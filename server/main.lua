-- as-passport server: applications, records, delivery, exports and the ID card.
--
-- A passport goes through: processing (paid, waiting) -> issued (valid, number is live) -> invalid
-- (replaced or revoked). "Issued" is set when the passport is handed to Postal Prime or the inventory;
-- the physical item is created when the player collects it.

local DAY = 86400
local function now() return os.time() end
local function log(fmt, ...) print(('^5[as-passport]^0 ' .. fmt):format(...)) end

-- ---------------------------------------------------------------------------------------------
-- Database
-- ---------------------------------------------------------------------------------------------

MySQL.ready(function()
    MySQL.query([[CREATE TABLE IF NOT EXISTS as_passports (
        id INT AUTO_INCREMENT PRIMARY KEY,
        number VARCHAR(12) NOT NULL,
        citizenid VARCHAR(64) NOT NULL,
        first_name VARCHAR(60) NOT NULL,
        last_name VARCHAR(60) NOT NULL,
        dob VARCHAR(20) NOT NULL DEFAULT '',
        sex CHAR(1) NOT NULL DEFAULT 'X',
        nationality VARCHAR(48) NOT NULL DEFAULT '',
        type VARCHAR(24) NOT NULL,
        status VARCHAR(16) NOT NULL,
        invalid_reason VARCHAR(48) NULL,
        photo MEDIUMTEXT NULL,
        locker_id VARCHAR(64) NULL,
        applied_at INT NOT NULL,
        ready_at INT NOT NULL,
        issued_at INT NULL,
        valid_until INT NULL,
        collected TINYINT NOT NULL DEFAULT 0,
        UNIQUE KEY uq_number (number),
        KEY idx_owner (citizenid, status),
        KEY idx_ready (status, ready_at)
    )]])
end)

local function findType(id)
    for _, t in ipairs(Config.types) do if t.id == id then return t end end
    return nil
end

-- ---------------------------------------------------------------------------------------------
-- Records
-- ---------------------------------------------------------------------------------------------

--- 'issued' turns into 'expired' when the passport has a limited life and it has run out.
local function effectiveStatus(row)
    if row.status == 'issued' and row.valid_until and tonumber(row.valid_until) and tonumber(row.valid_until) > 0
        and tonumber(row.valid_until) <= now() then
        return 'expired'
    end
    return row.status
end

local function toCard(row, withPhoto)
    local card = {
        number = row.number, first = row.first_name, last = row.last_name, dob = row.dob, sex = row.sex,
        nationality = row.nationality, type = row.type, status = effectiveStatus(row),
        issuedAt = row.issued_at, validUntil = (tonumber(row.valid_until) or 0) > 0 and row.valid_until or nil,
        placeOfIssue = Config.placeOfIssue, country = Config.countryCode, countryName = Config.countryName,
        hasPhoto = row.photo ~= nil and row.photo ~= '',
    }
    if withPhoto then card.photo = row.photo end
    return card
end

local function byNumber(number)
    if type(number) ~= 'string' or not number:match('^%d+$') or #number > 12 then return nil end
    return MySQL.single.await('SELECT * FROM as_passports WHERE number = ?', { number })
end

--- The character's current passport (valid or expired), if any.
local function currentRow(cid)
    return MySQL.single.await(
        "SELECT * FROM as_passports WHERE citizenid = ? AND status = 'issued' ORDER BY id DESC LIMIT 1", { cid })
end

local function pendingRow(cid)
    return MySQL.single.await(
        "SELECT * FROM as_passports WHERE citizenid = ? AND status = 'processing' ORDER BY id DESC LIMIT 1", { cid })
end

local function newNumber()
    for _ = 1, 20 do
        local n = tostring(math.random(100000000, 999999999))
        if not MySQL.scalar.await('SELECT 1 FROM as_passports WHERE number = ?', { n }) then return n end
    end
    return nil
end

local function itemMetadata(row)
    return {
        number = row.number,
        holder = ('%s %s'):format(row.first_name, row.last_name),
        dob = row.dob, sex = row.sex, nationality = row.nationality,
        description = T('item.description', row.number, row.first_name, row.last_name),
    }
end

-- ---------------------------------------------------------------------------------------------
-- Discord log
-- ---------------------------------------------------------------------------------------------

local function discordLog(title, color, fields)
    if type(Config.webhook) ~= 'string' or not Config.webhook:find('^https://') then return end
    local out = {}
    for _, f in ipairs(fields) do
        out[#out + 1] = { name = f[1], value = tostring(f[2]):gsub('@', '@\226\128\139'):sub(1, 200), inline = true }
    end
    PerformHttpRequest(Config.webhook, function() end, 'POST', json.encode({
        embeds = { { title = title, color = color, fields = out, timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'), footer = { text = 'as-passport' } } },
        allowed_mentions = { parse = {} },
    }), { ['Content-Type'] = 'application/json' })
end

-- ---------------------------------------------------------------------------------------------
-- Postal Prime
-- ---------------------------------------------------------------------------------------------

local function postalReady()
    return GetResourceState('as-postalprime') == 'started'
end

local function lockers()
    if not postalReady() then return {} end
    local ok, list = pcall(function() return exports['as-postalprime']:getLockers() end)
    return ok and type(list) == 'table' and list or {}
end

local function lockerLabel(id)
    for _, l in ipairs(lockers()) do if l.id == id then return l.label end end
    return nil
end

local warnedLockers = false
local function deliveryMode()
    if Config.delivery.mode == 'locker' and postalReady() then
        if #lockers() > 0 then return 'locker' end
        -- Running, but it gave us no lockers: usually as-postalprime was not restarted after its edit,
        -- so it does not have the getLockers export yet. Do not leave players unable to apply.
        if not warnedLockers then
            warnedLockers = true
            log('as-postalprime returned no lockers. Restart as-postalprime (it needs the edit described in the README). Passports go to the inventory until then.')
        end
    end
    return 'inventory'
end

-- ---------------------------------------------------------------------------------------------
-- What a character may apply for
-- ---------------------------------------------------------------------------------------------

--- Returns nil when allowed, or a reason.
local function refusal(t, current, pending)
    if pending then return T('err.alreadyPending') end
    local valid = current ~= nil and effectiveStatus(current) == 'issued'
    if t.needs == 'passport' and not valid then return T('err.needValid') end
    if t.needs ~= 'passport' and valid then return T('err.alreadyValid') end
    return nil
end

local function getState(src)
    local cid = Bridge.getIdentifier(src)
    if not cid then return nil, T('err.notSignedIn') end
    local current, pending = currentRow(cid), pendingRow(cid)

    local types = {}
    for _, t in ipairs(Config.types) do
        local why = refusal(t, current, pending)
        types[#types + 1] = {
            id = t.id, label = t.label, description = t.description, price = t.price,
            waitSeconds = t.waitSeconds, allowed = why == nil, reason = why,
        }
    end

    local state = {
        currency = Config.currency, types = types, mode = deliveryMode(), now = now(),
        lockers = deliveryMode() == 'locker' and lockers() or {},
        photo = Config.photo.enabled == true,
        passport = current and toCard(current, false) or nil,
    }
    if pending then
        state.application = {
            type = (findType(pending.type) or {}).label or pending.type, readyAt = pending.ready_at,
            appliedAt = pending.applied_at, lockerLabel = pending.locker_id and lockerLabel(pending.locker_id) or nil,
            late = pending.ready_at <= now(),
        }
    end
    return state
end

-- ---------------------------------------------------------------------------------------------
-- Applying
-- ---------------------------------------------------------------------------------------------

local busy = {}

local function takePhoto(src)
    if not Config.photo.enabled then return nil end
    local ok, photo = pcall(function() return lib.callback.await('as-passport:capture', src, Config.photo.resource) end)
    if not ok or type(photo) ~= 'string' or photo == '' then return nil end
    if #photo > (Config.photo.maxBytes or 250000) then return nil end
    if not photo:find('^data:image/') then photo = 'data:image/png;base64,' .. photo end
    return photo
end

local function apply(src, data)
    local cid = Bridge.getIdentifier(src)
    if not cid then return nil, T('err.notSignedIn') end
    local t = findType(tostring(data.type or ''))
    if not t then return nil, T('err.chooseType') end

    local current, pending = currentRow(cid), pendingRow(cid)
    local why = refusal(t, current, pending)
    if why then return nil, why end

    local mode = deliveryMode()
    local lockerId
    if mode == 'locker' then
        lockerId = tostring(data.lockerId or '')
        if not lockerLabel(lockerId) then return nil, T('err.chooseLocker') end
    end

    local info = Bridge.getCharInfo(src)
    if (info.first or '') == '' then return nil, T('err.noCharInfo') end

    local photo = takePhoto(src)
    if not photo and Config.photo.enabled and Config.photo.required then
        return nil, T('err.noPhoto')
    end

    local number = newNumber()
    if not number then return nil, T('err.noNumber') end

    if not Bridge.removeMoney(src, Config.account, t.price, 'passport') then
        return nil, T('err.noMoney')
    end

    local applied = now()
    local ok, id = pcall(function()
        return MySQL.insert.await(
            "INSERT INTO as_passports (number, citizenid, first_name, last_name, dob, sex, nationality, type, status, photo, locker_id, applied_at, ready_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'processing', ?, ?, ?, ?)",
            { number, cid, info.first, info.last or '', info.dob or '', info.sex or 'X',
              (info.nationality ~= '' and info.nationality) or Config.nationality, t.id,
              photo or '', lockerId or '', applied, applied + t.waitSeconds })
    end)
    if not ok or not id then
        Bridge.addMoney(src, Config.account, t.price, 'passport-refund')
        return nil, T('err.applyFailed')
    end

    if t.invalidateOld then
        MySQL.update.await(
            "UPDATE as_passports SET status = 'invalid', invalid_reason = 'replaced' WHERE citizenid = ? AND status = 'issued'", { cid })
    end

    pcall(function()
        exports['sd-phone']:addBankTransaction(cid, {
            label = t.label, amount = -t.price, category = 'government', counterparty = Config.placeOfIssue,
        })
    end)
    local name = Bridge.getCharacterName(src)
    Bridge.sendPhoneMail(src, cid, Config.mailFrom, T('mail.received.subject'),
        T('mail.received.body', name, t.label:lower(), Config.currency, t.price, os.date('%d %b %Y %H:%M', applied + t.waitSeconds)))
    discordLog(T('discord.applied'), 0x2563eb, {
        { T('discord.type'), t.label }, { T('discord.character'), name }, { T('discord.citizenId'), cid }, { T('discord.paid'), Config.currency .. t.price },
    })

    return { type = t.label, price = t.price, readyAt = applied + t.waitSeconds, now = applied }
end

-- ---------------------------------------------------------------------------------------------
-- Making a passport live and handing it over
-- ---------------------------------------------------------------------------------------------

--- Marks the row issued, cancels the character's older passports.
local function markIssued(row, delivered)
    local t = now()
    local validUntil = (Config.validDays or 0) > 0 and (t + Config.validDays * DAY) or nil
    MySQL.update.await(
        "UPDATE as_passports SET status = 'invalid', invalid_reason = 'renewed' WHERE citizenid = ? AND status = 'issued' AND id <> ?",
        { row.citizenid, row.id })
    MySQL.update.await(
        "UPDATE as_passports SET status = 'issued', issued_at = ?, valid_until = ?, collected = ? WHERE id = ?",
        { t, validUntil or 0, delivered and 1 or 0, row.id })
    row.status, row.issued_at, row.valid_until = 'issued', t, validUntil or 0
end

local function saveCopy(src, row)
    pcall(function()
        local lines = {
            T('doc.heading', Config.countryName),
            '',
            T('doc.number', row.number),
            T('doc.surname', row.last_name),
            T('doc.given', row.first_name),
            T('doc.nationality', row.nationality),
            T('doc.dob', row.dob),
            T('doc.sex', row.sex),
            T('doc.issued', os.date('%d %b %Y', tonumber(row.issued_at) or now())),
            T('doc.place', Config.placeOfIssue),
        }
        if (tonumber(row.valid_until) or 0) > 0 then lines[#lines + 1] = T('doc.validUntil', os.date('%d %b %Y', row.valid_until)) end
        exports['sd-phone']:createDocument(src, {
            name = T('doc.name', row.number), kind = 'text', content = table.concat(lines, '\n'),
            folder = Config.documentFolder, deletable = true,
        })
    end)
end

--- One pass over an application whose waiting time is up. Returns true when it was handled.
local function deliver(row)
    local mode = deliveryMode()
    local cid = row.citizenid
    local name = ('%s %s'):format(row.first_name, row.last_name)

    if mode == 'locker' then
        local lockerId = row.locker_id ~= '' and row.locker_id or (lockers()[1] or {}).id
        if not lockerId then log('no locker to deliver passport %s to', row.number); return false end
        local ok, sent, err = pcall(function()
            return exports['as-postalprime']:createParcel(cid, {
                ref = row.number, sender = Config.delivery.sender, lockerId = lockerId,
                prepSeconds = Config.delivery.prepSeconds, expireSeconds = Config.delivery.expireSeconds,
                items = { { item = Config.item, label = T('item.label'), icon = '🛂', qty = 1, metadata = itemMetadata(row) } },
            })
        end)
        if not ok then log('createParcel failed: %s', tostring(sent)); return false end
        if not sent then
            if err ~= 'busy' then log('could not send passport %s to a locker: %s', row.number, tostring(err)) end
            return false -- 'busy': the player has another Postal Prime order, try again next pass
        end
        markIssued(row, false)
        local label = lockerLabel(lockerId) or T('misc.yourLocker')
        local src = Bridge.findSource(cid)
        Bridge.phoneNotify(src, T('phone.sent.title'), T('phone.sent.body', label))
        Bridge.sendPhoneMail(src, cid, Config.mailFrom, T('mail.sent.subject'),
            T('mail.sent.body', name, label, row.number))
        discordLog(T('discord.issued'), 0x16a34a, { { T('discord.number'), row.number }, { T('discord.character'), name }, { T('discord.citizenId'), cid }, { T('discord.sentTo'), label } })
        return true
    end

    -- inventory delivery: needs the player online
    local src = Bridge.findSource(cid)
    if not src then return false end
    if not Bridge.addItem(src, Config.item, 1, itemMetadata(row)) then
        log('could not add the passport item for %s (is the item defined? see README)', cid)
        return false
    end
    markIssued(row, true)
    saveCopy(src, row)
    Bridge.phoneNotify(src, T('phone.issued.title'), T('phone.issued.body'))
    Bridge.sendPhoneMail(src, cid, Config.mailFrom, T('mail.issued.subject'),
        T('mail.issued.body', name, row.number))
    discordLog(T('discord.issued'), 0x16a34a, { { T('discord.number'), row.number }, { T('discord.character'), name }, { T('discord.citizenId'), cid }, { T('discord.sentTo'), T('discord.inventory') } })
    return true
end

CreateThread(function()
    Wait(5000)
    while true do
        local rows = MySQL.query.await(
            "SELECT * FROM as_passports WHERE status = 'processing' AND ready_at <= ? ORDER BY ready_at LIMIT 20", { now() }) or {}
        for i = 1, #rows do
            local ok, err = pcall(deliver, rows[i])
            if not ok then log('delivery failed: %s', tostring(err)) end
        end
        Wait(15000)
    end
end)

-- Postal Prime tells us when the parcel is picked up, or when nobody collected it in time.
AddEventHandler('as-postalprime:parcelCollected', function(cid, ref, src)
    local row = byNumber(tostring(ref or ''))
    if not row or row.citizenid ~= cid then return end
    MySQL.update.await('UPDATE as_passports SET collected = 1 WHERE id = ?', { row.id })
    if src then saveCopy(src, row) end
    discordLog(T('discord.collected'), 0x0ea5e9, { { T('discord.number'), row.number }, { T('discord.citizenId'), cid } })
end)

AddEventHandler('as-postalprime:parcelExpired', function(cid, ref)
    local row = byNumber(tostring(ref or ''))
    if not row or row.citizenid ~= cid or row.status ~= 'issued' then return end
    -- Send it again: put it back in the queue, ready straight away.
    MySQL.update.await("UPDATE as_passports SET status = 'processing', ready_at = ? WHERE id = ?", { now(), row.id })
    log('passport %s was not collected in time, sending it again', row.number)
end)

-- ---------------------------------------------------------------------------------------------
-- The ID card
-- ---------------------------------------------------------------------------------------------

local cardBuckets = {}
local function cardAllowed(src)
    local t = GetGameTimer()
    local b = cardBuckets[src]
    if not b or t - b.start > 10000 then b = { start = t, n = 0 }; cardBuckets[src] = b end
    b.n = b.n + 1
    return b.n <= 10
end
AddEventHandler('playerDropped', function() cardBuckets[source] = nil; busy[source] = nil end)

lib.callback.register('as-passport:card', function(src, number)
    if not cardAllowed(src) then return nil end
    number = tostring(number or '')
    if not Bridge.holdsPassport(src, number) then return nil end
    local row = byNumber(number)
    return row and toCard(row, true) or nil
end)

RegisterNetEvent('as-passport:server:show', function(number)
    local src = source
    if not cardAllowed(src) then return end
    number = tostring(number or '')
    if not Bridge.holdsPassport(src, number) then return end
    local row = byNumber(number)
    if not row then return end

    local ped = GetPlayerPed(src)
    if not ped or ped == 0 then return end
    local here = GetEntityCoords(ped)
    local best, bestDist
    for _, id in ipairs(GetPlayers()) do
        local other = tonumber(id)
        if other and other ~= src then
            local p = GetPlayerPed(other)
            if p and p ~= 0 then
                local d = #(GetEntityCoords(p) - here)
                if d <= (Config.showDistance or 3.0) and (not bestDist or d < bestDist) then best, bestDist = other, d end
            end
        end
    end
    if not best then
        TriggerClientEvent('ox_lib:notify', src, { title = T('toast.title'), description = T('toast.nobodyClose'), type = 'error' })
        return
    end
    TriggerClientEvent('as-passport:client:showCard', best, toCard(row, true), Bridge.getCharacterName(src))
    TriggerClientEvent('ox_lib:notify', src, { title = T('toast.title'), description = T('toast.showed'), type = 'success' })
end)

-- config.lua is server only, so the client asks which language to use.
lib.callback.register('as-passport:locale', function()
    return Config.locale or 'en'
end)

Bridge.registerUsable(Config.item, function(source, item)
    TriggerClientEvent('as-passport:client:useItem', source, item)
end)

-- ---------------------------------------------------------------------------------------------
-- Exports
-- ---------------------------------------------------------------------------------------------

--- For the gov site: what the player can do and what they hold.
exports('getState', getState)

--- For the gov site: apply. data = { type = 'standard', lockerId = '...' }. Returns a result or nil, message.
exports('apply', function(src, data)
    if type(src) ~= 'number' or type(data) ~= 'table' then return nil, T('err.badRequest') end
    if busy[src] then return nil, T('err.busy') end
    busy[src] = true
    local ok, res, err = pcall(apply, src, data)
    busy[src] = nil
    if not ok then log('apply failed: %s', tostring(res)); return nil, T('err.generic') end
    return res, err
end)

--- The character's current valid passport (no photo), or nil. Accepts a server id or a citizen id.
exports('getPassport', function(who)
    local cid = type(who) == 'number' and Bridge.getIdentifier(who) or who
    if type(cid) ~= 'string' then return nil end
    local row = currentRow(cid)
    if not row or effectiveStatus(row) ~= 'issued' then return nil end
    return toCard(row, false)
end)

exports('hasValidPassport', function(who)
    local cid = type(who) == 'number' and Bridge.getIdentifier(who) or who
    if type(cid) ~= 'string' then return false end
    local row = currentRow(cid)
    return row ~= nil and effectiveStatus(row) == 'issued'
end)

--- Look a passport up by its number (no photo unless withPhoto), for police or MDT scripts.
exports('getByNumber', function(number, withPhoto)
    local row = byNumber(tostring(number or ''))
    return row and toCard(row, withPhoto == true) or nil
end)

--- Cancel a passport. Returns true when one was cancelled.
exports('revokePassport', function(number, reason)
    local row = byNumber(tostring(number or ''))
    if not row or row.status == 'invalid' then return false end
    MySQL.update.await("UPDATE as_passports SET status = 'invalid', invalid_reason = ? WHERE id = ?",
        { tostring(reason or 'revoked'):sub(1, 48), row.id })
    discordLog(T('discord.revoked'), 0xdc2626, { { T('discord.number'), row.number }, { T('discord.citizenId'), row.citizenid }, { T('discord.reason'), reason or 'revoked' } })
    return true
end)

CreateThread(function()
    Wait(2000)
    log('framework: %s | inventory: %s | delivery: %s', Bridge.framework, Bridge.inventory, deliveryMode())
    if Config.delivery.mode == 'locker' and not postalReady() then
        log('as-postalprime is not running, so passports are delivered straight to the inventory')
    elseif Config.delivery.mode == 'locker' and #lockers() == 0 then
        log('as-postalprime is running but returned no lockers, so passports are delivered to the inventory. Restart as-postalprime.')
    end
end)

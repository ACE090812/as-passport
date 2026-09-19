-- Framework and inventory bridge: who the player is, their character details, their bank and their
-- inventory. Works with qbx_core, qb-core and es_extended, and with ox_inventory or qb-inventory.
Bridge = {}

local function detectFramework()
    if Config.framework ~= 'auto' then return Config.framework end
    if GetResourceState('qbx_core') == 'started' then return 'qbx' end
    if GetResourceState('qb-core') == 'started' then return 'qb' end
    if GetResourceState('es_extended') == 'started' then return 'esx' end
    return 'standalone'
end

local function detectInventory()
    if Config.inventory ~= 'auto' then return Config.inventory end
    if GetResourceState('ox_inventory') == 'started' then return 'ox_inventory' end
    if GetResourceState('qb-inventory') == 'started' then return 'qb-inventory' end
    return 'ox_inventory'
end

Bridge.framework = detectFramework()
Bridge.inventory = detectInventory()
local framework, inventory = Bridge.framework, Bridge.inventory

local QBCore, qbxExport, ESX

local function ensureCore()
    if framework == 'qb' and not QBCore then
        QBCore = exports['qb-core']:GetCoreObject()
    elseif framework == 'qbx' and not qbxExport then
        qbxExport = exports.qbx_core
    elseif framework == 'esx' and not ESX then
        ESX = exports['es_extended']:getSharedObject()
    end
end

local function getPlayer(source)
    ensureCore()
    if framework == 'qb' and QBCore then return QBCore.Functions.GetPlayer(source) end
    if framework == 'qbx' and qbxExport then return qbxExport:GetPlayer(source) end
    return nil
end

local function trim(s) return (tostring(s or ''):gsub('^%s+', ''):gsub('%s+$', '')) end

--- The character's stable id (citizenid, or the ESX identifier).
function Bridge.getIdentifier(source)
    ensureCore()
    if framework == 'qb' or framework == 'qbx' then
        local p = getPlayer(source)
        return p and p.PlayerData.citizenid or nil
    elseif framework == 'esx' and ESX then
        local x = ESX.GetPlayerFromId(source)
        return x and x.identifier or nil
    end
    return source and ('standalone:' .. tostring(source)) or nil
end

--- The server id of an online character, or nil.
function Bridge.findSource(identifier)
    ensureCore()
    if type(identifier) ~= 'string' then return nil end
    if framework == 'qb' and QBCore then
        local p = QBCore.Functions.GetPlayerByCitizenId(identifier)
        return p and p.PlayerData.source or nil
    elseif framework == 'qbx' and qbxExport then
        local p = qbxExport:GetPlayerByCitizenId(identifier)
        return p and p.PlayerData.source or nil
    elseif framework == 'esx' and ESX then
        local x = ESX.GetPlayerFromIdentifier(identifier)
        return x and x.source or nil
    end
    local id = identifier:match('^standalone:(%d+)$')
    return id and tonumber(id) or nil
end

local function sexLetter(v)
    if v == nil then return 'X' end
    local s = tostring(v):lower()
    if s == '0' or s == 'm' or s == 'male' then return 'M' end
    if s == '1' or s == 'f' or s == 'female' then return 'F' end
    return 'X'
end

--- { first, last, dob, sex ('M'/'F'/'X'), nationality } exactly as the character was created.
function Bridge.getCharInfo(source)
    ensureCore()
    if framework == 'qb' or framework == 'qbx' then
        local p = getPlayer(source)
        local ci = p and p.PlayerData.charinfo
        if ci then
            return {
                first = trim(ci.firstname), last = trim(ci.lastname),
                dob = trim(ci.birthdate), sex = sexLetter(ci.gender),
                nationality = trim(ci.nationality),
            }
        end
    elseif framework == 'esx' and ESX then
        local x = ESX.GetPlayerFromId(source)
        if x then
            local function get(k) local ok, v = pcall(function() return x.get(k) end); return ok and v or nil end
            return {
                first = trim(get('firstName')), last = trim(get('lastName')),
                dob = trim(get('dateofbirth')), sex = sexLetter(get('sex')), nationality = '',
            }
        end
    end
    local name = GetPlayerName(source) or 'Citizen'
    return { first = name, last = '', dob = '', sex = 'X', nationality = '' }
end

function Bridge.getCharacterName(source)
    local ci = Bridge.getCharInfo(source)
    local name = trim(('%s %s'):format(ci.first or '', ci.last or ''))
    return name ~= '' and name or (GetPlayerName(source) or 'Citizen')
end

-- ---------------------------------------------------------------------------------------------
-- Money
-- ---------------------------------------------------------------------------------------------

function Bridge.removeMoney(source, account, amount, reason)
    ensureCore()
    amount = math.floor(tonumber(amount) or 0)
    if amount <= 0 then return true end
    if framework == 'qb' or framework == 'qbx' then
        local p = getPlayer(source)
        if not p or (p.PlayerData.money[account] or 0) < amount then return false end
        return p.Functions.RemoveMoney(account, amount, reason or 'as-passport') == true
    elseif framework == 'esx' and ESX then
        local x = ESX.GetPlayerFromId(source)
        if not x then return false end
        local acc = x.getAccount(account)
        if not acc or acc.money < amount then return false end
        x.removeAccountMoney(account, amount)
        return true
    end
    return true
end

function Bridge.addMoney(source, account, amount, reason)
    ensureCore()
    amount = math.floor(tonumber(amount) or 0)
    if amount <= 0 then return true end
    if framework == 'qb' or framework == 'qbx' then
        local p = getPlayer(source)
        if not p then return false end
        p.Functions.AddMoney(account, amount, reason or 'as-passport-refund')
        return true
    elseif framework == 'esx' and ESX then
        local x = ESX.GetPlayerFromId(source)
        if not x then return false end
        x.addAccountMoney(account, amount)
        return true
    end
    return true
end

-- ---------------------------------------------------------------------------------------------
-- Inventory
-- ---------------------------------------------------------------------------------------------

function Bridge.addItem(source, item, count, metadata)
    if inventory == 'ox_inventory' then
        local ok, res = pcall(function() return exports.ox_inventory:AddItem(source, item, count or 1, metadata) end)
        return ok and res and true or false
    elseif inventory == 'qb-inventory' then
        local ok, res = pcall(function() return exports['qb-inventory']:AddItem(source, item, count or 1, false, metadata) end)
        return ok and res ~= false
    end
    return false
end

--- True when the player is carrying a passport item with this number. If the inventory can't be
--- searched it says yes, so a card is never refused because of a bridge problem.
function Bridge.holdsPassport(source, number)
    if inventory == 'ox_inventory' then
        local ok, slots = pcall(function() return exports.ox_inventory:Search(source, 'slots', Config.item) end)
        if not ok or type(slots) ~= 'table' then return true end
        for _, s in pairs(slots) do
            if s.metadata and tostring(s.metadata.number) == tostring(number) then return true end
        end
        return false
    elseif inventory == 'qb-inventory' then
        local ok, items = pcall(function() return exports['qb-inventory']:GetItemsByName(source, Config.item) end)
        if not ok or type(items) ~= 'table' then return true end
        for _, s in pairs(items) do
            local info = s.info or s.metadata
            if info and tostring(info.number) == tostring(number) then return true end
        end
        return false
    end
    return true
end

--- qb-inventory needs the item registered as usable. ox_inventory uses the item definition instead.
function Bridge.registerUsable(item, fn)
    if inventory ~= 'qb-inventory' then return end
    ensureCore()
    local core = QBCore
    if not core and framework == 'qbx' then
        pcall(function() exports.qbx_core:CreateUseableItem(item, fn) end)
        return
    end
    if core then core.Functions.CreateUseableItem(item, fn) end
end

-- ---------------------------------------------------------------------------------------------
-- Phone
-- ---------------------------------------------------------------------------------------------

function Bridge.phoneNotify(source, title, body)
    if not source then return end
    pcall(function()
        exports['sd-phone']:notify(source, { app = 'as-browser', appId = 'as-browser', title = title, body = body, time = 'now' })
    end)
end

--- Sends a system email to the character's Mail app. Prints the reason when it can't.
function Bridge.sendPhoneMail(source, identifier, from, subject, body)
    local ok, err = pcall(function()
        local email
        if source then
            local live = exports['sd-phone']:getMailAccounts(source)
            if type(live) == 'table' and live[1] then email = live[1].email end
        end
        if not email and identifier then
            local saved = exports['sd-phone']:getMailAddresses(identifier)
            if type(saved) == 'table' and saved[1] then email = saved[1].email end
        end
        if not email then
            print(('^5[as-passport]^0 mail not sent: %s has no email account in the Mail app'):format(tostring(identifier)))
            return
        end
        local attempts = { from, from and { name = from.name } or nil, false }
        for i = 1, 3 do
            local sender = attempts[i]
            if sender ~= nil then
                local mail = { to = email, subject = subject, body = body }
                if sender then mail.from = sender end
                local res = exports['sd-phone']:sendMail(mail)
                if type(res) == 'table' and res.delivered and res.delivered > 0 then return end
            end
        end
        print(('^5[as-passport]^0 mail to %s was not delivered by sd-phone'):format(email))
    end)
    if not ok then print(('^5[as-passport]^0 mail failed: %s'):format(tostring(err))) end
end

return Bridge

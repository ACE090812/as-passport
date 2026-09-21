-- as-passport settings. SERVER ONLY (never sent to players), so the webhook is safe here.
Config = {}

Config.locale = 'en'         -- Language: any file in locales/ (locales/en.lua = English). Copy en.lua to add a language.

Config.framework = 'auto'      -- 'auto', 'qbx', 'qb' or 'esx'
Config.inventory = 'auto'      -- 'auto', 'ox_inventory' or 'qb-inventory'

Config.account  = 'bank'       -- the account applications are paid from
Config.currency = '£'

Config.item = 'passport'       -- inventory item name (see README for the item definition)

-- What is printed on the passport.
Config.countryCode   = 'SAN'                          -- three letters, used in the machine readable lines
Config.countryName   = 'San Andreas'
Config.nationality   = 'British'                      -- used when the character has none
Config.placeOfIssue  = 'Los Santos Passport Office'
Config.validDays     = 0                              -- real days a passport lasts. 0 = never expires

-- Passport types. `needs = 'passport'` means the character must already hold a valid passport.
-- `invalidateOld = true` cancels their current passport as soon as they apply (a lost passport).
-- Any other new passport cancels older ones when it is issued.
Config.types = {
    { id = 'standard',    label = 'Standard passport',       price = 75,  waitSeconds = 3600, needs = 'none',
      description = 'Apply for your first passport. Ready in about an hour.' },
    { id = 'fast',        label = 'Fast track passport',     price = 150, waitSeconds = 600,  needs = 'none',
      description = 'The same passport, ready in about ten minutes.' },
    { id = 'replacement', label = 'Replace a lost passport', price = 40,  waitSeconds = 3600, needs = 'passport', invalidateOld = true,
      description = 'Lost or stolen? Your old passport is cancelled straight away and a new one is issued.' },
    { id = 'renewal',     label = 'Renew or update details', price = 25,  waitSeconds = 3600, needs = 'passport',
      description = 'Reissue your passport with your current details and a new photo. Your old one works until the new one is issued.' },
}

-- Delivery. 'locker' sends the passport to a Postal Prime locker (needs as-postalprime, with the
-- createParcel export, see README). 'inventory' puts it straight into the player's inventory,
-- and waits until they are online if they are not.
Config.delivery = {
    mode          = 'locker',
    prepSeconds   = 180,        -- time before the locker parcel is ready
    expireSeconds = 172800,     -- how long it waits in the locker. If nobody collects it, it is sent again
    sender        = 'Los Santos Passport Office',
}

-- The character mugshot. Needs the MugShotBase64 resource. With required = false, an application
-- still goes through without a photo if the mugshot fails.
Config.photo = { enabled = true, required = false, resource = 'MugShotBase64', maxBytes = 250000 }

Config.showDistance = 3.0       -- how close another player must be to be shown the passport

-- Discord log of every application, issue, replacement and revoke. Empty = off.
Config.webhook = ''

Config.documentFolder = 'Passport'      -- folder in the Files app for the passport copy
Config.mailFrom = { name = 'Los Santos Passport Office', email = 'noreply@lsgov.co.uk' }

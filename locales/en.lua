-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['en'] = {
    -- Misc
    ['misc.citizen']            = 'Citizen',
    ['misc.yourLocker']         = 'your locker',

    -- Notifications (ox_lib toasts)
    ['toast.title']             = 'Passport',
    ['toast.notReadable']       = 'This passport is not readable.',
    ['toast.nobodyClose']       = 'There is nobody close enough.',
    ['toast.showed']            = 'You showed your passport.',

    -- Errors shown on the government website
    ['err.notSignedIn']         = 'You are not signed in.',
    ['err.alreadyPending']      = 'You already have a passport application in progress.',
    ['err.needValid']           = 'You need a valid passport for this.',
    ['err.alreadyValid']        = 'You already have a valid passport.',
    ['err.chooseType']          = 'Choose a passport type.',
    ['err.chooseLocker']        = 'Choose where to collect your passport.',
    ['err.noCharInfo']          = 'We could not read your character details.',
    ['err.noPhoto']             = 'We could not take your photo. Stand still, face the camera and try again.',
    ['err.noNumber']            = 'We could not create a passport number. Please try again.',
    ['err.noMoney']             = 'You do not have enough money in your bank account.',
    ['err.applyFailed']         = 'We could not process your application. You have not been charged, please try again.',
    ['err.badRequest']          = 'Bad request.',
    ['err.busy']                = 'Please wait, your last request is still being processed.',
    ['err.generic']             = 'Something went wrong. Please try again.',

    -- Emails
    ['mail.received.subject']   = 'We have received your passport application',
    ['mail.received.body']      = 'Hello %s,\n\nWe have received your %s application and your payment of %s%d.\n\nIt will be ready at %s. We will email you when it has been sent to you.',
    ['mail.sent.subject']       = 'Your passport is on its way',
    ['mail.sent.body']          = 'Hello %s,\n\nYour passport has been sent to %s. Open Postal Prime for your pickup code, then collect it from the locker.\n\nPassport number: %s',
    ['mail.issued.subject']     = 'Your passport has been issued',
    ['mail.issued.body']        = 'Hello %s,\n\nYour passport is ready and is in your inventory. A copy is saved in your Files app.\n\nPassport number: %s',

    -- Phone notifications
    ['phone.now']               = 'now',
    ['phone.sent.title']        = 'Passport sent',
    ['phone.sent.body']         = 'Your passport has been sent to %s.',
    ['phone.issued.title']      = 'Passport issued',
    ['phone.issued.body']       = 'Your passport has been issued and added to your inventory.',

    -- Item and parcel
    ['item.label']              = 'Passport',
    ['item.description']        = 'Passport %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name']                = 'Passport %s',
    ['doc.heading']             = 'Passport - %s',
    ['doc.number']              = 'Passport number: %s',
    ['doc.surname']             = 'Surname: %s',
    ['doc.given']               = 'Given names: %s',
    ['doc.nationality']         = 'Nationality: %s',
    ['doc.dob']                 = 'Date of birth: %s',
    ['doc.sex']                 = 'Sex: %s',
    ['doc.issued']              = 'Date of issue: %s',
    ['doc.place']               = 'Place of issue: %s',
    ['doc.validUntil']          = 'Valid until: %s',

    -- Discord log
    ['discord.applied']         = 'Passport application',
    ['discord.issued']          = 'Passport issued',
    ['discord.collected']       = 'Passport collected',
    ['discord.revoked']         = 'Passport revoked',
    ['discord.type']            = 'Type',
    ['discord.character']       = 'Character',
    ['discord.citizenId']       = 'Citizen ID',
    ['discord.paid']            = 'Paid',
    ['discord.number']          = 'Number',
    ['discord.sentTo']          = 'Sent to',
    ['discord.inventory']       = 'Inventory',
    ['discord.reason']          = 'Reason',

    -- Card (NUI)
    ['card.title']              = 'Passport',
    ['card.valid']              = 'VALID',
    ['card.invalid']            = 'INVALID',
    ['card.expired']            = 'EXPIRED',
    ['card.type']               = 'Type',
    ['card.number']             = 'Passport no.',
    ['card.surname']            = 'Surname',
    ['card.given']              = 'Given names',
    ['card.nationality']        = 'Nationality',
    ['card.sex']                = 'Sex',
    ['card.dob']                = 'Date of birth',
    ['card.issued']             = 'Date of issue',
    ['card.authority']          = 'Authority',
    ['card.validUntil']         = 'Valid until',
    ['card.noExpiry']           = 'No expiry',
    ['card.shownBy']            = '%s shows you their passport',
    ['card.show']               = 'Show to person nearby',
    ['card.close']              = 'Close',
    ['card.escHint']            = 'Press Esc to close',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months']             = 'Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec',
}

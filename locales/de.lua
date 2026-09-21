-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['de'] = {
    -- Misc
    ['misc.citizen'] = 'Bürger',
    ['misc.yourLocker'] = 'dein Schließfach',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Reisepass',
    ['toast.notReadable'] = 'Dieser Reisepass ist nicht lesbar.',
    ['toast.nobodyClose'] = 'Es ist niemand in der Nähe.',
    ['toast.showed'] = 'Du hast deinen Reisepass gezeigt.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Du bist nicht angemeldet.',
    ['err.alreadyPending'] = 'Du hast bereits einen laufenden Reisepass-Antrag.',
    ['err.needValid'] = 'Du brauchst einen gültigen Reisepass dafür.',
    ['err.alreadyValid'] = 'Du hast bereits einen gültigen Reisepass.',
    ['err.chooseType'] = 'Wähle eine Reisepass-Art.',
    ['err.chooseLocker'] = 'Wähle aus, wo du deinen Reisepass abholen möchtest.',
    ['err.noCharInfo'] = 'Wir konnten deine Charakterdaten nicht lesen.',
    ['err.noPhoto'] = 'Wir konnten dein Foto nicht aufnehmen. Steh still, schau in die Kamera und versuch es nochmal.',
    ['err.noNumber'] = 'Wir konnten keine Reisepassnummer erstellen. Bitte versuch es nochmal.',
    ['err.noMoney'] = 'Du hast nicht genug Geld auf deinem Bankkonto.',
    ['err.applyFailed'] = 'Wir konnten deinen Antrag nicht bearbeiten. Es wurde nichts abgebucht, bitte versuch es nochmal.',
    ['err.badRequest'] = 'Ungültige Anfrage.',
    ['err.busy'] = 'Bitte warte, deine letzte Anfrage wird noch bearbeitet.',
    ['err.generic'] = 'Etwas ist schiefgelaufen. Bitte versuch es nochmal.',

    -- Emails
    ['mail.received.subject'] = 'Wir haben deinen Reisepass-Antrag erhalten',
    ['mail.received.body'] = 'Hallo %s,\\n\\nWir haben deinen %s-Antrag und deine Zahlung von %s%d erhalten.\\n\\nEr wird fertig sein am %s. Wir schicken dir eine E-Mail, wenn er an dich versendet wurde.',
    ['mail.sent.subject'] = 'Dein Reisepass ist unterwegs',
    ['mail.sent.body'] = 'Hallo %s,\\n\\nDein Reisepass wurde an %s versendet. Öffne Postal Prime für deinen Abholcode und hol ihn dann am Schließfach ab.\\n\\nReisepassnummer: %s',
    ['mail.issued.subject'] = 'Dein Reisepass wurde ausgestellt',
    ['mail.issued.body'] = 'Hallo %s,\\n\\nDein Reisepass ist fertig und befindet sich in deinem Inventar. Eine Kopie ist in deiner Dateien-App gespeichert.\\n\\nReisepassnummer: %s',

    -- Phone notifications
    ['phone.now'] = 'jetzt',
    ['phone.sent.title'] = 'Reisepass versendet',
    ['phone.sent.body'] = 'Dein Reisepass wurde an %s versendet.',
    ['phone.issued.title'] = 'Reisepass ausgestellt',
    ['phone.issued.body'] = 'Dein Reisepass wurde ausgestellt und zu deinem Inventar hinzugefügt.',

    -- Item and parcel
    ['item.label'] = 'Reisepass',
    ['item.description'] = 'Reisepass %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Reisepass %s',
    ['doc.heading'] = 'Reisepass - %s',
    ['doc.number'] = 'Reisepassnummer: %s',
    ['doc.surname'] = 'Nachname: %s',
    ['doc.given'] = 'Vornamen: %s',
    ['doc.nationality'] = 'Staatsangehörigkeit: %s',
    ['doc.dob'] = 'Geburtsdatum: %s',
    ['doc.sex'] = 'Geschlecht: %s',
    ['doc.issued'] = 'Ausstellungsdatum: %s',
    ['doc.place'] = 'Ausstellungsort: %s',
    ['doc.validUntil'] = 'Gültig bis: %s',

    -- Discord log
    ['discord.applied'] = 'Reisepass-Antrag',
    ['discord.issued'] = 'Reisepass ausgestellt',
    ['discord.collected'] = 'Reisepass abgeholt',
    ['discord.revoked'] = 'Reisepass widerrufen',
    ['discord.type'] = 'Typ',
    ['discord.character'] = 'Charakter',
    ['discord.citizenId'] = 'Bürger-ID',
    ['discord.paid'] = 'Bezahlt',
    ['discord.number'] = 'Nummer',
    ['discord.sentTo'] = 'Gesendet an',
    ['discord.inventory'] = 'Inventar',
    ['discord.reason'] = 'Grund',

    -- Card (NUI)
    ['card.title'] = 'Pass',
    ['card.valid'] = 'GÜLTIG',
    ['card.invalid'] = 'UNGÜLTIG',
    ['card.expired'] = 'ABGELAUFEN',
    ['card.type'] = 'Typ',
    ['card.number'] = 'Pass-Nr.',
    ['card.surname'] = 'Nachname',
    ['card.given'] = 'Vorname(n)',
    ['card.nationality'] = 'Nationalität',
    ['card.sex'] = 'Geschlecht',
    ['card.dob'] = 'Geburtsdatum',
    ['card.issued'] = 'Ausstellungsdatum',
    ['card.authority'] = 'Behörde',
    ['card.validUntil'] = 'Gültig bis',
    ['card.noExpiry'] = 'Unbegrenzt gültig',
    ['card.shownBy'] = '%s zeigt dir seinen Pass',
    ['card.show'] = 'Zeigen',
    ['card.close'] = 'Schließen',
    ['card.escHint'] = 'Drücke Esc zum Schließen',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Jan,Feb,Mär,Apr,Mai,Jun,Jul,Aug,Sep,Okt,Nov,Dez',
}

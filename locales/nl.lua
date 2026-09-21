-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['nl'] = {
    -- Misc
    ['misc.citizen'] = 'Burger',
    ['misc.yourLocker'] = 'je kluisje',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Paspoort',
    ['toast.notReadable'] = 'Dit paspoort is niet leesbaar.',
    ['toast.nobodyClose'] = 'Er is niemand dichtbij genoeg.',
    ['toast.showed'] = 'Je hebt je paspoort laten zien.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Je bent niet ingelogd.',
    ['err.alreadyPending'] = 'Je hebt al een paspoortaanvraag in behandeling.',
    ['err.needValid'] = 'Je hebt hier een geldig paspoort voor nodig.',
    ['err.alreadyValid'] = 'Je hebt al een geldig paspoort.',
    ['err.chooseType'] = 'Kies een paspoorttype.',
    ['err.chooseLocker'] = 'Kies waar je je paspoort wilt ophalen.',
    ['err.noCharInfo'] = 'We konden je karaktergegevens niet lezen.',
    ['err.noPhoto'] = 'We konden je foto niet maken. Sta stil, kijk naar de camera en probeer het opnieuw.',
    ['err.noNumber'] = 'We konden geen paspoortnummer aanmaken. Probeer het opnieuw.',
    ['err.noMoney'] = 'Je hebt niet genoeg geld op je bankrekening.',
    ['err.applyFailed'] = 'We konden je aanvraag niet verwerken. Er is niets afgeschreven, probeer het opnieuw.',
    ['err.badRequest'] = 'Ongeldig verzoek.',
    ['err.busy'] = 'Een moment geduld, je vorige verzoek wordt nog verwerkt.',
    ['err.generic'] = 'Er is iets misgegaan. Probeer het opnieuw.',

    -- Emails
    ['mail.received.subject'] = 'We hebben je paspoortaanvraag ontvangen',
    ['mail.received.body'] = 'Hallo %s,\\n\\nWe hebben je %s aanvraag ontvangen en je betaling van %s%d.\\n\\nHet is klaar om %s. We mailen je wanneer het naar je verstuurd is.',
    ['mail.sent.subject'] = 'Je paspoort is onderweg',
    ['mail.sent.body'] = 'Hallo %s,\\n\\nJe paspoort is verzonden naar %s. Open Postal Prime voor je ophaalkode en haal het op bij het kluisje.\\n\\nPaspoortnummer: %s',
    ['mail.issued.subject'] = 'Je paspoort is uitgegeven',
    ['mail.issued.body'] = 'Hallo %s,\\n\\nJe paspoort is klaar en zit in je inventaris. Een kopie is opgeslagen in je Bestanden app.\\n\\nPaspoortnummer: %s',

    -- Phone notifications
    ['phone.now'] = 'nu',
    ['phone.sent.title'] = 'Paspoort verzonden',
    ['phone.sent.body'] = 'Je paspoort is verzonden naar %s.',
    ['phone.issued.title'] = 'Paspoort uitgegeven',
    ['phone.issued.body'] = 'Je paspoort is uitgegeven en toegevoegd aan je inventaris.',

    -- Item and parcel
    ['item.label'] = 'Paspoort',
    ['item.description'] = 'Paspoort %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Paspoort %s',
    ['doc.heading'] = 'Paspoort - %s',
    ['doc.number'] = 'Paspoortnummer: %s',
    ['doc.surname'] = 'Achternaam: %s',
    ['doc.given'] = 'Voornamen: %s',
    ['doc.nationality'] = 'Nationaliteit: %s',
    ['doc.dob'] = 'Geboortedatum: %s',
    ['doc.sex'] = 'Geslacht: %s',
    ['doc.issued'] = 'Datum van uitgifte: %s',
    ['doc.place'] = 'Plaats van uitgifte: %s',
    ['doc.validUntil'] = 'Geldig tot: %s',

    -- Discord log
    ['discord.applied'] = 'Paspoortaanvraag',
    ['discord.issued'] = 'Paspoort uitgegeven',
    ['discord.collected'] = 'Paspoort opgehaald',
    ['discord.revoked'] = 'Paspoort ingetrokken',
    ['discord.type'] = 'Type',
    ['discord.character'] = 'Personage',
    ['discord.citizenId'] = 'Burger ID',
    ['discord.paid'] = 'Betaald',
    ['discord.number'] = 'Nummer',
    ['discord.sentTo'] = 'Verzonden naar',
    ['discord.inventory'] = 'Inventaris',
    ['discord.reason'] = 'Reden',

    -- Card (NUI)
    ['card.title'] = 'Paspoort',
    ['card.valid'] = 'GELDIG',
    ['card.invalid'] = 'ONGELDIG',
    ['card.expired'] = 'VERLOPEN',
    ['card.type'] = 'Type',
    ['card.number'] = 'Paspoort nr.',
    ['card.surname'] = 'Achternaam',
    ['card.given'] = 'Voornamen',
    ['card.nationality'] = 'Nationaliteit',
    ['card.sex'] = 'Geslacht',
    ['card.dob'] = 'Geboortedatum',
    ['card.issued'] = 'Datum van afgifte',
    ['card.authority'] = 'Autoriteit',
    ['card.validUntil'] = 'Geldig tot',
    ['card.noExpiry'] = 'Geen vervaldatum',
    ['card.shownBy'] = '%s laat je hun paspoort zien',
    ['card.show'] = 'Toon aan persoon in de buurt',
    ['card.close'] = 'Sluiten',
    ['card.escHint'] = 'Druk op Esc om te sluiten',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'jan,feb,mrt,apr,mei,jun,jul,aug,sep,okt,nov,dec',
}

-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['it'] = {
    -- Misc
    ['misc.citizen'] = 'Cittadino',
    ['misc.yourLocker'] = 'il tuo armadietto',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Passaporto',
    ['toast.notReadable'] = 'Questo passaporto non è leggibile.',
    ['toast.nobodyClose'] = 'Non c\'è nessuno abbastanza vicino.',
    ['toast.showed'] = 'Hai mostrato il tuo passaporto.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Non hai effettuato l\'accesso.',
    ['err.alreadyPending'] = 'Hai già una richiesta di passaporto in corso.',
    ['err.needValid'] = 'Hai bisogno di un passaporto valido per questo.',
    ['err.alreadyValid'] = 'Hai già un passaporto valido.',
    ['err.chooseType'] = 'Scegli un tipo di passaporto.',
    ['err.chooseLocker'] = 'Scegli dove ritirare il tuo passaporto.',
    ['err.noCharInfo'] = 'Non siamo riusciti a leggere i dettagli del tuo personaggio.',
    ['err.noPhoto'] = 'Non siamo riusciti a scattare la tua foto. Stai fermo, guarda la fotocamera e riprova.',
    ['err.noNumber'] = 'Non siamo riusciti a creare un numero di passaporto. Riprova.',
    ['err.noMoney'] = 'Non hai abbastanza soldi sul tuo conto bancario.',
    ['err.applyFailed'] = 'Non siamo riusciti a elaborare la tua richiesta. Non ti è stato addebitato nulla, riprova.',
    ['err.badRequest'] = 'Richiesta non valida.',
    ['err.busy'] = 'Attendi, la tua ultima richiesta è ancora in elaborazione.',
    ['err.generic'] = 'Qualcosa è andato storto. Riprova.',

    -- Emails
    ['mail.received.subject'] = 'Abbiamo ricevuto la tua richiesta di passaporto',
    ['mail.received.body'] = 'Ciao %s,\\n\\nAbbiamo ricevuto la tua richiesta per %s e il tuo pagamento di %s%d.\\n\\nSarà pronto presso %s. Ti invieremo un\'email quando ti sarà stato spedito.',
    ['mail.sent.subject'] = 'Il tuo passaporto è in arrivo',
    ['mail.sent.body'] = 'Ciao %s,\\n\\nIl tuo passaporto è stato inviato a %s. Apri Postal Prime per il codice di ritiro, poi ritiralo dall\'armadietto.\\n\\nNumero passaporto: %s',
    ['mail.issued.subject'] = 'Il tuo passaporto è stato emesso',
    ['mail.issued.body'] = 'Ciao %s,\\n\\nIl tuo passaporto è pronto ed è nel tuo inventario. Una copia è salvata nell\'app File.\\n\\nNumero passaporto: %s',

    -- Phone notifications
    ['phone.now'] = 'ora',
    ['phone.sent.title'] = 'Passaporto inviato',
    ['phone.sent.body'] = 'Il tuo passaporto è stato inviato a %s.',
    ['phone.issued.title'] = 'Passaporto emesso',
    ['phone.issued.body'] = 'Il tuo passaporto è stato emesso e aggiunto al tuo inventario.',

    -- Item and parcel
    ['item.label'] = 'Passaporto',
    ['item.description'] = 'Passaporto %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Passaporto %s',
    ['doc.heading'] = 'Passaporto - %s',
    ['doc.number'] = 'Numero passaporto: %s',
    ['doc.surname'] = 'Cognome: %s',
    ['doc.given'] = 'Nome/i di battesimo: %s',
    ['doc.nationality'] = 'Nazionalità: %s',
    ['doc.dob'] = 'Data di nascita: %s',
    ['doc.sex'] = 'Sesso: %s',
    ['doc.issued'] = 'Data di emissione: %s',
    ['doc.place'] = 'Luogo di emissione: %s',
    ['doc.validUntil'] = 'Valido fino al: %s',

    -- Discord log
    ['discord.applied'] = 'Richiesta passaporto',
    ['discord.issued'] = 'Passaporto emesso',
    ['discord.collected'] = 'Passaporto ritirato',
    ['discord.revoked'] = 'Passaporto revocato',
    ['discord.type'] = 'Tipo',
    ['discord.character'] = 'Personaggio',
    ['discord.citizenId'] = 'ID Cittadino',
    ['discord.paid'] = 'Pagato',
    ['discord.number'] = 'Numero',
    ['discord.sentTo'] = 'Inviato a',
    ['discord.inventory'] = 'Inventario',
    ['discord.reason'] = 'Motivo',

    -- Card (NUI)
    ['card.title'] = 'Passaporto',
    ['card.valid'] = 'VALIDO',
    ['card.invalid'] = 'NON VALIDO',
    ['card.expired'] = 'SCADUTO',
    ['card.type'] = 'Tipo',
    ['card.number'] = 'N. passaporto',
    ['card.surname'] = 'Cognome',
    ['card.given'] = 'Nome/i',
    ['card.nationality'] = 'Nazionalità',
    ['card.sex'] = 'Sesso',
    ['card.dob'] = 'Data di nascita',
    ['card.issued'] = 'Data di rilascio',
    ['card.authority'] = 'Autorità',
    ['card.validUntil'] = 'Valido fino al',
    ['card.noExpiry'] = 'Nessuna scadenza',
    ['card.shownBy'] = '%s ti mostra il passaporto',
    ['card.show'] = 'Mostra a persona vicina',
    ['card.close'] = 'Chiudi',
    ['card.escHint'] = 'Premi Esc per chiudere',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Gen,Feb,Mar,Apr,Mag,Giu,Lug,Ago,Set,Ott,Nov,Dic',
}

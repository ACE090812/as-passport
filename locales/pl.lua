-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['pl'] = {
    -- Misc
    ['misc.citizen'] = 'Obywatel',
    ['misc.yourLocker'] = 'twoja skrytka',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Paszport',
    ['toast.notReadable'] = 'Ten paszport jest nieczytelny.',
    ['toast.nobodyClose'] = 'Nikt nie jest wystarczająco blisko.',
    ['toast.showed'] = 'Pokazałeś swój paszport.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Nie jesteś zalogowany.',
    ['err.alreadyPending'] = 'Masz już złożony wniosek o paszport.',
    ['err.needValid'] = 'Potrzebujesz ważnego paszportu.',
    ['err.alreadyValid'] = 'Masz już ważny paszport.',
    ['err.chooseType'] = 'Wybierz typ paszportu.',
    ['err.chooseLocker'] = 'Wybierz gdzie odebrać swój paszport.',
    ['err.noCharInfo'] = 'Nie udało się odczytać danych twojej postaci.',
    ['err.noPhoto'] = 'Nie udało się zrobić zdjęcia. Stój spokojnie, patrz w kamerę i spróbuj ponownie.',
    ['err.noNumber'] = 'Nie udało się wygenerować numeru paszportu. Spróbuj ponownie.',
    ['err.noMoney'] = 'Nie masz wystarczająco pieniędzy na koncie bankowym.',
    ['err.applyFailed'] = 'Nie udało się przetworzyć twojego wniosku. Nie zostałeś obciążony, spróbuj ponownie.',
    ['err.badRequest'] = 'Nieprawidłowe żądanie.',
    ['err.busy'] = 'Poczekaj, twoje poprzednie żądanie jest wciąż przetwarzane.',
    ['err.generic'] = 'Coś poszło nie tak. Spróbuj ponownie.',

    -- Emails
    ['mail.received.subject'] = 'Otrzymaliśmy twój wniosek o paszport',
    ['mail.received.body'] = 'Witaj %s,\\n\\nOtrzymaliśmy twój wniosek o %s i płatność w wysokości %s%d.\\n\\nBędzie gotowy w %s. Wyślemy ci maila, gdy zostanie do ciebie wysłany.',
    ['mail.sent.subject'] = 'Twój paszport jest w drodze',
    ['mail.sent.body'] = 'Witaj %s,\\n\\nTwój paszport został wysłany do %s. Otwórz Postal Prime po kod odbioru, a następnie odbierz go ze skrytki.\\n\\nNumer paszportu: %s',
    ['mail.issued.subject'] = 'Twój paszport został wydany',
    ['mail.issued.body'] = 'Witaj %s,\\n\\nTwój paszport jest gotowy i znajduje się w twoim ekwipunku. Kopia została zapisana w aplikacji Pliki.\\n\\nNumer paszportu: %s',

    -- Phone notifications
    ['phone.now'] = 'teraz',
    ['phone.sent.title'] = 'Paszport wysłany',
    ['phone.sent.body'] = 'Twój paszport został wysłany do %s.',
    ['phone.issued.title'] = 'Paszport wydany',
    ['phone.issued.body'] = 'Twój paszport został wydany i dodany do ekwipunku.',

    -- Item and parcel
    ['item.label'] = 'Paszport',
    ['item.description'] = 'Paszport %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Paszport %s',
    ['doc.heading'] = 'Paszport - %s',
    ['doc.number'] = 'Numer paszportu: %s',
    ['doc.surname'] = 'Nazwisko: %s',
    ['doc.given'] = 'Imiona: %s',
    ['doc.nationality'] = 'Narodowość: %s',
    ['doc.dob'] = 'Data urodzenia: %s',
    ['doc.sex'] = 'Płeć: %s',
    ['doc.issued'] = 'Data wydania: %s',
    ['doc.place'] = 'Miejsce wydania: %s',
    ['doc.validUntil'] = 'Ważny do: %s',

    -- Discord log
    ['discord.applied'] = 'Wniosek o paszport',
    ['discord.issued'] = 'Paszport wydany',
    ['discord.collected'] = 'Paszport odebrany',
    ['discord.revoked'] = 'Paszport unieważniony',
    ['discord.type'] = 'Typ',
    ['discord.character'] = 'Postać',
    ['discord.citizenId'] = 'ID obywatela',
    ['discord.paid'] = 'Zapłacono',
    ['discord.number'] = 'Numer',
    ['discord.sentTo'] = 'Wysłano do',
    ['discord.inventory'] = 'Ekwipunek',
    ['discord.reason'] = 'Powód',

    -- Card (NUI)
    ['card.title'] = 'Paszport',
    ['card.valid'] = 'WAŻNY',
    ['card.invalid'] = 'NIEWAŻNY',
    ['card.expired'] = 'WYGASŁ',
    ['card.type'] = 'Typ',
    ['card.number'] = 'Nr paszportu',
    ['card.surname'] = 'Nazwisko',
    ['card.given'] = 'Imiona',
    ['card.nationality'] = 'Obywatelstwo',
    ['card.sex'] = 'Płeć',
    ['card.dob'] = 'Data urodzenia',
    ['card.issued'] = 'Data wydania',
    ['card.authority'] = 'Organ wydający',
    ['card.validUntil'] = 'Ważny do',
    ['card.noExpiry'] = 'Bezterminowy',
    ['card.shownBy'] = '%s pokazuje ci swój paszport',
    ['card.show'] = 'Pokaż osobie w pobliżu',
    ['card.close'] = 'Zamknij',
    ['card.escHint'] = 'Naciśnij Esc aby zamknąć',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Sty,Lut,Mar,Kwi,Maj,Cze,Lip,Sie,Wrz,Paź,Lis,Gru',
}

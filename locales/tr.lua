-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['tr'] = {
    -- Misc
    ['misc.citizen'] = 'Vatandaş',
    ['misc.yourLocker'] = 'dolabın',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Pasaport',
    ['toast.notReadable'] = 'Bu pasaport okunamıyor.',
    ['toast.nobodyClose'] = 'Yakında kimse yok.',
    ['toast.showed'] = 'Pasaportunu gösterdin.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Giriş yapmamışsın.',
    ['err.alreadyPending'] = 'Zaten devam eden bir pasaport başvurun var.',
    ['err.needValid'] = 'Bunun için geçerli bir pasaporta ihtiyacın var.',
    ['err.alreadyValid'] = 'Zaten geçerli bir pasaportun var.',
    ['err.chooseType'] = 'Bir pasaport türü seç.',
    ['err.chooseLocker'] = 'Pasaportunu nereden alacağını seç.',
    ['err.noCharInfo'] = 'Karakter bilgilerini okuyamadık.',
    ['err.noPhoto'] = 'Fotoğrafını çekemedik. Hareketsiz dur, kameraya bak ve tekrar dene.',
    ['err.noNumber'] = 'Pasaport numarası oluşturamadık. Lütfen tekrar dene.',
    ['err.noMoney'] = 'Banka hesabında yeterli paran yok.',
    ['err.applyFailed'] = 'Başvurunu işleme koyamadık. Ücret alınmadı, lütfen tekrar dene.',
    ['err.badRequest'] = 'Geçersiz istek.',
    ['err.busy'] = 'Lütfen bekle, son isteğin hala işleniyor.',
    ['err.generic'] = 'Bir şeyler ters gitti. Lütfen tekrar dene.',

    -- Emails
    ['mail.received.subject'] = 'Pasaport başvurunuzu aldık',
    ['mail.received.body'] = 'Merhaba %s,\\n\\n%s başvurunuzu ve %s%d ödemenizi aldık.\\n\\n%s tarihinde hazır olacak. Size gönderildiğinde e-posta ile bildireceğiz.',
    ['mail.sent.subject'] = 'Pasaportunuz yolda',
    ['mail.sent.body'] = 'Merhaba %s,\\n\\nPasaportunuz %s adresine gönderildi. Teslim alma kodun için Postal Prime\'ı aç, ardından dolabından al.\\n\\nPasaport numarası: %s',
    ['mail.issued.subject'] = 'Pasaportunuz verildi',
    ['mail.issued.body'] = 'Merhaba %s,\\n\\nPasaportunuz hazır ve envanterinde. Bir kopyası Dosyalar uygulamanda kayıtlı.\\n\\nPasaport numarası: %s',

    -- Phone notifications
    ['phone.now'] = 'şimdi',
    ['phone.sent.title'] = 'Pasaport gönderildi',
    ['phone.sent.body'] = 'Pasaportunuz %s adresine gönderildi.',
    ['phone.issued.title'] = 'Pasaport verildi',
    ['phone.issued.body'] = 'Pasaportunuz verildi ve envanterine eklendi.',

    -- Item and parcel
    ['item.label'] = 'Pasaport',
    ['item.description'] = 'Pasaport %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Pasaport %s',
    ['doc.heading'] = 'Pasaport - %s',
    ['doc.number'] = 'Pasaport numarası: %s',
    ['doc.surname'] = 'Soyadı: %s',
    ['doc.given'] = 'Adı: %s',
    ['doc.nationality'] = 'Uyruk: %s',
    ['doc.dob'] = 'Doğum tarihi: %s',
    ['doc.sex'] = 'Cinsiyet: %s',
    ['doc.issued'] = 'Verilme tarihi: %s',
    ['doc.place'] = 'Verildiği yer: %s',
    ['doc.validUntil'] = 'Geçerlilik: %s',

    -- Discord log
    ['discord.applied'] = 'Pasaport başvurusu',
    ['discord.issued'] = 'Pasaport verildi',
    ['discord.collected'] = 'Pasaport alındı',
    ['discord.revoked'] = 'Pasaport iptal edildi',
    ['discord.type'] = 'Tür',
    ['discord.character'] = 'Karakter',
    ['discord.citizenId'] = 'Vatandaş ID',
    ['discord.paid'] = 'Ödenen',
    ['discord.number'] = 'Numara',
    ['discord.sentTo'] = 'Gönderilen',
    ['discord.inventory'] = 'Envanter',
    ['discord.reason'] = 'Sebep',

    -- Card (NUI)
    ['card.title'] = 'Pasaport',
    ['card.valid'] = 'GEÇERLİ',
    ['card.invalid'] = 'GEÇERSİZ',
    ['card.expired'] = 'SÜRESİ DOLMUŞ',
    ['card.type'] = 'Tür',
    ['card.number'] = 'Pasaport no.',
    ['card.surname'] = 'Soyadı',
    ['card.given'] = 'Adı',
    ['card.nationality'] = 'Uyruk',
    ['card.sex'] = 'Cinsiyet',
    ['card.dob'] = 'Doğum tarihi',
    ['card.issued'] = 'Verilme tarihi',
    ['card.authority'] = 'Veren makam',
    ['card.validUntil'] = 'Geçerlilik süresi',
    ['card.noExpiry'] = 'Süresiz',
    ['card.shownBy'] = '%s pasaportunu gösteriyor',
    ['card.show'] = 'Yakındaki kişiye göster',
    ['card.close'] = 'Kapat',
    ['card.escHint'] = 'Kapatmak için Esc\'ye bas',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Oca,Şub,Mar,Nis,May,Haz,Tem,Ağu,Eyl,Eki,Kas,Ara',
}

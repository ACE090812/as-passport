-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['ar'] = {
    -- Misc
    ['misc.citizen'] = 'مواطن',
    ['misc.yourLocker'] = 'خزانتك',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'جواز السفر',
    ['toast.notReadable'] = 'جواز السفر هذا غير قابل للقراءة.',
    ['toast.nobodyClose'] = 'ما في حد قريب كفاية.',
    ['toast.showed'] = 'عرضت جواز سفرك.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'أنت مو مسجل دخول.',
    ['err.alreadyPending'] = 'عندك طلب جواز سفر قيد المعالجة.',
    ['err.needValid'] = 'تحتاج جواز سفر صالح عشان كذا.',
    ['err.alreadyValid'] = 'عندك جواز سفر صالح بالفعل.',
    ['err.chooseType'] = 'اختر نوع جواز السفر.',
    ['err.chooseLocker'] = 'اختر من وين تستلم جواز سفرك.',
    ['err.noCharInfo'] = 'ما قدرنا نقرأ تفاصيل شخصيتك.',
    ['err.noPhoto'] = 'ما قدرنا نصورك. قف ثابت، واجه الكاميرا وحاول مرة ثانية.',
    ['err.noNumber'] = 'ما قدرنا ننشئ رقم جواز سفر. حاول مرة ثانية.',
    ['err.noMoney'] = 'ما عندك فلوس كافية في حسابك البنكي.',
    ['err.applyFailed'] = 'ما قدرنا نعالج طلبك. ما تم خصم فلوس، حاول مرة ثانية.',
    ['err.badRequest'] = 'طلب غير صحيح.',
    ['err.busy'] = 'انتظر شوي، طلبك الأخير لسه قيد المعالجة.',
    ['err.generic'] = 'صار شي غلط. حاول مرة ثانية.',

    -- Emails
    ['mail.received.subject'] = 'استلمنا طلب جواز السفر حقك',
    ['mail.received.body'] = 'مرحباً %s،\\n\\nاستلمنا طلبك لـ %s ودفعتك بقيمة %s%d.\\n\\nراح يكون جاهز في %s. راح نرسل لك إيميل لما يتم إرساله لك.',
    ['mail.sent.subject'] = 'جواز سفرك في الطريق',
    ['mail.sent.body'] = 'مرحباً %s،\\n\\nجواز سفرك تم إرساله إلى %s. افتح Postal Prime عشان كود الاستلام، بعدين استلمه من الخزانة.\\n\\nرقم جواز السفر: %s',
    ['mail.issued.subject'] = 'جواز سفرك تم إصداره',
    ['mail.issued.body'] = 'مرحباً %s،\\n\\nجواز سفرك جاهز وموجود في المخزن حقك. نسخة محفوظة في تطبيق الملفات.\\n\\nرقم جواز السفر: %s',

    -- Phone notifications
    ['phone.now'] = 'الحين',
    ['phone.sent.title'] = 'تم إرسال جواز السفر',
    ['phone.sent.body'] = 'جواز سفرك تم إرساله إلى %s.',
    ['phone.issued.title'] = 'تم إصدار جواز السفر',
    ['phone.issued.body'] = 'جواز سفرك تم إصداره وإضافته لمخزنك.',

    -- Item and parcel
    ['item.label'] = 'جواز سفر',
    ['item.description'] = 'جواز سفر %s، %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'جواز سفر %s',
    ['doc.heading'] = 'جواز سفر - %s',
    ['doc.number'] = 'رقم جواز السفر: %s',
    ['doc.surname'] = 'اللقب: %s',
    ['doc.given'] = 'الأسماء الأولى: %s',
    ['doc.nationality'] = 'الجنسية: %s',
    ['doc.dob'] = 'تاريخ الميلاد: %s',
    ['doc.sex'] = 'الجنس: %s',
    ['doc.issued'] = 'تاريخ الإصدار: %s',
    ['doc.place'] = 'مكان الإصدار: %s',
    ['doc.validUntil'] = 'صالح حتى: %s',

    -- Discord log
    ['discord.applied'] = 'طلب جواز سفر',
    ['discord.issued'] = 'إصدار جواز سفر',
    ['discord.collected'] = 'استلام جواز سفر',
    ['discord.revoked'] = 'إلغاء جواز سفر',
    ['discord.type'] = 'النوع',
    ['discord.character'] = 'الشخصية',
    ['discord.citizenId'] = 'رقم المواطن',
    ['discord.paid'] = 'مدفوع',
    ['discord.number'] = 'الرقم',
    ['discord.sentTo'] = 'أُرسل إلى',
    ['discord.inventory'] = 'المخزون',
    ['discord.reason'] = 'السبب',

    -- Card (NUI)
    ['card.title'] = 'جواز السفر',
    ['card.valid'] = 'صالح',
    ['card.invalid'] = 'غير صالح',
    ['card.expired'] = 'منتهي الصلاحية',
    ['card.type'] = 'النوع',
    ['card.number'] = 'رقم جواز السفر',
    ['card.surname'] = 'اللقب',
    ['card.given'] = 'الأسماء الأولى',
    ['card.nationality'] = 'الجنسية',
    ['card.sex'] = 'الجنس',
    ['card.dob'] = 'تاريخ الميلاد',
    ['card.issued'] = 'تاريخ الإصدار',
    ['card.authority'] = 'الجهة المصدرة',
    ['card.validUntil'] = 'صالح حتى',
    ['card.noExpiry'] = 'بدون انتهاء',
    ['card.shownBy'] = '%s يعرض لك جواز سفره',
    ['card.show'] = 'أظهر لشخص قريب',
    ['card.close'] = 'إغلاق',
    ['card.escHint'] = 'اضغط Esc للإغلاق',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'يناير,فبراير,مارس,أبريل,مايو,يونيو,يوليو,أغسطس,سبتمبر,أكتوبر,نوفمبر,ديسمبر',
}

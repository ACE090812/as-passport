-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['ja'] = {
    -- Misc
    ['misc.citizen'] = '市民',
    ['misc.yourLocker'] = 'あなたのロッカー',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'パスポート',
    ['toast.notReadable'] = 'このパスポートは読み取れません。',
    ['toast.nobodyClose'] = '近くに誰もいません。',
    ['toast.showed'] = 'パスポートを提示しました。',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'サインインしていません。',
    ['err.alreadyPending'] = 'すでにパスポート申請が進行中です。',
    ['err.needValid'] = 'これには有効なパスポートが必要です。',
    ['err.alreadyValid'] = 'すでに有効なパスポートを持っています。',
    ['err.chooseType'] = 'パスポートの種類を選択してください。',
    ['err.chooseLocker'] = 'パスポートの受取場所を選択してください。',
    ['err.noCharInfo'] = 'キャラクター情報を読み取れませんでした。',
    ['err.noPhoto'] = '写真を撮影できませんでした。静止してカメラを向いてもう一度試してください。',
    ['err.noNumber'] = 'パスポート番号を作成できませんでした。もう一度試してください。',
    ['err.noMoney'] = '銀行口座の残高が不足しています。',
    ['err.applyFailed'] = '申請を処理できませんでした。請求は発生していませんので、もう一度試してください。',
    ['err.badRequest'] = '不正なリクエストです。',
    ['err.busy'] = 'お待ちください、前回のリクエストがまだ処理中です。',
    ['err.generic'] = '問題が発生しました。もう一度試してください。',

    -- Emails
    ['mail.received.subject'] = 'パスポート申請を受け付けました',
    ['mail.received.body'] = '%sさん、こんにちは。\\n\\n%sの申請と%s%dの支払いを受け付けました。\\n\\n%sに準備が完了します。送付が完了次第メールでお知らせします。',
    ['mail.sent.subject'] = 'パスポートを発送しました',
    ['mail.sent.body'] = '%sさん、こんにちは。\\n\\nパスポートを%sに発送しました。Postal Primeで受取コードを確認し、ロッカーから受け取ってください。\\n\\nパスポート番号: %s',
    ['mail.issued.subject'] = 'パスポートを発行しました',
    ['mail.issued.body'] = '%sさん、こんにちは。\\n\\nパスポートの準備が完了し、インベントリに追加されました。コピーはファイルアプリに保存されています。\\n\\nパスポート番号: %s',

    -- Phone notifications
    ['phone.now'] = '今',
    ['phone.sent.title'] = 'パスポート発送完了',
    ['phone.sent.body'] = 'パスポートを%sに発送しました。',
    ['phone.issued.title'] = 'パスポート発行完了',
    ['phone.issued.body'] = 'パスポートが発行され、インベントリに追加されました。',

    -- Item and parcel
    ['item.label'] = 'パスポート',
    ['item.description'] = 'パスポート %s、%s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'パスポート %s',
    ['doc.heading'] = 'パスポート - %s',
    ['doc.number'] = 'パスポート番号: %s',
    ['doc.surname'] = '姓: %s',
    ['doc.given'] = '名: %s',
    ['doc.nationality'] = '国籍: %s',
    ['doc.dob'] = '生年月日: %s',
    ['doc.sex'] = '性別: %s',
    ['doc.issued'] = '発行日: %s',
    ['doc.place'] = '発行地: %s',
    ['doc.validUntil'] = '有効期限: %s',

    -- Discord log
    ['discord.applied'] = 'パスポート申請',
    ['discord.issued'] = 'パスポート発行',
    ['discord.collected'] = 'パスポート受取',
    ['discord.revoked'] = 'パスポート無効化',
    ['discord.type'] = '種類',
    ['discord.character'] = 'キャラクター',
    ['discord.citizenId'] = '市民ID',
    ['discord.paid'] = '支払額',
    ['discord.number'] = '番号',
    ['discord.sentTo'] = '送信先',
    ['discord.inventory'] = '所持品',
    ['discord.reason'] = '理由',

    -- Card (NUI)
    ['card.title'] = 'パスポート',
    ['card.valid'] = '有効',
    ['card.invalid'] = '無効',
    ['card.expired'] = '期限切れ',
    ['card.type'] = '種別',
    ['card.number'] = '旅券番号',
    ['card.surname'] = '姓',
    ['card.given'] = '名',
    ['card.nationality'] = '国籍',
    ['card.sex'] = '性別',
    ['card.dob'] = '生年月日',
    ['card.issued'] = '発行日',
    ['card.authority'] = '発行機関',
    ['card.validUntil'] = '有効期限',
    ['card.noExpiry'] = '期限なし',
    ['card.shownBy'] = '%sがパスポートを見せた',
    ['card.show'] = '近くの人に見せる',
    ['card.close'] = '閉じる',
    ['card.escHint'] = 'Escキーで閉じる',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = '1月,2月,3月,4月,5月,6月,7月,8月,9月,10月,11月,12月',
}

-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['zh'] = {
    -- Misc
    ['misc.citizen'] = '市民',
    ['misc.yourLocker'] = '你的储物柜',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = '护照',
    ['toast.notReadable'] = '这本护照无法读取。',
    ['toast.nobodyClose'] = '附近没有人。',
    ['toast.showed'] = '你出示了护照。',

    -- Errors shown on the government website
    ['err.notSignedIn'] = '你还没有登录。',
    ['err.alreadyPending'] = '你已经有一份护照申请正在处理中。',
    ['err.needValid'] = '你需要一本有效护照才能进行此操作。',
    ['err.alreadyValid'] = '你已经有一本有效护照了。',
    ['err.chooseType'] = '请选择护照类型。',
    ['err.chooseLocker'] = '请选择领取护照的地点。',
    ['err.noCharInfo'] = '无法读取你的角色信息。',
    ['err.noPhoto'] = '无法拍摄你的照片。请站稳，面向摄像头后重试。',
    ['err.noNumber'] = '无法生成护照号码。请重试。',
    ['err.noMoney'] = '你的银行账户余额不足。',
    ['err.applyFailed'] = '无法处理你的申请。未扣费，请重试。',
    ['err.badRequest'] = '请求错误。',
    ['err.busy'] = '请稍候，上一个请求还在处理中。',
    ['err.generic'] = '出了点问题。请重试。',

    -- Emails
    ['mail.received.subject'] = '我们已收到你的护照申请',
    ['mail.received.body'] = '你好 %s，\\n\\n我们已收到你的%s申请和%s%d的付款。\\n\\n护照将在%s准备好。发送给你后我们会发邮件通知。',
    ['mail.sent.subject'] = '你的护照正在派送中',
    ['mail.sent.body'] = '你好 %s，\\n\\n你的护照已发送至%s。打开 Postal Prime 查看取件码，然后从储物柜领取。\\n\\n护照号码：%s',
    ['mail.issued.subject'] = '你的护照已签发',
    ['mail.issued.body'] = '你好 %s，\\n\\n你的护照已准备好，现在在你的物品栏中。副本已保存在文件应用中。\\n\\n护照号码：%s',

    -- Phone notifications
    ['phone.now'] = '现在',
    ['phone.sent.title'] = '护照已发送',
    ['phone.sent.body'] = '你的护照已发送至%s。',
    ['phone.issued.title'] = '护照已签发',
    ['phone.issued.body'] = '你的护照已签发并添加到物品栏中。',

    -- Item and parcel
    ['item.label'] = '护照',
    ['item.description'] = '护照 %s，%s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = '护照 %s',
    ['doc.heading'] = '护照 - %s',
    ['doc.number'] = '护照号码：%s',
    ['doc.surname'] = '姓：%s',
    ['doc.given'] = '名：%s',
    ['doc.nationality'] = '国籍：%s',
    ['doc.dob'] = '出生日期：%s',
    ['doc.sex'] = '性别：%s',
    ['doc.issued'] = '签发日期：%s',
    ['doc.place'] = '签发地点：%s',
    ['doc.validUntil'] = '有效期至：%s',

    -- Discord log
    ['discord.applied'] = '护照申请',
    ['discord.issued'] = '护照签发',
    ['discord.collected'] = '护照领取',
    ['discord.revoked'] = '护照吊销',
    ['discord.type'] = '类型',
    ['discord.character'] = '角色',
    ['discord.citizenId'] = '市民 ID',
    ['discord.paid'] = '已支付',
    ['discord.number'] = '编号',
    ['discord.sentTo'] = '发送至',
    ['discord.inventory'] = '库存',
    ['discord.reason'] = '原因',

    -- Card (NUI)
    ['card.title'] = '护照',
    ['card.valid'] = '有效',
    ['card.invalid'] = '无效',
    ['card.expired'] = '已过期',
    ['card.type'] = '类型',
    ['card.number'] = '护照号',
    ['card.surname'] = '姓',
    ['card.given'] = '名',
    ['card.nationality'] = '国籍',
    ['card.sex'] = '性别',
    ['card.dob'] = '出生日期',
    ['card.issued'] = '签发日期',
    ['card.authority'] = '签发机构',
    ['card.validUntil'] = '有效期至',
    ['card.noExpiry'] = '无期限',
    ['card.shownBy'] = '%s 向你出示了护照',
    ['card.show'] = '向附近的人展示',
    ['card.close'] = '关闭',
    ['card.escHint'] = '按 Esc 键关闭',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = '1月,2月,3月,4月,5月,6月,7月,8月,9月,10月,11月,12月',
}

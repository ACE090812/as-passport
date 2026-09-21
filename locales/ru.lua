-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['ru'] = {
    -- Misc
    ['misc.citizen'] = 'Гражданин',
    ['misc.yourLocker'] = 'твой шкафчик',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Паспорт',
    ['toast.notReadable'] = 'Этот паспорт не читается.',
    ['toast.nobodyClose'] = 'Рядом никого нет.',
    ['toast.showed'] = 'Вы показали свой паспорт.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Вы не авторизованы.',
    ['err.alreadyPending'] = 'У вас уже есть заявка на паспорт в обработке.',
    ['err.needValid'] = 'Для этого нужен действующий паспорт.',
    ['err.alreadyValid'] = 'У вас уже есть действующий паспорт.',
    ['err.chooseType'] = 'Выберите тип паспорта.',
    ['err.chooseLocker'] = 'Выберите, где забрать паспорт.',
    ['err.noCharInfo'] = 'Не удалось прочитать данные вашего персонажа.',
    ['err.noPhoto'] = 'Не удалось сделать фото. Стойте неподвижно, смотрите в камеру и попробуйте снова.',
    ['err.noNumber'] = 'Не удалось создать номер паспорта. Попробуйте ещё раз.',
    ['err.noMoney'] = 'Недостаточно денег на банковском счёте.',
    ['err.applyFailed'] = 'Не удалось обработать заявку. Деньги не списаны, попробуйте снова.',
    ['err.badRequest'] = 'Неверный запрос.',
    ['err.busy'] = 'Подождите, ваш предыдущий запрос ещё обрабатывается.',
    ['err.generic'] = 'Что-то пошло не так. Попробуйте снова.',

    -- Emails
    ['mail.received.subject'] = 'Мы получили вашу заявку на паспорт',
    ['mail.received.body'] = 'Здравствуйте, %s,\\n\\nМы получили вашу заявку на %s и оплату %s%d.\\n\\nПаспорт будет готов в %s. Мы отправим письмо, когда он будет отправлен вам.',
    ['mail.sent.subject'] = 'Ваш паспорт в пути',
    ['mail.sent.body'] = 'Здравствуйте, %s,\\n\\nВаш паспорт был отправлен в %s. Откройте Postal Prime для получения кода, затем заберите его из шкафчика.\\n\\nНомер паспорта: %s',
    ['mail.issued.subject'] = 'Ваш паспорт выдан',
    ['mail.issued.body'] = 'Здравствуйте, %s,\\n\\nВаш паспорт готов и находится в вашем инвентаре. Копия сохранена в приложении Файлы.\\n\\nНомер паспорта: %s',

    -- Phone notifications
    ['phone.now'] = 'сейчас',
    ['phone.sent.title'] = 'Паспорт отправлен',
    ['phone.sent.body'] = 'Ваш паспорт отправлен в %s.',
    ['phone.issued.title'] = 'Паспорт выдан',
    ['phone.issued.body'] = 'Ваш паспорт выдан и добавлен в инвентарь.',

    -- Item and parcel
    ['item.label'] = 'Паспорт',
    ['item.description'] = 'Паспорт %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Паспорт %s',
    ['doc.heading'] = 'Паспорт - %s',
    ['doc.number'] = 'Номер паспорта: %s',
    ['doc.surname'] = 'Фамилия: %s',
    ['doc.given'] = 'Имя: %s',
    ['doc.nationality'] = 'Гражданство: %s',
    ['doc.dob'] = 'Дата рождения: %s',
    ['doc.sex'] = 'Пол: %s',
    ['doc.issued'] = 'Дата выдачи: %s',
    ['doc.place'] = 'Место выдачи: %s',
    ['doc.validUntil'] = 'Действителен до: %s',

    -- Discord log
    ['discord.applied'] = 'Заявка на паспорт',
    ['discord.issued'] = 'Паспорт выдан',
    ['discord.collected'] = 'Паспорт получен',
    ['discord.revoked'] = 'Паспорт аннулирован',
    ['discord.type'] = 'Тип',
    ['discord.character'] = 'Персонаж',
    ['discord.citizenId'] = 'ID гражданина',
    ['discord.paid'] = 'Оплачено',
    ['discord.number'] = 'Номер',
    ['discord.sentTo'] = 'Отправлено',
    ['discord.inventory'] = 'Инвентарь',
    ['discord.reason'] = 'Причина',

    -- Card (NUI)
    ['card.title'] = 'Паспорт',
    ['card.valid'] = 'ДЕЙСТВИТЕЛЕН',
    ['card.invalid'] = 'НЕДЕЙСТВИТЕЛЕН',
    ['card.expired'] = 'ПРОСРОЧЕН',
    ['card.type'] = 'Тип',
    ['card.number'] = 'Номер паспорта',
    ['card.surname'] = 'Фамилия',
    ['card.given'] = 'Имя',
    ['card.nationality'] = 'Гражданство',
    ['card.sex'] = 'Пол',
    ['card.dob'] = 'Дата рождения',
    ['card.issued'] = 'Дата выдачи',
    ['card.authority'] = 'Орган выдачи',
    ['card.validUntil'] = 'Действителен до',
    ['card.noExpiry'] = 'Бессрочно',
    ['card.shownBy'] = '%s показывает вам свой паспорт',
    ['card.show'] = 'Показать рядом стоящему',
    ['card.close'] = 'Закрыть',
    ['card.escHint'] = 'Нажмите Esc для закрытия',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Янв,Фев,Мар,Апр,Май,Июн,Июл,Авг,Сен,Окт,Ноя,Дек',
}

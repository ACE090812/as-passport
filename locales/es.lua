-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['es'] = {
    -- Misc
    ['misc.citizen'] = 'Ciudadano',
    ['misc.yourLocker'] = 'tu casillero',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Pasaporte',
    ['toast.notReadable'] = 'Este pasaporte no es legible.',
    ['toast.nobodyClose'] = 'No hay nadie lo suficientemente cerca.',
    ['toast.showed'] = 'Mostraste tu pasaporte.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'No has iniciado sesión.',
    ['err.alreadyPending'] = 'Ya tienes una solicitud de pasaporte en proceso.',
    ['err.needValid'] = 'Necesitas un pasaporte válido para esto.',
    ['err.alreadyValid'] = 'Ya tienes un pasaporte válido.',
    ['err.chooseType'] = 'Elige un tipo de pasaporte.',
    ['err.chooseLocker'] = 'Elige dónde recoger tu pasaporte.',
    ['err.noCharInfo'] = 'No pudimos leer los detalles de tu personaje.',
    ['err.noPhoto'] = 'No pudimos tomar tu foto. Quédate quieto, mira a la cámara e intenta de nuevo.',
    ['err.noNumber'] = 'No pudimos crear un número de pasaporte. Por favor intenta de nuevo.',
    ['err.noMoney'] = 'No tienes suficiente dinero en tu cuenta bancaria.',
    ['err.applyFailed'] = 'No pudimos procesar tu solicitud. No se te ha cobrado, por favor intenta de nuevo.',
    ['err.badRequest'] = 'Solicitud incorrecta.',
    ['err.busy'] = 'Por favor espera, tu última solicitud todavía se está procesando.',
    ['err.generic'] = 'Algo salió mal. Por favor intenta de nuevo.',

    -- Emails
    ['mail.received.subject'] = 'Hemos recibido tu solicitud de pasaporte',
    ['mail.received.body'] = 'Hola %s,\\n\\nHemos recibido tu solicitud de %s y tu pago de %s%d.\\n\\nEstará listo en %s. Te enviaremos un correo cuando haya sido enviado.',
    ['mail.sent.subject'] = 'Tu pasaporte está en camino',
    ['mail.sent.body'] = 'Hola %s,\\n\\nTu pasaporte ha sido enviado a %s. Abre Postal Prime para tu código de recogida, luego retíralo del casillero.\\n\\nNúmero de pasaporte: %s',
    ['mail.issued.subject'] = 'Tu pasaporte ha sido emitido',
    ['mail.issued.body'] = 'Hola %s,\\n\\nTu pasaporte está listo y se encuentra en tu inventario. Una copia se ha guardado en tu app de Archivos.\\n\\nNúmero de pasaporte: %s',

    -- Phone notifications
    ['phone.now'] = 'ahora',
    ['phone.sent.title'] = 'Pasaporte enviado',
    ['phone.sent.body'] = 'Tu pasaporte ha sido enviado a %s.',
    ['phone.issued.title'] = 'Pasaporte emitido',
    ['phone.issued.body'] = 'Tu pasaporte ha sido emitido y añadido a tu inventario.',

    -- Item and parcel
    ['item.label'] = 'Pasaporte',
    ['item.description'] = 'Pasaporte %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Pasaporte %s',
    ['doc.heading'] = 'Pasaporte - %s',
    ['doc.number'] = 'Número de pasaporte: %s',
    ['doc.surname'] = 'Apellido: %s',
    ['doc.given'] = 'Nombres: %s',
    ['doc.nationality'] = 'Nacionalidad: %s',
    ['doc.dob'] = 'Fecha de nacimiento: %s',
    ['doc.sex'] = 'Sexo: %s',
    ['doc.issued'] = 'Fecha de emisión: %s',
    ['doc.place'] = 'Lugar de emisión: %s',
    ['doc.validUntil'] = 'Válido hasta: %s',

    -- Discord log
    ['discord.applied'] = 'Solicitud de pasaporte',
    ['discord.issued'] = 'Pasaporte emitido',
    ['discord.collected'] = 'Pasaporte recogido',
    ['discord.revoked'] = 'Pasaporte revocado',
    ['discord.type'] = 'Tipo',
    ['discord.character'] = 'Personaje',
    ['discord.citizenId'] = 'ID de Ciudadano',
    ['discord.paid'] = 'Pagado',
    ['discord.number'] = 'Número',
    ['discord.sentTo'] = 'Enviado a',
    ['discord.inventory'] = 'Inventario',
    ['discord.reason'] = 'Razón',

    -- Card (NUI)
    ['card.title'] = 'Pasaporte',
    ['card.valid'] = 'VÁLIDO',
    ['card.invalid'] = 'INVÁLIDO',
    ['card.expired'] = 'VENCIDO',
    ['card.type'] = 'Tipo',
    ['card.number'] = 'N.º de pasaporte',
    ['card.surname'] = 'Apellidos',
    ['card.given'] = 'Nombres',
    ['card.nationality'] = 'Nacionalidad',
    ['card.sex'] = 'Sexo',
    ['card.dob'] = 'Fecha de nacimiento',
    ['card.issued'] = 'Fecha de emisión',
    ['card.authority'] = 'Autoridad',
    ['card.validUntil'] = 'Válido hasta',
    ['card.noExpiry'] = 'Sin vencimiento',
    ['card.shownBy'] = '%s te muestra su pasaporte',
    ['card.show'] = 'Mostrar a persona cercana',
    ['card.close'] = 'Cerrar',
    ['card.escHint'] = 'Presiona Esc para cerrar',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Ene,Feb,Mar,Abr,May,Jun,Jul,Ago,Sep,Oct,Nov,Dic',
}

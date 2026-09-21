-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['pt-br'] = {
    -- Misc
    ['misc.citizen'] = 'Cidadão',
    ['misc.yourLocker'] = 'seu armário',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Passaporte',
    ['toast.notReadable'] = 'Este passaporte não está legível.',
    ['toast.nobodyClose'] = 'Não há ninguém perto o suficiente.',
    ['toast.showed'] = 'Você mostrou seu passaporte.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Você não está logado.',
    ['err.alreadyPending'] = 'Você já tem uma solicitação de passaporte em andamento.',
    ['err.needValid'] = 'Você precisa de um passaporte válido para isso.',
    ['err.alreadyValid'] = 'Você já tem um passaporte válido.',
    ['err.chooseType'] = 'Escolha um tipo de passaporte.',
    ['err.chooseLocker'] = 'Escolha onde retirar seu passaporte.',
    ['err.noCharInfo'] = 'Não foi possível ler os detalhes do seu personagem.',
    ['err.noPhoto'] = 'Não foi possível tirar sua foto. Fique parado, olhe para a câmera e tente novamente.',
    ['err.noNumber'] = 'Não foi possível criar um número de passaporte. Tente novamente.',
    ['err.noMoney'] = 'Você não tem dinheiro suficiente na sua conta bancária.',
    ['err.applyFailed'] = 'Não foi possível processar sua solicitação. Você não foi cobrado, tente novamente.',
    ['err.badRequest'] = 'Requisição inválida.',
    ['err.busy'] = 'Aguarde, sua última solicitação ainda está sendo processada.',
    ['err.generic'] = 'Algo deu errado. Tente novamente.',

    -- Emails
    ['mail.received.subject'] = 'Recebemos sua solicitação de passaporte',
    ['mail.received.body'] = 'Olá %s,\\n\\nRecebemos sua solicitação de %s e seu pagamento de %s%d.\\n\\nEstará pronto em %s. Enviaremos um email quando for enviado para você.',
    ['mail.sent.subject'] = 'Seu passaporte está a caminho',
    ['mail.sent.body'] = 'Olá %s,\\n\\nSeu passaporte foi enviado para %s. Abra o Postal Prime para seu código de retirada e retire-o do armário.\\n\\nNúmero do passaporte: %s',
    ['mail.issued.subject'] = 'Seu passaporte foi emitido',
    ['mail.issued.body'] = 'Olá %s,\\n\\nSeu passaporte está pronto e está no seu inventário. Uma cópia foi salva no seu app Arquivos.\\n\\nNúmero do passaporte: %s',

    -- Phone notifications
    ['phone.now'] = 'agora',
    ['phone.sent.title'] = 'Passaporte enviado',
    ['phone.sent.body'] = 'Seu passaporte foi enviado para %s.',
    ['phone.issued.title'] = 'Passaporte emitido',
    ['phone.issued.body'] = 'Seu passaporte foi emitido e adicionado ao seu inventário.',

    -- Item and parcel
    ['item.label'] = 'Passaporte',
    ['item.description'] = 'Passaporte %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Passaporte %s',
    ['doc.heading'] = 'Passaporte - %s',
    ['doc.number'] = 'Número do passaporte: %s',
    ['doc.surname'] = 'Sobrenome: %s',
    ['doc.given'] = 'Nomes: %s',
    ['doc.nationality'] = 'Nacionalidade: %s',
    ['doc.dob'] = 'Data de nascimento: %s',
    ['doc.sex'] = 'Sexo: %s',
    ['doc.issued'] = 'Data de emissão: %s',
    ['doc.place'] = 'Local de emissão: %s',
    ['doc.validUntil'] = 'Válido até: %s',

    -- Discord log
    ['discord.applied'] = 'Solicitação de passaporte',
    ['discord.issued'] = 'Passaporte emitido',
    ['discord.collected'] = 'Passaporte retirado',
    ['discord.revoked'] = 'Passaporte revogado',
    ['discord.type'] = 'Tipo',
    ['discord.character'] = 'Personagem',
    ['discord.citizenId'] = 'ID do Cidadão',
    ['discord.paid'] = 'Pago',
    ['discord.number'] = 'Número',
    ['discord.sentTo'] = 'Enviado para',
    ['discord.inventory'] = 'Inventário',
    ['discord.reason'] = 'Motivo',

    -- Card (NUI)
    ['card.title'] = 'Passaporte',
    ['card.valid'] = 'VÁLIDO',
    ['card.invalid'] = 'INVÁLIDO',
    ['card.expired'] = 'EXPIRADO',
    ['card.type'] = 'Tipo',
    ['card.number'] = 'Nº do passaporte',
    ['card.surname'] = 'Sobrenome',
    ['card.given'] = 'Nomes',
    ['card.nationality'] = 'Nacionalidade',
    ['card.sex'] = 'Sexo',
    ['card.dob'] = 'Data de nascimento',
    ['card.issued'] = 'Data de emissão',
    ['card.authority'] = 'Autoridade',
    ['card.validUntil'] = 'Válido até',
    ['card.noExpiry'] = 'Sem validade',
    ['card.shownBy'] = '%s mostra o passaporte para você',
    ['card.show'] = 'Mostrar para alguém próximo',
    ['card.close'] = 'Fechar',
    ['card.escHint'] = 'Pressione Esc para fechar',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Jan,Fev,Mar,Abr,Mai,Jun,Jul,Ago,Set,Out,Nov,Dez',
}

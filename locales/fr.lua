-- English. To add a language copy this file to locales/<code>.lua, translate the VALUES only (keep the keys and
-- the %s / %d placeholders in the same order), change 'en' below to your code and set Config.locale = '<code>'.
Locales = Locales or {}

Locales['fr'] = {
    -- Misc
    ['misc.citizen'] = 'Citoyen',
    ['misc.yourLocker'] = 'votre casier',

    -- Notifications (ox_lib toasts)
    ['toast.title'] = 'Passeport',
    ['toast.notReadable'] = 'Ce passeport n\'est pas lisible.',
    ['toast.nobodyClose'] = 'Il n\'y a personne assez proche.',
    ['toast.showed'] = 'Vous avez montré votre passeport.',

    -- Errors shown on the government website
    ['err.notSignedIn'] = 'Vous n\'êtes pas connecté.',
    ['err.alreadyPending'] = 'Vous avez déjà une demande de passeport en cours.',
    ['err.needValid'] = 'Vous avez besoin d\'un passeport valide pour ça.',
    ['err.alreadyValid'] = 'Vous avez déjà un passeport valide.',
    ['err.chooseType'] = 'Choisissez un type de passeport.',
    ['err.chooseLocker'] = 'Choisissez où récupérer votre passeport.',
    ['err.noCharInfo'] = 'Impossible de lire les détails de votre personnage.',
    ['err.noPhoto'] = 'Impossible de prendre votre photo. Restez immobile, regardez la caméra et réessayez.',
    ['err.noNumber'] = 'Impossible de créer un numéro de passeport. Veuillez réessayer.',
    ['err.noMoney'] = 'Vous n\'avez pas assez d\'argent sur votre compte bancaire.',
    ['err.applyFailed'] = 'Impossible de traiter votre demande. Vous n\'avez pas été débité, veuillez réessayer.',
    ['err.badRequest'] = 'Requête invalide.',
    ['err.busy'] = 'Veuillez patienter, votre dernière requête est toujours en cours de traitement.',
    ['err.generic'] = 'Une erreur s\'est produite. Veuillez réessayer.',

    -- Emails
    ['mail.received.subject'] = 'Nous avons reçu votre demande de passeport',
    ['mail.received.body'] = 'Bonjour %s,\\n\\nNous avons reçu votre demande de %s et votre paiement de %s%d.\\n\\nIl sera prêt à %s. Nous vous enverrons un email quand il vous sera envoyé.',
    ['mail.sent.subject'] = 'Votre passeport est en route',
    ['mail.sent.body'] = 'Bonjour %s,\\n\\nVotre passeport a été envoyé à %s. Ouvrez Postal Prime pour votre code de retrait, puis récupérez-le au casier.\\n\\nNuméro de passeport : %s',
    ['mail.issued.subject'] = 'Votre passeport a été délivré',
    ['mail.issued.body'] = 'Bonjour %s,\\n\\nVotre passeport est prêt et se trouve dans votre inventaire. Une copie est sauvegardée dans votre application Fichiers.\\n\\nNuméro de passeport : %s',

    -- Phone notifications
    ['phone.now'] = 'maintenant',
    ['phone.sent.title'] = 'Passeport envoyé',
    ['phone.sent.body'] = 'Votre passeport a été envoyé à %s.',
    ['phone.issued.title'] = 'Passeport délivré',
    ['phone.issued.body'] = 'Votre passeport a été délivré et ajouté à votre inventaire.',

    -- Item and parcel
    ['item.label'] = 'Passeport',
    ['item.description'] = 'Passeport %s, %s %s',

    -- Copy saved in the phone Files app
    ['doc.name'] = 'Passeport %s',
    ['doc.heading'] = 'Passeport - %s',
    ['doc.number'] = 'Numéro de passeport : %s',
    ['doc.surname'] = 'Nom : %s',
    ['doc.given'] = 'Prénoms : %s',
    ['doc.nationality'] = 'Nationalité : %s',
    ['doc.dob'] = 'Date de naissance : %s',
    ['doc.sex'] = 'Sexe : %s',
    ['doc.issued'] = 'Date de délivrance : %s',
    ['doc.place'] = 'Lieu de délivrance : %s',
    ['doc.validUntil'] = 'Valide jusqu\'au : %s',

    -- Discord log
    ['discord.applied'] = 'Demande de passeport',
    ['discord.issued'] = 'Passeport délivré',
    ['discord.collected'] = 'Passeport récupéré',
    ['discord.revoked'] = 'Passeport révoqué',
    ['discord.type'] = 'Type',
    ['discord.character'] = 'Personnage',
    ['discord.citizenId'] = 'ID Citoyen',
    ['discord.paid'] = 'Payé',
    ['discord.number'] = 'Numéro',
    ['discord.sentTo'] = 'Envoyé à',
    ['discord.inventory'] = 'Inventaire',
    ['discord.reason'] = 'Raison',

    -- Card (NUI)
    ['card.title'] = 'Passeport',
    ['card.valid'] = 'VALIDE',
    ['card.invalid'] = 'INVALIDE',
    ['card.expired'] = 'EXPIRÉ',
    ['card.type'] = 'Type',
    ['card.number'] = 'N° de passeport',
    ['card.surname'] = 'Nom',
    ['card.given'] = 'Prénoms',
    ['card.nationality'] = 'Nationalité',
    ['card.sex'] = 'Sexe',
    ['card.dob'] = 'Date de naissance',
    ['card.issued'] = 'Date d\'émission',
    ['card.authority'] = 'Autorité',
    ['card.validUntil'] = 'Valide jusqu\'au',
    ['card.noExpiry'] = 'Sans expiration',
    ['card.shownBy'] = '%s vous montre son passeport',
    ['card.show'] = 'Montrer à une personne proche',
    ['card.close'] = 'Fermer',
    ['card.escHint'] = 'Appuyez sur Échap pour fermer',

    -- Short month names for the card dates (comma separated, January first)
    ['meta.months'] = 'Jan,Fév,Mar,Avr,Mai,Jun,Jul,Aoû,Sep,Oct,Nov,Déc',
}

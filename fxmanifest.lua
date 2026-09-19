fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'as-passport'
author 'you'
description 'Passports for the server: apply on lsgov.co.uk (as-browser), delivered to a Postal Prime locker as an inventory item with the character mugshot, shown to nearby players as an ID card.'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
}

-- config.lua is SERVER ONLY: it holds the Discord webhook, and is never sent to players.
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/bridge.lua',
    'server/main.lua',
}

client_scripts {
    'client/main.lua',
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
}

dependencies {
    'ox_lib',
    'oxmysql',
}

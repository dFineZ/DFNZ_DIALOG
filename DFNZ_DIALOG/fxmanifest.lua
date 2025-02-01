fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'DFNZ'
description 'Dialogsystem by DFNZscripts'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua'
}

client_scripts {
    'shared/config.lua',
    'client/main.lua' 
}

exports {
    'openDialog', --> pedHandle, menü name, optionen
    'closeDialog'
}

escrow_ignore {
    'shared/config.lua',
}
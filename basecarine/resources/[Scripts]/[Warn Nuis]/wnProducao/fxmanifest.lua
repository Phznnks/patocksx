shared_script '@wAC/client-side/library.lua'








fx_version 'cerulean'
game 'gta5'

ui_page 'web-side/index.html'

server_scripts{
    '@vrp/lib/utils.lua',
    'server.lua'
}

client_scripts{
    '@vrp/lib/utils.lua',
    'client.lua'
}

files{
    'web-side/*',
    'web-side/**/*'
}              
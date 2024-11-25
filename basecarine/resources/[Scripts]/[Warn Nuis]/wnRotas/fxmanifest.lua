shared_script '@wAC/client-side/library.lua'








fx_version 'adamant'
game 'gta5'


client_scripts{
    "@vrp/lib/utils.lua",
    "cfg/cfg_rotas.lua",
    "client.lua",
}

server_scripts{
    "@vrp/lib/utils.lua",
    "server.lua",
}


ui_page "web-side/index.html"
files{
    "web-side/**",
    "web-side/**/*"
}
fx_version 'adamant'
game 'gta5'

ui_page "ui/index.html"
client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua",
	"cfg/config.lua",
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua",
	"cfg/config.lua",
}

shared_script 'cfg/config.lua'

files {
	"ui/*.html",
	"ui/*.js",
	"ui/*.css"
}


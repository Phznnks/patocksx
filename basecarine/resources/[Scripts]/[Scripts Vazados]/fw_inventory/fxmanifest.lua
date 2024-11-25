fx_version "bodacious"
game "gta5"

ui_page "ui/fiveware.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua",
	"config.lua",
	"itens_c.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua",
	"config.lua",
	"itens_s.lua"
}

files {
	"ui/*",
	"ui/**/*"
}
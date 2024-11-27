fx_version 'adamant'
game {'gta5'}

author 'Pequi Shop'
description 'Script for inventory'
version '1.0.1'

ui_page 'html/index.html'

shared_scripts {
    "config.lua",
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client/*.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server/*.lua"
}

files {
	'html/*.html',
	'html/**/*'
}

dependencies {
    'vrp'
}
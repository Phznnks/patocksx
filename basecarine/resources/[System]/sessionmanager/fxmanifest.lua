client_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

client_script 'client/empty.lua'    

server_scripts {
    "server/host_lock.lua",
    "server/host_manager.lua",
}

fx_version 'adamant'
games { 'rdr3', 'gta5' }
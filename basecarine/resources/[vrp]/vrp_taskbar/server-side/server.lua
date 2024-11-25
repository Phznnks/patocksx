local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vCLIENT = Tunnel.getInterface("vrp_taskbar")

exports("taskBar",function(...)    local value = vCLIENT.taskBar(...)    return value end)



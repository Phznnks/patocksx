local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface("wnEmpresas")

cas = Tunnel.getInterface("wnEmpresas")

local cassino = false
local timedown = 0
local cooldown = 0


Citizen.CreateThread(function()
	while true do
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
		Citizen.Wait(1000)
	end
end)

-- BOTÃO DO BLIP --

Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if not cassino then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for k,v in pairs(locs) do
				local distance = Vdist(x,y,z,v.x,v.y,v.z)
				if distance <= 1.1 and GetEntityHealth(ped) > 101 then
					sleep = 4
					
					DrawMarker(21, v.x,v.y,v.z-0.7,0,0,0,0,0,0,0.2,0.2,0.3,255, 255, 255,255,0,0,0,1)
					DrawMarker(27, v.x,v.y,v.z-1,0,0,0,0,0,0,0.4,0.4,0.5,255, 64, 64,255,0,0,0,1)
					if IsControlJustPressed(0,38) and cas.checarPermissao(v.Permissao) and timedown <= 0 then
						if cooldown == 0 then
							cooldown = 3600
							vSERVER.pegarDinheiro(v.Nome,v.Log,v.Min,v.Max)
						else
							cooldown2 = cooldown / 60 
							TriggerEvent("Notify","negado","Você pode pegar o seu proximo cofre em "..parseInt(cooldown2)..' Minutos')
						end
					end
				end
			end
		end
		Wait(sleep)
	end
end)

-- DRAWTEXT --

function draw3DText(x,y,z,text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35,0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255,255,255,215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125, 0.015+ factor,0.03,0,0,0,100)
end
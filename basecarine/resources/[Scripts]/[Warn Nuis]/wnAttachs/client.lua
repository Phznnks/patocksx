-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("wnAttachs",src)
vSERVER = Tunnel.getInterface("wnAttachs")

local silenciador = false

RegisterCommand('garmas',function(source,args,rawCommand)
	silenciador = false
	vSERVER.garmas()
end)

RegisterCommand("attachs",function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local ped = PlayerPedId()
	local ArmaSelect = GetSelectedPedWeapon(ped)
	if vSERVER.AttachsVerify() then
		for k,v in pairs(ListAttachs) do
			if ArmaSelect == GetHashKey(k) then
				if args[1] == "Carregador" then
					if v.Carregador then
						TriggerEvent("progress",5000,"Equipando Attachs")
						Wait(5000)
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Carregador))
					else
						TriggerEvent("Notify","negado","Nao tem esse <b>Attachs</b>.",8000)
					end
				elseif args[1] == "Silenciador" then
					if v.Silenciador then
						TriggerEvent("progress",5000,"Equipando Attachs")
						Wait(5000)
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Silenciador))
						silenciador = true
					else
						TriggerEvent("Notify","negado","Nao tem esse <b>Attachs</b>.",8000)
					end
				elseif args[1] == "Mira" then
					if v.Mira then
						TriggerEvent("progress",5000,"Equipando Attachs")
						Wait(5000)
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Mira))
					else
						TriggerEvent("Notify","negado","Nao tem esse <b>Attachs</b>.",8000)
					end
				elseif args[1] == "Grip" then
					if v.Grip then
						TriggerEvent("progress",5000,"Equipando Attachs")
						Wait(5000)
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Grip))
					else
						TriggerEvent("Notify","negado","Nao tem esse <b>Attachs</b>.",8000)
					end
				elseif args[1] == "Compensador" then
					if v.Compensador then
						TriggerEvent("progress",5000,"Equipando Attachs")
						Wait(5000)
						silenciador = false
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Compensador))
					else
						TriggerEvent("Notify","negado","Nao tem esse <b>Attachs</b>.",8000)
					end
				elseif args[1] == "Todos" then

					TriggerEvent("progress",5000,"Equipando Attachs")
					Wait(5000)

					if v.Carregador then
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Carregador))
					end

					if v.Compensador then
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Compensador))
					end

					if v.Mira then
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Mira))
					end

					if v.Grip then
						GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Grip))
					end
				else
					TriggerEvent("Notify","importante","Use <b>/attachs Compensador</b><br>Use <b>/attachs Grip</b></br>Use <b>/attachs Mira</b></br>",8000)
					TriggerEvent("Notify","importante","Use <b>/attachs Silenciador</b><br>Use <b>/attachs Carregador</b></br>Use <b>/attachs Todos</b></br>",8000)
				end
			end
		end
	end
end)

RegisterNetEvent("equiparAttachs")
AddEventHandler("equiparAttachs",function(Type)
	local ped = PlayerPedId()
	local ArmaSelect = GetSelectedPedWeapon(ped)
	for k,v in pairs(ListAttachs) do 
		if ArmaSelect == GetHashKey(k) then
			if Type == "carregador" then
				if v.Carregador then
					TriggerEvent("progress",5000,"Equipando Carregador")
					Wait(5000)
					GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Carregador))
					TriggerEvent("Notify","sucesso","Voce equipou a <b>Carregador</b>.",8000)
				else
					TriggerEvent("Notify","negado","Essa arma nao tem <b>Carregador</b>.",8000)
				end
			elseif Type == "silenciador" then
				if v.Silenciador then
					TriggerEvent("progress",5000,"Equipando Silenciador")
					Wait(5000)
					GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Silenciador))
					TriggerEvent("Notify","sucesso","Voce equipou a <b>Silenciador</b>.",8000)
					silenciador = true
				else
					TriggerEvent("Notify","negado","Essa arma nao tem <b>Silenciador</b>.",8000)
				end
			elseif Type == "compensador" then
				if v.Compensador then
					TriggerEvent("progress",5000,"Equipando Compensador")
					Wait(5000)
					GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Compensador))
					silenciador = false
					TriggerEvent("Notify","sucesso","Voce equipou a <b>Compensador</b>.",8000)
				else
					TriggerEvent("Notify","negado","Essa arma nao tem <b>Compensador</b>.",8000)
				end
			elseif Type == "mira" then
				if v.Mira then
					TriggerEvent("progress",5000,"Equipando Mira")
					Wait(5000)
					GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Mira))
					TriggerEvent("Notify","sucesso","Voce equipou a <b>Mira</b>.",8000)
				else
					TriggerEvent("Notify","negado","Essa arma nao tem <b>Mira</b>.",8000)
				end
			elseif Type == "grip" then
				if v.Grip then
					TriggerEvent("progress",5000,"Equipando Grip")
					Wait(5000)
					GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v.Grip))
					TriggerEvent("Notify","sucesso","Voce equipou a <b>Grip</b>.",8000)
				else
					TriggerEvent("Notify","negado","Essa arma nao tem <b>Grip</b>.",8000)
				end
			end
		end
	end
end)


RegisterNetEvent('changeWeaponColor')
AddEventHandler('changeWeaponColor', function(cor) 
    local tinta = tonumber(cor)
    local ped = PlayerPedId()
    local arma = GetSelectedPedWeapon(ped)
    if tinta >= 0 then
        SetPedWeaponTintIndex(ped,arma,tinta)
	else
		TriggerEvent("Notify","sucesso","Precisa insirar um <b>Numero</b>.",8000)
    end
end)


local blacklistedWeapons = {
	"GADGET_PARACHUTE",
	"WEAPON_PETROLCAN",
	"WEAPON_FLARE",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_KNIFE",
	"WEAPON_DAGGER",
	"WEAPON_KNUCKLE",
	"WEAPON_MACHETE",
	"WEAPON_SWITCHBLADE",
	"WEAPON_WRENCH",
	"WEAPON_HAMMER",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_HATCHET",
	"WEAPON_FLASHLIGHT",
	"WEAPON_RPG",
	"WEAPON_MOLOTOV",
	"WEAPON_BAT",
	"WEAPON_BOTTLE",
	"WEAPON_BATTLEAXE",
	"WEAPON_POOLCUE",
	"WEAPON_STONE_HATCHET",
	"WEAPON_NIGHTSTICK",
	"WEAPON_STUNGUN"
}

 Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(1)
 		local ped = PlayerPedId()
 		local blacklistweapon = false
 		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

 		for k,v in ipairs(blacklistedWeapons) do
 			if GetSelectedPedWeapon(ped) == GetHashKey(v) then
 				blacklistweapon = true
 			end
 		end

 		if IsPedShooting(ped) and not blacklistweapon and not silenciador then
 			TriggerServerEvent('atirando',x,y,z)
 		end

 		blacklistweapon = false
 	end
 end)

 local cooldown = 0

 Citizen.CreateThread(function()
	while true do
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
		Citizen.Wait(1000)
	end
end)


local blips = {}
RegisterNetEvent('notificacao')
AddEventHandler('notificacao',function(x,y,z,user_id)
	local distance = GetDistanceBetweenCoords(x,y,z,-186.1,-893.5,29.3,true)
	if distance <= 2100 then
		if cooldown <= 0 and not silenciador then
			PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
			TriggerEvent("Notify","aviso","Disparos de <b>Arma</b> de fogo, Verifique o Local.",8000)
			blips[user_id] = AddBlipForCoord(x,y,z)
			SetBlipScale(blips[user_id],0.5)
		   	SetBlipSprite(blips[user_id],10)
			SetBlipColour(blips[user_id],49)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Disparos de arma de fogo")
			EndTextCommandSetBlipName(blips[user_id])
			SetBlipAsShortRange(blips[user_id],false)
			cooldown = 10
			Wait(30000)
			if DoesBlipExist(blips[user_id]) then
				RemoveBlip(blips[user_id])
			end
		end
	end
end)
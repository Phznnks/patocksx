-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
fivewareItens = {}
Tunnel.bindInterface("fw_inventory-itens",fivewareItens)

vSERVER = Tunnel.getInterface("fw_inventory-itens")

-----------------------------------------------------------------------------------------------------------------------------------------
-- SETENERGETIC
-----------------------------------------------------------------------------------------------------------------------------------------
local energetic = 0
RegisterNetEvent("setEnergetic")
AddEventHandler("setEnergetic",function(timers,number)
	energetic = timers
	SetRunSprintMultiplierForPlayer(PlayerId(),number)
end)

Citizen.CreateThread(function()
	while true do
		local fwTS = 500
		if energetic > 0 then
			fwTS = 5
			RestorePlayerStamina(PlayerId(),1.0)
		end
		Citizen.Wait(fwTS)
	end
end)

Citizen.CreateThread(function()
	while true do
		if energetic > 0 then
			energetic = energetic - 1
			if energetic <= 0 or GetEntityHealth(PlayerPedId()) <= 101 then
				energetic = 0
				SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
			end
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETEFFECTDRUGS
-----------------------------------------------------------------------------------------------------------------------------------------
local drugseffect = 0
RegisterNetEvent("setEffectDrugs")
AddEventHandler("setEffectDrugs",function()
	drugseffect = drugseffect + 60
	if not GetScreenEffectIsActive("DMT_flight") then
		StartScreenEffect("DMT_flight",0,true)
	end
end)

Citizen.CreateThread(function()
	while true do
		if drugseffect > 0 then
			drugseffect = drugseffect - 1
			if drugseffect <= 0 or GetEntityHealth(PlayerPedId()) <= 101 then
				drugseffect = 0
				if GetScreenEffectIsActive("DMT_flight") then
					StopScreenEffect("DMT_flight")
				end
			end
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE
-----------------------------------------------------------------------------------------------------------------------------------------
local plateX = -1133.31
local plateY = 2694.2
local plateZ = 18.81

Citizen.CreateThread(function()
	while true do
		local fwTS = 500
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(plateX,plateY,plateZ))
			if distance <= 50.0 then
				fwTS = 5
				DrawMarker(23,plateX,plateY,plateZ-0.98,0,0,0,0,0,0,5.0,5.0,1.0,255,0,0,50,0,0,0,0)
			end
		end
		Citizen.Wait(fwTS)
	end
end)

function fivewareItens.plateDistance()
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsUsing(ped)
		if GetPedInVehicleSeat(vehicle,-1) == ped then
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(plateX,plateY,plateZ))
			if distance <= 3.0 then
				FreezeEntityPosition(vehicle,true)
				return true
			end
		end
	end
	return false
end

function fivewareItens.plateApply(plate)
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsUsing(ped)
	if IsEntityAVehicle(vehicle) then
		SetVehicleNumberPlateText(vehicle,plate)
		FreezeEntityPosition(vehicle,false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:repairVehicle")
AddEventHandler("inventory:repairVehicle",function(index,status)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			local fuel = GetVehicleFuelLevel(v)
			if status then
				SetVehicleFixed(v)
				SetVehicleDeformationFixed(v)
			end
			SetVehicleBodyHealth(v,1000.0)
			SetVehicleEngineHealth(v,1000.0)
			SetVehiclePetrolTankHealth(v,1000.0)
			SetVehicleFuelLevel(v,fuel)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRTIRES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:repairTires")
AddEventHandler("inventory:repairTires",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			for i = 0,8 do
				SetVehicleTyreFixed(v,i)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCKPICKVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:lockpickVehicle")
AddEventHandler("inventory:lockpickVehicle",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			SetEntityAsMissionEntity(v,true,true)
			if GetVehicleDoorsLockedForPlayer(v,PlayerId()) == 1 then
				SetVehicleDoorsLocked(v,false)
				SetVehicleDoorsLockedForAllPlayers(v,false)
			else
				SetVehicleDoorsLocked(v,true)
				SetVehicleDoorsLockedForAllPlayers(v,true)
			end
			SetVehicleLights(v,2)
			Wait(200)
			SetVehicleLights(v,0)
			Wait(200)
			SetVehicleLights(v,2)
			Wait(200)
			SetVehicleLights(v,0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKBUTTONS
-----------------------------------------------------------------------------------------------------------------------------------------
local blockButtons = false
function fivewareItens.blockButtons(status)
	blockButtons = status
end

Citizen.CreateThread(function()
	while true do
		local fwTS = 500
		if blockButtons then
			fwTS = 5
			DisableControlAction(1,73,true)
			DisableControlAction(1,75,true)
			DisableControlAction(1,29,true)
			DisableControlAction(1,47,true)
			DisableControlAction(1,105,true)
			DisableControlAction(1,187,true)
			DisableControlAction(1,189,true)
			DisableControlAction(1,190,true)
			DisableControlAction(1,188,true)
			DisableControlAction(1,311,true)
			DisableControlAction(1,245,true)
			DisableControlAction(1,257,true)
			DisableControlAction(1,288,true)
			DisableControlAction(1,37,true)
			DisablePlayerFiring(PlayerPedId(),true)
		end
		Citizen.Wait(fwTS)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARACHUTECOLORS
-----------------------------------------------------------------------------------------------------------------------------------------
function fivewareItens.parachuteColors()
	AddPlayerWeapon(PlayerPedId(),"GADGET_PARACHUTE",1,false,true)
	SetPedParachuteTintIndex(PlayerPedId(),math.random(7))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CASHREGISTER
-----------------------------------------------------------------------------------------------------------------------------------------
local registerCoords = {}
function fivewareItens.cashRegister()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	for k,v in pairs(registerCoords) do
		local distance = #(coords - vector3(v[1],v[2],v[3]))
		if distance <= 1 then
			return false,v[1],v[2],v[3]
		end
	end

	local object = GetClosestObjectOfType(coords,0.4,GetHashKey("prop_till_01"),0,0,0)
	if DoesEntityExist(object) then
		SetEntityHeading(ped,GetEntityHeading(object)-360.0)
		local coords = GetEntityCoords(object)
		return true,coords.x,coords.y,coords.z
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEREGISTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:updateRegister")
AddEventHandler("inventory:updateRegister",function(status)
	registerCoords = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECHARGEWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
local weapon_ammos = {
	["WEAPON_PISTOL_AMMO"] = {
		"WEAPON_PISTOL",
		"WEAPON_PISTOL_MK2",
		"WEAPON_APPISTOL",
		"WEAPON_HEAVYPISTOL",
		"WEAPON_SNSPISTOL",
		"WEAPON_SNSPISTOL_MK2",
		"WEAPON_VINTAGEPISTOL",
		"WEAPON_PISTOL50",
		"WEAPON_REVOLVER",
		"WEAPON_COMBATPISTOL"
	},
	["WEAPON_SMG_AMMO"] = {
		"WEAPON_COMPACTRIFLE",
		"WEAPON_MICROSMG",
		"WEAPON_MINISMG",
		"WEAPON_SMG",
		"WEAPON_ASSAULTSMG",
		"WEAPON_GUSENBERG",
		"WEAPON_MACHINEPISTOL"
	},
	["WEAPON_RIFLE_AMMO"] = {
		"WEAPON_CARBINERIFLE",
		"WEAPON_ASSAULTRIFLE",
		"WEAPON_ASSAULTRIFLE_MK2"
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		"WEAPON_PUMPSHOTGUN",
		"WEAPON_SAWNOFFSHOTGUN"
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		"WEAPON_PETROLCAN"
	}
}

function fivewareItens.verifyAmmoType(ammoType)
	local ped = PlayerPedId()
	if weapon_ammos[ammoType] then
		return weapon_ammos[ammoType]
	end
	return false
end

function fivewareItens.rechargeCheck(ammoType)
	local ped = PlayerPedId()
	if weapon_ammos[ammoType] then
		for k,v in pairs(weapon_ammos[ammoType]) do
			if HasPedGotWeapon(ped,v) then
				return true
			end
		end
	end
	return false
end

function fivewareItens.rechargeWeapon(ammoType,ammoAmount)
	local ped = PlayerPedId()
	if weapon_ammos[ammoType] then
		for k,v in pairs(weapon_ammos[ammoType]) do
			if HasPedGotWeapon(ped,v) then
				AddAmmoToPed(ped,v,parseInt(ammoAmount))
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ATTACHS
-----------------------------------------------------------------------------------------------------------------------------------------
local wComponents = {
	["WEAPON_PISTOL"] = {
		"COMPONENT_AT_PI_FLSH"
	},
	["WEAPON_HEAVYPISTOL"] = {
		"COMPONENT_AT_PI_FLSH"
	},
	["WEAPON_PISTOL_MK2"] = {
		"COMPONENT_AT_PI_RAIL",
		"COMPONENT_AT_PI_FLSH_02",
		"COMPONENT_AT_PI_COMP"
	},
	["WEAPON_COMBATPISTOL"] = {
		"COMPONENT_AT_PI_FLSH"
	},
	["WEAPON_APPISTOL"] = {
		"COMPONENT_AT_PI_FLSH"
	},
	["WEAPON_MICROSMG"] = {
		"COMPONENT_AT_PI_FLSH",
		"COMPONENT_AT_SCOPE_MACRO"
	},
	["WEAPON_SMG"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MACRO_02",
		"COMPONENT_AT_PI_SUPP"
	},
	["WEAPON_ASSAULTSMG"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MACRO",
		"COMPONENT_AT_AR_SUPP_02"
	},
	["WEAPON_COMBATPDW"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_AR_AFGRIP",
		"COMPONENT_AT_SCOPE_SMALL"
	},
	["WEAPON_PUMPSHOTGUN"] = {
		"COMPONENT_AT_AR_FLSH"
	},
	["WEAPON_CARBINERIFLE"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MEDIUM",
		"COMPONENT_AT_AR_AFGRIP"
	},
	["WEAPON_ASSAULTRIFLE"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MACRO",
		"COMPONENT_AT_AR_AFGRIP"
	},
	["WEAPON_MACHINEPISTOL"] = {
		"COMPONENT_AT_PI_SUPP"
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		"COMPONENT_AT_AR_AFGRIP_02",
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MEDIUM_MK2",
		"COMPONENT_AT_MUZZLE_01"
	},
	["WEAPON_PISTOL50"] = {
		"COMPONENT_AT_PI_FLSH"
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		"COMPONENT_AT_PI_FLSH_03",
		"COMPONENT_AT_PI_RAIL_02",
		"COMPONENT_AT_PI_COMP_02"
	},
	["WEAPON_SMG_MK2"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2",
		"COMPONENT_AT_MUZZLE_01"
	},
	["WEAPON_BULLPUPRIFLE"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_SMALL",
		"COMPONENT_AT_AR_SUPP"
	},
	["WEAPON_BULLPUPRIFLE_MK2"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MACRO_02_MK2",
		"COMPONENT_AT_MUZZLE_01"
	},
	["WEAPON_SPECIALCARBINE"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MEDIUM",
		"COMPONENT_AT_AR_AFGRIP"
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
		"COMPONENT_AT_AR_FLSH",
		"COMPONENT_AT_SCOPE_MEDIUM_MK2",
		"COMPONENT_AT_MUZZLE_01"
	}
}

RegisterCommand("attachs",function(source,args)
	local ped = PlayerPedId()
	for k,v in pairs(wComponents) do
		if GetSelectedPedWeapon(ped) == GetHashKey(k) then
			for k2,v2 in pairs(v) do
				GiveWeaponComponentToPed(ped,GetHashKey(k),GetHashKey(v2))
			end
		end
	end
end)
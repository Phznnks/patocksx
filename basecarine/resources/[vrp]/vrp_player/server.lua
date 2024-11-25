local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
src = {}
Tunnel.bindInterface("vrp_player",src)
vDIAGNOSTIC = Tunnel.getInterface("vrp_diagnostic")


-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK ROUPAS SERVER.LUA
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkRoupas()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.")
			return false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÃO
----------------------------------------------------------------------------------------------------------------------------------------
local cooldown = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALÁRIO
-------------------------------------------------------------------------------------------------------------------------------------------
local salarios = {
	{ ['permissao'] = "bronze.permissao", ['nome'] = "BRONZE", ['payment'] = 3500 },
	{ ['permissao'] = "prata.permissao", ['nome'] = "PRATA", ['payment'] = 5000 },
	{ ['permissao'] = "ouro.permissao", ['nome'] = "OURO", ['payment'] = 8000 },
	{ ['permissao'] = "platina.permissao", ['nome'] = "PLATINA", ['payment'] = 12000 },

	{ ['permissao'] = "juiza.permissao", ['nome'] = "JUIZA", ['payment'] = 10000 },
	{ ['permissao'] = "news.permissao", ['nome'] = "News", ['payment'] = 2300 },

---- | Policia | ----
	{ ['permissao'] = "policiaI.permissao", ['nome'] = "POLICIA", ['payment'] = 4500 },
	{ ['permissao'] = "policiaII.permissao", ['nome'] = "POLICIA", ['payment'] = 5500 },
	{ ['permissao'] = "policiaIII.permissao", ['nome'] = "POLICIA", ['payment'] = 6000 },
	{ ['permissao'] = "policiaIIII.permissao", ['nome'] = "POLICIA", ['payment'] = 6500 },
	{ ['permissao'] = "policiaIIIII.permissao", ['nome'] = "POLICIA", ['payment'] = 7500 },
	{ ['permissao'] = "policiaIC.permissao", ['nome'] = "POLICIA", ['payment'] = 8000 },
	{ ['permissao'] = "policiaIMAJ.permissao", ['nome'] = "POLICIA", ['payment'] = 8500 },
	{ ['permissao'] = "policiaASS.permissao", ['nome'] = "POLICIA", ['payment'] = 9000 },
	{ ['permissao'] = "policiaICH.permissao", ['nome'] = "POLICIA", ['payment'] = 10000 },

---- | Paramedico | ----
    { ['permissao'] = "Estagiario.permissao", ['nome'] = "Hospital", ['payment'] = 2000 },
	{ ['permissao'] = "Enfermagem.permissao", ['nome'] = "Hospital", ['payment'] = 3000 },
	{ ['permissao'] = "Enfermeiro.permissao", ['nome'] = "Hospital", ['payment'] = 3500 },
	{ ['permissao'] = "Medico.permissao", ['nome'] = "Hospital", ['payment'] = 4000 },
	{ ['permissao'] = "Socorrista.permissao", ['nome'] = "Hospital", ['payment'] = 4500 },
	{ ['permissao'] = "Clinico.permissao", ['nome'] = "Hospital", ['payment'] = 5000 },
	{ ['permissao'] = "Cirurgiao.permissao", ['nome'] = "Hospital", ['payment'] = 5500 },
	{ ['permissao'] = "Gerente.permissao", ['nome'] = "Hospital", ['payment'] = 7000 },
	{ ['permissao'] = "Hospital.permissao", ['nome'] = "Hospital", ['payment'] = 9000 },
---- | Mecanico | ----
    { ['permissao'] = "aprendizmecanico.permissao", ['nome'] = "MECANICO", ['payment'] = 2000 },
	{ ['permissao'] = "mecanicosalario.permissao", ['nome'] = "MECANICO", ['payment'] = 3000 },
	{ ['permissao'] = "tunador.permissao", ['nome'] = "MECANICO", ['payment'] = 3500 },
	{ ['permissao'] = "gerentemec.permissao", ['nome'] = "MECANICO", ['payment'] = 5000 },
	{ ['permissao'] = "chefemec.permissao", ['nome'] = "MECANICO", ['payment'] = 6000 },
---------------------
	{ ['permissao'] = "burgershot.permissao", ['nome'] = "BURGERSHOT", ['payment'] = 2000 },
	{ ['permissao'] = "advogadosa.permissao", ['nome'] = "ADVOGADO", ['payment'] = 5000 }
}

RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento',function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(salarios) do
			if vRP.hasPermission(user_id,v.permissao) then
				TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
				TriggerClientEvent("Notify",source,"importante","Obrigado por colaborar com a cidade, seu salario de <b>$"..vRP.format(parseInt(v.payment)).." dólares</b> foi depositado.")
				vRP.giveBankMoney(user_id,parseInt(v.payment))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COR NA ARMA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cor', function(source, args)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "cor.permissao") then
        TriggerClientEvent('changeWeaponColor', source, args[1])
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------
-- ATTACHS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("attachs",function(source,args)
	local ped = PlayerPedId()
    if vRP.hasPermission(user_id, "attachs.permissao") then
	if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),GetHashKey("COMPONENT_AT_PI_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SMG"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SMG"),GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPDW") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),GetHashKey("COMPONENT_AT_SIGHTS"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),GetHashKey("COMPONENT_AT_AR_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_MICROSMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_PI_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTRIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_RAIL"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_FLSH_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_COMP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_REVOLVER_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_REVOLVER_MK2"),GetHashKey("COMPONENT_AT_PI_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_REVOLVER_MK2"),GetHashKey("COMPONENT_AT_SIGHTS"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_REVOLVER_MK2"),GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_IND_01"))	
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTSMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTSMG"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTSMG"),GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTSMG"),GetHashKey("COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL"),GetHashKey("COMPONENT_AT_PI_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"),GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01"))	
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"),GetHashKey("COMPONENT_AT_MUZZLE_04"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"),GetHashKey("COMPONENT_AT_SIGHTS"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"),GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"),GetHashKey("COMPONENT_AT_AR_FLSH"))
	   end 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GCOLETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gcolete',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        local armour = vRPclient.getArmour(source)
        local tempog = math.random(2000,6000)
        Citizen.Wait(tempog)
		if armour == 100 then
			vRPclient.setArmour(source,0)
       		vRP.giveInventoryItem(user_id,"colete",1) 
			TriggerClientEvent("Notify",source,"sucesso","Você guardou seu Colete na mochila.")
        else
			TriggerClientEvent("Notify",source,"sucesso","Seu colete está danificado, não foi possível guardar.")
		end
        Citizen.Wait(2000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REBOCAR 
-----------------------------------------------------------------------------------------------------------------------------------------
local reboque = nil
local rebocado = nil
RegisterCommand("rebocar",function(source,args)
    local vehicle = GetPlayersLastVehicle()
    local vehicletow = IsVehicleModel(vehicle,GetHashKey("flatbed"))

    if vehicletow and not IsPedInAnyVehicle(PlayerPedId()) then
        rebocado = getVehicleInDirection(GetEntityCoords(PlayerPedId()),GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,5.0,0.0))
        if IsEntityAVehicle(vehicle) and IsEntityAVehicle(rebocado) then
            TriggerServerEvent("trytow",VehToNet(vehicle),VehToNet(rebocado))
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ID
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		local nuser_id = vRP.getUserId(nplayer)
		vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 100px; padding: 20px 20px 5px; top: 7%; right: 10%; position: absolute; border: 1px solid rgba(0,0,0,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local b { color: #DAA520;}","<div class=\"local\"><b>ID:</b> " ..parseInt(nuser_id).. " </div>")
		vRP.request(source,"Você deseja fechar?",1000)
		vRPclient.removeDiv(source,"completerg")
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Nenhum Jogador Próximo</b>")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MASCARA
----------------------------------------------------------------------------------------------------------------------------------------- 
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmascara",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OCULOS
----------------------------------------------------------------------------------------------------------------------------------------- 
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setoculos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAPEU 
----------------------------------------------------------------------------------------------------------------------------------------- 
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setchapeu",source,args[1],args[2])
				end
			end
		end
	end
end)

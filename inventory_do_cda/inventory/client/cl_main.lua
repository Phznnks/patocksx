-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local config = module(GetCurrentResourceName(),"config")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
highRP = {}
Tunnel.bindInterface("inventory",highRP)
vSERVER = Tunnel.getInterface("inventory")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local homeschestweight = 0
local opentrytrunk     = false
local uCarry           = nil
local iCarry           = false
local sCarry           = false
local blips            = {}
local dropList         = {}
local cooldown         = false
local createblips      = false
local PlayerPedPreview = nil

function createPedScreen() 
	CreateThread(function()
		heading = GetEntityHeading(PlayerPedId())
		upaljeno = true
		SetFrontendActive(true)
		ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), true, -1)
		Citizen.Wait(100)
		N_0x98215325a695e78a(false)

 		PlayerPedPreview = ClonePed(PlayerPedId(), heading, true, false)
 		local x,y,z = table.unpack(GetEntityCoords(PlayerPedPreview))
 		SetEntityCoords(PlayerPedPreview, x,y,z-10)
 		FreezeEntityPosition(PlayerPedPreview, true)
		SetEntityVisible(PlayerPedPreview, false, false)
		NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
		Wait(200)
		SetPedAsNoLongerNeeded(PlayerPedPreview)
		GivePedToPauseMenu(PlayerPedPreview, 0)
		SetPauseMenuPedLighting(true)
		SetPauseMenuPedSleepState(true)
		ReplaceHudColourWithRgba(117, 0, 0, 0, 0) --transparent
	end)
end

function deletePedScreen()
	DeleteEntity(PlayerPedPreview)
   	SetFrontendActive(false)
	   ReplaceHudColourWithRgba(117, 0, 0, 0, 186)
   	PlayerPedPreview = nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("inventoryuse 1","Inventory Bind 1","keyboard","1")
RegisterKeyMapping("inventoryuse 2","Inventory Bind 2","keyboard","2")
RegisterKeyMapping("inventoryuse 3","Inventory Bind 3","keyboard","3")
RegisterKeyMapping("inventoryuse 4","Inventory Bind 4","keyboard","4")
RegisterKeyMapping("inventoryuse 5","Inventory Bind 5","keyboard","5")
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORYUSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("inventoryuse",function(source,args)
	if not IsPauseMenuActive() then
		local ped = PlayerPedId()
		if not celular and GetEntityHealth(ped) > 101 then
			if args[1] == "1" then
				TriggerServerEvent("inventory:useItem","1",1)
			elseif args[1] == "2" then
				TriggerServerEvent("inventory:useItem","2",1)
			elseif args[1] == "3" then
				TriggerServerEvent("inventory:useItem","3",1)
			elseif args[1] == "4" then
				TriggerServerEvent("inventory:useItem","4",1)
			elseif args[1] == "5" then
				TriggerServerEvent("inventory:useItem","5",1)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("invClose",function(data,cb)
	deletePedScreen()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = "hideMenu" })

	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) and opentrytrunk then
		opentrytrunk = false
		TriggerServerEvent("trytrunk",VehToNet(vehicle))
	end

	homeschestweight = 0
	TriggerServerEvent("homeschest:Close")
	TriggerServerEvent("trade:Close")
	TriggerServerEvent("inspect:reset")
	TriggerEvent("hud:setShow", true)
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSEINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function highRP.closeInventory()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = "hideMenu" })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("inventory:moc",function(source,args)
	local ped      = PlayerPedId()
	local coords   = GetEntityCoords(ped)
	local nuser_id = vRP.getNearestPlayer(3)
	if not IsPlayerFreeAiming(ped) and GetEntityHealth(ped) > 101 then
		for _,shop in pairs(config.shops) do
			for k,v in pairs(shop.coords) do
				local distance = #(coords - vector3(v.x,v.y,v.z))
				if distance < 1.2 then
					if shop.checkpermissions ~= nil then
						if not vSERVER.checkPermissions(shop.checkpermissions) then
							return
						end
					end

					if shop.checkoffice ~= nil then
						if vSERVER.checkOffice(shop.checkoffice) then
							return
						end
					end
					SetNuiFocus(true,true)
					SetCursorLocation(0.5,0.5)
					SendNUIMessage({ action = "showShop", index = _, type = shop.type })
					return
				end
			end
		end

		for _,chest in pairs(config.chest) do
			for k,v in pairs(chest.coords) do
				local distance = #(coords - vector3(v.x,v.y,v.z))
				if distance < 1.2 and not nuser_id then
					if vSERVER.checkPermissions(chest.permissions) then
						SetNuiFocus(true,true)
						SetCursorLocation(0.5,0.5)
						SendNUIMessage({ action = "showChest", index = _ })
						return
					end
				end
			end
		end

		createPedScreen()
		SetNuiFocus(true,true)
		SetCursorLocation(0.5,0.5)
		SendNUIMessage({ action = "showMenu" })
		TriggerEvent("hud:setShow", false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("inventory:moc","Abrir a mochila","keyboard","oem_3")
-- oem_3
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("inventory:trunkchest",function(source,args)
	TriggerServerEvent("trytrunk:trunk")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("inventory:trunkchest","Abrir a porta malas","keyboard","PAGEUP")
-- PAGEUP
-----------------------------------------------------------------------------------------------------------------------------------------
-- inventory:open
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:open",function(id)
	SetNuiFocus(true,true)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = "showMenuId", id = id })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- trunkchest:Open
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("trunkchest:Open",function(index)
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) then
		SetNuiFocus(true,true)
		SetCursorLocation(0.5,0.5)
		SendNUIMessage({ action = "showTrunkChest", index = index })

		local vehicle = vRP.getNearestVehicle(7)
		if IsEntityAVehicle(vehicle) then
			opentrytrunk = true
			TriggerServerEvent("trytrunk",VehToNet(vehicle))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- synctrunk
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("synctrunk",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local isopen = GetVehicleDoorAngleRatio(v,5)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if isopen == 0 then
					SetVehicleDoorOpen(v,5,0,0)
				else
					SetVehicleDoorShut(v,5,0)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- homeschest:Open
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("homeschest:Open",function(index, weight)
	local nuser_id = vRP.getNearestPlayer(3)
	if not nuser_id then
		homeschestweight = weight
		SetNuiFocus(true,true)
		SetCursorLocation(0.5,0.5)
		SendNUIMessage({ action = "showHomesChest", index = index })
	else
		TriggerEvent("Notify","negado","Existem pessoas perto",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- inspect:Open
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inspect:Open",function(index)
	SetNuiFocus(true,true)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = "showInspect", index = index })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- inspect:Open
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("trade:Open",function(index, money)
	SetNuiFocus(true,true)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = "showTrade", index = index })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("dropItem",function(data)
	local ped = GetPlayerPed(-1)
	if IsPedArmed(ped,1) or IsPedArmed(ped,2) or IsPedArmed(ped,4) then
		TriggerServerEvent("inventory:dropItem",data.item,data.amount,true)
	else
		TriggerServerEvent("inventory:dropItem",data.item,data.amount,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDROPITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function highRP.checkdropItem()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	for i = 1, #config.propTrashCans do
		if DoesObjectOfTypeExistAtCoords(coords,0.7,GetHashKey(config.propTrashCans[i]),true) then
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("useItem",function(data,cb)
	TriggerServerEvent("inventory:useItem",data.slot,data.amount)
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUBMIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sendItem",function(data,cb)
	local ped = GetPlayerPed(-1)
	if IsPedArmed(ped,1) or IsPedArmed(ped,2) or IsPedArmed(ped,4) then
		TriggerServerEvent("inventory:sendItem",data.item,data.amount)
	else
		TriggerServerEvent("inventory:sendItem",data.item,data.amount)
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data,cb)
	local ped = GetPlayerPed(-1)
	if IsPedArmed(ped) or IsPedArmed(ped,2) or IsPedArmed(ped,4) then
		TriggerServerEvent("inventory:updateSlot",data.item,data.slot,data.target,data.amount)
	else
		TriggerServerEvent("inventory:updateSlot",data.item,data.slot,data.target,data.amount)
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- functionShops
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(data,cb)
	TriggerServerEvent("inventory:functionShops",data.shop,data.item,data.amount,data.slot)
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUMSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sumSlot",function(data,cb)
	TriggerServerEvent("inventory:sumSlot",data.chest,data.item,data.slot,data.amount)
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("storeItem",function(data,cb)
	TriggerServerEvent("inventory:storeItem",data.chest,data.item,data.slot,data.amount,homeschestweight)
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOCHILA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestMochila",function(data,cb)
	local inventario,peso,maxpeso,slots,infos,ipimages = vSERVER.Mochila(data.id)
	if inventario then
		cb({ inventario = inventario, peso = peso, maxpeso = maxpeso, slots = slots, infos = infos, ipimages = ipimages })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestShop",function(data,cb)
	local itens,ipimages = vSERVER.Shop(data.shop)
	if itens then
		cb({ itens = itens, ipimages = ipimages })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- requestChest
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestChest",function(data,cb)
	local itens,peso,weight,slots,ipimages = vSERVER.Chest(data.chest)
	if itens then
		cb({ itens = itens, peso = peso, weight = weight, slots = slots, ipimages = ipimages })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- requestTrunkChest
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestTrunkChest",function(data,cb)
	local itens,peso,weight,slots,ipimages = vSERVER.TrunkChest()
	if itens then
		cb({ itens = itens, peso = peso, weight = weight, slots = slots, ipimages = ipimages })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- requestHomesChest
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestHomesChest",function(data,cb)
	local itens,peso,slots,ipimages = vSERVER.HomesChest(data.home)
	if itens then
		cb({ itens = itens, peso = peso, weight = homeschestweight, slots = slots, ipimages = ipimages })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- requestTrade
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestTrade",function(data,cb)
	local trade,mytrade,name,ipimages = vSERVER.requestTrade(data.id)
	if trade then
		cb({ trade = trade, mytrade = mytrade, name = name, ipimages = ipimages })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- inventory:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- inventory:REMOVEDROP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('inventory:RemoveDrop')
AddEventHandler('inventory:RemoveDrop',function(id)
	if dropList[id] ~= nil then
		dropList[id] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- inventory:CREATEDROP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('inventory:CreateDrop')
AddEventHandler('inventory:CreateDrop',function(id,marker)
	dropList[id] = marker
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKBUTTONS
-----------------------------------------------------------------------------------------------------------------------------------------
local blockButtons = false
function highRP.blockButtons(status)
	blockButtons = status
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBUTTONS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if blockButtons then
			timeDistance = 4
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
		  --DisableControlAction(1,37,true)
			DisablePlayerFiring(PlayerPedId(),true)
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADRENALINEDISTANCE
-----------------------------------------------------------------------------------------------------------------------------------------
function highRP.adrenalineDistance()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	for k,v in pairs(config.adrenalinacoords) do
		local distance = #(coords - vector3(v[1],v[2],v[3]))
		if distance <= 5 then
			return true
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIRECRACKER
-----------------------------------------------------------------------------------------------------------------------------------------
local firecracker = nil
RegisterNetEvent("inventory:Firecracker",function()
	if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
		RequestNamedPtfxAsset("scr_indep_fireworks")
		while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
			RequestNamedPtfxAsset("scr_indep_fireworks")
			Citizen.Wait(10)
		end
	end

	local mHash = GetHashKey("ind_prop_firework_03")

	RequestModel(mHash)
	while not HasModelLoaded(mHash) do
		RequestModel(mHash)
		Citizen.Wait(10)
	end

	local explosives = 25
	local ped = PlayerPedId()
	local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.6,0.0)
	firecracker = CreateObjectNoOffset(mHash,coords.x,coords.y,coords.z,true,false,false)

	PlaceObjectOnGroundProperly(firecracker)
	FreezeEntityPosition(firecracker,true)
	SetModelAsNoLongerNeeded(mHash)

	Citizen.Wait(10000)

	repeat
		UseParticleFxAssetNextCall("scr_indep_fireworks")
		local explode = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst",coords.x,coords.y,coords.z,0.0,0.0,0.0,2.5,false,false,false,false)
		explosives = explosives - 1

		Citizen.Wait(2000)
	until explosives == 0

	TriggerServerEvent("trydeleteobj",ObjToNet(firecracker))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- entityHeading
-----------------------------------------------------------------------------------------------------------------------------------------
function highRP.entityHeading()
	return GetEntityHeading(PlayerPedId())
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setEntityHeading
-----------------------------------------------------------------------------------------------------------------------------------------
function highRP.setEntityHeading(h)
	SetEntityHeading(PlayerPedId(),h)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- inVehicle
-----------------------------------------------------------------------------------------------------------------------------------------
function highRP.inVehicle(source)
	local ped = PlayerPedId(source)
	if IsPedInAnyVehicle(ped) then
		return true
	else
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- inspect:toggleCarry
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inspect:toggleCarry",function(source)
	uCarry = source
	iCarry = not iCarry

	local ped = PlayerPedId()
	if iCarry and uCarry then
		print(1)
		Citizen.InvokeNative(0x6B9BBD38AB0796DF,PlayerPedId(),GetPlayerPed(GetPlayerFromServerId(uCarry)),4103,11816,0.5,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
		sCarry = true
	else
		print(2)
		if sCarry then
			print(3)
			DetachEntity(ped,true,false)
			sCarry = false
		end
	end	
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Thread Blips
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle    = 1000
		local ped     = PlayerPedId()
		local pcoords = GetEntityCoords(ped)
		local r,g,b   = table.unpack(config.drawmarker.colorrgb)

		if #blips > 0 then
            if not createblips then
                highRP.CreateSpawnBlips()
            end
			for _,coords in pairs(blips) do
				local x,y,z    = coords.x,coords.y,coords.z
				local distance = #(pcoords - vector3(x,y,z))
				if distance <= 5 then
					idle = 5
					DrawMarker(config.drawmarker.blip,x,y,z-0.90,0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, r, g, b, 180, 0, 0, 0, config.drawmarker.rotate)
					if distance <= 1.5 then
                        drawTxt(coords.title,4,0.5,0.92,0.35,255,255,255,180)
					end
				end
			end
		else
		
			for k,v in pairs(config.chest) do
				for _,coords in pairs(v.coords) do
					local ndata = {
						x     = coords.x,
						y     = coords.y,
						z     = coords.z,
						title = "Abra o inventário para acessar o baú"
					}
					table.insert(blips, ndata)
				end
			end
			
			for k,v in pairs(config.shops) do
				for _,coords in pairs(v.coords) do
					local ndata = {
						x        = coords.x,
						y        = coords.y,
						z        = coords.z,
						blipinfo = v.blip,
						title    = "Abra o inventário para acessar a loja"
					}
					table.insert(blips, ndata)
				end			
			end
		end

		for k,v in pairs(dropList) do
			local x,y,z    = v.x,v.y,v.z
			local distance = #(pcoords - vector3(x,y,z))
			if distance <= 15 then
				idle = 5
				DrawMarker(config.drawmarker.blip, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, r, g, b, 180, 0, 0, 0, config.drawmarker.rotate)
				if distance < 1.2 then
					drawTxt("Pressione [~g~E~w~] para pegar ~g~"..v.count.."~w~x ~g~"..string.upper(v.name).."~w~.",4,0.5,0.90,0.35,255,255,255,255)
					if distance <= 1.2 and v.count ~= nil and v.name ~= nil and not IsPedInAnyVehicle(ped) then
						if IsControlJustPressed(1,38) and not cooldown then
							cooldown = true
							TriggerServerEvent('inventory:take',k)
							SetTimeout(3000,function()
								cooldown = false
							end)
						end
					end
				end
			end
		end

		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CreateSpawnBlip
-----------------------------------------------------------------------------------------------------------------------------------------
function highRP.CreateSpawnBlips()
    for k, v in pairs(blips) do
        if v.blipinfo ~= nil then
            if v.blipinfo.show ~= nil and v.blipinfo.show then
                local blip = AddBlipForCoord(v.x,v.y,v.z)
                SetBlipSprite(blip, v.blipinfo.id)
                SetBlipColour(blip, v.blipinfo.color)
                SetBlipScale(blip, v.blipinfo.scale)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.blipinfo.name)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
    createblips = true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- drawTxt
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
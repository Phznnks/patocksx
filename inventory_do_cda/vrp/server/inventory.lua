-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATE:ADVTOOLBOX
-----------------------------------------------------------------------------------------------------------------------------------------
-- for i = 1,99 do
-- 	items.list["toolboxes"..i] = {
-- 		index = "toolbox",
-- 		name = "Caixa de Ferramentas",
-- 		desc = "",
-- 		tipo = "Ferramentas",
-- 		unity = "Não",
-- 		economy = "500",
-- 		type = "use",
-- 		weight = 1.75
-- 	}
-- end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getInventory
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventory(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		for k,v in pairs(data.inventorys) do
            if v.item and v.timestamp then
                if v.timestamp <= os.time() then
                    v.item = vRP.itemTransformList(v.item) or v.item
					data.inventorys[k] = {item = v.item, amount = v.amount}
                end
            end
        end
		return data.inventorys
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemBodyList(item)
	if items.list[item] then
		return items.list[item]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEXLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemIndexList(item)
	if items.list[item] then
		return items.list[item].index
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAMELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemNameList(item)
	if items.list[item] then
		return items.list[item].name
	end
	return "REMOVIDO"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDESCLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemDescList(item)
    if items.list[item] then
        return items.list[item].desc or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTIPOLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTipoList(item)
    if items.list[item] then
        return items.list[item].tipo or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMUNITYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemUnityList(item)
    if items.list[item] then
        return items.list[item].unity or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMECONOMYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemEconomyList(item)
    if items.list[item] then
        return items.list[item].economy or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMSUBTYPELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemSubTypeList(item)
    if items.list[item] then
        return items.list[item].subtype or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTRANSFORMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTransformList(item)
    if items.list[item] then
        return items.list[item].transform or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDURABILITYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemDurabilityList(item)
    if items.list[item] then
        return items.list[item].durability or 0
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNOTCHESTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemNotChestList(item)
    if items.list[item] then
        return items.list[item].notchest or false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTypeList(item)
	if items.list[item] then
		return items.list[item].type
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMOLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemAmmoList(item)
	if items.list[item] then
		return items.list[item].ammo
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getItemWeight
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getItemWeight(item)
	if items.list[item] then
		return items.list[item].weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- itemMaxAmount
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemMaxAmount(item)
	if items.list[item] then
		if items.list[item].max ~= nil then
			return items.list[item].max
		else
			return 999999999999999
		end
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getInventoryMaxWeight
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryMaxWeight(user_id)
	return math.floor(vRP.expToLevel(vRP.getExp(user_id,"physical","strength")))*3
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getInventoryWeight
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k,v in pairs(inventory) do
			if vRP.itemBodyList(v.item) then
				weight = weight + vRP.getItemWeight(v.item) * tonumber(v.amount)
			end
		end
		return weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- computeItemsWeight
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.computeItemsWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		local iweight = vRP.getItemWeight(k)
		weight = weight+iweight*v.amount
	end
	return weight
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORYITEMAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname then
				return tonumber(v.amount)
			end
		end
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORYITEMAMOUNTMAX
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryItemAmountMax(user_id,idname)
	local data = vRP.getInventory(user_id)
	local total = 0
	if data then
		for k,v in pairs(data) do
			if v.item == idname then
				total = total + v.amount
			end
		end
		return total
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SWAPSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.swapSlot(user_id,slot,target)
	local data = vRP.getInventory(user_id)
	if data then
		local temp = data[tostring(slot)]
		data[tostring(slot)] = data[tostring(target)]
		data[tostring(target)] = temp
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORYITEMDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryItemDurability(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and v.timestamp then
				return v.timestamp
			end
		end
	end
	return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.giveInventoryItem(user_id,idname,amount,notify,slot,timestamp)
	local data = vRP.getInventory(user_id)

	if notify == nil then
		notify = true
	end

	if data and tonumber(amount) > 0 then
		if not slot then
			local initial = 0
			repeat
				initial = initial + 1
			until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
			initial = tostring(initial)
			if data[initial] == nil then

				if vRP.getInventoryItemAmountMax(user_id,idname) >= vRP.itemMaxAmount(idname) then
					return false
				end

				newamount = amount
				
				if (vRP.getInventoryItemAmountMax(user_id,idname) + amount) >= vRP.itemMaxAmount(idname) then
					newamount = vRP.itemMaxAmount(idname) - vRP.getInventoryItemAmountMax(user_id,idname)
				end

				local isdurability = false

				if vRP.itemDurabilityList(idname) >= 1 then
					isdurability = true
				end

				if isdurability then
					if timestamp then
						data[initial] = { item = idname, amount = tonumber(newamount), timestamp = timestamp }
					else
						data[initial] = { item = idname, amount = tonumber(newamount), timestamp = (os.time() + vRP.itemDurabilityList(idname)) }
					end
				else
					data[initial] = { item = idname, amount = tonumber(newamount) }
				end

			elseif data[initial] and data[initial].item == idname then

				if vRP.getInventoryItemAmountMax(user_id,idname) >= vRP.itemMaxAmount(idname) then
					return false
				end

				newamount = amount
				
				if (vRP.getInventoryItemAmountMax(user_id,idname) + amount) >= vRP.itemMaxAmount(idname) then
					newamount = vRP.itemMaxAmount(idname) - vRP.getInventoryItemAmountMax(user_id,idname)
				end

				if vRP.itemDurabilityList(idname) >= 1 then
					isdurability = true
				end
				
				if isdurability then
					if timestamp then
						data[initial].amount = tonumber(data[initial].amount) + tonumber(newamount)
						data[initial].timestamp = timestamp
					else
						data[initial].amount = tonumber(data[initial].amount) + tonumber(newamount)
						data[initial].timestamp = (os.time() + vRP.itemDurabilityList(idname))
					end
				else
					data[initial].amount = tonumber(data[initial].amount) + tonumber(newamount)
				end
			end

			if notify and vRP.itemBodyList(idname) then
				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),"Recebeu", vRP.itemIndexList(idname))
			end
			return true
		else
			slot = tostring(slot)

			if vRP.getInventoryItemAmountMax(user_id,idname) >= vRP.itemMaxAmount(idname) then
				return false
			end

			newamount = amount

			if (vRP.getInventoryItemAmountMax(user_id,idname) + amount) >= vRP.itemMaxAmount(idname) then
				newamount = vRP.itemMaxAmount(idname) - vRP.getInventoryItemAmountMax(user_id,idname)
			end

			local isdurability = false

			if vRP.itemDurabilityList(idname) >= 1 then
				isdurability = true
			end

			if data[slot] then
				if data[slot].item == idname then
					local oldAmount = tonumber(data[slot].amount)
					if isdurability then
						if timestamp then
							data[slot] = { item = idname, amount = tonumber(oldAmount) + tonumber(newamount), timestamp = timestamp }
						else
							data[slot] = { item = idname, amount = tonumber(oldAmount) + tonumber(newamount), timestamp = (os.time() + vRP.itemDurabilityList(idname)) }
						end
					else
						data[slot] = { item = idname, amount = tonumber(oldAmount) + tonumber(newamount) }
					end
				end
			else
				if isdurability then
					if timestamp then
						data[slot] = { item = idname, amount = tonumber(newamount), timestamp = timestamp }
					else
						data[slot] = { item = idname, amount = tonumber(newamount), timestamp = (os.time() + vRP.itemDurabilityList(idname)) }
					end
				else
					data[slot] = { item = idname, amount = tonumber(newamount) }
				end
			end

			if notify and vRP.itemBodyList(idname) then
				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),"Recebeu", vRP.itemIndexList(idname))
			end
			return true
		end
	end
end

	-- function vRP.giveInventoryItem(user_id,idname,amount,notify,slot)
	-- 	local data = vRP.getInventory(user_id)
	-- 	if data and tonumber(amount) > 0 then
	-- 		if not slot then
	-- 			local initial = 0
	-- 			repeat
	-- 				initial = initial + 1
	-- 			until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
	-- 			initial = tostring(initial)
				
	-- 			if data[initial] == nil then
	-- 				data[initial] = { item = idname, amount = tonumber(amount) }
	-- 			elseif data[initial] and data[initial].item == idname then
	-- 				data[initial].amount = tonumber(data[initial].amount) + tonumber(amount)
	-- 			end

	-- 			if notify and vRP.itemBodyList(idname) then
	-- 				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(tonumber(amount)),vRP.itemNameList(idname) })
	-- 			end
	-- 		else
	-- 			slot = tostring(slot)

	-- 			if data[slot] then
	-- 				if data[slot].item == idname then
	-- 					local oldAmount = tonumber(data[slot].amount)
	-- 					data[slot] = { item = idname, amount = tonumber(oldAmount) + tonumber(amount) }
	-- 				end
	-- 			else
	-- 				data[slot] = { item = idname, amount = tonumber(amount) }
	-- 			end

	-- 			if notify and vRP.itemBodyList(idname) then
	-- 				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(tonumber(amount)),vRP.itemNameList(idname) })
	-- 			end
	-- 		end
	-- 	end
	-- end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYGETINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.tryGetInventoryItem(user_id,idname,amount,notify,slot)
	local data = vRP.getInventory(user_id)
	if data then
		if not slot then
			for k,v in pairs(data) do
				if v.item == idname and tonumber(v.amount) >= tonumber(amount) then
					v.amount = tonumber(v.amount) - tonumber(amount)

					if tonumber(v.amount) <= 0 then
						data[k] = nil
					end

					if notify and vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),"Subtraiu", vRP.itemIndexList(idname))
					end
					return true
				end
			end
		else
			local slot  = tostring(slot)

			if data[slot] and data[slot].item == idname and tonumber(data[slot].amount) >= tonumber(amount) then
				data[slot].amount = tonumber(data[slot].amount) - tonumber(amount)

				if tonumber(data[slot].amount) <= 0 then
					data[slot] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),"Subtraiu", vRP.itemIndexList(idname))
				end
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.removeInventoryItem(user_id,idname,amount,notify)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and tonumber(v.amount) >= tonumber(amount) then
				v.amount = tonumber(v.amount) - tonumber(amount)

				if tonumber(v.amount) <= 0 then
					data[k] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),"Subtraiu", vRP.itemIndexList(idname))
				end

				break
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.createDurability(itemName)
	local advFile = LoadResourceFile("logsystem","toolboxes.json")
	local advDecode = json.decode(advFile)

	if advDecode[itemName] then
		advDecode[itemName] = advDecode[itemName] - 1

		if advDecode[itemName] <= 0 then
			advDecode[itemName] = nil
			vRP.removeInventoryItem(user_id,itemName,1,true)
		end
	else
		advDecode[itemName] = 9
	end

	SaveResourceFile("logsystem","toolboxes.json",json.encode(advDecode),-1)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVED
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local activedAmount = {}
Citizen.CreateThread(function()
	while true do
		local slyphe = 500
		if actived then
			slyphe = 100 
			for k,v in pairs(actived) do
				if actived[k] > 0 then
					actived[k] = v - 1
					if actived[k] <= 0 then
						actived[k] = nil
					end
				end
			end
		end
		Citizen.Wait(slyphe)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARLOGS
-----------------------------------------------------------------------------------------------------------------------------------------
local policeLogs = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYCHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.tryChestItem(user_id,chestData,itemName,amount,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then
			if items[itemName] ~= nil and tonumber(items[itemName].amount) >= tonumber(amount) then

				if tonumber(amount) > 0 then
					activedAmount[user_id] = tonumber(amount)
				else
					activedAmount[user_id] = tonumber(items[itemName].amount)
				end

				local new_weight = vRP.getInventoryWeight(user_id) + vRP.getItemWeight(itemName) * tonumber(activedAmount[user_id])
				if new_weight <= vRP.getInventoryMaxWeight(user_id) then
					vRP.giveInventoryItem(user_id,itemName,tonumber(activedAmount[user_id]),true,slot)

					items[itemName].amount = tonumber(items[itemName].amount) - tonumber(activedAmount[user_id])

					if tonumber(items[itemName].amount) <= 0 then
						items[itemName] = nil
					end

					TriggerEvent("ps_groups:chestlogs", user_id, chestData, itemName, amount, "down")
					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORECHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.storeChestItem(user_id,chestData,itemName,amount,chestWeight,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local slot = tostring(slot)
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then

			if tonumber(amount) > 0 then
				activedAmount[user_id] = tonumber(amount)
			else
				local inv = vRP.getInventory(user_id)
				if inv[slot] then
					activedAmount[user_id] = tonumber(inv[slot].amount)
				end
			end

			local new_weight = vRP.computeItemsWeight(items) + vRP.getItemWeight(itemName) * tonumber(activedAmount[user_id])
			if new_weight <= chestWeight then
				if vRP.tryGetInventoryItem(user_id,itemName,tonumber(activedAmount[user_id]),true,slot) then
					if items[itemName] ~= nil then
						items[itemName].amount = tonumber(items[itemName].amount) + tonumber(activedAmount[user_id])
					else
						items[itemName] = { amount = tonumber(activedAmount[user_id]) }
					end

					TriggerEvent("ps_groups:chestlogs", user_id, chestData, itemName, amount, "up")
					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- clearInventoryTwo
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("clearInventoryTwo")
AddEventHandler("clearInventoryTwo",function(id)
    if id then
		local data = vRP.getUserDataTable(id)
		if data then
			data.inventorys = {}
		end

		vRPclient._clearWeapons(id)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- clearInventory
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("clearInventory")
AddEventHandler("clearInventory",function()
    local source = source
	local user_id = vRP.getUserId(source)
	
    if user_id then
        local data = vRP.getUserDataTable(user_id)
        if data then
            data.inventorys = {}
        end

        vRP.varyThirst(user_id,-50)
		vRP.varyHunger(user_id,-50)
        vRPclient._clearWeapons(source)
        vRPclient._setHandcuffed(source,false)

        vRP.setExp(user_id,"physical","strength",20)
    end
end)

--[ VEHICLEGLOBAL ]-------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleGlobal()
	return vehs.vehglobal
end

--[ VEHICLENAME ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleName(vname)
	return vehs.vehglobal[vname].name
end

--[ VEHICLERENTALPRICE ]--------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleRentalPrice(vname)
	return vehs.vehglobal[vname].rentalPrice
end

--[ VEHICLECHEST ]--------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleChest(vname)
	return vehs.vehglobal[vname].mala
end

--[ VEHICLESLOT ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleSlot(vname)
	if vehs.vehglobal[vname].slots == nil then
		return 5
	end
	return vehs.vehglobal[vname].slots
end

--[ VEHICLEPRICE ]--------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehiclePrice(vname)
	return vehs.vehglobal[vname].price
end

--[ VEHICLETYPE ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleType(vname)
	return vehs.vehglobal[vname].tipo
end
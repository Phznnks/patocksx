-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
fivewareItens = {}
Tunnel.bindInterface("fw_inventory-itens",fivewareItens)

vCLIENT = Tunnel.getInterface("fw_inventory-itens")

vGARAGE = Tunnel.getInterface("vrp_garages")
vPLAYER = Tunnel.getInterface("vrp_player")
vHOMES = Tunnel.getInterface("vrp_homes")
vTASKBAR = Tunnel.getInterface("vrp_taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local active = {}
local registerTimers = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REGISTERTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(registerTimers) do
			if registerTimers[k][4] > 0 then
				registerTimers[k][4] = registerTimers[k][4] - 1

				if registerTimers[k][4] <= 0 then
					registerTimers[k] = nil
					TriggerClientEvent("inventory:updateRegister",-1,registerTimers)
				end
			end
		end
		Citizen.Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(active) do
			if active[k] > 0 then
				active[k] = active[k] - 1
			end
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:useItem")
AddEventHandler("inventory:useItem",function(slot,rAmount)
	local source = source
    local user_id = vRP.getUserId(source)
	if user_id then
		
		if rAmount == nil then
			rAmount = 1
		end
		if rAmount <= 0 then
			rAmount = 1
		end

		if active[user_id] == nil then
			local inv = vRP.getInventory(user_id)
			if inv then
				if not inv[tostring(slot)] or inv[tostring(slot)].item == nil then
					return
				end

				local itemName = inv[tostring(slot)].item
				if vRP.itemTypeList(itemName) == "use" then
					vCLIENT.removeWeaponInHand(source)

					if itemName == "bandagem" then
						if vRPclient.getHealth(source) > 101 and vRPclient.getHealth(source) < 200 then
							active[user_id] = 40
							vCLIENT.closeInventory(source)
							vCLIENT.blockButtons(source,true)
							TriggerClientEvent("progress",source,40000)
							vRPclient._playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)
							repeat
								if active[user_id] == 0 then
									active[user_id] = nil
									vRPclient._stopAnim(source,false)
									vCLIENT.blockButtons(source,false)

									if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
										vRP.upgradeStress(user_id,2)
										vRPclient.updateHealth(source,15)
									end
								end
								Citizen.Wait(0)
							until active[user_id] == nil
						else
							TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar de vida cheia ou nocauteado.",5000)
						end
					end

					if itemName == "maconha" then
						active[user_id] = 6
						vCLIENT.closeInventory(source)
						vCLIENT.blockButtons(source,true)
						TriggerClientEvent("progress",source,6000)
						vRPclient._playAnim(source,true,{"mp_suicide","pill"},true)
						repeat
							if active[user_id] == 0 then
								active[user_id] = nil
								vRPclient._stopAnim(source,false)
								vCLIENT.blockButtons(source,false)

								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									vRP.chemicalTimer(user_id,2)
									vRP.downgradeStress(user_id,50)
									TriggerClientEvent("setEffectDrugs",source)
								end
							end
							Citizen.Wait(0)
						until active[user_id] == nil
					end

					if itemName == "cocaina" then
						active[user_id] = 6
						vCLIENT.closeInventory(source)
						vCLIENT.blockButtons(source,true)
						TriggerClientEvent("progress",source,6000)
						vRPclient._playAnim(source,true,{"mp_suicide","pill"},true)
						repeat
							if active[user_id] == 0 then
								active[user_id] = nil
								vRPclient._stopAnim(source,false)
								vCLIENT.blockButtons(source,false)

								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									vRP.chemicalTimer(user_id,2)
									vRP.downgradeStress(user_id,50)
									TriggerClientEvent("setEffectDrugs",source)
								end
							end
							Citizen.Wait(0)
						until active[user_id] == nil
					end

					if itemName == "ecstasy" then
						active[user_id] = 6
						vCLIENT.closeInventory(source)
						vCLIENT.blockButtons(source,true)
						TriggerClientEvent("progress",source,6000)
						vRPclient._playAnim(source,true,{"mp_suicide","pill"},true)
						repeat
							if active[user_id] == 0 then
								active[user_id] = nil
								vRPclient._stopAnim(source,false)
								vCLIENT.blockButtons(source,false)

								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									vRP.chemicalTimer(user_id,2)
									vRP.downgradeStress(user_id,50)
									TriggerClientEvent("setEffectDrugs",source)
								end
							end
							Citizen.Wait(0)
						until active[user_id] == nil
					end

					if itemName == "metanfetamina" then
						active[user_id] = 6
						vCLIENT.closeInventory(source)
						vCLIENT.blockButtons(source,true)
						TriggerClientEvent("progress",source,6000)
						vRPclient._playAnim(source,true,{"mp_suicide","pill"},true)
						repeat
							if active[user_id] == 0 then
								active[user_id] = nil
								vRPclient._stopAnim(source,false)
								vCLIENT.blockButtons(source,false)

								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									vRP.chemicalTimer(user_id,2)
									vRP.downgradeStress(user_id,50)
									TriggerClientEvent("setEffectDrugs",source)
								end
							end
							Citizen.Wait(0)
						until active[user_id] == nil
					end

					if itemName == "gauze" then
						if vRPclient.getHealth(source) > 101 and vRPclient.getHealth(source) < 200 then
							active[user_id] = 3
							vCLIENT.closeInventory(source)
							vCLIENT.blockButtons(source,true)
							TriggerClientEvent("progress",source,3000)
							vRPclient._playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

							repeat
								if active[user_id] == 0 then
									active[user_id] = nil
									vRPclient._stopAnim(source,false)
									vCLIENT.blockButtons(source,false)

									if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
										TriggerClientEvent("resetBleeding",source)
									end
								end
								Citizen.Wait(0)
							until active[user_id] == nil
						else
							TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar de vida cheia ou nocauteado.",5000)
						end
					end

					if itemName == "colete" then
						active[user_id] = 10
						vCLIENT.closeInventory(source)
						vCLIENT.blockButtons(source,true)
						TriggerClientEvent("progress",source,10000)
						vRPclient._playAnim(source,true,{{"clothingtie","try_tie_negative_a"}},true)

						repeat
							if active[user_id] == 0 then
								active[user_id] = nil
								vRPclient._stopAnim(source,false)
								vCLIENT.blockButtons(source,false)

								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									vRPclient.setArmour(source,100)
								end
							end
							Citizen.Wait(0)
						until active[user_id] == nil
					end

					if itemName == "GADGET_PARACHUTE" then
						active[user_id] = 10
						vCLIENT.closeInventory(source)
						vCLIENT.blockButtons(source,true)
						TriggerClientEvent("progress",source,10000)
						repeat	
							if active[user_id] == 0 then
								active[user_id] = nil
								vCLIENT.blockButtons(source,false)

								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									vCLIENT.parachuteColors(source)
								end
							end
							Citizen.Wait(0)
						until active[user_id] == nil
					end

					if itemName == "lockpick" then
						local vehicle,vehNet,vehPlate,vehName,vehLock,vehBlock,vehHealth,vehModel,vehClass = vRPclient.vehList(source,3)
						if vehicle and vehClass ~= 15 and vehClass ~= 16 then
							if vRPclient.inVehicle(source) then
								active[user_id] = 100
								vRPclient.stopActived(source)
								vCLIENT.closeInventory(source)
								vCLIENT.blockButtons(source,true)
								vGARAGE.startAnimHotwired(source)

								local taskResult = vTASKBAR.taskLockpick(source)
								if taskResult then
									vRP.upgradeStress(user_id,4)
									local iddoroubado = vRP.getVehiclePlate(vehPlate)
									if iddoroubado and math.random(100) >= 50 then
										TriggerClientEvent("Notify",source,"aviso","O alarme do seu veículo <b>"..vRP.vehicleName(vehName).."</b> foi acionado.",7000)
									end
									if math.random(100) >= 99 then
										TriggerEvent("setPlateEveryone",vehPlate)
										TriggerEvent("setPlatePlayers",vehPlate,user_id)
									end

									if math.random(100) >= 75 then
										local x,y,z = vRPclient.getPositions(source)
										local copAmount = vRP.getUsersByPermission("policia.perm")
										for k,v in pairs(copAmount) do
											async(function()
												TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S - %d/%m/%Y"), code = "QRU", title = "Roubo de Veículo", x = x, y = y, z = z, vehicle = vRP.vehicleName(vehName).." - "..vehPlate, rgba = {15,110,110} })
											end)
										end
									end
								--else
								--	TriggerClientEvent("Notify",source,"aviso","Você falhou.",7000)
								end

								if parseInt(math.random(1000)) >= 950 then
									vRP.removeInventoryItem(user_id,itemName,1,true,slot)
								end

								vCLIENT.blockButtons(source,false)
								vGARAGE.stopAnimHotwired(source,vehicle)
								active[user_id] = nil
							else
								active[user_id] = 100
								vRPclient.stopActived(source)
								vCLIENT.closeInventory(source)
								vCLIENT.blockButtons(source,true)
								vRPclient._playAnim(source,false,{{"missfbi_s4mop","clean_mop_back_player"}},true)

								local taskResult = vTASKBAR.taskLockpick(source)
								if taskResult then
									vRP.upgradeStress(user_id,4)
									local iddoroubado = vRP.getVehiclePlate(vehPlate)
									if iddoroubado then
										TriggerClientEvent("Notify",source,"aviso","Veículo <b>"..vRP.vehicleName(vehName).."</b> foi roubado.",7000)
									end
									if math.random(100) >= 99 then
										TriggerEvent("setPlateEveryone",vehPlate)
										TriggerClientEvent("fw_inventory:lockpickVehicle",-1,vehNet)
									end

									if math.random(100) >= 75 then
										local x,y,z = vRPclient.getPositions(source)
										local copAmount = vRP.getUsersByPermission("policia.perm")
										for k,v in pairs(copAmount) do
											async(function()
												TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S - %d/%m/%Y"), code = "QRU", title = "Roubo de Veículo", x = x, y = y, z = z, vehicle = vRP.vehicleName(vehName).." - "..vehPlate, rgba = {15,110,110} })
											end)
										end
									end
								else
									TriggerClientEvent("Notify",source,"aviso","Voce falhou.",7000)
								end

								if parseInt(math.random(1000)) >= 950 then
									vRP.removeInventoryItem(user_id,itemName,1,true,slot)
								end

								vCLIENT.blockButtons(source,false)
								vRPclient._stopAnim(source,false)
								active[user_id] = nil
							end
						else
							local checkHomes,homeName = vHOMES.checkHomesTheft(source)
							if checkHomes then
								active[user_id] = 100
								vRPclient.stopActived(source)
								vCLIENT.closeInventory(source)
								vCLIENT.blockButtons(source,true)
								vRPclient.playAnim(source,false,{{"missheistfbi3b_ig7","lift_fibagent_loop"}},false)

								local taskResult = vTASKBAR.taskLockpick(source)
								if taskResult then
									vRP.upgradeStress(user_id,4)
									vHOMES.enterHomesTheft(source,homeName)
									TriggerEvent("vrp:homes:ApplyTime",homeName)
								
								else
									TriggerClientEvent("Notify",source,"aviso","Você falhou.",7000)
								end

								if parseInt(math.random(1000)) >= 950 then
									vRP.removeInventoryItem(user_id,itemName,1,true,slot)
								end

								vRPclient._stopAnim(source,false)
								vCLIENT.blockButtons(source,false)
								active[user_id] = nil
							else
								local status,x,y,z = vCLIENT.cashRegister(source)
								if status then
									active[user_id] = 10
									vRPclient.stopActived(source)
									vCLIENT.closeInventory(source)
									vCLIENT.blockButtons(source,true)
									table.insert(registerTimers,{ x,y,z,360 })
									TriggerClientEvent("progress",source,10000)
									TriggerClientEvent("fw_inventory:updateRegister",-1,registerTimers)
									vRPclient._playAnim(source,false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
									repeat
										if active[user_id] == 0 then
											active[user_id] = nil
											vRP.upgradeStress(user_id,1)
											vRPclient._removeObjects(source)
											vCLIENT.blockButtons(source,false)
											vRP.giveInventoryItem(user_id,"dollars2",math.random(4,6),true)

											if math.random(100) >= 75 then
												vRP.wantedTimer(user_id,15)
												local copAmount = vRP.numPermission("Police")
												for k,v in pairs(copAmount) do
													async(function()
														TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S - %d/%m/%Y"), code = "QTH", title = "Roubo a Caixa Registradora", x = x, y = y, z = z, rgba = {170,80,25} })
													end)
												end
											end
										end
										Citizen.Wait(0)
									until active[user_id] == nil
								else
									if x ~= nil and y ~= nil and z ~= nil then
										for k,v in pairs(registerTimers) do
											if v[1] == x and v[2] == y and v[3] == z then
												TriggerClientEvent("Notify",source,"importante","Aguarde "..vRP.getTimers(parseInt(v[4]*10))..".",5000)
											end
											Citizen.Wait(1)
										end
									end
								end
							end
						end
					end

					if itemName == "energetico" then
						active[user_id] = 10
						vRPclient.stopActived(source)
						vCLIENT.closeInventory(source)
						vCLIENT.blockButtons(source,true)
						TriggerClientEvent("progress",source,10000)
						TriggerClientEvent("emotes",source,"beber2")
						repeat
							if active[user_id] == 0 then
								active[user_id] = nil
								vCLIENT.blockButtons(source,false)
								vRPclient._DeletarObjeto(source,"one")

								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									vRP.upgradeStress(user_id,4)
									TriggerClientEvent("setEnergetic",source,90,1.10)
								end
							end
							Citizen.Wait(0)
						until active[user_id] == nil
					end

					if itemName == "mochilap" then
						local exp = vRP.getInventoryMaxWeight(user_id)
						if exp < 25 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,25)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
							end
						else
							TriggerClientEvent("Notify",source,"aviso","No momento você não pode usar essa mochila.",5000)
						end
					end

					if itemName == "mochilam" then
						local exp = vRP.getInventoryMaxWeight(user_id)
						if exp >= 25 and exp < 50 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,50)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
							end
						else
							TriggerClientEvent("Notify",source,"aviso","No momento você não pode usar essa mochila.",5000)
						end
					end

					if itemName == "mochilag" then
						local exp = vRP.getInventoryMaxWeight(user_id)
						if exp >= 50 and exp < 75 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,75)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
							end
						else
							TriggerClientEvent("Notify",source,"aviso","No momento você não pode usar essa mochila.",5000)
						end
					end

					if itemName == "mochilax" then
						local exp = vRP.getInventoryMaxWeight(user_id)
						if exp >= 75 and exp < 100 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,100)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
							end
						else
							TriggerClientEvent("Notify",source,"aviso","No momento você não pode usar essa mochila.",5000)
						end
					end

					if itemName == "pneus" then
						if not vRPclient.inVehicle(source) then
							local vehicle,vehNet = vRPclient.vehList(source,3)
							if vehicle then
								active[user_id] = 30
								vRPclient.stopActived(source)
								vCLIENT.closeInventory(source)
								vCLIENT.blockButtons(source,true)
								vRPclient._playAnim(source,false,{{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"}},true)

								local taskResult = vTASKBAR.taskTwo(source)
								if taskResult then
									if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
										TriggerClientEvent("inventory:repairTires",-1,vehNet)
									end
								end

								vCLIENT.blockButtons(source,false)
								vRPclient._stopAnim(source,false)
								active[user_id] = nil
							end
						end
					end

					if itemName == "placa" then
						if vCLIENT.plateDistance(source) then
							active[user_id] = 10
							vCLIENT.closeInventory(source)
							vCLIENT.blockButtons(source,true)
							TriggerClientEvent("progress",source,10000)
							repeat
								if active[user_id] == 0 then
									active[user_id] = nil
									vCLIENT.blockButtons(source,false)

									if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
										local plate = vRP.genPlate()
										vCLIENT.plateApply(source,plate)
										TriggerEvent("setPlateEveryone",plate)
									end
								end
								Citizen.Wait(0)
							until active[user_id] == nil
						end
					end

					if itemName == "algemas" then
						if not vRPclient.inVehicle(source) then
							local nplayer = vRPclient.getNearestPlayer(source,1)
							if nplayer then
								if vPLAYER.getHandcuff(nplayer) then
									vPLAYER.toggleHandcuff(nplayer)
									vRPclient._stopAnim(nplayer,false)
									TriggerClientEvent("vrp_sound:source",source,"uncuff",0.5)
									TriggerClientEvent("vrp_sound:source",nplayer,"uncuff",0.5)
								else
									active[user_id] = 30
									local taskResult = vTASKBAR.taskHandcuff(nplayer)
									if not taskResult then
										vPLAYER.toggleHandcuff(nplayer)
										TriggerClientEvent("vrp_sound:source",source,"cuff",0.5)
										TriggerClientEvent("vrp_sound:source",nplayer,"cuff",0.5)
										vRPclient.playAnim(nplayer,true,{{"mp_arresting","idle"}},true)
									else
										TriggerClientEvent("Notify",source,"importante","O cidadao resistiu de ser algemado.",5000)
									end
									active[user_id] = nil
								end
							end
						end
					end

					if itemName == "capuz" then
						local nplayer = vRPclient.getNearestPlayer(source,2)
						if nplayer then
							vRPclient.setCapuz(nplayer)
							vRP.closeMenu(nplayer)
							TriggerClientEvent("Notify",source,"sucesso","Capuz utilizado com sucesso.",8000)
						end
					end

					if itemName == "coordas" then
						local nplayer = vRPclient.getNearestPlayer(source,2)
						if nplayer and not vRPclient.inVehicle(source) then
							local taskResult = vTASKBAR.taskHandcuff(nplayer)
							if not taskResult then
								TriggerClientEvent("vrp_rope:toggleRope",source,nplayer)
							else
								TriggerClientEvent("Notify",source,"importante","O cidadao resistiu de ser carregado.",5000)
							end
						end
					end
				end

				if vRP.itemTypeList(itemName) == "equip" then
					if vRP.tryGetInventoryItem(user_id,itemName,1,true) then
						local playerWeapons = {}
						playerWeapons[string.gsub(itemName,"wbody|","")] = { ammo = 0 }
						vRPclient._giveWeapons(source,playerWeapons)
						TriggerClientEvent("inventory:Update",source,"updateInventory")
					end 
				end

				if vRP.itemTypeList(itemName) == "recharge" then
					if vCLIENT.rechargeCheck(source,itemName) then
						if parseInt(rAmount) >= 250 then
							rAmount = 250
						end
						if vRP.tryGetInventoryItem(user_id,itemName,parseInt(rAmount),true,slot) then
							vCLIENT.rechargeWeapon(source,itemName,parseInt(rAmount))
							TriggerClientEvent("inventory:Update",source,"updateInventory")
						end
					end
				end

			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local weapons = vRPclient.replaceWeapons(source,{})
		Citizen.Wait(math.random(500,1999))
		for k,v in pairs(weapons) do
			vRP.removeWeaponTable(user_id,k)
			vRP.giveInventoryItem(user_id,k,1,true)
			if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,vRP.itemAmmoList(k),v.ammo,true)
			end
			Citizen.Wait(10)
		end
		vRPclient.updateWeapons(source)
		TriggerClientEvent("itensNotify",source,"sucesso","Armamento Guardado.",10000)
		TriggerClientEvent("Notify",source,"sucesso","Armamento Guardado.",10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function fivewareItens.checkInventory()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if active[user_id] ~= nil and active[user_id] > 0 then
			return false
		end
		return true
	end
end
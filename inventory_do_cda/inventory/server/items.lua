-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy  = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vRPRAGE = Tunnel.getInterface("high_resources")
vTASKBAR = Tunnel.getInterface("high_resources")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local active          = {}
local weaponrechenger = {}
local firecracker     = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIRECRACKER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(firecracker) do
			if firecracker[k] > 0 then
				firecracker[k] = firecracker[k] - 30
				if firecracker[k] <= 0 then
					firecracker[k] = nil
				end
			end
		end
		Citizen.Wait(30000)
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
-- useItem
-----------------------------------------------------------------------------------------------------------------------------------------
function useItem(source, user_id, itemName, amount, slot)
    if amount > 0 and not active[user_id] and active[user_id] == nil then
        if itemName == "bandagem" then
            if vRPclient.getHealth(source) > 101 and vRPclient.getHealth(source) < 200 then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vCLIENT.blockButtons(source,true)
                TriggerClientEvent("progress",source,10000,"Utilizando...")
                vRPclient._playAnim(source,true,{{"amb@world_human_clipboard@male@idle_a","idle_c"}},true)

                repeat
                    if active[user_id] == 0 then
                        active[user_id] = nil
                        vRPclient._stopAnim(source,false)
                        vCLIENT.blockButtons(source,false)

                        if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                            vRPclient.updateHealth(source,15)
                        end
                    end
                    Citizen.Wait(0)
                until active[user_id] == nil
            else
                sendnotify(source,"negado","Você não pode utilizar de vida cheia ou nocauteado.",5000)
            end
        end

        if itemName == "adrenalina" then
            local distance = vCLIENT.adrenalineDistance(source)
            local paramedicos = getUsersByPermission("ems.permissao")
            if #paramedicos > 0 and not distance then
                return
            end

            local nplayer = vRPclient.getNearestPlayer(source,2)
            if nplayer then
                local nuser_id = vRP.getUserId(nplayer)
                if nuser_id then
                    if vRPclient.isInComa(nplayer) then
                        if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                            vCLIENT.closeInventory(source)
                            TriggerClientEvent('cancelando',source,true)
                            TriggerClientEvent("progress",source,10000,"Utilizando...")
                            vRPclient._playAnim(source,false,{{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
                            SetTimeout(10000,function()
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent('cancelando',source,false)
                                vRPclient.killGod(nplayer)
                                TriggerClientEvent("resetBleeding",nplayer)
                            end)
                        end
                    end
                end
            end
        end

        if itemName == "paracetamil" or itemName == "voltarom" or itemName == "trandrylux" or itemName == "dorfrex" or itemName == "buscopom" then
            if vRP.tryGetInventoryItem(user_id,item,1,slot) then
                vCLIENT.closeInventory(source)
                vRPclient._playAnim(source,true,{{"mp_player_intdrink","loop_bottle"}},true)	
                TriggerClientEvent('cancelando',source,true)
                TriggerClientEvent("progress",source,5000,"remedio")
                senditemnotify(source,"Tomando",vRP.itemIndexList(itemName))
                SetTimeout(5000,function()
                    vRPclient._stopAnim(source,false)
                    TriggerClientEvent('cancelando',source,false)
                    TriggerClientEvent("remedios",source)
                    sendnotify(source,"sucesso","Remédio utilizado com sucesso.",8000)
                end)
            end	
        end

        if itemName == "garrafa-vazia" then
            active[user_id] = 10
            vCLIENT.closeInventory(source)
            TriggerClientEvent("progress",source,10000,"enchendo")
            TriggerClientEvent('vrp_watercooler:use',source)
            TriggerClientEvent('cancelando',source,true)
            SetTimeout(10000,function()
                active[user_id] = nil
                TriggerClientEvent('cancelando',source,false)
                vRPclient.updateInventory(source)
            end)
        end

        if itemName == "agua" then
            if vRP.tryGetInventoryItem(user_id,"agua",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent('cancelando',source,true)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_ld_flow_bottle",49,28422)
                TriggerClientEvent("progress",source,10000,"bebendo")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,-40)
                    vRP.varyHunger(user_id,0)
                    TriggerClientEvent('cancelando',source,false)
                    vRP.giveInventoryItem(user_id,"garrafa-vazia",1)
                    vRPclient._DeletarObjeto(source)
                    sendnotify(source,"sucesso","agua utilizado com sucesso.",8000)
                end)
            end
        end

        if itemName == "leite" or itemName == "cha"  or itemName == "icecha" then
            if vRP.tryGetInventoryItem(user_id,itemName,1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent('cancelando',source,true)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
                TriggerClientEvent("progress",source,10000,"bebendo")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,-40)
                    vRP.varyHunger(user_id,0)
                    TriggerClientEvent('cancelando',source,false)
                    vRPclient._DeletarObjeto(source)
                    sendnotify(source,"sucesso",itemName.." utilizado com sucesso.",8000)
                end)
            end 
        end
        
        if itemName == "cafe" or itemName == "cafecleite" or itemName == "cafeexpresso" or itemName == "capuccino" or itemName == "frappuccino" then
            if vRP.tryGetInventoryItem(user_id,itemName,1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent('cancelando',source,true)
                vRPclient._CarregarObjeto(source,"amb@world_human_aa_coffee@idle_a","idle_a","prop_fib_coffee",49,28422)
                TriggerClientEvent("progress",source,10000,"bebendo")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,-40)
                    vRP.varyHunger(user_id,0)
                    TriggerClientEvent('cancelando',source,false)
                    vRPclient._DeletarObjeto(source)
                    sendnotify(source,"sucesso",itemName.." utilizado com sucesso.",8000)
                end)
            end
        end
        
        if itemName == "sprunk" then
            if vRP.tryGetInventoryItem(user_id,"sprunk",1) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","ng_proc_sodacan_01b",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))

                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,-65)
                    vRP.varyHunger(user_id,0)
                    vRPclient._DeletarObjeto(source)
                end)

            end
        end
        
        if itemName == "cola" then
            if vRP.tryGetInventoryItem(user_id,"cola",1) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","ng_proc_sodacan_01a",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))

                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,-70)
                    vRP.varyHunger(user_id,0)
                    vRPclient._DeletarObjeto(source)
                end)
            end 
        end
        
        if itemName == "pibwassen" then
            if vRP.tryGetInventoryItem(user_id,"pibwassen",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,-10)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "tequilya" then
            if vRP.tryGetInventoryItem(user_id,"tequilya",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_logopen",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,15)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "patriot" then
            if vRP.tryGetInventoryItem(user_id,"patriot",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,-10)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "blarneys" then
            if vRP.tryGetInventoryItem(user_id,"blarneys",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,15)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "jakeys" then
            if vRP.tryGetInventoryItem(user_id,"jakeys",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_logopen",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,15)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "barracho" then
            if vRP.tryGetInventoryItem(user_id,"barracho",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,15)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "ragga" then
            if vRP.tryGetInventoryItem(user_id,"ragga",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,15)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "nogo" then
            if vRP.tryGetInventoryItem(user_id,"nogo",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_logopen",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,15)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "mount" then
            if vRP.tryGetInventoryItem(user_id,"mount",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,20)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "cherenkov" then
            if vRP.tryGetInventoryItem(user_id,"cherenkov",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_logopen",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,20)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "bourgeoix" then
            if vRP.tryGetInventoryItem(user_id,"bourgeoix",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,20)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "bleuterd" then
            if vRP.tryGetInventoryItem(user_id,"bleuterd",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_logopen",49,28422)
                TriggerClientEvent("progress",source,10000,"tomando")
                senditemnotify(source,"Bebendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,20)
                    vRP.varyHunger(user_id,0)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "sanduiche" then
            if vRP.tryGetInventoryItem(user_id,"sanduiche",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent("emotes",source,"comer")
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))

                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "rosquinha" then
            if vRP.tryGetInventoryItem(user_id,"rosquinha",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent("emotes",source,"comer3")
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "hotdog" then
            if vRP.tryGetInventoryItem(user_id,"hotdog",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent("emotes",source,"comer2")
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))

                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "xburguer" then
            if vRP.tryGetInventoryItem(user_id,"xburguer",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent("emotes",source,"comer")
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "chips" then
            if vRP.tryGetInventoryItem(user_id,"chips",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","ng_proc_food_chips01b",49,28422)
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "batataf" then
            if vRP.tryGetInventoryItem(user_id,"batataf",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_food_bs_chips",49,28422)
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end

        if itemName == "pizza" then
            if vRP.tryGetInventoryItem(user_id,"pizza",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","v_res_tt_pizzaplate",49,28422)
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "frango" then
            if vRP.tryGetInventoryItem(user_id,"frango",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_food_cb_nugets",49,28422)
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "bcereal" then
            if vRP.tryGetInventoryItem(user_id,"bcereal",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_choc_pq",49,28422)
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))

                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "bchocolate" then
            if vRP.tryGetInventoryItem(user_id,"bchocolate",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_choc_meto",49,28422)
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end
        
        if itemName == "taco" then
            if vRP.tryGetInventoryItem(user_id,"taco",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                TriggerClientEvent("progress",source,10000,"comendo")
                senditemnotify(source,"Comendo",vRP.itemIndexList(itemName))
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRP.varyThirst(user_id,0)
                    vRP.varyHunger(user_id,-40)
                    vRPclient._DeletarObjeto(source)
                end)
            end
        end

        if itemName == "maconha" then
            if vRP.tryGetInventoryItem(user_id,"maconha",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
                TriggerClientEvent("progress",source,10000,"fumando")
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    sendnotify(source,"sucesso","Maconha utilizada com sucesso.",8000)
                end)
            end
        end
        
        if itemName == "crack" then
            if vRP.tryGetInventoryItem(user_id,"crack",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
                TriggerClientEvent('cancelando',source,true)
                TriggerClientEvent("progress",source,10000,"cheirando")
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    TriggerClientEvent('cancelando',source,false)
                    vRPclient.playScreenEffect(source,"RaceTurbo",120)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",120)
                    sendnotify(source,"sucesso","Crack utilizado com sucesso.",8000)
                end)
            end
        end
        
        if itemName == "lancaperfume" then
            if vRP.tryGetInventoryItem(user_id,"lancaperfume",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
                TriggerClientEvent('cancelando',source,true)
                TriggerClientEvent("progress",source,10000,"cheirando")
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    TriggerClientEvent('cancelando',source,false)
                    vRPclient.playScreenEffect(source,"RaceTurbo",120)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",120)
                    sendnotify(source,"sucesso","Lança perfume utilizado com sucesso.",8000)
                end)
            end
        end

        if itemName == "cocaina" then
            if vRP.tryGetInventoryItem(user_id,"cocaina",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
                TriggerClientEvent('cancelando',source,true)
                TriggerClientEvent("progress",source,10000,"cheirando")
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    TriggerClientEvent('cancelando',source,false)
                    vRPclient.playScreenEffect(source,"RaceTurbo",120)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",120)
                    sendnotify(source,"sucesso","Cocaína utilizada com sucesso.",8000)
                end)
            end
        end

        if itemName == "metanfetamina" then
            if vRP.tryGetInventoryItem(user_id,"metanfetamina",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
                TriggerClientEvent("progress",source,10000,"fumando")
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    sendnotify(source,"sucesso","Metanfetamina utilizada com sucesso.",8000)
                end)
            end
        end

        if itemName == "lsd" then
            if vRP.tryGetInventoryItem(user_id,"lsd",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
                TriggerClientEvent("progress",source,10000,"tomando")
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient._stopAnim(source,false)
                    vRPclient.playScreenEffect(source,"RaceTurbo",180)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                    sendnotify(source,"sucesso","LSD utilizado com sucesso.",8000)
                end)
            end
        end
        
        if itemName == "rebite" then
            if vRP.tryGetInventoryItem(user_id,"rebite",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent('cancelando',source,true)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
                TriggerClientEvent("progress",source,10000,"bebendo")
                SetTimeout(10000,function()
                    active[user_id] = nil
                    vRPclient.playScreenEffect(source,"RaceTurbo",90)
                    vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",90)
                    TriggerClientEvent('energeticos',source,true)
                    TriggerClientEvent('cancelando',source,false)
                    vRPclient._DeletarObjeto(source)
                    sendnotify(source,"sucesso","Rebite utilizado com sucesso.",8000)
                end)
                SetTimeout(90000,function()
                    TriggerClientEvent('energeticos',source,false)
                    sendnotify(source,"aviso","O efeito do rebite passou e o coração voltou a bater normalmente.",8000)
                end)
            end
        end

        if itemName == "capuz" then
            if vRP.tryGetInventoryItem(user_id,"capuz", 1) then
                local nplayer = vRPclient.getNearestPlayer(source,2)
                if nplayer then
                    vRPclient.setCapuz(nplayer)
                    vRP.closeMenu(nplayer)
                    sendnotify(source,"sucesso","Capuz utilizado com sucesso.",8000)
                end
            end
        end

        if itemName == "cordas" then
            local percentagerandom = math.random(1,100)
            -- if percentagerandom >= 80 then
            --     if vRP.tryGetInventoryItem(user_id,"cordas", 1) then
            --         local nplayer = vRPclient.getNearestPlayer(source,2)
            --         if nplayer and not vRPclient.isInVehicle(source) then
            --             TriggerClientEvent("rope:toggleRope",source,nplayer)
            --         end
            --         sendnotify(source,"aviso","Sua corda arrebentou.",8000)
            --     end
            -- else
                local nplayer = vRPclient.getNearestPlayer(source,2)
                if nplayer and not vRPclient.isInVehicle(source) then
                    TriggerClientEvent("rope:toggleRope",source,nplayer)
                end
            -- end
        end

        if itemName == "energetico" then
            if vRP.tryGetInventoryItem(user_id,"energetico",1,slot) then
                active[user_id] = 10
                vCLIENT.closeInventory(source)
                TriggerClientEvent('cancelando',source,true)
                vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
                TriggerClientEvent("progress",source,20000,"bebendo")
                SetTimeout(20000,function()
                    active[user_id] = nil
                    TriggerClientEvent('energeticos',source,true)
                    TriggerClientEvent('cancelando',source,false)
                    vRPclient._DeletarObjeto(source)
                    sendnotify(source,"sucesso","Energético utilizado com sucesso.",8000)
                end)
                SetTimeout(60000,function()
                    TriggerClientEvent('energeticos',source,false)
                    sendnotify(source,"aviso","O efeito do energético passou e o coração voltou a bater normalmente.",8000)
                end)
            end
        end

        if itemName == "lockpick" then
            local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPclient.vehList(source,3)
            local policia = getUsersByPermission("policia.permissao")
            if #policia < 1 then
                sendnotify(source,"aviso","Número insuficiente de policiais no momento para iniciar o roubo.")
                return true
            end
            -- if getHasPermission(user_id,"policia.permissao") then
            --     TriggerEvent("setPlateEveryone",placa)
            --     vRPRAGE.vehicleClientLock(-1,vnetid,lock)
            --     TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
            --     return
            -- end
            if not vehicle then
                sendnotify(source,"aviso","Nenhum veiculo perto")
                return false
            end
            if vTASKBAR.taskThree(source) then
                if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1 and vRP.tryGetInventoryItem(user_id,"lockpick",1,slot) and vehicle then
                    active[user_id] = 10
                    if getHasPermission(user_id,"polpar.permissao") then
                        active[user_id] = nil
                        TriggerEvent("setPlateEveryone",placa)
                        vRPRAGE.vehicleClientLock(-1,vnetid,lock)
                        return
                    end
                
                    TriggerClientEvent('cancelando',source,true)
                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
                    TriggerClientEvent("progress",source,5000,"roubando")
                    senditemnotify(source,"Usou",vRP.itemIndexList(itemName))
                    SetTimeout(5000,function()
                        active[user_id] = nil
                        TriggerClientEvent('cancelando',source,false)
                        vRPclient._stopAnim(source,false)

                        TriggerEvent("setPlateEveryone",placa)
                        vRPRAGE.vehicleClientLock(-1,vnetid,lock)
                        TriggerEvent("setPlateEveryone",placa)
                        TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
                    end)
                end
            else
                sendnotify(source,"negado","Roubo do veículo falhou e as autoridades foram acionadas.",8000)
                local policia = getUsersByPermission("policia.permissao")
                local x,y,z = getUserPosition(source)
                for k,v in pairs(policia) do
                    local player = getUserSource(tonumber(v))
                    if player then
                        async(function()
                            playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
                            TriggerClientEvent('chatMessage',player,"911",{64,64,255},"Roubo na ^1"..street.."^0 do veículo ^1"..model.."^0 de placa ^1"..placa.."^0 verifique o ocorrido.")
                            createBlipTimeout(player,x,y,z,"Ocorrência",20000)
                        end)
                    end
                end
            end
        end

        if itemName == "militec" then
            if not vRPclient.isInVehicle(source) then
                local vehicle = vRPclient.getNearestVehicle(source,3.5)
                if vehicle then
                    if getHasPermission(user_id,"mecanico.permissao") then
                        active[user_id] = 10
                        TriggerClientEvent('cancelando',source,true)
                        vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
                        TriggerClientEvent("progress",source,30000,"reparando motor")
                        SetTimeout(30000,function()
                            active[user_id] = nil
                            TriggerClientEvent('cancelando',source,false)
                            TriggerClientEvent('repararmotor',source,vehicle)
                            vRPclient._stopAnim(source,false)
                        end)
                    else
                        if vRP.tryGetInventoryItem(user_id,"militec",1,slot) then
                            active[user_id] = 10
                            vCLIENT.closeInventory(source)
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
                            TriggerClientEvent("progress",source,30000,"reparando motor")
                            SetTimeout(30000,function()
                                active[user_id] = nil
                                TriggerClientEvent('cancelando',source,false)
                                TriggerClientEvent('repararmotor',source,vehicle)
                                vRPclient._stopAnim(source,false)
                            end)
                        end
                    end
                end
            end
        end

        if itemName == "repairkit" then
            if not vRPclient.isInVehicle(source) then
                local vehicle = vRPclient.getNearestVehicle(source,3.5)
                if vehicle then
                    if getHasPermission(user_id,"mecanico.permissao") then
                        active[user_id] = 10
                        TriggerClientEvent('cancelando',source,true)
                        vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
                        TriggerClientEvent("progress",source,30000,"reparando veículo")
                        SetTimeout(30000,function()
                            active[user_id] = nil
                            TriggerClientEvent('cancelando',source,false)
                            TriggerClientEvent('reparar',source)
                            TriggerClientEvent('repararmotor',source,vehicle)
                            vRPclient._stopAnim(source,false)
                        end)
                    else
                        if vRP.tryGetInventoryItem(user_id,"repairkit",1,slot) then
                            active[user_id] = 10
                            vCLIENT.closeInventory(source)
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
                            TriggerClientEvent("progress",source,30000,"reparando veículo")
                            senditemnotify(source,"Usou",vRP.itemIndexList(itemName))
                            SetTimeout(30000,function()
                                active[user_id] = nil
                                TriggerClientEvent('cancelando',source,false)
                                TriggerClientEvent('reparar',source)
                                TriggerClientEvent('repararmotor',source,vehicle)
                                vRPclient._stopAnim(source,false)
                            end)
                        end
                    end
                end
            end	
        end

        if itemName == "paninho" then
            if not vRPclient.isInVehicle(source) then
                local vehicle = vRPclient.getNearestVehicle(source,3.5)
                if vehicle then
                    if vRP.tryGetInventoryItem(user_id,"paninho",1) then
                        active[user_id] = 10
                        vCLIENT.closeInventory(source)
                        TriggerClientEvent('cancelando',source,true)

                        TriggerClientEvent("emotes",source,"pano")

                        TriggerClientEvent("progress",source,10000,"limpando")
                        senditemnotify(source,"Usou",vRP.itemIndexList(itemName))

                        SetTimeout(10000,function()
                            active[user_id] = nil
                            TriggerClientEvent('cancelando',source,false)
                            TriggerClientEvent('limpar',source)
                            vRPclient._stopAnim(source,false)
                            vRPclient._DeletarObjeto(source)
                        end)
                    end
                end
            end
        end

        if itemName == "pneus" then
            if not vRPclient.isInVehicle(source) then
                local vehicle = vRPclient.getNearestVehicle(source,3)
                if vehicle then
                    if getHasPermission(user_id,"mecanico.permissao") then
                        active[user_id] = 10
                        TriggerClientEvent('cancelando',source,true)
                        vRPclient._playAnim(source,false,{{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"}},true)
                        TriggerClientEvent("progress",source,30000,"reparando pneus")
                        SetTimeout(30000,function()
                            active[user_id] = nil
                            TriggerClientEvent('cancelando',source,false)
                            TriggerClientEvent('repararpneus',source,vehicle)
                            vRPclient._stopAnim(source,false)
                        end)
                    else
                        if vRP.tryGetInventoryItem(user_id,"pneus",1,slot) then
                            active[user_id] = 10
                            vCLIENT.closeInventory(source)
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._playAnim(source,false,{{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"}},true)
                            TriggerClientEvent("progress",source,30000,"reparando pneus")
                            SetTimeout(30000,function()
                                active[user_id] = nil
                                TriggerClientEvent('cancelando',source,false)
                                TriggerClientEvent('repararpneus',source,vehicle)
                                vRPclient._stopAnim(source,false)
                            end)
                        end
                    end
                end
            end
        end

        if itemName == "notebook" then
            if vRPclient.isInVehicle(source) then
                local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
                if vehicle and placa then
                    active[user_id] = 10
                    vRPRAGE.freezeVehicleNotebook(source,vehicle)
                    TriggerClientEvent('cancelando',source,true)
                    TriggerClientEvent("progress",source,59500,"removendo rastreador")
                    SetTimeout(60000,function()
                        active[user_id] = nil
                        TriggerClientEvent('cancelando',source,false)
                        local placa_user_id = getOwnerVehiclePlate(placa)
                        if placa_user_id then
                            local player = getUserSource(placa_user_id)
                            if player then
                                vRPRAGE.removeGpsVehicle(player,vname)
                            end
                        end
                    end)
                end
            end
        end

        if itemName == "placa" then
            if vRPclient.GetVehicleSeat(source) then
                if vRP.tryGetInventoryItem(user_id,"placa",1,slot) then
                    local placa = vRP.generatePlate()
                    vCLIENT.closeInventory(source)
                    TriggerClientEvent('cancelando',source,true)
                    TriggerClientEvent("vehicleanchor",source)
                    TriggerClientEvent("progress",source,59500,"clonando")
                    senditemnotify(source,"Usou",vRP.itemIndexList(itemName))
                    SetTimeout(60000,function()
                        TriggerClientEvent('cancelando',source,false)
                        TriggerClientEvent("cloneplates",source,placa)
                        sendnotify(source,"sucesso","Placa clonada com sucesso.",8000)
                    end)
                end
            end
        end
        
        if itemName == "colete" then
            if vRP.tryGetInventoryItem(user_id,"colete",1,slot) then
                vRPclient.setArmour(source,100)
                vCLIENT.closeInventory(source)
                senditemnotify(source,"Equipou",vRP.itemIndexList(itemName))
            end
        end

        if itemName == "skate" then
            active[user_id] = 10
            vCLIENT.closeInventory(source)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,3000,"Utilizando")

            SetTimeout(3000,function()
                active[user_id] = nil
                TriggerClientEvent('cancelando',source,false)
                TriggerClientEvent("skate",source)
            end)
        end

        if itemName == "radio" then
            vCLIENT.closeInventory(source)
            TriggerClientEvent("openRadioNui",source)
        end

        if itemName == "identidade" or itemName == "passaporte" then
            vCLIENT.closeInventory(source)
            TriggerClientEvent("vrp_identity:rg",source)
        end
        
        if itemName == "narguile" then
            if vRP.tryGetInventoryItem(user_id,"narguile",1,slot) then
                active[user_id] = 3
                vCLIENT.closeInventory(source)
                TriggerClientEvent('cancelando',source,true)
                TriggerClientEvent("progress",source,3000,"usando")
                senditemnotify(source,"Usou",vRP.itemIndexList(itemName))
                SetTimeout(3000,function()
                    TriggerEvent("starthookah", source)
                    TriggerClientEvent('cancelando',source,false)
                    active[user_id] = nil
                    sendnotify(source,"sucesso","Narguile usado com sucesso.",8000)
                end)
            end
        end

        if itemName == "bateria-celular" then

            vCLIENT.closeInventory(source)

            if vRP.getInventoryItemAmount(user_id,"celular-descarregado") <= 0 then
                sendnotify(source,"negado","Você não possui um celular sem bateria.",5000)
                return
            end

            local durability = vRP.getInventoryItemDurability(user_id,itemName)
            if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                if vRP.tryGetInventoryItem(user_id,"celular-descarregado",1,true) then
                    vRP.giveInventoryItem(user_id,"celular",1,true)
                end
            end
        end

        if itemName == "ursinho" then
            vCLIENT.closeInventory(source)
            vRPclient._CarregarObjeto(source,"impexp_int-0","mp_m_waremech_01_dual-0","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
        end

        if itemName == "rosa" then
            vCLIENT.closeInventory(source)
            vRPclient._CarregarObjeto(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","prop_single_rose",49,18905,0.13,0.15,0.0,-100.0,0.0,-20.0)
        end

        if itemName == "fogos-artificio" then
            if firecracker[user_id] == nil then
                active[user_id] = 3
                firecracker[user_id] = 250
                vCLIENT.closeInventory(source)
                vCLIENT.blockButtons(source,true)
                TriggerClientEvent("progress",source,3000,"Utilizando...")
                vRPclient._playAnim(source,false,{{"anim@mp_fireworks","place_firework_3_box"}},true)

                repeat
                    if active[user_id] == 0 then
                        active[user_id] = nil
                        vRPclient._stopAnim(source,false)
                        vCLIENT.blockButtons(source,false)

                        if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                            TriggerClientEvent("inventory:Firecracker",source)
                        end
                    end
                    Citizen.Wait(0)
                until active[user_id] == nil
            end
        end

        if itemName == "mochilap" then
            if vRP.getInventoryMaxWeight(user_id) >= 51 then
                sendnotify(source,"negado","Você não pode equipar mais mochilas.",8000)
            else
                if vRP.tryGetInventoryItem(user_id,"mochilap",1) then
                    addWeight(user_id,650)
                    senditemnotify(source,"Equipou", vRP.itemIndexList(itemName))
                end
            end
        end

        if itemName == "mochilam" then
            if vRP.getInventoryMaxWeight(user_id) >= 75 then
                sendnotify(source,"negado","Você não pode equipar mais mochilas.",8000)
            elseif vRP.getInventoryMaxWeight(user_id) < 51 then
                sendnotify(source,"negado","Você deve usar primeiro Mochila P",8000)
            else
                if vRP.tryGetInventoryItem(user_id,"mochilam",1) then
                    addWeight(user_id,650)
                    senditemnotify(source,"Equipou", vRP.itemIndexList(itemName))
                end
            end
        end

        if itemName == "mochilag" then
            if vRP.getInventoryMaxWeight(user_id) >= 90 then
                sendnotify(source,"negado","Você não pode equipar mais mochilas.",8000)
            elseif vRP.getInventoryMaxWeight(user_id) < 75 then
                sendnotify(source,"negado","Você deve usar primeiro Mochila M",8000)
            else
                if vRP.tryGetInventoryItem(user_id,"mochilag",1) then
                    addWeight(user_id,580)
                    senditemnotify(source,"Equipou", vRP.itemIndexList(itemName))
                end
            end
        end

        if itemName == "maquininha" then
            local source = source
            local user_id = vRP.getUserId(source)
            local nplayer = vRPclient.getNearestPlayer(source,2)
            local nuser_id = vRP.getUserId(nplayer)
            
            vCLIENT.closeInventory(source)

            if nplayer then
                local identity = vRP.getUserIdentity(user_id)
                local identitynu = vRP.getUserIdentity(nuser_id)
                local banco = vRP.getBankMoney(user_id)
                local banconu = vRP.getBankMoney(nuser_id)

                if vRP.getInventoryItemAmount(user_id,"maquininha") >= 1 then
                    local cobranca = vRP.prompt(source,"Quanto deseja cobrar pelos serviços prestados a "..identitynu.name.." "..identitynu.firstname.."</b>?", "")
                    TriggerClientEvent("emotes",source,"anotar2")

                    if cobranca ~= "" then
                        local valorfatura = parseInt(cobranca)
                        local fatura = vRP.request(nplayer,"<b>"..identity.name.." "..identity.firstname.."</b> está cobrando <b>$"..valorfatura.." dólares</b> pelos serviços. Deseja pagar?",30)

                        if fatura then
                            if banconu >= valorfatura then
                                local tax = parseInt(3/100*valorfatura)
                                local pagamento	= parseInt(valorfatura-tax)

                                vRP.setBankMoney(user_id,banco+pagamento)
                                vRP.setBankMoney(nuser_id,banconu-valorfatura)

                                TriggerClientEvent("Notify",source,"sucesso","<b>"..identitynu.name.." "..identitynu.firstname.."</b> pagou <b>$"..valorfatura.." dólares</b> pelo serviço.s")
                                TriggerClientEvent("Notify",nplayer,"sucesso","Você pagou <b>$"..valorfatura.." dólares</b> a <b>"..identity.name.." "..identity.firstname.."</b> pelo serviço.")

                                vRPclient._stopAnim(source,false)
                                vRPclient._DeletarObjeto(source)
                            else
                                TriggerClientEvent("Notify",source,"negado","<b>"..identitynu.name.." "..identitynu.firstname.."</b> não tem dinheiro suficiente para o pagamento.")
                                TriggerClientEvent("Notify",nplayer,"negado","Saldo insuficiente.")
                                vRPclient._stopAnim(source,false)
                                vRPclient._DeletarObjeto(source)
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","<b>"..identitynu.name.." "..identitynu.firstname.."</b> negou o pagamento.")
                            vRPclient._stopAnim(source,false)
                            vRPclient._DeletarObjeto(source)
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Você precisa colocar o valor que deseja cobrar!")
                        vRPclient._stopAnim(source,false)
                        vRPclient._DeletarObjeto(source)
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Você não possuí uma maquina de cobranças em sua mochila.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Não há players por perto.")
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- equipItem
-----------------------------------------------------------------------------------------------------------------------------------------
function equipItem(source, user_id, itemName, amount, slot)
    if amount > 0 and not active[user_id] and active[user_id] == nil then
        if vRP.tryGetInventoryItem(user_id,itemName,1) then
            local weapons = {}
            local identity = getUserIdentity(user_id)
            
            weapons[string.gsub(itemName,"wbody","")] = { ammo = 0 }
            vRPclient._giveWeapons(source,weapons)
            -- PerformHttpRequest(config.webhookEquip, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO DE ITEM EQUIPADO:\n⠀", thumbnail = {url = config.webhookIcon}, fields = {{name = "**QUEM EQUIPOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"}, {name = "**ITEM EQUIPADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ]"}}, footer = {text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = config.webhookIcon}, color = config.webhookColor}}}), {['Content-Type'] = 'application/json'})
            senditemnotify(source,"Equipou", vRP.itemIndexList(itemName))
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- reloadingItem
-----------------------------------------------------------------------------------------------------------------------------------------
function reloadingItem(source, user_id, itemName, amount, slot)
    if amount > 0 and not active[user_id] and active[user_id] == nil then
        local uweapons = vRPclient.getWeapons(source)
		local weaponuse = string.gsub(itemName,"wammo","")
		local weaponusename = "wammo"..weaponuse
		local identity = getUserIdentity(user_id)
		if uweapons[weaponuse] then
			local itemAmount = amount
			if itemAmount > 250 then
				itemAmount = 250
			end
			if uweapons[weaponuse].ammo ~= 250 then
				local temp_val = (250 - uweapons[weaponuse].ammo)
				if itemAmount > temp_val then itemAmount = temp_val end
				if vRP.tryGetInventoryItem(user_id, weaponusename, tonumber(itemAmount),true,slot) then
					local weapons = {}
					weapons[weaponuse] = { ammo = itemAmount }
					vRPclient._giveWeapons(source,weapons,false)
				end
			end
		end
    end
end
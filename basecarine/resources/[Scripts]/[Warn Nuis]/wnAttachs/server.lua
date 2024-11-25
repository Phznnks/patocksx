-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local idgens = Tools.newIDGenerator()

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("wnAttachs",src)
vCLIENT = Tunnel.getInterface("wnAttachs")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE
-----------------------------------------------------------------------------------------------------------------------------------------

local SprayContagem = 0

src.garmas = function()
	local source = source
	local user_id = vRP.getUserId(source)
	
	local identity = vRP.getUserIdentity(user_id)
    if user_id then
        local weapons = vRPclient.replaceWeapons(source,{})
        local tempog = math.random(2000,6000)
        Citizen.Wait(tempog)
		TriggerClientEvent("progress",source,tempog,"Guardando Armas")
        for k,v in pairs(weapons) do
            vRP.giveInventoryItem(user_id,"wbody|"..k,1)
            if v.ammo > 0 then
                vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
            end
        end
        Citizen.Wait(2000)
        TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
		PerformHttpRequest(webhook_garmas, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{     ------------------------------------------------------------
					title = "Garmas Jogador",
					thumbnail = {
						url = "https://cdn.discordapp.com/attachments/755933469955195015/951639146357735464/gardencity.png"
					}, 
					fields = {
						{ 
							name = "Log\n",
							value = "Nome: "..identity.name.." "..identity.firstname.." ["..user_id.."]\nUsou: /garmas\n"
						}
					}, 
					footer = { 
						text = "Data e hora: " ..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = "https://www.autoriafacil.com/wp-content/uploads/2019/01/icone-data-hora.png"
					},
					color = Webhook_Color
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end

RegisterCommand('cor', function(source, args)
    local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"armas.permissao") then
		TriggerClientEvent('changeWeaponColor', source, args[1])
	else
		if vRP.getInventoryItemAmount(user_id,"spray") >= 1 then
			if SprayContagem >= 5 then
				vRP.tryGetInventoryItem(user_id,"spray",1)
				TriggerClientEvent("Notify",source,"negado","O seu Spray Acabou.",8000)
			else
				SprayContagem = SprayContagem + 1 
				TriggerClientEvent('changeWeaponColor', source, args[1])
			end
		end
	end
end)

src.AttachsVerify = function()
	local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"armas.permissao") then
		return true
	else
		TriggerClientEvent("Notify",source,"negado","Voce nao tem vip.")
		return false
	end

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ DISPAROS ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('atirando')
AddEventHandler('atirando',function(x,y,z)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if not vRP.hasPermission(user_id,"policia.permissao") then
			local policiais = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(policiais) do
				local player = vRP.getUserSource(w)
				local identityy = vRP.getUserIdentity(player)
				if player then
					TriggerClientEvent('notificacao',player,x,y,z,user_id)
				end
			end
		end
	end
end)
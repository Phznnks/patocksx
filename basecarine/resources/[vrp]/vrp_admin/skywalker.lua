local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPidd = {}
Tunnel.bindInterface("vrp_admin",vRPidd)
Proxy.addInterface("vrp_admin",vRPidd)
IDDclient = Tunnel.getInterface("vrp_admin")

RegisterCommand('anunciar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        TriggerClientEvent("NotifyAdm",-1,identity.name,mensagem)
    end
end)

RegisterCommand('anuncio',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if vRP.tryPayment(user_id,5000) then
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        TriggerClientEvent("NotifyPol",-1,identity.name,mensagem)
    end
end)

RegisterCommand('callback',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"chat.permissao") then
        if args[1] then
        	local id = vRP.getUserSource(parseInt(args[1]))
            local mensagem = vRP.prompt(source,"Mensagem:","")
            if mensagem == "" then
                return
            end
            TriggerClientEvent("NotifyAdmCallback",id,identity.name,mensagem)
        end
    end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP FACS
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADA
RegisterCommand('addvermelhos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidervermelhos.permissao") then
		if args[1] then
			--SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]: "..parseInt(args[1]).." \n[GRUPO]: VERMELHOS "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"VERMELHOS")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>VERMELHOS</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removevermelhos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidervermelhos.permissao") then
		if args[1] then
			--SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..parseInt(args[1]).." \n[GRUPO]: VERMELHOS "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"VERMELHOS")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>VERMELHOS</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('svon',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		Citizen.CreateThread(function()
			PerformHttpRequest("", function(err, text, headers) end, 'POST', json.encode({
				content = '||@everyone <@&882047959913603091>||',
				embeds = {
					{
						title = ":green_circle: SERVIDOR ONLINE :green_circle:",
						thumbnail = {
							url = "https://i.imgur.com/5VZpg0G.png"
						},
						image = {
							url = "https://media.tenor.com/images/13263ea207733d88b4a3c86f343dc56b/tenor.gif"
						},
						description = '_ _\n**Conectar no console (F8):**\nconnect vicecity.com.br\n\n**IP do TeamSpeak:**\nvicecity.com.br\n\n**Atualizações:**\n<#902935064428568636>\n\n**Tutorial TokoVoip:**\n<#882862490172661780>\n\nO servidor encontra-se **online**!',
						color = 8978660, -- Se quiser mudar a cor é aqui⠀
						footer = {
							text = "Atenciosamente equipe VICE CITY©",
							icon_url = "https://i.imgur.com/5VZpg0G.png"
						},
					}
				}
			}), { ['Content-Type'] = 'application/json' })
		end)
	end
end)

RegisterCommand('renomear',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id, "administrador.permissao") or vRP.hasPermission(user_id, "manager.permissao") then
        local idjogador = vRP.prompt(source, "Qual id do jogador?", "")
        local nome = vRP.prompt(source, "Novo nome", "")
        local firstname = vRP.prompt(source, "Novo sobrenome", "")
        local idade = vRP.prompt(source, "Nova idade", "")
		local nuidentity = vRP.getUserIdentity(parseInt(idjogador))

        vRP.execute("vRP/update_user_identity",{
            user_id = idjogador,
            firstname = firstname,
            name = nome,
            age = idade,
            registration = nuidentity.registration,
            phone = nuidentity.phone
		})

		PerformHttpRequest(config.Rename, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	------------------------------------------------------------
					title = "REGISTRO DE ALTERAÇÃO IDENTIDADE⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					},
					fields = {
						{
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						},
						{
							name = "**NOVOS DADOS DO RG:**",
							value = "**["..vRP.format(parseInt(idjogador)).."][ Nome: "..nome.." ][ Sobrenome: "..firstname.." ][ Idade: "..idade.." ]**\n⠀"
						}
					},
					footer = {
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /mochila
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('backpack',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if user_id then
			TriggerClientEvent("setmochila",source,args[1],args[2])
		end
	end
end)

local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local custom = vRPclient.getCustomization(source)

    if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else
			local content = ""

            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br/>"
            end

            player_customs[source] = true
            vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 4px; width: 250px; margin-top: 200px; margin-right: 50px; background: rgba(15,15,15,0.7); color: #ffff; font-weight: bold; }",content)
        end
    end
end)

-----------------------------
--VROUPAS2
-----------------------------
function IsNumber( numero )
    return tonumber(numero) ~= nil
end

RegisterCommand('vroupas2', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    local custom = vRPclient.getCustomization(source)
    if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
          if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
            local content = ""
            for k, v in pairs(custom) do
                if (IsNumber(k) and k <= 11) or k == "p0" or k == "p1" or k == "p2" or k == "p6" or k == "p7" then
                    if IsNumber(k) then
                        content = content .. '[' .. k .. '] = {' 
                    else
                        content = content .. '["' ..k..'"] = {'
                    end
                    local contador = 1
                    for y, x in pairs(v) do
                        if contador < #v then
                            content  = content .. x .. ',' 
                        else
                            content = content .. x 
                        end
                        contador = contador + 1
                    end
                    content = content .. "},\n"
                end
            end
            player_customs[source] = true
            vRPclient.prompt(source, 'vRoupas: ', content)
        end
    end
end)
RegisterCommand('estoque',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] and args[2] then

			PerformHttpRequest(config.Stock, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "REGISTRO DE ALTERAÇÃO DE ESTOQUE⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						},
						fields = {
							{
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**MODIFICAÇÃO DE ESTOQUE:**",
								value = "**[ Modelo: "..args[1].." ][ Quantidade: "..vRP.format(parseInt(args[2])).." ]**\n⠀"
							}
						},
						footer = {
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor
					}
				}
			}), { ['Content-Type'] = 'application/json' })

            vRP.execute("losanjos/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o carro <b>"..args[1].."</b>.")
        end
    end
end)


RegisterCommand('gender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id then
       print(getGenderImage(user_id))
    end
end)

function getGenderImage(id)
	local valor = 0
	local datatable = vRP.query("system/getoff", {user = id})
    local data = json.decode(datatable[1].dvalue)
	if data.customization then
		for k,v in pairs(data.customization) do
			if k == "modelhash" then
				valor = v
				break
			end
		end
    end
    if valor == 1885233650 then
		return 'https://media.discordapp.net/attachments/759739881420750878/905454932176539658/male.png?width=676&height=676'
    elseif valor == -1667301416 then
        return 'https://media.discordapp.net/attachments/759739881420750878/905454937356501052/FemalePink.png'
    else
		return 'https://media.discordapp.net/attachments/759739881420750878/905455190814121994/8b59095911922f0575457a0e0a9388ec-animal-macaco-bonito-plana.png'
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPARINV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('clearinv',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local player = vRP.getUserSource(user_id)
    if vRP.hasPermission(user_id,"manager.permissao") then
        local tuser_id = tonumber(args[1])
        local tplayer = vRP.getUserSource(tonumber(tuser_id))
        local tplayerID = vRP.getUserId (tonumber(tplayer))
            if tplayerID ~= nil then
				local ndata = vRP.getUserDataTable(tplayerID)
				if ndata ~= nil then
					if ndata.inventorys ~= nil then
						for k,v in pairs(ndata.inventorys) do
							if vRP.tryGetInventoryItem(tplayerID,v.item,v.amount) then
							end
						end
					end
				end
				local identity = vRP.getUserIdentity(tplayerID)
                TriggerClientEvent("Notify",source,"sucesso","Limpou inventario do <id>"..identity.name.." "..identity.firstname.."</b>.")
            else
                TriggerClientEvent("Notify",source,"negado","O usuário não foi encontrado ou está offline.")
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD CAR
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("creative/get_vehicle","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_update_vehicles","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_ipva","UPDATE vrp_user_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")
vRP._prepare("creative/con_maxvehs","SELECT COUNT(vehicle) as qtd FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP._prepare("creative/get_estoque","SELECT * FROM vrp_estoque WHERE vehicle = @vehicle")
vRP._prepare("creative/set_estoque","UPDATE vrp_estoque SET quantidade = @quantidade WHERE vehicle = @vehicle")
vRP._prepare("creative/get_users","SELECT * FROM vrp_users WHERE id = @user_id")

RegisterCommand('addcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/add_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) }) 
            --vRP.execute("creative/set_ipva",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) })
            TriggerClientEvent("Notify",source,"sucesso","Voce adicionou o veículo <b>"..args[1].."</b> para o Passaporte: <b>"..parseInt(args[2]).."</b>.") 
        end
    end
end)

RegisterCommand('remcar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local nplayer = vRP.getUserId(parseInt(args[2]))

    if vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
			local identitynu = vRP.getUserIdentity(nuser_id)

            vRP.execute("creative/rem_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1] })
            vRP.execute("creative/rem_srv_data",{ dkey = 'gloves:'..parseInt(args[2])..':'..tostring(args[1]) })
            vRP.execute("creative/rem_srv_data",{ dkey = 'custom:u'..parseInt(args[2])..'veh_'..tostring(args[1]) })
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o veículo <b>"..args[1].."</b> do Passaporte: <b>"..parseInt(args[2]).."</b>.")

			vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "addcar")
        end
    end
end)

RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			TriggerClientEvent('spawnarveiculo',source,args[1])
			--SendWebhookMessage(weblogcar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SPAWNOU UM]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", true)
		end
	end
end)

RegisterCommand('uncuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
			TriggerClientEvent("admcuff",source)
		end
	end
end)

RegisterCommand('deattach',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"manager.permissao") then
			TriggerClientEvent("deattach",source)
		end
	end
end)

RegisterCommand('limpararea',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        TriggerClientEvent("syncarea",-1,x,y,z)
    end
end)

RegisterCommand('apagao',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") and args[1] ~= nil then
            local cond = tonumber(args[1])
            --TriggerEvent("cloud:setApagao",cond)
            TriggerClientEvent("cloud:setApagao",-1,cond)
        end
    end
end)

RegisterCommand('raios', function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") and args[1] ~= nil then
            local vezes = tonumber(args[1])
            TriggerClientEvent("cloud:raios",-1,vezes)
        end
    end
end)

RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"ajodljasdabdajkldnals") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu",nplayer,args[2])
                TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.")
            end
        end
    end
end)

RegisterCommand('debug',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
			TriggerClientEvent("ToggleDebug",player)
		end
	end
end)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	
	TriggerClientEvent("syncreparar",-1,nveh)
end)


RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
    TriggerClientEvent("syncdeleteobj",-1,index)
end)

RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	local vehicle = vRPclient.getNearestVehicle(source,11)
	if vehicle then
		if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then

			PerformHttpRequest(config.Fix, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "REGISTRO DE FIX⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						},
						fields = {
							{
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							}
						},
						footer = {
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			TriggerClientEvent('reparar',source)
		end
	end
end)

RegisterCommand('god',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identity2 = vRP.getUserIdentity(nuser_id)

				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)

                vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,400)
				TriggerClientEvent("nuioff",nplayer)
				vRP.setThirst(args[1],100)
				vRP.setHunger(args[1],100)

				vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ALVO]: "..args[1].." "..identity2.name.." "..identity2.firstname.." \n[USOU GOD] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "god")
            end
		else


			TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)

            vRPclient.killGod(source)
			vRPclient.setHealth(source,400)
			TriggerClientEvent("nuioff",source)
			vRP.setThirst(user_id,100)
			vRP.setHunger(user_id,100)

			vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU GOD] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "god")
        end
    end
end)

RegisterCommand('godall',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
				TriggerClientEvent("nuioff",id)
            	TriggerClientEvent("resetBleeding",id)
            	TriggerClientEvent("resetDiagnostic",id)
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,400)
            end
		end

		PerformHttpRequest(config.Revive, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{
					title = "REGISTRO DE REVIVER TODOS⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					},
					fields = {
						{
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						}
					},
					footer = {
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent('vehash',source)
	end
end)

RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent('vehtuning',source)
	end
end)

RegisterCommand('wl',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"aprovador-wl.permissao") then
		if args[1] then
            vRP.setWhitelisted(args[1],true)
            TriggerClientEvent("Notify",source,"sucesso","Você aprovou o passaporte <b>"..args[1].."</b> na whitelist.")

			vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ADICIONOU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "wl")
        end
    end
end)

RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			vRP.setWhitelisted(args[1],false)
			TriggerClientEvent("Notify",source,"sucesso","Você retirou o passaporte <b>"..args[1].."</b> da whitelist.")
			vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "wl")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kick',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then
				local motivo = vRP.prompt(source,"Digite um motivo:","")
				if motivo or motivo ~= "" then
					vRP.kick(id,"Você foi expulso da cidade. Motivo: "..motivo)
					TriggerClientEvent("Notify",source,"sucesso","Voce kickou o passaporte <b>"..args[1].."</b> da cidade.")
					vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KICKOU]: "..args[1].." \n[MOTIVO]: "..motivo..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "kick")
				else
					TriggerClientEvent("Notify",source,"negado","Você deve específicar um motivo.")
				end
			end
		end
	end
end)

RegisterCommand('kickall',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
                vRP.kick(id,"Você foi vitima do terremoto.")
            end
		end

		PerformHttpRequest(config.Kick, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{
					title = "REGISTRO DE KICKAR TODOS⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					},
					fields = {
						{
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						}
					},
					footer = {
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterCommand('kickbugados',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao")then
        TriggerClientEvent('MQCU:bugado',-1)
    end
end)

RegisterServerEvent("MQCU:bugado")
AddEventHandler("MQCU:bugado",function()
    local user_id = vRP.getUserId(source)
    if user_id == nil then
        local identifiers = GetPlayerIdentifiers(source)
        DropPlayer(source,"Hoje não.")
        identifiers = json.encode(identifiers)
        print("Player bugado encontrado: "..identifiers)
    end
end)

RegisterCommand("kicksrc",function(source,args,command)
  local user_id = vRP.getUserId(source)
  if user_id then
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
      DropPlayer(args[1],"VOCE FOI KIKADO!")
    end
  end
end)

local webhookbansrc = "WEBHOOKAQUI"
RegisterCommand('bansrc',function(source,args,command)
  local user_id = vRP.getUserId(source)
  if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
    local nsource = args[1]
    if(nsource)then
      local identifiers = {}
      local qtd = GetNumPlayerIdentifiers(nsource)
      for i=0,qtd do
        local idf = GetPlayerIdentifier(nsource,i)
        table.insert(identifiers,idf)
      end
      local nuser_id = vRP.getUserIdByIdentifiers(identifiers)
      if(nuser_id)then
        print("[/bansrc] Player Banido com sucesso!  user_id: "..user_id)
        vRP.setBanned(nuser_id,true)
        local msg = "User_id: "..nuser_id.."  banido pelo /bansrc"
        PerformHttpRequest(webhookbansrc, function(err, text, headers) end, 'POST', json.encode({content = msg}), { ['Content-Type'] = 'application/json' })
      else
        print("[/bansrc] user_id não encontrado!")
        print("[/bansrc] identifiers:\t",table.concat(identifiers,"\t").."\n")
        local msg = "user_id não localizado: "..table.concat(identifiers,"\t")
        PerformHttpRequest(webhookbansrc, function(err, text, headers) end, 'POST', json.encode({content = msg}), { ['Content-Type'] = 'application/json' })
      end
      DropPlayer(nsource, "[MQCU] Deu ruim pae...")
      print("[/bansrc] Source Kickada com sucesso!")
    end
  end
end)

vRP._prepare("admin/get_license","SELECT steam FROM vrp_users WHERE id = @id")

function GetDiscordF(uid)
	local license = vRP.query("admin/get_license",{ id = uid })
	iteration = 0
	count = 1
	local discord = "Não encontrado"
	while iteration < #license do
		iteration = iteration + 1
		discord = license[iteration].steam
	end
	local string1 = discord:gsub("discord:","")
	return string1
end


RegisterCommand('ban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local motivo = vRP.prompt(source,"Digite um motivo:","")
			if motivo or motivo ~= "" then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				vRP.setBanned(args[1], true)
				local alvo = ""
				vRP.kick(nplayer,"Você foi banido da cidade! [ Mais informações em: discord.gg/vicecity ]")
				alvo = "ID: ` "..args[1].." ` \nDISCORD: <@"..GetDiscordF(args[1])..">"
				TriggerClientEvent("Notify",source,"sucesso","Voce baniu o passaporte <b>"..args[1].."</b> da cidade.")
				vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[BANIU]: "..args[1].." \n[MOTIVO]: "..motivo..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "ban")
				PerformHttpRequest("", function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{
						title = "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ **__NOVO BANIMENTO__** _ _ _ _ _ _ _ _",
						thumbnail = {
						url = "https://i.imgur.com/4rKUI93.png"
						},
						fields = {
							{
								name = "**STAFF:**",
								value = "` "..identity.name.." "..identity.firstname.." `   `"..user_id.."` "
							},
							{
								name = "**ALVO:**",
								value = alvo
							},
							{
								name = "**Motivo:**",
								value = "` "..motivo.." `"
							},
						},
						footer = {
							text = os.date("\nData: %d/%m/%Y - %H:%M:%S"),
							icon_url = "https://i.imgur.com/dNALubw.png"
						},
						color = 15914080
					}
				}
				}), { ['Content-Type'] = 'application/json' })
			else
				TriggerClientEvent("Notify",source,"negado","Você deve específicar um motivo.")
			end

		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce desbaniu o passaporte <b>"..args[1].."</b> da cidade.")
			vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESBANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "unban")

				PerformHttpRequest("", function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{
						title = "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ **__REMOVEU BANIMENTO__** _ _ _ _ _ _ _ _",
						thumbnail = {
						url = "https://i.imgur.com/4rKUI93.png"
						},
						fields = {
							{
								name = "**STAFF:**",
								value = "` "..identity.name.." "..identity.firstname.." `   `"..user_id.."` "
							},
							{
								name = "**ALVO:**",
								value = "` "..args[1].." ` "
							},
						},
						footer = {
							text = os.date("\nData: %d/%m/%Y - %H:%M:%S"),
							icon_url = "https://i.imgur.com/dNALubw.png"
						},
						color = 15914080
					}
				}
				}), { ['Content-Type'] = 'application/json' })
		end
	end
end) 

-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			vRP.giveMoney(user_id,parseInt(args[1]))
			SendWebhookMessage(weblogmoney,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU DINHEIRO PARA]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)

RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id, "manager.permissao") or vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then

		vRPclient.toggleNoclip(source)
		local identity = vRP.getUserIdentity(user_id)
		vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU NC] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "noclip")
	end
end)

RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	end
end)

RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
	end
end)

RegisterCommand('cds2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:",tD(x)..", "..tD(y)..", "..tD(z))
	end
end)

RegisterCommand('cds3',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","{name='ATM', id=277, x="..tD(x)..", y="..tD(y)..", z="..tD(z).."},")
	end
end)

RegisterCommand('cds4',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","x = "..tD(x)..", y = "..tD(y)..", z = "..tD(z))
	end
end)

RegisterCommand('reselect',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if user_id then
			vRP.rejoinServer(source)
			Citizen.Wait(1000)
			TriggerClientEvent("spawn:setupChars",source)
		end
	end
end)

--[[RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local nplayer = vRP.getUserSource(parseInt(args[1]))
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] and args[2] then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")

			vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "group")

			TriggerClientEvent("oc_gps:coords", nplayer)
		end
	end
end)]]

-----------------------------------------------------------------------------------------------------------------------------------------
--[ UNGROUP ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("system/getoff","SELECT dvalue FROM vrp_user_data WHERE dkey = 'vRP:datatable' and user_id = @user")


RegisterCommand('ungroup',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
        if args[1] and args[2] then
			if checkSetGroup(user_id, args[2]) then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				if nplayer then
					vRP.removeUserGroup(parseInt(args[1]),args[2])
					TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")
					SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DE-SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				else
					local datatable = vRP.query("system/getoff", {user = args[1]})
					local data = json.decode(datatable[1].dvalue)
					if data.groups then
						data.groups[args[2]] = nil
					end
					vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
					TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")
					SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DE-SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			else 
				TriggerClientEvent("Notify",source,"negado","Você não pode remover um grupo maior que o seu.")
			end
        end
    end
end)

local hierarquia = {
	'manager','administrador','moderador','suporte'
}

function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

function checkSetGroup(user_id, group)
	local userGroup = vRP.getUserGroupByTypeIndex(user_id,'staff')
	local iuser, igroup = 0, 0
	print(userGroup)
	if userGroup then 
		for i in ipairs(hierarquia) do 
			if igroup == 0 and hierarquia[i] == group then 
				igroup = #hierarquia-i
			end 
			if iuser == 0 and hierarquia[i] == userGroup then 
				iuser = #hierarquia-i
			end
		end
	end
	print(iuser, igroup)
	return iuser >= igroup
end

local webhookgroup = ''

RegisterCommand('group',function(source,args,rawCommand)
	if source == 0 then
		if args[1] and args[2] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRP.addUserGroup(parseInt(args[1]),args[2])
				print("[ONLINE] Voce setou o passaporte "..parseInt(args[1]).." no grupo "..args[2]..".")
			else
				local datatable = vRP.query("system/getoff", {user = args[1]})
				local data = json.decode(datatable[1].dvalue)
				if data.groups then
					data.groups[args[2]] = true
				end
				vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
				
				print("[OFFLINE] Voce setou o passaporte "..parseInt(args[1]).." no grupo "..args[2]..".")
			end
		end
	else
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao")  then
			if args[1] and args[2] then
				if checkSetGroup(user_id, args[2]) then 
					local nplayer = vRP.getUserSource(parseInt(args[1]))
					if nplayer then
						vRP.addUserGroup(parseInt(args[1]),args[2])
						TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")
						SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..tostring(user_id).." "..tostring(identity.name).." "..tostring(identity.firstname).." \n[SETOU]: "..tostring(args[1]).." \n[GRUPO]: "..tostring(args[2]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					else
						local datatable = vRP.query("system/getoff", {user = args[1]})
						local data = json.decode(datatable[1].dvalue)
						if data.groups then
							data.groups[args[2]] = true
						end
						vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
						TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")
						SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..tostring(user_id).." "..tostring(identity.name).." "..tostring(identity.firstname).." \n[SETOU]: "..tostring(args[1]).." \n[GRUPO]: "..tostring(args[2]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end
				else 
					TriggerClientEvent("Notify",source,"negado","Você não pode setar um grupo maior que o seu.")
				end
			end
		end
	end
end)

RegisterCommand('anunciar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        TriggerClientEvent("Notify",-1,'aviso',mensagem..'<br><br>Enviado por: '..tostring(identity.name), 15000)
    end
end)

local webhooktag = ''

RegisterCommand('anuncio',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id, 'policia.permissao') and vRP.tryPayment(user_id,5000) then
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
		if mensagem:find('<%w+%s.+>') then 
			SendWebhookMessage(webhooktag,"```prolog\n[ID]: "..tostring(user_id).." "..tostring(identity.name).." "..tostring(identity.firstname).." \n[ENVIOU UMA MENSAGEM COM TAG]: "..mensagem.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			return
		end
		TriggerClientEvent("Notify",-1,'amarelo',mensagem..'<br><br>Enviado por: '..tostring(identity.name), 15000)
    end
end)

RegisterCommand('festinha',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"manager.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 0.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 30px; top: 10%; right: 7%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        SetTimeout(10000,function()
            vRPclient.removeDiv(-1,"festinha")
        end)
    end
end)

RegisterCommand('status',function(source,args,rawCommand)
    local onlinePlayers = GetNumPlayerIndices()
    local policia = vRP.getUsersByPermission("policia.permissao")
    local paramedico = vRP.getUsersByPermission("paramedico.permissao")
    local mec = vRP.getUsersByPermission("reparo.permissao")
    local bandidos = vRP.getUsersByPermission("ilegal.permissao")
    local staff = vRP.getUsersByPermission("suporte.permissao")
    local user_id = vRP.getUserId(source)        
	TriggerClientEvent("Notify",source,"amarelo",
	"<bold><b>Jogadores</b>: <b>"..onlinePlayers..
	"<br>Bandidos</b>: <b>"..#bandidos..
	"<br>Suporte</b>: <b>"..#staff..
	"<br>Policiais</b>: <b>"..#policia..
	"<br>Paramédicos</b>: <b>"..#paramedico..
	"<br>Mecânicos</b>:  <b>"..#mec..
	"</b></bold>.",9000)
end)

RegisterCommand('limparinv',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
     if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
		vRP.clearInventory(user_id)
		TriggerClientEvent("Notify",source,"sucesso","Você <b>limpou seu inventário</b> com sucesso!")
    end
end)

RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then

				vRPclient.teleport(tplayer,x,y,z)

				local identity = vRP.getUserIdentity(user_id)
				local identity2 = vRP.getUserIdentity(vRP.getUserId(tplayer))
				vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ALVO]: "..args[1].." "..identity2.name.." "..identity2.firstname.." \n[TELEPORTOU PARA SI] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "tptome")
			end
		end
	end
end)

RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then

				vRPclient.teleport(source,vRPclient.getPosition(tplayer))

				local identity = vRP.getUserIdentity(user_id)
				local identity2 = vRP.getUserIdentity(vRP.getUserId(tplayer))
				vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ALVO]: "..args[1].." "..identity2.name.." "..identity2.firstname.." \n[TELEPORTOU PARA ELE] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "tpto")
			end
		end
	end
end)

RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then

		TriggerClientEvent('tptoway',source)
		local identity = vRP.getUserIdentity(user_id)
		local x,y,z = vRPclient.getPosition(source)
		vRP.log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[TELEPORTOU PARA COORDS] "..tD(x)..", "..tD(y)..", "..tD(z).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```", "tpway")
	end
end)

-----------------------------------------------------------------
-- SPAWNAR ARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
local qtdAmmunition = 250
local itemlist = {
    ["WEAPON_PISTOL_MK2"] = { arg = "fiveseven" },
    ["WEAPON_ASSAULTSMG"] = { arg = "21" },
	["WEAPON_RAYPISTOL"] = { arg = "raio" },
    ["WEAPON_ASSAULTRIFLE"] = { arg = "ak103" },
    ["WEAPON_PROXMINE"] = { arg = "zk1" },
    ["WEAPON_RPG"] = { arg = "zk2" },
	["WEAPON_MINIGUN"] = { arg = "zk3" },
	["WEAPON_RAYPISTOL"] = { arg = "zk4" } 
}

RegisterCommand('arma',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] then
            for k,v in pairs(itemlist) do
                if v.arg == args[1] then
                    result = k
                    vRPclient.giveWeapons(source,{[result] = { ammo = qtdAmmunition }})
                end
            end
        end
    end
end)

RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent('delnpcs',source)
	end
end)

RegisterCommand('pon',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
        local users = vRP.getUsers()
        local players = ""
		local quantidade = 0

        for k,v in pairs(users) do
            if k ~= #users then
                players = players
			end

            players = players.." "..k
            quantidade = quantidade + 1
		end

        TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{255,160,0},quantidade)
        TriggerClientEvent('chatMessage',source,"ID's ONLINE",{255,160,0},players)
    end
end)

function vRPidd.getPermissao()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		return true
	else
		return false
	end
end

RegisterCommand('ids',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		TriggerClientEvent("mostrarid",source)
	end
end)

function vRPidd.logID()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)

	PerformHttpRequest(config.Corno, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{
				title = "REGISTRO DE ID VISIVEL:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
				thumbnail = {
				url = config.webhookIcon
				},
				fields = {
					{
						name = "**COLABORADOR DA EQUIPE:**",
						value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
					},
					{
						name = "**LOCAL: "..tD(x)..", "..tD(y)..", "..tD(z).."**",
						value = "⠀"
					}
				},
				footer = {
					text = "DIAMOND"..os.date("%d/%m/%Y |: %H:%M:%S"),
					icon_url = config.webhookIcon
				},
				color = config.webhookColor
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('staff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local cargo = nil
	local status = nil

	if vRP.hasPermission(user_id,"manager.permissao") then
		cargo = "Manager"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-manager")
		TriggerClientEvent("Notify",source,"negado","<b>[MANAGER]</b> OFF.")
		TriggerEvent('eblips:remove',source)

	elseif vRP.hasPermission(user_id,"off-manager.permissao") then
		cargo = "Manager"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"manager")
		TriggerClientEvent("Notify",source,"sucesso","<b>[MANAGER]</b> ON.")

		TriggerEvent('eblips:add',{ name = "Staff", src = source, color = 83 })

	elseif vRP.hasPermission(user_id,"administrador.permissao") then
		cargo = "Administrador"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-administrador")
		TriggerClientEvent("Notify",source,"negado","<b>[ADMINISTRADOR]</b> OFF.")
		TriggerEvent('eblips:remove',source)

	elseif vRP.hasPermission(user_id,"off-administrador.permissao") then
		cargo = "Administrador"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"administrador")
		TriggerClientEvent("Notify",source,"sucesso","<b>[ADMINISTRADOR]</b> ON.")
		TriggerEvent('eblips:add',{ name = "Staff", src = source, color = 83 })

	elseif vRP.hasPermission(user_id,"moderador.permissao") then
		cargo = "Moderador"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-moderador")
		TriggerClientEvent("Notify",source,"negado","<b>[MODERADOR]</b> OFF.")
		TriggerEvent('eblips:remove',source)

	elseif vRP.hasPermission(user_id,"off-moderador.permissao") then
		cargo = "Moderador"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"moderador")
		TriggerClientEvent("Notify",source,"sucesso","<b>[MODERADOR]</b> ON.")
		TriggerEvent('eblips:add',{ name = "Staff", src = source, color = 83 })

	elseif vRP.hasPermission(user_id,"suporte.permissao") then
		cargo = "Suporte"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-suporte")
		TriggerClientEvent("Notify",source,"negado","<b>[SUPORTE]</b> OFF.")
		TriggerEvent('eblips:remove',source)

	elseif vRP.hasPermission(user_id,"off-suporte.permissao") then
		cargo = "Suporte"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"suporte")
		TriggerClientEvent("Notify",source,"sucesso","<b>[SUPORTE]</b> ON.")
		TriggerEvent('eblips:add',{ name = "Staff", src = source, color = 83 })

	end
	--[[PerformHttpRequest(config.Status, function(err, text, headers) end, 'POST', json.encode({
        embeds = {
            {
                title = "REGISTRO ADMINISTRATIVO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
                thumbnail = {
                    url = config.webhookIcon
                },
                fields = {
                    {
                        name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]",
                        value = "⠀"
					},
					{
                        name = "**CARGO: **"..cargo,
						value = "⠀",
						inline = true
					},
					{
                        name = "**STATUS: **"..status,
						value = "⠀",
						inline = true
                    }
                },
                footer = {
                    text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
                    icon_url = config.webhookIcon
                },
                color = config.webhookColor
            }
        }
    }), { ['Content-Type'] = 'application/json' })]]
end)

local plan = {}

RegisterCommand("plano", function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if args[1] == "add" then
		if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
			if vRP.getUserSource(tonumber(args[2])) then
				if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
					local consulta = vRP.getUData(tonumber(args[2]),"vRP:plano")
					local resultado = json.decode(consulta) or {}
					resultado.tempo = (resultado.tempo or 0)+tonumber(args[3])*1440
					plan[vRP.getUserId(source)] = resultado.tempo
					vRP.setUData(tonumber(args[2]), "vRP:plano", json.encode(resultado))
				end
			end
		end
	elseif args[1] == "info" then
		local consulta = vRP.getUData(vRP.getUserId(source),"vRP:plano")
		local resultado = json.decode(consulta) or {}

		resultado.tempo = resultado.tempo or 0
		resultado = resultado.tempo/1440 or 0

		TriggerClientEvent("Notify",source,"amarelo","<b>Dias Restantes:</b> "..math.ceil(resultado))
	end
end)

function vRPidd.getId(sourceplayer)
	local user_id = vRP.getUserId(sourceplayer)
	return user_id
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end

local run = {}

RegisterCommand("vip", function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local nuser_id = parseInt(args[2])
	if args[1] == "add" then
		local vip = args[3]
		if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
			if vip == "ultimate" then
				vRP.addUserGroup(nuser_id,"ultimate")
				TriggerClientEvent("Notify", source, "sucesso","ID "..args[1].." setado de Ultimate pass.")
				if vRP.getUserSource(tonumber(args[2])) then
					if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
						local consulta = vRP.getUData(tonumber(args[2]),"vRP:vip")
						local resultado = json.decode(consulta) or {}
						resultado.tempo = (resultado.tempo or 0)+tonumber(args[4])*1440
						run[vRP.getUserId(source)] = resultado.tempo
						vRP.setUData(tonumber(args[2]), "vRP:vip", json.encode(resultado))
					end
				end
			elseif 	vip == "platina" then
				vRP.addUserGroup(nuser_id,"platinum")
				TriggerClientEvent("Notify", source, "sucesso","ID "..args[1].." setado de Platina pass.")
				if vRP.getUserSource(tonumber(args[2])) then
					if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
						local consulta = vRP.getUData(tonumber(args[2]),"vRP:vip")
						local resultado = json.decode(consulta) or {}
						resultado.tempo = (resultado.tempo or 0)+tonumber(args[4])*1440
						run[vRP.getUserId(source)] = resultado.tempo
						vRP.setUData(tonumber(args[2]), "vRP:vip", json.encode(resultado))
					end
				end
			elseif 	vip == "ouro" then
				vRP.addUserGroup(nuser_id,"gold")
				TriggerClientEvent("Notify", source, "sucesso","ID "..args[1].." setado de Ouro pass.")
				if vRP.getUserSource(tonumber(args[2])) then
					if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
						local consulta = vRP.getUData(tonumber(args[2]),"vRP:vip")
						local resultado = json.decode(consulta) or {}
						resultado.tempo = (resultado.tempo or 0)+tonumber(args[4])*1440
						run[vRP.getUserId(source)] = resultado.tempo
						vRP.setUData(tonumber(args[2]), "vRP:vip", json.encode(resultado))
					end
				end
			elseif 	vip == "standard" then
				vRP.addUserGroup(nuser_id,"standard")
				TriggerClientEvent("Notify", source, "sucesso","ID "..args[1].." setado de Standard pass.")
				if vRP.getUserSource(tonumber(args[2])) then
					if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
						local consulta = vRP.getUData(tonumber(args[2]),"vRP:vip")
						local resultado = json.decode(consulta) or {}
						resultado.tempo = (resultado.tempo or 0)+tonumber(args[4])*1440
						run[vRP.getUserId(source)] = resultado.tempo
						vRP.setUData(tonumber(args[2]), "vRP:vip", json.encode(resultado))
					end
				end

			end
		end
	elseif args[1] == "rem" then
		if vRP.getUserSource(tonumber(args[2])) then
			if vRP.hasPermission(vRP.getUserId(source),"manager.permissao") or vRP.hasPermission(vRP.getUserId(source),"administrador.permissao") then
				local consulta = vRP.getUData(tonumber(args[2]),"vRP:vip")
				local resultado = json.decode(consulta) or {}
				resultado.tempo = (resultado.tempo or 0)-tonumber(args[3])*1440
				if resultado.tempo < 0 then resultado.tempo = 0 end
				run[vRP.getUserId(source)] = resultado.tempo
				vRP.setUData(tonumber(args[2]), "vRP:vip", json.encode(resultado))
			end
		end
	elseif args[1] == "status" then
		local user_id = vRP.getUserId(source)
		local consulta = vRP.getUData(vRP.getUserId(source),"vRP:vip")
		local resultado = json.decode(consulta) or {}
		local pass = ""

		if vRP.hasPermission(user_id,"ultimate.permissao") then
			pass = "Ultimate"
		elseif vRP.hasPermission(user_id,"platina.permissao") then
			pass = "Platina"
		elseif vRP.hasPermission(user_id,"ouro.permissao") then
			pass = "Ouro"
		elseif vRP.hasPermission(user_id,"standard.permissao") then
			pass = "Standard"
		end

		resultado.tempo = resultado.tempo or 0
		resultado = resultado.tempo/1440 or 0

		TriggerClientEvent("Notify",source,"amarelo","<b>Pass:</b> "..pass.." | <b>Dias Restantes:</b> "..math.ceil(resultado))
	end
end)

RegisterCommand('dbug',function(source,rawCommand)
	local user_id = vRP.getUserId(source)
	vRPclient._setCustomization(source,vRPclient.getCustomization(source))
	vRP.removeCloak(source)
	TriggerEvent("barbershop:init",user_id)
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
local armas = {
	["rpg"] = {
		arma = "WEAPON_RPG", 
		municao = 9999, 
	},
	["rail"] = {
		arma = "WEAPON_RAILGUN", 
		municao = 9999, 
	},
	["rpg2"] = {
		arma = "WEAPON_HOMINGLAUNCHER", 
		municao = 9999, 
	},
	["sniper"] = {
		arma = "WEAPON_HEAVYSNIPER_MK2", 
		municao = 9999, 
	},
	["g3"] = {
		arma = "WEAPON_SPECIALCARBINE", 
		municao = 9999, 
	},
	["g3c"] = {
		arma = "WEAPON_SPECIALCARBINE_MK2", 
		municao = 9999, 
	},
	["mg2"] = {
		arma = "WEAPON_COMBATMG_MK2", 
		municao = 9999, 
	},
	["shot"] = {
		arma = "WEAPON_ASSAULTSHOTGUN", 
		municao = 9999, 
	},
	["revolver"] = {
		arma = "WEAPON_NAVYREVOLVER", 
		municao = 9999, 
	},
	["revolver2"] = {
		arma = "WEAPON_GADGETPISTOL", 
		municao = 9999, 
	},
	["c4"] = {
		arma = "WEAPON_STICKYBOMB", 
		municao = 9999, 
	},
	["snow"] = {
		arma = "WEAPON_SNOWBALL", 
		municao = 9999, 
	},
	["minigun"] = {
		arma = "WEAPON_MINIGUN", 
		municao = 9999, 
	},
	["launcher"] = {
		arma = "WEAPON_GRENADELAUNCHER", 
		municao = 9999, 
	},
	["launcher2"] = {
		arma = "WEAPON_GRENADELAUNCHER_SM", 
		municao = 9999, 
	},
	["five"] = {
		arma = "WEAPON_PISTOL_MK2", 
		municao = 9999, 
	},
	["mtar"] = {
		arma = "WEAPON_ASSAULTSMG", 
		municao = 9999, 
	},
}

RegisterCommand('arma',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "manager.permissao") then
		for k,v in pairs(armas) do
			
			if args[1] then
				if args[1] == k then
					vRPclient.giveWeapons(source,{ [v.arma] = { ammo = v.municao }})
				end
			else
				vRPclient.giveWeapons(source,{ [v.arma] = { ammo = v.municao }})
			end
		end
	else
		TriggerClientEvent("Notify", source, "negado", "Voce nao tem <b>Permissao<b/>")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["dinheiroespecie"] = { index = "dinheiroespecie", nome = "Dinheiro em Espécie"},
	["semi-identidade"] = { index = "semi-identidade", nome = "Identidade Sem Plástico" },
	["plastico"] = { index = "plastico", nome = "Plástico" },
	["insumos"] = { index = "insumos", nome = "Insumos Alimentícios" },
	["relatorio"] = { index = "relatorio", nome = "Relatório" },
	["valefone"] = { index = "valefone", nome = "Vale Troca Número"},
	["valeplaca"] = { index = "valeplaca", nome = "Vale Troca Placa"},
	["valemansao"] = { index = "valemansao", nome = "Vale Mansão"},
	["laranja"] = { index = "laranja", nome = "Laranja" },
	["ferramenta"] = { index = "ferramenta", nome = "Ferramenta" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda" },
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de Lixo" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia" },
	["colete"] = { index = "colete", nome = "Colete" },
	["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite" },
	["receita-medica"] = { index = "receita-medica", nome = "Receita Médica" },
	["tora"] = { index = "tora", nome = "Tora de Madeira" },
	["alianca"] = { index = "alianca", nome = "Aliança" },
	["bandagem"] = { index = "bandagem", nome = "Bandagem" },
	["dorflex"] = { index = "dorflex", nome = "Dorflex" },
	["omeprazol"] = { index = "omeprazol", nome = "Omeprazol" },
	["dipirona"] = { index = "dipirona", nome = "Dipirona" },
	["gelol"] = { index = "gelol", nome = "Gelol" },
	["paracetamol"] = { index = "paracetamol", nome = "Paracetamol" },
	["decupramim"] = { index = "decupramim", nome = "Decupramim" },
	["identidade"] = { index = "identidade", nome = "Identidade" },
	["maquininha"] = { index = "maquininha", nome = "Maquininha" },
	["buscopan"] = { index = "buscopan", nome = "Buscopan" },
	["cartaoclonado"] = { index = "cartaoclonado", nome = "Cartão Clonado" },
	["cartaodecredito"] = { index = "cartaodecredito", nome = "Cartão de Crédito" },
	["cartaodedebito"] = { index = "cartaodedebito", nome = "Cartão de Débito" },
	["heroin"] = { index = "heroin", nome = "Heroina" },
	["eter"] = { index = "eter", nome = "Eter" },
	["cloroformio"] = { index = "cloroformio", nome = "Cloroformio" },
	["novalgina"] = { index = "novalgina", nome = "Novalgina" },
	["alivium"] = { index = "alivium", nome = "Alivium" },
	["agua-oxigenada"] = { index = "agua-oxigenada", nome = "Agua-Oxigenada" },
	["nokusin"] = { index = "nokusin", nome = "Nokusin" },
	["sidelnafila"] = { index = "sidelnafila", nome = "Sidelnafila" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja" },
	["tequila"] = { index = "tequila", nome = "Tequila" },
	["alvejante"] = { index = "alvejante", nome = "Alvejante" },
	["borrifador"] = { index = "borrifador", nome = "Borrifador" },
	["caixa-vazia"] = { index = "caixa-vazia", nome = "Caixa Vazia" },
	["vodka"] = { index = "vodka", nome = "Vodka" },
	["whisky"] = { index = "whisky", nome = "Whisky" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque" },
	["absinto"] = { index = "absinto", nome = "Absinto" },
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos" },
	["algemas"] = { index = "algemas", nome = "Algemas" },
	["capuz"] = { index = "capuz", nome = "Capuz" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick" },
	["masterpick"] = { index = "masterpick", nome = "Masterpick" },
	["militec"] = { index = "militec", nome = "Militec-1" },
	["celular"] = { index = "celular", nome = "Celular" },
	["carnedecormorao"] = { index = "carnedecormorao", nome = "Carne de Cormorão" },
	["carnedecorvo"] = { index = "carnedecorvo", nome = "Carne de Corvo" },
	["carnedeaguia"] = { index = "carnedeaguia", nome = "Carne de Águia" },
	["carnedecervo"] = { index = "carnedecervo", nome = "Carne de Cervo" },
	["carnedecoelho"] = { index = "carnedecoelho", nome = "Carne de Coelho" },
	["carnedecoyote"] = { index = "carnedecoyote", nome = "Carne de Coyote" },
	["carnedelobo"] = { index = "carnedelobo", nome = "Carne de Lobo" },
	["carnedepuma"] = { index = "carnedepuma", nome = "Carne de Puma" },
	["carnedejavali"] = { index = "carnedejavali", nome = "Carne de Javali" },
	["graos"] = { index = "graos", nome = "Graos" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros" },
	["keycard"] = { index = "keycard", nome = "Keycard" },
	["isca"] = { index = "isca", nome = "Isca" },
	["dourado"] = { index = "dourado", nome = "Dourado" },
	["corvina"] = { index = "corvina", nome = "Corvina" },
	["salmao"] = { index = "salmao", nome = "Salmão" },
	["pacu"] = { index = "pacu", nome = "Pacu" },
	["pintado"] = { index = "pintado", nome = "Pintado" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré" },
	["lambari"] = { index = "lambari", nome = "Lambari" },
	["energetico"] = { index = "energetico", nome = "Energético" },
	["mochila"] = { index = "mochila", nome = "Mochila" },
	["maconha"] = { index = "maconha", nome = "Maconha" },
	["adubo"] = { index = "adubo", nome = "Adubo" },
	["fertilizante"] = { index = "fertilizante", nome = "Fertilizante" },
	["capsula"] = { index = "capsula", nome = "Cápsula" },
	["polvora"] = { index = "polvora", nome = "Pólvora" },
	["malote"] = { index = "malote", nome = "Malote" },
	["cedula"] = { index = "cedula", nome = "Cédula" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Tecidos ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["tecido"] = { index = "tecido", nome = "Tecido" },
	["tecidor"] = { index = "tecidor", nome = "Tecido Reforçado" },
	["agulha"] = { index = "agulha", nome = "Agulha" },

	["orgao"] = { index = "orgao", nome = "Órgão" },
	["etiqueta"] = { index = "etiqueta", nome = "Etiqueta" },
	["pendrive"] = { index = "pendrive", nome = "Pendrive" },
	["notebook"] = { index = "notebook", nome = "Notebook" },
	["placa"] = { index = "placa", nome = "Placa" },
	["relogioroubado"] = { index = "relogioroubado", nome = "Relógio Roubado" },
	["pulseiraroubada"] = { index = "pulseiraroubada", nome = "Pulseira Roubada" },
	["anelroubado"] = { index = "anelroubado", nome = "Anel Roubado" },
	["colarroubado"] = { index = "colarroubado", nome = "Colar Roubado" },
	["brincoroubado"] = { index = "brincoroubado", nome = "Brinco Roubado" },
	["carteiraroubada"] = {  index = "carteiraroubada", nome = "Carteira Roubada"  },
	["tabletroubado"] = {  index = "tabletroubado", nome = "Tablet Roubado"  },
	["sapatosroubado"] = {  index = "sapatosroubado", nome = "Sapatos Roubado"  },
	["folhadecoca"] = { index = "folhadecoca", nome = "Folha de Coca" },
	["pastadecoca"] = { index = "pastadecoca", nome = "Pasta de Coca" },
	["cocaina"] = { index = "cocaina", nome = "Cocaína" },
	["fungo"] = { index = "fungo", nome = "Fungo" },
	["dietilamina"] = { index = "dietilamina", nome = "Dietilamina" },
	["lsd"] = { index = "lsd", nome = "LSD" },
	---------------------------------------------------------------------------------------------------
	--[ Bebidas Não Alcoólicas ]-----------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["agua"] = { index = "agua", nome = "Água" },
	["leite"] = { index = "leite", nome = "Leite" },
	["cafe"] = { index = "cafe", nome = "Café" },
	["cafecleite"] = { index = "cafecleite", nome = "Café com leite" },
	["cafeexpresso"] = { index = "cafeexpresso", nome = "Café Expresso" },
	["capuccino"] = { index = "capuccino", nome = "Capuccino" },
	["frappuccino"] = { index = "frappuccino", nome = "Frapuccino" },
	["cha"] = { index = "cha", nome = "Chá" },
	["icecha"] = { index = "icecha", nome = "Chá Gelado" },
	["sprunk"] = { index = "sprunk", nome = "Sprunk" },
	["cola"] = { index = "cola", nome = "Cola" },

	["sanduiche"] = { index = "sanduiche", nome = "Sanduíche" },
	["rosquinha"] = { index = "rosquinha", nome = "Rosquinha" },
	["hotdog"] = { index = "hotdog", nome = "HotDog" },
	["xburguer"] = { index = "xburguer", nome = "xBurguer" },
	["chips"] = { index = "chips", nome = "Batata Chips" },
	["batataf"] = { index = "batataf", nome = "Batata Frita" },
	["pizza"] = { index = "pizza", nome = "Pedaço de Pizza" },
	["frango"] = { index = "frango", nome = "Frango Frito" },
	["bcereal"] = { index = "bcereal", nome = "Barra de Cereal" },
	["bchocolate"] = { index = "bchocolate", nome = "Barra de Chocolate" },
	["taco"] = { index = "taco", nome = "Taco" },
	["yakisoba"] = { index = "yakisoba", nome = "Yakisoba" },
	["ticket"] = { index = "ticket", name = "Ticket", type = "use", weight = 2 },

	["uva"] = { index = "uva", nome = "Uva" },
	["uvafermentada"] = { index = "uvafermentada", nome = "Uva Fermentada" },
	["vinhobranco"] = { index = "vinhobranco", nome = "Vinho Branco" },
	["vinhorose"] = { index = "vinhorose", nome = "Vinho Rose" },
	["vinhotinto"] = { index = "vinhotinto", nome = "Vinho Tinto" },


	["acidobateria"] = { index = "acidobateria", nome = "Ácido de Bateria" },
	["anfetamina"] = { index = "anfetamina", nome = "Anfetamina" },
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina" },
	["armacaodearma"] = { index = "armacaodearma", nome = "Armação de Arma" },
	["pecadearma"] = { index = "pecadearma", nome = "Peça de Arma" },
	["logsinvasao"] = { index = "logsinvasao", nome = "L. Inv. Banco" },
	["keysinvasao"] = { index = "keysinvasao", nome = "K. Inv. Banco" },
	["pendriveinformacoes"] = { index = "pendriveinformacoes", nome = "P. com Info." },
	["acessodeepweb"] = { index = "acessodeepweb", nome = "P. DeepWeb" },
	["diamante"] = { index = "diamante", nome = "Min. Diamante" },
	["ouro"] = { index = "ouro", nome = "Min. Ouro" },
	["bronze"] = { index = "bronze", nome = "Min. Bronze" },
	["ferro"] = { index = "ferro", nome = "Min. Ferro" },
	["rubi"] = { index = "rubi", nome = "Min. Rubi" },
	["esmeralda"] = { index = "esmeralda", nome = "Min. Esmeralda" },
	["safira"] = { index = "safira", nome = "Min. Safira" },
	["topazio"] = { index = "topazio", nome = "Min. Topazio" },
	["ametista"] = { index = "ametista", nome = "Min. Ametista" },
	["diamante2"] = { index = "diamante2", nome = "Diamante" },
	["ouro2"] = { index = "ouro2", nome = "Ouro" },
	["bronze2"] = { index = "bronze2", nome = "Bronze" },
	["ferro2"] = { index = "ferro2", nome = "Ferro" },
	["rubi2"] = { index = "rubi2", nome = "Rubi" },
	["esmeralda2"] = { index = "esmeralda2", nome = "Esmeralda" },
	["safira2"] = { index = "safira2", nome = "Safira" },
	["topazio2"] = { index = "topazio2", nome = "Topazio" },
	["ametista2"] = { index = "ametista2", nome = "Ametista" },
	["ingresso"] = { index = "ingresso", nome = "Ingresso Eventos" },
	["radio"] = { index = "radio", nome = "Radio" },
	["serra"] = { index = "serra", nome = "Serra" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira" },
	["c4"] = { index = "c4", nome = "C-4" },
	["roupas"] = { index = "roupas", nome = "Roupas" },
	["xerelto"] = { index = "xerelto", nome = "Xerelto" },
	["coumadin"] = { index = "coumadin", nome = "Coumadin" },
	["aneldecompromisso"] = { index = "aneldecompromisso", nome = "Anel de Compromisso" },
	["aneldecompromissodasam"] = { index = "aneldecompromissodasam", nome = "Anel de Compromisso da Sam" },
	["sugar"] = { index = "sugar", nome = "Açúcar" },
	["algodaodoce"] = { index = "algodaodoce", nome = "Algodão Doce" },
	["colardeperolas"] = { index = "colardeperolas", nome = "Colar de Pérolas" },
	["pulseiradeouro"] = { index = "pulseiradeouro", nome = "Pulseira de Ouro" },
	["chocolate"] = { index = "chocolate", nome = "Chocolate" },
	["pirulito"] = { index = "pirulito", nome = "Pirulito" },
	["buque"] = { index = "buque", nome = "Buquê de Flores" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês" },
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra" },
	["wbody|WEAPON_PISTOL"] = { index = "m1911", nome = "M1911" },
	["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven" },
	["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19" },
	["wbody|WEAPON_STUNGUN"] = { index = "taser", nome = "Taser" },
	["wbody|WEAPON_SNSPISTOL"] = { index = "hkp7m10", nome = "HK P7M10" },
	["wbody|WEAPON_VINTAGEPISTOL"] = { index = "m1922", nome = "M1922" },
	["wbody|WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44" },
	["wbody|WEAPON_REVOLVER_MK2"] = { index = "magnum357", nome = "Magnum 357" },
	["wbody|WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador" },
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor" },
	["wbody|WEAPON_MICROSMG"] = { index = "uzi", nome = "Uzi" },
	["wbody|WEAPON_CARBINERIFLE"] = { index = "m4a1", nome = "M4A1" },
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mtar21", nome = "MTAR-21" },
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer MPX" },
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870" },
	["wbody|WEAPON_CARBINERIFLE_MK2"] = { index = "ia2", nome = "IA2" },
	["wbody|WEAPON_ASSAULTRIFLE"] = { index = "ak103", nome = "AK-103" },
	["wbody|WEAPON_GUSENBERG"] = { index = "thompson", nome = "Thompson" },
	["wbody|WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9" },
	["wbody|WEAPON_SMG"] = { index = "mpx", nome = "MPX" },
	["wbody|WEAPON_COMPACTRIFLE"] = { index = "aks", nome = "AKS-74U" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina" },
	["wbody|WEAPON_PISTOL50"] = { index = "pistol50", nome = "PISTOL50" },
	["wbody|WEAPON_APPISTOL"] = { index = "appistol", nome = "APPISTOL" },
	["wammo|WEAPON_PISTOL50"] = { index = "m-pistol50", nome = "M.PISTOL50" },
	["wammo|WEAPON_APPISTOL"] = { index = "m-appistol", nome = "M.APPISTOL" },
	["wammo|WEAPON_PISTOL"] = { index = "m-m1911", nome = "M.M1911" },
	["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.Five Seven" },
	["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19" },
	["wammo|WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser" },
	["wammo|WEAPON_SNSPISTOL"] = { index = "m-hkp7m10", nome = "M.HK P7M10" },
	["wammo|WEAPON_VINTAGEPISTOL"] = { index = "m-m1922", nome = "M.M1922" },
	["wammo|WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "M.Magnum 44" },
	["wammo|WEAPON_REVOLVER_MK2"] = { index = "m-magnum357", nome = "M.Magnum 357" },
	["wammo|WEAPON_MUSKET"] = { index = "m-winchester22", nome = "M.Winchester 22" },
	["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador" },
	["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas" },
	["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor" },
	["wammo|WEAPON_MICROSMG"] = { index = "m-uzi", nome = "M.Uzi" },
	["wammo|WEAPON_CARBINERIFLE"] = { index = "m-m4a1", nome = "M.M4A1" },
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mtar21", nome = "M.MTAR-21" },
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "M.Sig Sauer MPX" },
	["wammo|WEAPON_PUMPSHOTGUN"] = { index = "m-shotgun", nome = "M.Shotgun" },
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870" },
	["wammo|WEAPON_CARBINERIFLE_MK2"] = { index = "m-ia2", nome = "M.IA2" },
	["wammo|WEAPON_ASSAULTRIFLE"] = { index = "m-ak103", nome = "M.AK-103" },
	["wammo|WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "M.Tec-9" },
	["wammo|WEAPON_SMG"] = { index = "m-mpx", nome = "M.MPX" },
	["wammo|WEAPON_COMPACTRIFLE"] = { index = "m-aks", nome = "M.AKS-74U" },
	["wammo|WEAPON_GUSENBERG"] = { index = "m-thompson", nome = "M.Thompson" },
	["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível" },
	["dinheiro"] = { index = "dinheiro", name = "Dinheiro", type = "use", weight = 0.0 },
	["dinheirosujo"] = { index = "dinheirosujo", name = "Dinheiro Sujo", type = "use", weight = 0.0 },
	["celular"] = { index = "celular", name = "Celular", type = "use", weight = 1.0 },
	["mochilap"] = { index = "mochilap", name = "Mochila Pequena", type = "use", weight = 1.0 },
	["mochilam"] = { index = "mochilam", name = "Mochila Média", type = "use", weight = 1.0 },
	["mochilag"] = { index = "mochilag", name = "Mochila Grande", type = "use", weight = 1.0 },
	["mochilax"] = { index = "mochilax", name = "Mochila Extra Grande", type = "use", weight = 1.0 },
	["radio"] = { index = "radio", name = "Rádio", type = "use", weight = 1.0 },
	["colete"] = { index = "colete", name = "Colete", type = "use", weight = 5.0 },
	["bandagem"] = { index = "bandagem", name = "Bandagem", type = "use", weight = 0.5 },
	["energetico"] = { index = "energetico", name = "Energético", type = "use", weight = 0.5 },
	["pneus"] = { index = "pneus", name = "Pneus", type = "use", weight = 2.0 },
	["cordas"] = { index = "cordas", name = "Cordas", type = "use", weight = 1.5 },
	-- Pesca --
	["isca"] = { index = "isca", name = "Isca", type = "use", weight = 0.3 },
	["lambari"] = { index = "lambari", name = "Lambari", type = "use", weight = 0.6	},
	["pirarucu"] = { index = "pirarucu", name = "Pirarucu", type = "use", weight = 0.4 },
	["corvina"] = { index = "corvina", name = "Corvina", type = "use", weight = 0.5 },
	-- Lenhador --
	["tora"] = { index = "tora", name = "Tora de Madeira", type = "use", weight = 0.5 },

	--=== Ilegal ===--

	-- Utilitários --
	["placa"] = { index = "placa", name = "Placa", type = "use", weight = 5.0 },
	["lockpick"] = { index = "lockpick", name = "Lockpick", type = "use", weight = 5.0 },
	["algemas"] = { index = "algemas", name = "Algemas", type = "use", weight = 0.75 },
	["capuz"] = { index = "capuz", name = "Capuz", type = "use", weight = 1.5 },
	["c4"] = { index = "c4", name = "C4", type = "use", weight = 3.0 },
	-- Maconha --
	["maconha"] = { index = "maconha", name = "Maconha", type = "use", weight = 0.3 },
	["fertilizante"] = { index = "fertilizante", name = "Fertilizante", type = "use", weight = 0.3 },
	["adubo"] = { index = "adubo", name = "Adubo", type = "use", weight = 0.3 },
	-- Cocaina --
	["cocaina"] = { index = "cocaina", name = "Cocaina", type = "use", weight = 0.2 },
	["pasta"] = { index = "cocaina", name = "Cocaina", type = "use", weight = 0.2 },
	["folha"] = { index = "cocaina", name = "Cocaina", type = "use", weight = 0.2 },
	-- Metanfetamina --
	["metanfetamina"] = { index = "metanfetamina", name = "Metanfetamina", type = "use", weight = 0.4 },
	["dietilamina"] = { index = "dietilamina", name = "Dietilamina", type = "use", weight = 0.4 },
	["fungo"] = { index = "fungo", name = "Fungo", type = "use", weight = 0.4 },
	-- Armamentos --
	["armacao"] = { index = "armacao", name = "Armação", type = "use", weight = 0.01 },
	["aluminio"] = { index = "aluminio", name = "Alumínio", type = "use", weight = 0.01 },
	["cobre"] = { index = "cobre", name = "Cobre", type = "use", weight = 0.01 },
	
	--=== Armas ===--

	["WEAPON_KNIFE"] = { index = "knife", name = "Faca", type = "equip", weight = 0.50 },
	["WEAPON_HATCHET"] = { index = "hatchet", name = "Machado", type = "equip", weight = 0.75 },
	["WEAPON_BAT"] = { index = "bat", name = "Bastão de Beisebol", type = "equip", weight = 0.75 },
	["WEAPON_BATTLEAXE"] = { index = "battleaxe", name = "Machado de Batalha", type = "equip", weight = 0.75 },
	["WEAPON_BOTTLE"] = { index = "bottle", name = "Garrafa", type = "equip", weight = 0.75 },
	["WEAPON_CROWBAR"] = { index = "crowbar", name = "Pé de Cabra", type = "equip", weight = 0.75 },
	["WEAPON_DAGGER"] = { index = "dagger", name = "Adaga", type = "equip", weight = 0.50 },
	["WEAPON_GOLFCLUB"] = { index = "golfclub", name = "Taco de Golf", type = "equip", weight = 0.75 },
	["WEAPON_HAMMER"] = { index = "hammer", name = "Martelo", type = "equip", weight = 0.75 },
	["WEAPON_MACHETE"] = { index = "machete", name = "Facão", type = "equip", weight = 0.75 },
	["WEAPON_POOLCUE"] = { index = "poolcue", name = "Taco de Sinuca", type = "equip", weight = 0.75 },
	["WEAPON_STONE_HATCHET"] = { index = "stonehatchet", name = "Machado de Pedra", type = "equip", weight = 0.75 },
	["WEAPON_SWITCHBLADE"] = { index = "switchblade", name = "Canivete", type = "equip", weight = 0.50 },
	["WEAPON_WRENCH"] = { index = "wrench", name = "Chave Inglesa", type = "equip", weight = 0.75 },
	["WEAPON_KNUCKLE"] = { index = "knuckle", name = "Soco Inglês", type = "equip", weight = 0.50 },
	["WEAPON_FLASHLIGHT"] = { index = "flashlight", name = "Lanterna", type = "equip", weight = 0.50 },
	["WEAPON_NIGHTSTICK"] = { index = "nightstick", name = "Cassetete", type = "equip", weight = 0.75 },
	["WEAPON_PISTOL"] = { index = "m1911", name = "M1911", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.25 },
	["WEAPON_PISTOL_MK2"] = { index = "fiveseven", name = "FN Five Seven", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
	["WEAPON_COMPACTRIFLE"] = { index = "akcompact", name = "AK Compact", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 2.25 },
	--["WEAPON_APPISTOL"] = { index = "kochvp9", name = "Koch Vp9", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.25 },
	["WEAPON_HEAVYPISTOL"] = { index = "atifx45", name = "Ati FX45", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
	["WEAPON_MACHINEPISTOL"] = { index = "tec9", name = "Tec-9", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 1.75 },
--	["WEAPON_MICROSMG"] = { index = "uzi", name = "Uzi", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 1.25 },
	--["WEAPON_MINISMG"] = { index = "skorpionv61", name = "Skorpion V61", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 1.75 },
	["WEAPON_SNSPISTOL"] = { index = "amt380", name = "AMT 380", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_SNSPISTOL_MK2"] = { index = "hkp7m10", name = "HK P7M10", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_VINTAGEPISTOL"] = { index = "m1922", name = "M1922", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_PISTOL50"] = { index = "desert", name = "Desert Eagle", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
--	["WEAPON_REVOLVER"] = { index = "magnum", name = "Magnum 44", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
	["WEAPON_COMBATPISTOL"] = { index = "glock", name = "Glock", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_CARBINERIFLE"] = { index = "m4a1", name = "M4A1", type = "equip", ammo = "WEAPON_RIFLE_AMMO", weight = 8.0 },
	--["WEAPON_PUMPSHOTGUN"] = { index = "remington", name = "Remington", type = "equip", ammo = "WEAPON_SHOTGUN_AMMO", weight = 6.0 },
	--["WEAPON_SAWNOFFSHOTGUN"] = { index = "mossberg590", name = "Mossberg 590", type = "equip", ammo = "WEAPON_SHOTGUN_AMMO", weight = 6.0 },
	["WEAPON_SMG"] = { index = "mp5", name = "MP5", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 4.0 },
	["WEAPON_ASSAULTRIFLE"] = { index = "ak103", name = "AK-103", type = "equip", ammo = "WEAPON_RIFLE_AMMO", weight = 8.0 },
	--["WEAPON_ASSAULTRIFLE_MK2"] = { index = "ak74", name = "AK-74", type = "equip", ammo = "WEAPON_RIFLE_AMMO", weight = 8.0 },
	["WEAPON_ASSAULTSMG"] = { index = "mtar21", name = "MTAR-21", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 5.0 },
	--["WEAPON_GUSENBERG"] = { index = "thompson", name = "Thompson", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 6.0 },
	["WEAPON_PETROLCAN"] = { index = "gallon", name = "Galão", type = "equip", ammo = "WEAPON_PETROLCAN_AMMO", weight = 1.25 },
	["GADGET_PARACHUTE"] = { index = "parachute", name = "Paraquedas", type = "use", weight = 2.25 },
	["WEAPON_STUNGUN"] = { index = "stungun", name = "Tazer", type = "equip", weight = 0.75 },
	["WEAPON_FIREEXTINGUISHER"] = { index = "extinguisher", name = "Extintor", type = "equip", weight = 2.25 },

	--=== Munições ===--

	["WEAPON_PISTOL_AMMO"] = { index = "pistolammo", name = "M. Pistola", type = "recharge", weight = 0.02 },
	["WEAPON_SMG_AMMO"] = { index = "smgammo", name = "M. Sub Metralhadora", type = "recharge", weight = 0.03 },
	["WEAPON_RIFLE_AMMO"] = { index = "rifleammo", name = "M. Rifle", type = "recharge", weight = 0.04 },
	--["WEAPON_SHOTGUN_AMMO"] = { index = "shotgunammo", name = "M. Escopeta", type = "recharge", weight = 0.05 },
	["WEAPON_PETROLCAN_AMMO"] = { index = "fuel", name = "Combustível", type = "recharge", weight = 0.001 }
}

RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] and args[2] and itemlist[args[1]] ~= nil then
			vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))
			TriggerClientEvent("Notify", source, "sucesso", "Você pegou".." " ..args[2].." item:".. " "..args[1])
		else
			TriggerClientEvent("Notify", source, "aviso", "o item digitador não foi encontrador")
			--SendWebhookMessage(item,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU]: "..args[1].." \n[QUANTIDADE]: "..vRP.format(parseInt(args[2])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KILL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kill',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.setHealth(nplayer,0)
				TriggerClientEvent("Notify", source, "sucesso", "Você matou o ID: "..parseInt(args[1]))
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(weblogkill,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MATOU ID:]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		else
			vRPclient.setHealth(source,0)
			vRPclient.setArmour2(source,0)
			TriggerClientEvent("Notify", source, "sucesso", "Você se matou")
			local identity = vRP.getUserIdentity(user_id)
			SendWebhookMessage(weblogkill,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MATOU ID:]: "..source.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)

RegisterCommand('rbgcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"manager.permissao") then
        TriggerClientEvent('rbgcar',source)
        TriggerClientEvent("Notify",source,"sucesso","Você tunou o <b>veículo</b> RGB com sucesso.")
    end
end)
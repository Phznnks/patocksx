local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

cas = {}
Tunnel.bindInterface("wnEmpresas",cas)
vCLIENT = Tunnel.getInterface("wnEmpresas")

local cassino = false
local timedown = 0


-- COOLDOWN COFRES --

function cas.checarTempo()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if (os.time()-timedown) <= 1800 then
			TriggerClientEvent('Notify',source,"Aviso","Os cofres estão vazios, aguarde <b>"..vRP.format(parseInt((1800-(os.time()-timedown)))).." segundos</b> até que os civis apostem novamente.",8000)
			return false
		end
	end
	return true
end

-- PEGAR O DINHEIRO --

function cas.pegarDinheiro(Nome,Log,Min,Max)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		local ganhos = math.random(100)
		timedown = os.time()
		vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)	
		TriggerClientEvent("progress",source,10000,"Pegando Dinheiro")
		local randmoney = math.random(Min,Max)
		Wait(10000)
		vRP.giveMoney(user_id,parseInt(randmoney))
		vRPclient._stopAnim(source,false)
		TriggerClientEvent('Notify',source,"Sucesso","Você recebeu $"..randmoney.." de <b>Dinheiro</b> do Cofre.",8000)
			PerformHttpRequest(Log, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{     ------------------------------------------------------------
						title = " "..Nome.."	\n⠀",
						thumbnail = {
							url = "https://cdn.discordapp.com/attachments/913250396363972649/913250479973232751/Gamboz_Logo_2048x2048.png"
						}, 
						fields = {
							{ 
								name = "``Player``",
								value = "Nome: "..identity.name.." "..identity.firstname.."\nID: "..user_id.."\n"
							},
							{ 
								name = "``Valor``",
								value = ""..randmoney.." $\n"
							}
						}, 
						footer = { 
							text = "Data e hora: " ..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = "https://www.autoriafacil.com/wp-content/uploads/2019/01/icone-data-hora.png"
						},
						color = 15844367
					}
				}
			}), { ['Content-Type'] = 'application/json' })
	end
end

-- CHECAR PERMISSÃO --

function cas.checarPermissao(Permissao)
	local source = source
	local user_id = vRP.getUserId(source)
	return (vRP.hasPermission(user_id,Permissao))
end
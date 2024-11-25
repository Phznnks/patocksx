-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_taskbar",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local chance = 0
local skillGap = 0
local activeTasks = 0
local taskInProcess = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENGUI
-----------------------------------------------------------------------------------------------------------------------------------------
function openGui(sentLength,taskID,chancesent,skillGapSent)
	SetNuiFocus(true,false)
	SendNUIMessage({ runProgress = true, Length = sentLength, Task = taskID, chance = chancesent, skillGap = skillGapSent })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEGUI
-----------------------------------------------------------------------------------------------------------------------------------------
function updateGui(sentLength,taskID,chancesent,skillGapSent)
	SendNUIMessage({ runUpdate = true, Length = sentLength, Task = taskID, chance = chancesent, skillGap = skillGapSent })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSEGUI
-----------------------------------------------------------------------------------------------------------------------------------------
function closeGui()
	SetNuiFocus(false,false)
	SendNUIMessage({ closeProgress = true })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSENORMALGUI
-----------------------------------------------------------------------------------------------------------------------------------------
function closeNormalGui()
	SetNuiFocus(false,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TASKEND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("taskEnd",function(data,cb)
	closeNormalGui()
	if (tonumber(data.taskResult) > chance) and tonumber(data.taskResult) < (chance + skillGap + 3) then
		activeTasks = 3
	else
		activeTasks = 2
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TASKBAR
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.taskBar(difficulty,skillGapSent)
	Citizen.Wait(100)

	skillGap = skillGapSent

	if skillGap < 5 then
		skillGap = 5
	end

	if taskInProcess then
		return false
	end

	chance = math.random(20,80)

	local length = math.ceil(difficulty*1.0)

	taskInProcess = true
	local taskIdentifier = "taskid"..math.random(1000000)
	openGui(length,taskIdentifier,chance,skillGap)
	activeTasks = 1

	local maxcount = GetGameTimer() + length

	while activeTasks == 1 do
		Citizen.Wait(1)
		local curTime = GetGameTimer()
		if curTime > maxcount then
			activeTasks = 2
		end
		local updater = 100 - (((maxcount - curTime)/length)*100)
		updater = math.min(76,updater)
		updateGui(updater,taskIdentifier,chance,skillGap)
	end

	closeGui()
	taskInProcess = false

	if activeTasks == 2 then
		return false
	else
		return true
	end
end

RegisterCommand("teste1")
    vTASKBAR.taskLockpick(source)
end
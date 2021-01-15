dofile("scripts/forts.lua")

function Load(gameStart)
	Log("Load")
    -- call the MyDelayedFunc function with parameter 'myParam' in 5 seconds time
    -- the function can be one of the built-in script functions or defined by the script
    --ScheduleCall(1, checkNodes)
	
	--Init EvoForts
	initEvo()
	--ScheduleCall(5, restart)
	
	
end

function Update(frame)
    -- Update
	--Log(tostring(frame))
	step(frame)
end

function mCreateNode()
	
	
	local teamId = 2
	local materialSaveName = "bracing"
	local linkedNodeIdA = 0
	local dest = Vec3(10.0, 10.0)
	
	local existingNode = SnapToNode(dest, teamId, 20)

	result = CreateNode(teamId,  materialSaveName, existingNode, dest)
	Log(result)
end



function test()
	Log("test")
	
	local dest = Vec3(-4000.0,550.0)
	local buildDest = Vec3(-4000.0,700)
	local colorR = Colour(255,0,0)
	local colorB = Colour(0,0,255)
	
	local id = GetClosestFoundationNodeId(1, dest)
	
	
	
	local vecB = NodePosition(id)
	
	
	
	
	
	SpawnCircle(vecB, 50.0, colorR, 1000.0)
	SpawnCircle(dest, 50.0, colorB, 1000.0)
	
	
	local result = CreateNode(1, "bracing", id, buildDest)
	DestroyStructure(result) 
	
	
end

function checkNodes()
	local colorB = Colour(0,0,255)

	
	
	
	
	for i=250,275 do 
		res = NodeExists(i)
		--Log(tostring(i) .. tostring(res))
		local vec = NodePosition(i)
		
		
	
		if 2 == 2 then
			SpawnCircle(vec, 50.0, colorB, 1000.0)
		end 
	
		end
	
end




--create and initializes global data structures
--Buildorderfileformat 
--<frame> cn <parentIndex> <vecX> <vecY> : eCreateNode
--<frame> bn <indexA> <indexB>
--<frame> bc <type> <pos> 
--<frame> shoot <cannonid> <angle>



--botId 0: left, 1: right

--example: order = {"10", "cn", "273", "0.0", "-100.0", "bracing",
--	"100", "bn", "274", "317", "armour"}


function initEvo()
	eip = 1 --instruction pointer
	
	botId = 2
	
	
	local colorB = Colour(0,0,255)
	local colorR = Colour(255,0,0)
	
--InsOrderStr
	
	
	
	
	
	
	
	

end



--Executes a build order step (step just gets executed once frame is met)

function step(frame)

	if tonumber(order[eip]) == tonumber(frame) then
		execOrder()
	end

end

function eCreateNode(aBotId, aMaterial, aNodeId,aX,aY) -- aX,Ay relative pos of new node to aNodeId-node
	Log("createNode")
	
	
	if NodeExists(tonumber(order[eip+1])) == false then return -1 end
	if NodeTeam(tonumber(order[eip+1])) ~= aBotId then return -1 end
	

	Log(aBotId .. " " .. aMaterial .. " " .. aNodeId .. " " .. aX .. " " .. aY)
	
	pos = NodePosition(tonumber(aNodeId))
	CreateNode(aBotId, aMaterial, tonumber(aNodeId), Vec3(tonumber(aX)+pos.x,tonumber(aY)+pos.y))


end

function eConnectNodes(aBotId,aMaterial,nodeAind, nodeBind)
	Log("Connect")
	if NodeExists(tonumber(order[eip+1])) == false then return -1 end
	if NodeExists(tonumber(order[eip+2])) == false then return -1 end

	Log(aBotId .. " " .. aMaterial .. " " .. nodeAind .. " " .. nodeBind)
	res = CreateLink(aBotId, aMaterial,tonumber(nodeAind), tonumber(nodeBind))
	
	return res
end

function execOrder()
	eip=eip+1
	Log("ExecOrder")
	if order[eip] == "cn" then
		eCreateNode(botId,order[eip+4],order[eip+1],order[eip+2],order[eip+3])
		eip=eip+5
		return 1
	end
	
	Log(order[eip])
	if order[eip] == "bn" then
		eConnectNodes(botId,order[eip+3],order[eip+1], order[eip+2])
		eip=eip+4
		return 1
	end


end


function restart()
	nextMap = "maps/Abyss/Abyss.fwe"
	Exit(1.0, nextMap)
end

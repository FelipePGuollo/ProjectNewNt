eventsId = {}

local function reddamage(cid)
    local player = Player(cid)	
	-----------------------------------------
    local tile = Tile(player:getPosition())
    if not tile then
        return false
    end
	
	local tile = tile:getItemById(26383)
	if tile and Tile(player:getPosition()) then
	player:getPosition():sendMagicEffect(187)
		player:setStorageValue(58344, os.time() + 1)
    eventsId[cid] = addEvent(reddamage, 1 * 900, cid)
	end
	end
	------------------------------------------------
function onStepIn(creature, item, position, fromPosition)
    if creature:isPlayer() then
        local cid = creature:getId()
        eventsId[cid] = addEvent(reddamage, 1 * 900, cid)
    end

    return true
end

function onStepOut(creature, item, pos, fromPosition)
    if creature:isPlayer() then
        local cid = creature:getId()
        stopEvent(eventsId[cid])
        eventsId[cid] = nil
    end

    return true
end
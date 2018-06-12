local function scanContainer(cid, position)
    local player = Player(cid)
    if not player then
        return
    end

    local corpse = Tile(position):getTopDownItem()
    if not corpse then
        return
    end

    if corpse:getType():isCorpse() then
		corpse:setActionId(49000)
    end
end

function onKill(player, target)
    if not target:isMonster() then
        return true
    end

    addEvent(scanContainer, 100, player:getId(), target:getPosition())
    return true
end
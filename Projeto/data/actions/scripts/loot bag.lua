function onUse(player, item)
    local x = item:getItemHoldingCount()
	if x ~= 0 then
	player:getPosition():sendMagicEffect(30)
	else
	item:remove()
	addEvent(function()
    player:sendCancelMessage("Sorry the loot bag is empty")
	end, 10)
	end
    return false
end
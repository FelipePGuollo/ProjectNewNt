function onThink(interval, lastExecution)
if player then
    local accountName2 = getCreatureName(player)
	local accountName = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountName2 .. "' LIMIT 1;")
	local accountName3 = result.getDataInt(accountName, "account_id")
	local accountPoints = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accountName3 .. "' LIMIT 1;")
	local points_op = result.getDataInt(accountPoints, "premium_points")
    player:sendExtendedOpcode(52, points_op) 
    return true
end
end
function onExtendedOpcode(player, opcode, buffer)
    local nameplayer = getCreatureName(player)
		function getpointsopcode(player)
				local accountNameopcode = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. nameplayer .. "' LIMIT 1;")
				local accidopcode = result.getDataInt(accountNameopcode, "account_id")
				local selectpointsopcode = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accidopcode .. "' LIMIT 1;")
				local pointsopcode = result.getDataInt(selectpointsopcode, "premium_points")
				player:sendExtendedOpcode(52, pointsopcode)				
				return pointsopcode
		end
getpointsopcode(player)
end
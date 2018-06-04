		function getidaccount(name)
	local accountName2 = name
	local accountName = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountName2 .. "' LIMIT 1;")
	local accidplayer = result.getDataInt(accountName, "account_id")
		return accidplayer
	end
		
		function gettotalpoints(player)
	local accountPoints = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accidplayer .. "' LIMIT 1;")
	local points = result.getDataInt(accountPoints, "premium_points")
	local pointscomparestring = result.getDataString(accountPoints, "premium_points")
		return points				
		end
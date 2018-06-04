				function getidaccount(name)
	local accountName2 = name
	local accountName = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountName2 .. "' LIMIT 1;")
	local accidplayer = result.getDataInt(accountName, "account_id")
		return accidplayer
	end
	
		function getidtarget(player)
				local accountName2 = split[1]
				local accountName = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountName2 .. "' LIMIT 1;")
				local accountName3 = result.getDataInt(accountName, "account_id")
				local accountPoints = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accountName3 .. "' LIMIT 1;")
				local pointstarget = result.getDataInt(accountPoints, "premium_points")
				local accidtarget = accountName3	
				local pointstargetf = pointstarget + split[2]				
		end
		
	
				function gettotalpoints(player)
	local accountPoints = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accidplayer .. "' LIMIT 1;")
	local points = result.getDataInt(accountPoints, "premium_points")
	local pointscomparestring = result.getDataString(accountPoints, "premium_points")
		return points				
		end
		
		function pointsrestantes(player)
				local pointstransfer = ((gettotalpoints(player)) - (paramet))
				return pointstransfer
		end
		
		function querystransfer(player)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ''..split[1]..' recebeu '.. pointstransfer ..' bd.')	
		end			
			
			function onSay(player, words, param)
			local split = param:split(",") 
			local name = getCreatureName(player)
			local namelower = string.lower(name)
			local paramet = tonumber(split[2])
						if split[1] == name or split[1] == namelower then
			player:sendCancelMessage("Error.")
			return true
			end
			if paramet <= 0 then
			player:sendCancelMessage("Error.")
			return true
			end
			if split[1] == nil or split[2] == nil then
					player:sendCancelMessage("Insufficient parameters.")
			return true
			end
			getidtarget(player)
			gettotalpoints(player)
			getidaccount(player)
			local pointstransfer2 = pointsrestantes(player)
			if pointsplayer < paramet then
			player:sendCancelMessage("Not enough coins.")
			return true
			end
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ''..split[1]..' recebeu '.. pointstransfer ..' Points.')
					player:sendExtendedOpcode(52, pointstransfer)						
		
			end
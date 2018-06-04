				function getidtarget(player)
				local accountNametarget2 = splittransfer[1]
				local accountNametarget = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountNametarget2 .. "' LIMIT 1;")
				local accountNametarget3 = result.getDataInt(accountNametarget, "account_id")
				local accountPointstarget = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accountNametarget3 .. "' LIMIT 1;")
				pointstarget = result.getDataInt(accountPointstarget, "premium_points")
				accidtargettransfer = accountNametarget3	
				local pointstargetf = pointstarget + splittransfer[2]				
				end
				
				function getidaccounttransfer(name)
				local accountNamePai = name
				local accountName = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountNamePai .. "' LIMIT 1;")
				accidplayertransfer = result.getDataInt(accountName, "account_id")
				return accidplayer
				end
				
				function gettotalpoints(player)
				local accountPoints = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accidplayertransfer .. "' LIMIT 1;")
				local points = result.getDataInt(accountPoints, "premium_points")
				pointscomparestringtarget = result.getDataString(accountPoints, "premium_points")
				return points				
				end
				
				function calcularpontosrestantestarget(pontos)
				local pontosrestantestarget = (pointstarget + paramettarget)
				return pontosrestantestarget
				end
				
				function calcularpontosrestantes(pontos)
				local pontosrestantes = (pointsplayernow - paramettarget)
				return pontosrestantes
				end
								
				function onSay(player, words, param)
				splittransfer = param:split(",") 
										if splittransfer[1] == nil or splittransfer[2] == nil then
										player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Error.')
						return
						end
				local name = getCreatureName(player)
				local namelower = string.lower(name)
				local paramet = tonumber(splittransfer[2])
				paramettarget = tonumber(splittransfer[2])
				getidaccounttransfer(name)
				gettotalpoints(player)
				getidtarget(player)
						if splittransfer[1] == name or splittransfer[1] == namelower then
										player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Error.')
						return
						end
				if paramet <= 0 then
										player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Error.')
				return
				end
				pointsplayernow = gettotalpoints(player)		
				if pointsplayernow < paramet then
				player:sendCancelMessage("Not enough coins.")
				return
				end
				pontossendtarget = calcularpontosrestantestarget(pontos)
				pontossendplayer = calcularpontosrestantes(pontos)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ''..splittransfer[1]..' recebeu '.. paramet ..' Points.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ''..pontossendtarget..' recebeu '.. pontossendplayer ..' Points.')
								db.asyncQuery('UPDATE `accounts` SET `premium_points` = '..pontossendplayer..'  WHERE id = ' .. accidplayertransfer)
												db.asyncQuery('UPDATE `accounts` SET `premium_points` = '..pontossendtarget..'  WHERE id = ' .. accidtargettransfer)
																player:sendExtendedOpcode(52, pontossendplayer)	
					f = io.open("data/logs/Pontos.txt", "a+")
					f:write("Player: "..name.." transferiu "..paramet.." pontos para "..splittransfer[1].."\n\n----------------------------------------------------------\n")
					f:close()				
					end
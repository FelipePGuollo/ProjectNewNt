		local config =
{
["1"] =
{id="1", price="250", name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
{id="2", price="450", name="Premium Days", itemid=8300, count=60, pa=true, mount= false},
{id="8", price="650", name="Premium Days", itemid=26382, count=90, pa=true, mount= false},
["2"] =
{price="250", name="teste", itemid=25383, id="2.1", count=1, pa=false, mount= false},
{price="250", name="teste3", itemid=25384, id="2.2", count=1, pa=false, mount= false},
["3"] =
{price="250", name="teste3", itemid=25384, id="3.1", count=1, pa=false, mount= false},
{price="250", name="teste3", itemid=25384, id="3.2", count=1, pa=false, mount= false},
}
		function getidaccountshop(player)
			    local accountName2 = getCreatureName(player)
				local accountName = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountName2 .. "' LIMIT 1;")
				local accidplayer = result.getDataInt(accountName, "account_id")
				accidplayershop = result.getDataInt(accountName, "account_id")
				local accountPoints = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accidplayer .. "' LIMIT 1;")
				local points = result.getDataInt(accountPoints, "premium_points")	
				pointsplayershop = points
				return pointsplayershop
		end
		
				function querysshop(player)
				local pointsrestant = (pointsplayershop - pricepointsshop)
				local pointsrestant2 = tonumber(pointsrestant)
				--db.asyncQuery('UPDATE `accounts` SET `premium_points` = '..pointsrestant2..'  WHERE id = ' .. accidplayershop)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You buy a '..pointsrestant2..' thanks for helping the server.')
				end
				
	function onSay(player, words, param)
		local split = param:split(",") 
		local points = getidaccountshop(player)
		for i, x in pairs (config) do
						pricepointsshop= tonumber(x.price)
		if split[2] == x.id and (x.pa == false) then
				if pointsplayershop < pricepointsshop then
							player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Enough Coins')
				return
				end
								local namesave = getCreatureName(player)
				f = io.open("data/logs/Shop.txt", "a+")
				f:write("Player: "..namesave.." Comprou no Market "..x.count.." "..x.name.."\n\n----------------------------------------------------------\n")
				f:close()
			local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
			local parcel = inbox:addItem(2596, 1)
			local packagename = ''..x.count..'x '.. x.name ..' package.'
						player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You buy a '..x.name..' check your mailbox.')
			parcel:setAttribute(ITEM_ATTRIBUTE_NAME, packagename)
			local w = 0
								while w ~= x.count do
			parcel:addItem(x.itemid)
			w = w + 1
			end
			elseif split[2] == x.id and (x.pa == true) then 
			if pointsplayershop < pricepointsshop then
										player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Error')
			return
			end
			--db.asyncQuery("UPDATE `accounts` SET `premdays` = `premdays` + ".. x.count .." WHERE id = " .. accidplayershop .. ";")
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You buy a '..x.count..' '..x.name..' thanks for helping the server.')
						player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You buy a '..x.count..' '..x.name..' thanks for helping the server.')
			end					
end
			querysshop(player)
end
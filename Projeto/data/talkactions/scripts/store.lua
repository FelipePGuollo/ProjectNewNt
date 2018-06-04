local type1 = {
["1"] = {price=250, name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["2"] = {price=350, name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["3"] = {price=450, name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["4"] = {price=550, name="Premium Days", itemid=26382, count=30, pa=true, mount= false}}

local type2 = {
["1"] = {price="1250", name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["2"] = {price="1350", name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["3"] = {price="1450", name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["4"] = {price="1550", name="Premium Days", itemid=26382, count=30, pa=true, mount= false}}

local type3 = {
["1"] = {price="3", name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["2"] = {price="3", name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["3"] = {price="3", name="Premium Days", itemid=26382, count=30, pa=true, mount= false},
["4"] = {price="3", name="Premium Days", itemid=26382, count=30, pa=true, mount= false}}

		function getidaccountshop(accid)
				local accountName = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = '" .. accountnameshop .. "' LIMIT 1;")
				accidplayershop = result.getDataInt(accountName, "account_id")
				local accountPoints = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = '" .. accidplayershop .. "' LIMIT 1;")
				pointsplayershop = result.getDataInt(accountPoints, "premium_points")				
				return accid
		end
		
	function onSay(player, words, param)
	accountnameshop = getCreatureName(player)
	getidaccountshop(accid)
	local split = param:split(",")
	if split[1] == nil or split [2] == nil then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Error')
	return
	end
	if split[1] == "1" then
			for i,n in pairs(type1) do
		if split[2] == i and pointsplayershop >= n.price then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'id , '..i..' preco ' ..n.price)
		db.asyncQuery("UPDATE `accounts` SET `premium_points` = `premium_points` - ".. n.price .." WHERE id = " .. accidplayershop .. "  LIMIT 1;")
																				player:sendExtendedOpcode(52, pointsplayershop)	
			end
		end
		elseif split[1] == "2" then
			for i,n in pairs(type2) do
		if split[2] == i then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'id , '..i..' preco ' ..n.price)
			end
		end
		elseif split[1] == "3" then
			for i,n in pairs(type3) do
		if split[2] == i then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'id , '..i..' preco ' ..n.price)
			end
		end
		end
end
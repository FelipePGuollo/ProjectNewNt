local config = {
tempo = 20;
tempopremium = 10
}
	function onSay(player, words, param)

local petmasterid = player:getGuid()
local exhausted = math.ceil((player:getStorageValue(960031)-os.time())/60)
local queryPet = db.storeQuery("SELECT * FROM `pet_loot` WHERE `player_id` = '" .. petmasterid .. "' and pet_itemid != 0")
--UPDATE `pet_loot` SET `player_id`=player_id,`pet_itemid`=0,`pet_count`=0 WHERE `player_id` = 13 and `pet_itemid` = 4 and `id` = pet_id LIMIT 1;
	if queryPet ~= false then
		if player:getStorageValue(960031) >= os.time() then
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Whait: ' ..exhausted..' Minutes')
		return
	end
	repeat
		local pet_id, petitem_id, petitem_count = result.getNumber(queryPet, 'id'),result.getNumber(queryPet, 'pet_itemid'), result.getNumber(queryPet, 'pet_count')
		player:getInbox():addItem(petitem_id, petitem_count, INDEX_WHEREEVER, FLAG_NOLIMIT)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ''.. petmasterid ..' << do WebShop em seu depot.') 
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ''.. pet_id ..' << do WebShop em seu depot.') 
		db.asyncQuery('UPDATE `pet_loot` SET `player_id`= player_id ,`pet_itemid`=0,`pet_count`=0 WHERE `player_id` = ' .. petmasterid .. ' and `id` = '.. pet_id .. ' LIMIT 1;')
	until not result.next(queryPet)
	result.free(queryPet)
		if not player:isPremium() then
		player:setStorageValue(960031, os.time() + (config.tempo*60))
		--db.asyncQuery('INSERT INTO `pet_loot`(`player_id`, `pet_itemid`, `pet_count`) VALUES ('..petmasterid..',12649,0)')
				else
		player:setStorageValue(960031, os.time() + (config.tempopremium*60))
		end
		else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You Dont have anything item in u pet.')
	end
	end
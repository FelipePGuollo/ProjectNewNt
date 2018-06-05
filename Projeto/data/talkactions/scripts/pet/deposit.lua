local config = {
tempo = 20;
tempopremium = 1
}
	function onSay(player, words, param)

local petmasterid = player:getGuid()
local exhausted = math.ceil((player:getStorageValue(960031)-os.time())/60)
local queryPet = db.storeQuery("SELECT * FROM `pet_loot` WHERE `player_id` = '" .. petmasterid .. "' and pet_itemid != 0 LIMIT 1;")
	if queryPet ~= false then
		if player:getStorageValue(960031) >= os.time() then
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Whait: ' ..exhausted..' Minutes')
		return
	end
	repeat
		local pet_id, petitem_id, petitem_count = result.getNumber(queryPet, 'id'),result.getNumber(queryPet, 'pet_itemid'), result.getDataInt(queryPet, 'pet_count')
		local i, new_container = 0, player:getInbox():addItem(26377, 1, false, INDEX_WHEREEVER, FLAG_NOLIMIT)
		local x = 0
		local v = 0
		if petitem_count > 100 and petitem_count < 1000 and ItemType(petitem_id):isStackable() then
		x = petitem_count/10
		v = 10
		elseif not ItemType(petitem_id):isStackable() and petitem_count > 1 then
		v = petitem_count
		x = 1
		elseif petitem_count < 100 and ItemType(petitem_id):isStackable() then
		v = 1
		x = petitem_count
		end
					while i ~= v do
						new_container:addItem(petitem_id, x, INDEX_WHEREEVER, FLAG_NOLIMIT)
						i = i + 1
					end 
		--db.asyncQuery('UPDATE `pet_loot` SET `player_id`= player_id ,`pet_itemid`=0,`pet_count`=0 WHERE `player_id` = ' .. petmasterid .. ' and `id` = '.. pet_id .. ' LIMIT 1;')
		db.asyncQuery('DELETE FROM `pet_loot` WHERE `player_id` = '..petmasterid..' and `id` = '..pet_id..' and `pet_itemid` = '..petitem_id..' LIMIT 1;')	
		until not result.next(queryPet)
		result.free(queryPet)
		if not player:isPremium() then
		player:setStorageValue(960031, os.time() + (config.tempo*60))
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'The Items is in your Mail BOX ')
				else
		player:setStorageValue(960031, os.time() + (config.tempopremium*60))
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'The Items is in your Mail BOX ')
		end
		else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You Dont have anything item in u pet.')
	end
	end
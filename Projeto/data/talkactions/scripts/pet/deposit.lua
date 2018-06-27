local config = {
tempo = 20;
tempopremium = 10
}
	function onSay(player, words, param)
	local summon = player:getSummons()

local petmasterid = player:getGuid()
local exhausted = math.ceil((player:getStorageValue(960031)-os.time())/60)
local queryPet = db.storeQuery('SELECT * FROM `pet_loot` WHERE `player_id` = '.. petmasterid)
	if queryPet ~= false then
		if player:getStorageValue(960031) >= os.time() then
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Whait: ' ..exhausted..' Minutes')
		return
	end
	local new_container = player:getInbox():addItem(26377, 1, false, INDEX_WHEREEVER, FLAG_NOLIMIT)
	repeat
		local i = 0
		local pet_id, petitem_id, petitem_count = result.getNumber(queryPet, 'id'),result.getNumber(queryPet, 'pet_itemid'), result.getDataInt(queryPet, 'pet_count')
		local addrest = 0
		local finishedrest = 1
		local x = 0
		local v = 0
		local p = true
		if petitem_count > 100 and petitem_count < 1000 and ItemType(petitem_id):isStackable() then
		local w = string.sub(petitem_count, -2)
		x = petitem_count/10
		v = 10
		elseif not ItemType(petitem_id):isStackable() and petitem_count > 0 then
		v = petitem_count
		x = 1
		p = false
		elseif petitem_count < 100 and ItemType(petitem_id):isStackable() then
		v = 1
		x = petitem_count
		p = false
		end
					while i ~= v do
						new_container:addItem(petitem_id, x, INDEX_WHEREEVER, FLAG_NOLIMIT)
						i = i + 1
						end 
					
							if ItemType(petitem_id):isStackable() and p == true then
							new_container:addItem(petitem_id, w, INDEX_WHEREEVER, FLAG_NOLIMIT)	
							end
					
		db.asyncQuery('DELETE FROM `pet_loot` WHERE `player_id` = '..petmasterid..' and `id` = '..pet_id..' and `pet_itemid` = '..petitem_id..' LIMIT 1;')	
		until not result.next(queryPet)
		result.free(queryPet)
				local storagex = player:getStorageValue(94433)
		if not player:isPremium() then
		player:setStorageValue(960031, os.time() + (config.tempo*60))
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'The Items is in your Mail BOX ')
				summon[1]:remove()
		player:setStorageValue(94433, player:getStorageValue(94433)-storagex)
				else
		player:setStorageValue(960031, os.time() + (config.tempopremium*60))
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'The Items is in your Mail BOX ')
				summon[1]:remove()
		player:setStorageValue(94433, player:getStorageValue(94433)-storagex)
		end
		else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You Dont have anything item in u pet.')
	end
	end
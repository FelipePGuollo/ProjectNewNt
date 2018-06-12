function onSay(player, words, param)
    local split = param:split(",")

    local action = split[1]
    if action == "add" then
        local item = split[2]:gsub("%s+", "", 1)
        local itemType = ItemType(item)
        if itemType:getId() == 0 then
            itemType = ItemType(tonumber(item))
            if itemType:getId() == 0 then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "There is no item with that id or name.")
                return false
            end
        end

		
        local itemName = tonumber(split[2]) and itemType:getName() or item
        local size = 0	
		
			for x = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do	
		    local storage = player:getStorageValue(x)
			if storage == itemType:getId() then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "The Item " ..itemName .." is on Auto Loot List.")
			return
			end
			end
			
        for i = AUTOPETLOOT_STORAGE_START, AUTOPETLOOT_STORAGE_END do
            local storage = player:getStorageValue(i)
            if size == AUTOPET_LOOT_MAX_ITEMS then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "The list is full, please remove from the list to make some room.")
                break
            end
			
            if storage == itemType:getId() then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .." is already in the list.")
                break
            end

            if storage <= 0 then
                player:setStorageValue(i, itemType:getId())
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .." has been added to the Pet list.")
                break
            end

            size = size + 1
        end
    elseif action == "remove" then
        local item = split[2]:gsub("%s+", "", 1)
        local itemType = ItemType(item)
        if itemType:getId() == 0 then
            itemType = ItemType(tonumber(item))
            if itemType:getId() == 0 then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "There is no item with that id or name.")
                return false
            end
        end

        local itemName = tonumber(split[2]) and itemType:getName() or item
        for i = AUTOPETLOOT_STORAGE_START, AUTOPETLOOT_STORAGE_END do
            if player:getStorageValue(i) == itemType:getId() then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .." has been removed from the list.")
                player:setStorageValue(i, 0)
                return false
            end
        end

        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .." was not founded in the list.")
    elseif action == "show" then
        local text = ""
        local count = 1
		local idtype = ""
        for i = AUTOPETLOOT_STORAGE_START, AUTOPETLOOT_STORAGE_END do
            local storage = player:getStorageValue(i)
            if storage > 0 then
				local clienttype = ItemType(storage):getClientId()
                text = string.format("%s%d. %s %s %s\n", text, count, ItemType(storage):getName(), storage, clienttype)
				idtype = string.format("%s|%s|%s", idtype, storage, clienttype)
                count = count + 1
            end
        end

        if text == "" then
            text = "Empty"
        end
   
        player:showTextDialog(1950, text, false)
		
		    elseif action == "looted" then
			local playeridpet = player:getGuid()
			local querylootedpet = db.storeQuery('SELECT * FROM `pet_loot` WHERE `player_id` = '..playeridpet)
        local pettext = ""
        local count = 1
		local idtype = ""
		if querylootedpet ~= false then
		repeat
            local petitemid = result.getDataInt(querylootedpet, 'pet_itemid')
			local petitemcount = result.getDataInt(querylootedpet, 'pet_count')
            if petitemid ~= false then
				local namepetitem = ItemType(petitemid):getName()
                pettext = string.format("%s%d. %s %d\n", pettext, count, namepetitem, petitemcount)
                count = count + 1
				end
				until not result.next(querylootedpet)
				result.free(querylootedpet)
			end
			

        if pettext == "" then
            pettext = "Looted Anything."
        end
   
        player:showTextDialog(1950, pettext, false)
		
    elseif action == "clear" then
        for i = AUTOPETLOOT_STORAGE_START, AUTOPETLOOT_STORAGE_END do
            player:setStorageValue(i, 0)
        end

        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "The autoloot list has been cleared.")
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Use the commands: !autoloot {add, remove, show, clear}")
    end

    return false
end
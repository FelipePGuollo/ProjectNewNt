local function scanContainer(cid, position)
    local player = Player(cid)
    if not player then
        return
    end

    local corpse = Tile(position):getTopDownItem()
    if not corpse then
        return
    end
	

    if corpse:getType():isCorpse() and corpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == cid then
						local idpetsave = 0
        for i = corpse:getSize() - 1, 0, -1 do
            local containerItem = corpse:getItem(i)
            if containerItem then
                for i = AUTOPETLOOT_STORAGE_START, AUTOPETLOOT_STORAGE_END do
                    if player:getStorageValue(i) == containerItem:getId() then
					local countpetsave = containerItem:getCount()
					local idpetsave = containerItem:getId()
					if idpetsave == 2148 then
					containerItem:remove()
					player:setBankBalance(player:getBankBalance() + countpetsave)
					end
					if idpetsave == 2152 then
					containerItem:remove()
					player:setBankBalance(player:getBankBalance() + countpetsave*100)
					end
					if idpetsave == 2160 then
					containerItem:remove()
					player:setBankBalance(player:getBankBalance() + countpetsave*1000)
					end
					if idpetsave ~= 2148 and idpetsave ~= 2152 and idpetsave ~= 2160 then
					local queryPet = db.storeQuery("SELECT * FROM `pet_loot` WHERE `player_id` = '" .. playerpetid .. "' and pet_itemid = "..idpetsave.."")
					local idpet = result.getNumber(queryPet, 'id')
					containerItem:remove()
					if queryPet ~= false then
					repeat
					position:sendMagicEffect(57, player)	
	db.asyncQuery('UPDATE `pet_loot` SET `player_id`= player_id ,`pet_count`= `pet_count` + '..countpetsave..' WHERE `player_id` = ' .. playerpetid .. ' and `id` = '.. idpet .. ' LIMIT 1;')		
					until not result.next(queryPet)
					result.free(queryPet)
					else
					db.asyncQuery('INSERT INTO `pet_loot`(`player_id`, `pet_itemid`, `pet_count`) VALUES ('..playerpetid..','..idpetsave..','..countpetsave..')')
					position:sendMagicEffect(57, player)
								end
                    end
						end
                end
            end
        end
    end
end

function onKill(player, target)
playerpetid = player:getGuid()
    if not target:isMonster() then
        return true
    end

						
	local summon = player:getSummons()
		if not summon[1] then
				return true
			end
			
			if player:getStorageValue(94433) >= 300 then
			summon[1]:say("Need reposit",TALKTYPE_ORANGE_1,true,player)
			return
			end
			
	local posback = summon[1]:getPosition()
	local posgo = target:getPosition()
					player:setStorageValue(94433, player:getStorageValue(94433)+1)
					summon[1]:teleportTo(posgo, true)
					summon[1]:say("Taked",TALKTYPE_ORANGE_1,true,player,posgo)
					addEvent(function()
					summon[1]:teleportTo(posback, true)
					end, 300)
    addEvent(scanContainer, 100, player:getId(), target:getPosition())
    return true
end
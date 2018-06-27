pet_table={}

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
					containerItem:remove()
					local index = 0
					for i in pairs(pet_table) do
					if pet_table[i].itemid == idpetsave and (pet_table[i].playerid == player_pettable) then
					index = i
					end
					end
					if index ~= 0 then
					local newcount = pet_table[index].count + countpetsave
										pet_table[index]={playerid = player_pettable, itemid=idpetsave, count=newcount}
															position:sendMagicEffect(57, player)	
										else			
					local pet_tablecount = #pet_table+1
					pet_table[pet_tablecount]={playerid = player_pettable, itemid=idpetsave, count=countpetsave}
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
player_pettable = player:getGuid()
local targetistrue = target:getMaster()
    if not target:isMonster() then
        return true
    end
	
	if targetistrue then
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
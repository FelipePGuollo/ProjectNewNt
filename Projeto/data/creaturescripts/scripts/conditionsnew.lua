function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)  

	local tile = Tile(creature:getPosition())
    if not tile then
        return false
    end
		local tile = tile:getItemById(26383)

		
	if primaryType == COMBAT_HEALING then
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end
	
	if creature:getVocation():getId() == 11 then
	if tile and Tile(creature:getPosition()) and creature:getStorageValue(58344) >= os.time() then
	local x = tonumber(primaryDamage/100)
	local y = tonumber(x*30)
	local z = tonumber(x*60)
	creature:addMana(y, true)
	return z,primaryType, secondaryDamage, secondaryType
	elseif creature:getVocation():getId() == 11 then
	local x = tonumber(primaryDamage/100)
	local y = tonumber(x*10)
	local z = tonumber(x*90)
	creature:addMana(y, true)
        return z, primaryType, secondaryDamage, secondaryType
    end
	end
	        return primaryDamage, primaryType, secondaryDamage, secondaryType
end
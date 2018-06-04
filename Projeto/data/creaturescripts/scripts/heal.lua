function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)  

if primaryType == COMBAT_HEALING and creature:getStorageValue(94432) >= 1 and isPlayer(creature) then
			creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Heal reducced by purgatory flames')
			creature:setStorageValue(94432, creature:getStorageValue(94432)-1)
            return primaryDamage/2, primaryType, secondaryDamage, secondaryType
else
	        return primaryDamage, primaryType, secondaryDamage, secondaryType
			end
end
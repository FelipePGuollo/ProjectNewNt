function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin) 
	if isPlayer(attacker) and attacker:getStorageValue(67839) >= os.time() then
	creature:setMoveLocked(true)
	addEvent(function()
	creature:setMoveLocked(false)
	end, 380)
	        return primaryDamage, primaryType, secondaryDamage, secondaryType
			else
			return primaryDamage, primaryType, secondaryDamage, secondaryType
end
end
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setArea(createCombatArea(AREA_CROSS6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4) + 75
	local max = (level / 5) + (maglevel * 10) + 150
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if creature:isPlayer() then
		local city = CityWars.getPlayerWar(creature)
		if city and not city:onCastSpell(creature, 'ultimateExplosion') then
			return false
		end
	end
	return combat:execute(creature, variant)
end

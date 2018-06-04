local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 181)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 56)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 2.4) + 118
	local max = (level / 5) + (maglevel * 3.2) + 140
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

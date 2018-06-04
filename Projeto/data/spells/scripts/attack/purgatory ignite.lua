local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:addDamage(23, 10000, -10)
combat:setCondition(condition)

function onCastSpell(creature, variant)
    local target = creature:getTarget()
	target:setStorageValue(94432, target:getStorageValue(94432)+1)
	return combat:execute(creature, variant)
end

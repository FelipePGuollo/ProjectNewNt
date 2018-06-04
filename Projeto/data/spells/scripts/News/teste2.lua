local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DARKDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 181)

function onGetFormulaValues(player, level, maglevel)
	local min = 2500
	local max = 4000
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    local target = creature:getTarget()
		if isPlayer(target) then
	target:setStorageValue(94432, target:getStorageValue(94432)+1)
	end
	
	for i = 1, 15 do
		addEvent(function()
		combat:execute(creature, variant)
				end, 200 * i)
	end
	return true
end
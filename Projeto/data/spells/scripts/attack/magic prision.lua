	local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 178)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)


function onGetFormulaValues(cid, level, maglevel)
	min = -((level / 5) + (maglevel * 4.1) + 32)
	max = -((level / 5) + (maglevel * 8.2) + 48)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    local target = creature:getTarget()
	local function get(cid)
		target:setMoveLocked(true)
	end

	local function out(cid)
		target:setMoveLocked(false)
	end
		addEvent(get, 1,cid)
		addEvent(out, 3000,cid)
	return combat:execute(creature, variant)
end

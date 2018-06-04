local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

-- local condition = Condition(CONDITION_PARALYZE)
-- condition:setParameter(CONDITION_PARAM_TICKS, 100)
-- condition:setFormula(-0.9, -80, -0.9, -81)
-- combat:setCondition(condition)

arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
local combat_area = createCombatArea(arr1)
setCombatArea(combat, combat_area)


function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.0) + 110
	local max = (level / 5) + (maglevel * 1.2) + 130
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(creature, variant)
	local checkmonster = creature:getPosition()
	local position = creature:getPosition()
	local direction = creature:getDirection()
	if direction == 1 then
	checkmonster.x = position.x+1
	checkmonster.y = position.y
	position.x = position.x+2
	position.y = position.y
	elseif direction == 2 then
	checkmonster.x = position.x
	checkmonster.y = position.y+1
	position.x = position.x+1
	position.y = position.y+2
	elseif direction == 3 then
	checkmonster.x = position.x-1
	checkmonster.y = position.y
	position.x = position.x-1
	position.y = position.y
	elseif direction == 0 then
	checkmonster.x = position.x
	checkmonster.y = position.y-1
	position.x = position.x
	position.y = position.y-1
	end
	local tile = Tile(checkmonster)
	if tile:getCreatureCount() == 0 then
	creature:sendCancelMessage("You need something creature to cast this spell.")
	return false
	end
	for i = 0, 15 do
	dmg = addEvent(function()
	if tile:getCreatureCount() > 0 then
	combat:execute(creature, variant)
	creature:setStorageValue(67839, os.time() + 1) 
	position:sendMagicEffect(188)
	end
	end, 280 * i)
	end
	return true
end

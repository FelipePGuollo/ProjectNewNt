combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DARKDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 1)

arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
local combat_area = createCombatArea(arr1)
setCombatArea(combat, combat_area)

combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DARKDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 4)

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
local combat_area2 = createCombatArea(arr2)
setCombatArea(combat2, combat_area2)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 30) + (maglevel * 0.1) + 1
	local max = (level / 30) + (maglevel * 0.1) + 1
	return -1, -1
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


	function onCastSpell(creature, variant)
		local i = 0
	local function doeffect()
	if i ~= 10 then
local newPos = creature:getPosition()
local x1 = creature:getPosition()
local x2 = creature:getPosition()
local x3 = creature:getPosition()
local x4 = creature:getPosition()
local x5 = creature:getPosition()
local x6 = creature:getPosition()
local x7 = creature:getPosition()
local x8 = creature:getPosition()
x1.x = x1.x + 1
x2.y = x2.y + 1
x3.x = x3.x - 1
x4.y = x4.y - 1
x5.x = x5.x -1
x5.y = x5.y - 1
x6.y = x6.y -1
x6.x = x6.x + 1
x7.x = x7.x - 1
x7.y = x7.y + 1
x8.y = x8.y + 1
x8.x = x8.x + 1	
		addEvent(function()
				x1:sendMagicEffect(7)
		end, 200 )			
		addEvent(function()
				x2:sendMagicEffect(7)
			end, 800)	
		addEvent(function()
				x3:sendMagicEffect(7)
		end, 600)
		addEvent(function()
				x4:sendMagicEffect(7)
		end, 400)	
		addEvent(function()
				x5:sendMagicEffect(7)
		end, 500)	
		addEvent(function()
				x6:sendMagicEffect(7)
		end, 300)	
		addEvent(function()
				x7:sendMagicEffect(7)
		end, 700)	
		addEvent(function()
				x8:sendMagicEffect(7)
		end, 100)
		i = i + 1
		addEvent(doeffect, 900)
		end
		end
		doeffect()
	return true
	end
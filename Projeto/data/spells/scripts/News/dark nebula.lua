local function doPushCreature(target, cid)
   if target then
   if not isNpc(target) then
   local position = cid:getPosition()
   local fromPosition = target:getPosition()
   local x = ((fromPosition.x - position.x) < 0 and -1 or ((fromPosition.x - position.x) == 0 and 0 or 1))
   local y = ((fromPosition.y - position.y) < 0 and -1 or ((fromPosition.y - position.y) == 0 and 0 or 1))
   local toPosition = {x = fromPosition.x + x, y = fromPosition.y + y, z = fromPosition.z}
   if isWalkable(toPosition, target:getId()) then
   target:teleportTo(toPosition, true)
   else
   local freepos = target:getClosestFreePosition(target:getPosition(), false)
   if isWalkable(freepos, target:getId()) then
   -- doMoveCreature(target, cid:getDirection())
   target:teleportTo(freepos, true)
   freepos:sendMagicEffect(3)
   end
   end
   end
    end
end
local spell = {}
spell.config = {
    [3] = {
   damageType = 1,
   areaEffect = 3,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 1, 3, 1, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    },
    [2] = {
   damageType = 1,
   areaEffect = 3,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 1, 3, 1, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }  
    },
    [1] = {
   damageType = 1,
   areaEffect = 3,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 1, 3, 1, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    }
}
  
spell.combats = {}
for _, config in ipairs(spell.config) do
    local combat = createCombatObject()
    setCombatParam(combat, COMBAT_PARAM_TYPE, config.damageType)
    setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.1, 0, -0.1, 0)
    function onTargetCreature(cid, target)
   doPushCreature(target, cid)
    end
    setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
    setCombatArea(combat, createCombatArea(config.area))
    table.insert(spell.combats, combat)
end
function onCastSpell(cid, var)
local effect = cid:getPosition()
effect.x = effect.x + 1
effect.y = effect.y + 1
	effect:sendMagicEffect(187)
    for n = 1, #spell.combats do
	addEvent(function()
	doCombat(cid, spell.combats[n], var)
	end, 100 * n)
	end
    return true
end
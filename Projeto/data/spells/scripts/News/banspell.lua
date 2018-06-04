local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 63)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
 
local condition = Condition(CONDITION_INVISIBLE)
condition:setParameter(CONDITION_PARAM_TICKS, 5000)
combat:setCondition(condition)
 
function onCastSpell(creature, variant, isHotkey)
local player = Player(creature)
 
local function OMG()
    player:setGhostMode(isGhost)
         return true
  end
    addEvent(OMG, 5 * 1000)  
    local position = player:getPosition()
    local isGhost = not player:isInGhostMode()
    player:setGhostMode(isGhost)
    return combat:execute(creature, variant)
end
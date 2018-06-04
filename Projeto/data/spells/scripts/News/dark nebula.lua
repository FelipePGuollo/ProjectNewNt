local function isWalkable(pos, creatures)
     local tile = Tile(pos)
     if (creatures and tile:getCreatureCount() > 0) or tile:hasFlag(TILESTATE_BLOCKSOLID) then
         return false
     end
     return true
end
 
function onCastSpell(creature, var)
     local steps, pos = math.random(1), creature:getPosition()
     pos:sendMagicEffect(CONST_ME_POFF)
     for x = 1, steps do
         position = creature:getPosition()
         position:getNextPosition(creature:getDirection(), x)
 
         position = creature:getClosestFreePosition(position, false)
         if position.x == 0 or not isWalkable(position, x == steps and true or false) then
             creature:sendCancelMessage("You failed to jump, there is something blocking.")
             position:sendMagicEffect(CONST_ME_POFF)
             return false
         end
     end
     creature:teleportTo(position, true)
     pos:sendMagicEffect(CONST_ME_POFF)    
     position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
     return true
end
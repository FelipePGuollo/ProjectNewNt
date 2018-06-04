local storage =	65321
local seconds = 10
local value = {1,400}
local effect = 2

function onCastSpell(creature, variant, target)
	
	local master = getCreatureMaster(cid)
	if isCreature(master) and getCreatureHealth(master) < getCreatureMaxHealth(master) then
		local health_value = math.random(value[1],value[2])
        doCreatureAddHealth(master, health_value)
		doCreatureAddHealth(target, health_value)
        doSendMagicEffect(getCreaturePosition(cid), effect) -- and doSendMagicEffect(getCreaturePosition(master), effect)
		return true
    end
return true 
end

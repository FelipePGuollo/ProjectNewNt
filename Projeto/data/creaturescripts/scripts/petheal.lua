    local config = {
    heal = 30,
    condition = "yes",
	tempo = 5,
	storage = 235853,
	min =2,
	max =6.5,-- put no if you dont want him to remove the conditions (fire, poison, etc).
    }
function onThink(cid, target)
    local master = getCreatureMaster(cid)
	local health = getCreatureMaxHealth(master)
	local healthn = getCreatureHealth(master)
	local heal = health/100
		local name = getCreatureName(master)
	if getPlayerStorageValue(master, config.storage) >= os.time() then
return true
end
    if master then
	if (healthn < health) then
        local conditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_PARALYZE, CONDITION_DRUNK, CONDITION_DROWN, CONDITION_CURSED}
        local party = getPartyMembers(master)
        local pos = getCreaturePosition(master)
        if not getPlayerParty(master) then
            doCreatureAddHealth(master,heal* math.random (config.min, config.max))
				doCreatureSay(cid, 'Take my energy, '.. name .. '!!',TALKTYPE_SAY)
			setPlayerStorageValue(master, config.storage, os.time()+config.tempo) 
            doSendMagicEffect(pos, 12)
            if (config.condition == "yes") then
                for i, todos in ipairs(conditions) do
                    doRemoveCondition(master, todos)
                end

            return true
        end
		end
        for _, miembros in pairs(party) do
            doCreatureAddHealth(miembros, config.heal)
            pos = getCreaturePosition(miembros)
            doSendMagicEffect(pos, 12)
            if (config.contidion == "yes") then
                for i, todos in ipairs(conditions) do
                    doRemoveCondition(miembros, todos)
                end
            end
        end
    end
    return true
end
end
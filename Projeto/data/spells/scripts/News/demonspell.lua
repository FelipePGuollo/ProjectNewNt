local t = 60 * 1000 -- length of time for effect
local v = 100 -- percentage of damage to resist
 
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
 
local resist = Condition(CONDITION_ATTRIBUTES)
resist:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
resist:setParameter(CONDITION_PARAM_SUBID, 108) -- set subid as per main script to achieve desired effect
resist:setParameter(CONDITION_PARAM_TICKS, t)
creaturetestest:setStorageValue(5, v)
combat:setCondition(resist)
 
function onCastSpell(creature, var)
local creaturetestest = creature
    return combat:execute(creature, var)
end
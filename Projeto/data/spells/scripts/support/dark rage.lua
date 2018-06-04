local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 176)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local skill = Condition(CONDITION_ATTRIBUTES)
skill:setParameter(CONDITION_PARAM_TICKS, 10000)
skill:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, 100)
skill:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, 100)
skill:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, -100)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:setCondition(skill)

local speed = Condition(CONDITION_PARALYZE)
speed:setParameter(CONDITION_PARAM_TICKS, 10000)
speed:setFormula(-0.9, -20, -0.9, -30)
combat:setCondition(speed)

local cooldownHealingGroup = Condition(CONDITION_SPELLGROUPCOOLDOWN)
cooldownHealingGroup:setParameter(CONDITION_PARAM_TICKS, 10000)
cooldownHealingGroup:setParameter(CONDITION_PARAM_SUBID, 2)
combat:setCondition(cooldownHealingGroup)

local cooldownSupportGroup = Condition(CONDITION_SPELLGROUPCOOLDOWN)
cooldownSupportGroup:setParameter(CONDITION_PARAM_TICKS, 10000)
cooldownSupportGroup:setParameter(CONDITION_PARAM_SUBID, 3)
combat:setCondition(cooldownSupportGroup)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

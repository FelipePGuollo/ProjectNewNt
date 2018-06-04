local scom1 = createCombatObject()
local scom2 = createCombatObject()
local scom3 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 184)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.9, 15, -1.3, 25)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 182)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, 0, -0.0, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.3, 25, -1.7, 35)

arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3 = {
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
}


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
setCombatArea(scom1, area1)
setCombatArea(scom2, area2)
setCombatArea(scom3, area3)

function onTargetTile(cid, pos)
doCombat(cid,combat1,positionToVariant(pos))
end

function onTargetTile2(cid, pos)
doCombat(cid,combat2,positionToVariant(pos))
end

function onTargetTile3(cid, pos)
doCombat(cid,combat3,positionToVariant(pos))
end

setCombatCallback(scom1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(scom2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
setCombatCallback(scom3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")

local function onCastSpell1(parameters)
doCombat(parameters.cid, scom1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, scom2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, scom3, parameters.var)
end

function onCastSpell(cid, var)
    local player = Player(cid)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
if player:getLevel() >= 50 then
addEvent(onCastSpell2, 800, parameters)
addEvent(onCastSpell3, 800, parameters)
end

return TRUE
end
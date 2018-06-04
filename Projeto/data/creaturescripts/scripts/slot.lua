 
local conditionMP,conditionHP,conditionML,conditionCLUB,conditionSHI,conditionDIST,conditionAMP, conditionCRIT, conditionLIFEL = {},{},{},{},{},{},{}, {}, {}
for i=1,300 do
  conditionHP[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionHP[i], CONDITION_PARAM_SUBID, 50)
  setConditionParam(conditionHP[i], CONDITION_PARAM_BUFF_SPELL, 1)
  setConditionParam(conditionHP[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionHP[i], CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 100+i)
 
  conditionMP[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionMP[i], CONDITION_PARAM_SUBID, 51)
  setConditionParam(conditionMP[i], CONDITION_PARAM_BUFF_SPELL, 1)
  setConditionParam(conditionMP[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionMP[i], CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 100+i)
 
  conditionML[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionML[i], CONDITION_PARAM_SUBID, 52)
  setConditionParam(conditionML[i], CONDITION_PARAM_BUFF_SPELL, 1)
  setConditionParam(conditionML[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionML[i], CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 100+i)
 
 
  conditionCLUB[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionCLUB[i], CONDITION_PARAM_SUBID, 53)
  setConditionParam(conditionCLUB[i], CONDITION_PARAM_BUFF_SPELL, 1)
  setConditionParam(conditionCLUB[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionCLUB[i], CONDITION_PARAM_SKILL_MELEEPERCENT, 100+i)
 
 
  conditionSHI[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionSHI[i], CONDITION_PARAM_SUBID, 54)
  setConditionParam(conditionSHI[i], CONDITION_PARAM_BUFF_SPELL, 1)
  setConditionParam(conditionSHI[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionSHI[i], CONDITION_PARAM_SKILL_SHIELDPERCENT, 100+i)
 
  conditionDIST[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionDIST[i], CONDITION_PARAM_SUBID, 55)
  setConditionParam(conditionDIST[i], CONDITION_PARAM_BUFF_SPELL, 1)
  setConditionParam(conditionDIST[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionDIST[i], CONDITION_PARAM_SKILL_DISTANCEPERCENT, 100+i)
  
    conditionCRIT[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionCRIT[i], CONDITION_PARAM_SUBID, 56)
  setConditionParam(conditionCRIT[i], CONDITION_PARAM_BUFF_SPELL, true)
  setConditionParam(conditionCRIT[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionCRIT[i], CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, 0+i)
  setConditionParam(conditionCRIT[i], CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, 0+i)
  
    conditionLIFEL[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionLIFEL[i], CONDITION_PARAM_SUBID, 57)
  setConditionParam(conditionLIFEL[i], CONDITION_PARAM_BUFF_SPELL, true)
  setConditionParam(conditionLIFEL[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionLIFEL[i], CONDITION_PARAM_SKILL_LIFE_LEECH_CHANCE, 0+i)
  setConditionParam(conditionLIFEL[i], CONDITION_PARAM_SKILL_LIFE_LEECH_AMOUNT, 0+i)
end
 
function getSlotType(n)
  if not n then
  return false
  end
  if n:match('%[(.+)%]') then
  n = n:match('%[(.+)%]')
  if n == '?' then
  return 0,n
  else
  return n:match('(.-)%.([+-])(%d+)%%')
  end
  else
  return false
  end
end
 
local function loadSet(cid)
local player = Player(cid)
if not player then return false end
  local t = {}
  for slot=1,9 do
  t[slot] = ''
  local s = getPlayerSlotItem(player,slot).uid
  if s ~= 0 then
  t[slot] = Item(s):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
  end
  end
  return t
end
 
function chk(cid,f)
      local player = Player(cid)
  if not Player(cid) then return false end
  local t = loadSet(cid)
  if not t then return false end
 
  for i=1,#f do
  if f[i] ~= t[i] then
  equip(player,nil,slot)
  break
  end
  end
  addEvent(chk,2000,cid,t)
end
 
function check_slot(aab, i)
  if i == 5 or i == 6 then
  if isWeapon(aab) or isShield(aab) or isBow(aab) then
  return true
  end
  else
  return true
  end
return false
end
 
function equip(player,item,slot)
  local t = {}
  if item then
  local mm,sinal,qto = getSlotType(Item(item.uid):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION))
  t[mm] = tonumber(qto)
  end
  for i=1,9 do
  if i ~= slot then
  if getPlayerSlotItem(player,i).itemid ~= 0 then
  local aab = getPlayerSlotItem(player,i).uid
  if aab and check_slot(aab,i) then
  for _ in Item(aab):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION):gmatch('(%[.-%])') do
  local mm,sinal,qto2 = getSlotType(_)
  if mm then
  if not t[mm] then
  t[mm] = 0
  end
  t[mm] = t[mm]+tonumber(qto2)
  t[mm] = t[mm] > 300 and 300 or t[mm]
  end
  end
  end
  end
  end
  end
  local fu = 0
  local ca = {}
  local s = ''
  for sl,n in pairs(t) do
  fu = fu+1
  s = s..''..n..'% more of '..sl..'\n'
  if sl == 'hp' then
  player:addCondition(conditionHP[tonumber(n)])
  ca[50] = 1
  doSendTutorial(player,19)
  elseif sl == 'mp' then
  player:addCondition(conditionMP[tonumber(n)])
  ca[51] = 1
  doSendTutorial(player,19)
  elseif sl == 'ml' then
  player:addCondition(conditionML[tonumber(n)])
  ca[52] = 1
  elseif sl == 'melee' then
  player:addCondition(conditionCLUB[tonumber(n)])
  ca[53] = 1
  elseif sl == 'shield' then
  player:addCondition(conditionSHI[tonumber(n)])
  ca[54] = 1
  elseif sl == 'dist' then
  player:addCondition(conditionDIST[tonumber(n)])
  ca[55] = 1
   elseif sl == 'crit' then
  player:addCondition(conditionCRIT[tonumber(n)])
  ca[56] = 1
     elseif sl == 'Life Leech' then
  player:addCondition(conditionLIFEL[tonumber(n)])
  ca[57] = 1
  end
  end
  if fu > 0 then
  for i=50,57 do
  if not ca[i] then
  doRemoveCondition(player:getId(),CONDITION_ATTRIBUTES,i)
  end
  end
  else
  for i=50,57 do
  doRemoveCondition(player:getId(),CONDITION_ATTRIBUTES,i)
  end
  end
  return true
end
 
function onLogin(player)
  equip(player,nil,slot)
local cid = player:getId()
  addEvent(chk,2000,cid,loadSet(cid))
  return true
end
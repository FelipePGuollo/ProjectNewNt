petBaseStorage = 1000
petHealthStorage = 1001
 
playerPet = {
    [1] = "Pig"
}
 
pets = {
    ["Pig"] = {storageValue = 1, healthPerLevel = 10}
}
 
function Player.doSummonPet(self, pet)
    local monster = Game.createMonster(pet, self:getPosition(), false, false)
    if not monster then
        monster = Game.createMonster(pet, self:getPosition(), false, true)
    end
 
    monster:setMaster(self)
    monster:adjustStatus(self)
end
 
function Monster.adjustStatus(self, player)
    local maxHealth = self:getMaxHealth()
    self:setMaxHealth(10 * pets[self:getName()].healthPerLevel + maxHealth + player:getLevel())
    local storage = player:getStorageValue(petHealthStorage)
    if storage > 0 then
        self:addHealth(-maxHealth + storage)
    else
        self:addHealth(maxHealth)
    end
end
 
function Player.isPetAlive(self)
    if self:getStorageValue(petHealthStorage) > 0 then
        return true
    end
    return false
end
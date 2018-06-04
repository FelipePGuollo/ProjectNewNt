-- <talkaction words="!petadd" separator=" " script="pet_add.lua" />
function onSay(player, words, param, channel)
        if tonumber(param) ~= nil and tonumber(param) <= table.maxn(PETS.IDENTIFICATION) then
            player:doRemovePet()
            player:doResetPet()
            if player:doAddPet(tonumber(param)) then
                player:petSystemMessage("New pet added!")
            else
                player:petSystemMessage("Can't add pet!") 
            end
    end
    return true
end


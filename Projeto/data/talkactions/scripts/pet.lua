function onSay(player,cid , words, param)

        player:petSystemMessage("Type '!petcommands' to see pet commands list.")
    local petUid = player:getPetUid()
	        if pet ~= nil and pet:isCreature() then
        player:summonPet( player:getPosition() )
			    player:openChannel(10)
				else
				        player:summonPet( player:getPosition() )
    end
    return true
end
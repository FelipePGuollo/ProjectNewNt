function onThink(cid, interval)
if getPlayerStorageValue == 83320 then
if getPlayerItemCount(cid, 2148) == 100 then

doPlayerRemoveItem(cid, 2148,100)

doPlayerAddItem(cid,2152,1)

if getPlayerItemCount(cid,2152) == 100 then

doPlayerRemoveItem(cid, 2152,100)

doPlayerAddItem(cid,2160,1)

end

return true

end
end
end
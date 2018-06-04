function onUse(cid, item, fromPosition, itemEx, toPosition) 
	doPlayerAddPremiumDays(cid, 30)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have recived 30 Premium Days to your account.")
	doSendMagicEffect(getCreaturePosition(cid), 28)
	doRemoveItem(item.uid,1)
	return true
end
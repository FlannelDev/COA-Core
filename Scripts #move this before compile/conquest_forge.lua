function onRespawn(event, creature)
	--creature:AddAura(64117, creature)
end

local RUNE_COST = 20
local RUNE_CURRENCY = 900031

function On_Gossip(event, plr, unit)
	plr:GossipMenuAddItem(2, "Transform "..RUNE_COST.." x "..GetItemLink(RUNE_CURRENCY).." into a random Runic Tome.", 0, 1, false, "This action will cost "..RUNE_COST.." x "..GetItemLink(RUNE_CURRENCY)..". Click accept to confirm.")
	plr:GossipMenuAddItem(2, "What are Runic Tomes?", 0, 2, false) 
	plr:GossipMenuAddItem(2, "Where can I get "..GetItemLink(RUNE_CURRENCY).."?", 0, 3, false) 
	plr:GossipSendMenu(1, unit)
end

function On_Select(event, player, unit, sender, intid, code)
	if(intid == 1)then
		if(player:GetLevel() >= MAX_LEVEL)then
			if(player:HasItem(RUNE_CURRENCY, RUNE_COST))then
				--player:AddItem(getRandomRune(), 1)
				player:SendBroadcastMessage("Feature not yet implemented.")
				player:AddItem(RUNE_CURRENCY, RUNE_COST)
				player:RemoveItem(RUNE_CURRENCY, RUNE_COST)
			else
				player:SendBroadcastMessage("Requires "..RUNE_COST.." x "..GetItemLink(RUNE_CURRENCY))
				player:GossipComplete()
			end
		else
			player:SendBroadcastMessage("You must be level "..MAX_LEVEL..".")
			player:GossipComplete()
		end
	end
	if(intid == 2)then
		player:SendBroadcastMessage("Runic Tomes are items that let you learn new spells. You can trade them with other players, or equip up to 3 of them at a time to further develop your character how you'd like it.")
		player:GossipComplete()
	end
	if(intid == 3)then
		player:SendBroadcastMessage("From random world events.")
		player:GossipComplete()
	end
end

function getRandomRune()
	return 0
end

RegisterCreatureGossipEvent(50140, 1, On_Gossip)
RegisterCreatureGossipEvent(50140, 2, On_Select)
RegisterCreatureEvent(50140, 5, onRespawn)


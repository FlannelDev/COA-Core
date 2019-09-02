function onRespawn(event, creature)
	creature:AddAura(64117, creature)
	creature:SetScale(1)
	creature:SetPhaseMask(1)
end

function On_Gossip(event, plr, unit)
	plr:GossipMenuAddItem(2, "I want to enter the Thunder Bluff Invasion event.", 0, 1, false, "This action will cost "..EVENT_COST.." x "..GetItemLink(EVENT_CURRENCY)..". Click accept to confirm.")
	plr:GossipMenuAddItem(2, "How do these events work?", 0, 2, false) 
	plr:GossipSendMenu(1, unit)
end

function On_Select(event, player, unit, sender, intid, code)
	if(intid == 1)then
		if(CURRENT_EVENT == EVENT_RAZORHILL or HOME == true)then
			if(player:GetLevel() >= MAX_LEVEL)then
				if(player:HasItem(EVENT_CURRENCY, EVENT_COST))then
					player:SetPhaseMask(EVENT_PHASE)
					player:AddAura(800659, player)
					player:RemoveItem(EVENT_CURRENCY, EVENT_COST)
					player:CastSpell(player, 47292, true)
				else
					player:SendBroadcastMessage("Requires "..EVENT_COST.." x "..GetItemLink(EVENT_CURRENCY))
					player:GossipComplete()
				end
			else
				player:SendBroadcastMessage("You need to be level "..MAX_LEVEL.." to participate in events.")
				player:GossipComplete()
			end
		else
			player:SendBroadcastMessage("This event is not currently active.")
			player:GossipComplete()
		end
	end
	if(intid == 2)then
		player:SendBroadcastMessage("At certain times, a random event may open in the world for a short space of time. Players of level "..MAX_LEVEL.." may participate in the events for exclusive rewards.")
		player:GossipComplete()
	end
end

RegisterCreatureGossipEvent(50180, 1, On_Gossip)
RegisterCreatureGossipEvent(50180, 2, On_Select)
RegisterCreatureEvent(50180, 5, onRespawn)


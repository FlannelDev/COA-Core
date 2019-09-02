local NPC_ID = 50006

function On_Gossip(event, plr, unit)
    plr:GossipMenuAddItem(5, "", 0, 1, false, "Are you sure you want to boost straight to level 70?\nNote: Requires at least one character of level 70 or above.")
    plr:GossipSendMenu(1, unit)
end

function spawn(event, creature)
end

function On_Select(event, plr, unit, sender, intid, code)
	local minlvl = 70
	local lvl = CharDBQuery("SELECT level FROM characters WHERE account = "..plr:GetAccountId().." AND level >= "..minlvl)
	if(lvl ~= nil)then
	   	boostToSixty(plr)
	    plr:Teleport(1, 16250, 16310.5, 21.85, 3.97)
	else
		plr:SendBroadcastMessage("You need to have at least one character at level "..minlvl.." or above before you can boost any other characters.")
	end
    plr:GossipComplete()
end

function HasCharAtleast(plr, min)
	local lvl = CharDBQuery("SELECT level FROM characters WHERE account = "..plr:GetAccountId().." AND level >= "..min)
	return (lvl ~= nil)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, On_Select)

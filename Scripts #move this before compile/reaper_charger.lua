local NPC_ID = 50093

function spawn(event, creature)
    creature:AddAura(48154, creature)
    for i=1,6 do
    	creature:CastSpell(creature, 68857, true)
    	creature:CastSpell(creature, 68859, true)
    end
    creature:CastSpell(creature, 44079, true)
end

function On_Gossip(event, plr, unit)
    if(unit:GetOwner() == plr)then
        plr:CastSpell(unit, 60968, true)
    end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)


RegisterCreatureEvent(NPC_ID, 5, spawn)

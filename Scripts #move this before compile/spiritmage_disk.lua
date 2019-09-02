local NPC_ID = 50122

function spawn(event, creature)
    creature:AddAura(42586, creature)
    creature:AddAura(50195, creature)
    creature:GetOwner():CastSpell(creature, 60968, true)
end

function On_Gossip(event, plr, unit)
    if(unit:GetOwner() == plr)then
        plr:CastSpell(unit, 60968, true)
    end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)


RegisterCreatureEvent(NPC_ID, 5, spawn)

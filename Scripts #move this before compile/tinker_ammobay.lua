local NPC_ID = 50047

function On_Gossip(event, plr, unit)
    if(unit:GetPower(5) > 0)then
        local aura = plr:AddAura(500238, plr)
        aura:SetStackAmount(10)
        unit:SetPower(5, unit:GetPower(5) - 1)
        plr:SendBroadcastMessage("Ammo refilled!")
    else
        plr:SendBroadcastMessage("No charges left.")
    end
end



function spawn(event, creature)
    creature:SetPowerType(5)
    creature:SetMaxPower(5, 10)
    creature:SetPower(10, 5)
        creature:AddAura(42716, creature)

end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)

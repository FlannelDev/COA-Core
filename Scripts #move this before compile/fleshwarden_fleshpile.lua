local NPC_ID = 50082

function On_Gossip(event, player, unit)
    
end

function seeUnit(event, unit, plr)
    if(plr:ToPlayer() ~= nil and unit:GetOwner() == plr)then
        if(plr:GetDistance(unit) <= 0.3)then
            unit:CastSpell(unit, 52580, true)
            unit:CastSpell(unit, 56840, true)
            unit:CastSpell(plr, 72313, true)
            plr:CastSpell(unit, 42908, true)
            plr:DealHeal(plr, 500313, plr:GetMaxHealth() / 10)
            plr:AddAura(500906, plr)
            unit:DespawnOrUnsummon();
            setPower(plr, plr:GetPower(1) + 150, 1)
        end
    end
end

RegisterCreatureEvent(NPC_ID, 27, seeUnit)

function spawn(event, creature)
    creature:RegisterEvent(killpile, 10000, 1)
        creature:AddAura(42716, creature)

end

function killpile(i, ii, iii, creature)
    creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)

local NPC_ID = 50152

local location_icon_size = 64


local sets = {
    {"Mana-Etched [Intellect Cloth]", 27465, 27796, 27907, 28191, 28193},
    {"Wastewalker [Agi Leather]", 27531, 27797, 27837, 28224, 28264},
    {"Moonglade [Druid Leather]", 27468, 27737, 27873, 28202, 28348},
    {"Desolation [Agi/Int Mail]", 28192, 27936, 27713, 27528, 28401},
    {"Doomplate [Str/Stam Plate]", 28403, 28225, 27870, 27771, 27497},
    {"Righteous [Intellect Plate]", 27535, 27739, 27839, 28203, 28285},
}

function On_Gossip(event, plr, unit)
    for i,v in ipairs(sets) do
        plr:GossipMenuAddItem(6, v[1], 0, i, false, "Are you sure you want |cFF87CEFA"..v[1].."?")
    end
    plr:GossipSendMenu(1, unit)
end

function spawn(event, creature)
    creature:SetPowerType(3)
    creature:SetMaxPower(3, 10000)
    creature:AddAura(57685, creature)
    creature:SetScale(2)
end

function On_Select(event, plr, unit, sender, intid, code)
    local set = sets[intid]
    if(plr:HasItem(24245, 10))then
        for i,v in ipairs(set) do
            if(i > 1)then
                plr:AddItem(v, 1)
            end
        end
        plr:RemoveItem(24245, 10)
    else
        plr:SendBroadcastMessage("Requires 10 x "..GetItemLink(24245))
    end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, On_Select)

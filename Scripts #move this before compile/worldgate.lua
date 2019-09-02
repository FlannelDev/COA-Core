local NPC_ID = 50000

local location_icon_size = 64

local alliance_locations = {
    {generateIcon("Icons/achievement_zone_elwynnforest", location_icon_size).." Elwynn Forest", 0, -8921.09, -119.135, 82.195, 5.82878},
    {generateIcon("Icons/achievement_zone_dunmorogh", location_icon_size).." Dun Morogh", 0, -6231.77, 332.993, 383.171, 0.480178},
    {generateIcon("Icons/achievement_zone_darnassus", location_icon_size).." Teldrassil", 1, 10313.5, 830.955, 1326.39, 5.23148},
    {generateIcon("Icons/achievement_zone_azuremystisle_01", location_icon_size).." Azuremyst Isle", 530, -3961.3, -13933.6, 100.504, 1.99571},
};

local horde_locations = {
    {generateIcon("Icons/achievement_zone_durotar", location_icon_size).." Durotar", 1, -612.535, -4249.28, 38.9561, 6.16243},
    {generateIcon("Icons/achievement_zone_mulgore_01", location_icon_size).." Mulgore", 1, -2920.38, -255.658, 52.9711, 0.0565463},
    {generateIcon("Icons/achievement_zone_tirisfalglades_01", location_icon_size).." Tirisfal Glades", 0, 1676.94, 1678.29, 121.67, 3.09542},
    {generateIcon("Icons/achievement_zone_eversongwoods", location_icon_size).." Eversong Woods", 530, 10347, -6370.69, 35.8044, 0.292675},
};


function On_Gossip(event, plr, unit)
    if(getClassID(plr) ~= 0)then
        if(plr:GetLevel() >= 10)then
            plr:GossipMenuAddItem(5, "", 0, 999, false, "Are you ready to leave?")
        else
            if(plr:IsAlliance())then
                for i,v in ipairs(alliance_locations) do
                    plr:GossipMenuAddItem(5, v[1], 0, i, false, "Are you sure you wish to start in |cFF87CEFA"..v[1].."?")
                end
            else
                for i,v in ipairs(horde_locations) do
                    plr:GossipMenuAddItem(5, v[1], 0, i, false, "Are you sure you wish to start in |cFF87CEFA"..v[1].."?")
                end
            end
        end
    else
        plr:SendBroadcastMessage("You have to select your class path before you can choose a starting location.")
    end
    plr:GossipSendMenu(1, unit)
end

function spawn(event, creature)
    creature:SetPowerType(3)
    creature:SetMaxPower(3, 10000)
end

function On_Select(event, plr, unit, sender, intid, code)
    if(plr:IsAlliance())then
        if(plr:GetLevel() >= 10)then
            plr:Teleport(0, -8833, 628, 94.007, 1.07)
            plr:LearnSpell(68057)
            plr:SetPhaseMask(1)
        else
            local loc = alliance_locations[intid]
            local map = loc[2]
            local x, y, z, o = loc[3], loc[4], loc[5], loc[6]
            plr:Teleport(map, x, y, z, o)
            plr:KilledMonsterCredit(50041)
            plr:SetPhaseMask(1)
        end
    else
        if(plr:GetLevel() >= 10)then
            plr:Teleport(1, 16234, 16300, 21, 0.4)
            plr:LearnSpell(68056)
            plr:SetPhaseMask(1)
        else
            local loc = horde_locations[intid]
            local map = loc[2]
            local x, y, z, o = loc[3], loc[4], loc[5], loc[6]
            plr:Teleport(map, x, y, z, o)
            plr:KilledMonsterCredit(50041)
            plr:SetPhaseMask(1)
        end
    end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, On_Select)

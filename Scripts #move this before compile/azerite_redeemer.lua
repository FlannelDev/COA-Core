local NPC_ID = 50215

--[[local shop = {
    --shopID, ID, name, icon, type, cost 
    {1, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0, },
    {2, 800587, "Tuskar Tradesman [Account]\nCompanion that sells general goods and food.", 0},
    {3, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {4, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {5, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {6, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {7, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {8, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {9, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {10, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {11, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {12, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {13, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {14, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
    {15, 800587, "Tuskar Tradesman [Character]\nCompanion that sells general goods and food.", 0},
}]]
function On_Gossip(event, plr, unit)
    local qry = WorldDBQuery("SELECT amount FROM donation_points WHERE account = "..plr:GetAccountId().." OR accountName = '"..plr:GetAccountName().."'")
    local pending = 0
    local color = "|cFFFF0000"
    if(qry ~= nil)then
        pending = qry:GetUInt32(0)
    end
    plr:GossipMenuAddItem(5, "Redeem Azerite ["..pending.." available|r]\n", 0, 0, true, pending.." Azerite available|r\n\n".."On the next popup please enter how much Azerite you want to redeem.\n\nNote: Click accept rather than hitting enter.")
    plr:GossipSendMenu(1, unit)
end

function spawn(event, creature)
    creature:SetPowerType(3)
    creature:SetMaxPower(3, 10000)
end

function On_Select(event, plr, unit, sender, intid, code)
    if(intid == 0)then
        local pending = WorldDBQuery("SELECT amount FROM donation_points WHERE account = "..plr:GetAccountId().." OR accountName = '"..plr:GetAccountName().."'"):GetUInt32(0)
        local request = tonumber(code)
        if(request <= pending)then
            plr:AddItem(900004, request)
            WorldDBQuery("UPDATE donation_points SET amount = "..(pending-request).." WHERE account = "..plr:GetAccountId().." OR accountName = '"..plr:GetAccountName().."'")
            WorldDBQuery("INSERT INTO redeem_log VALUES (0, '"..plr:GetAccountName().."', "..request..")")
        else
            plr:SendBroadcastMessage("You cannot redeem that much Azerite.")
            plr:GossipComplete()
        end
    end
end


RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, On_Select)

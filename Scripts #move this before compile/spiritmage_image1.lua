function spawn(event, creature)
	local entry = creature:GetEntry()
    creature:AddAura(63726, creature)
    creature:AddAura(41232, creature)
    if(entry == 50253)then
        creature:AddAura(35847, creature)
    	--creature:SetEquipmentSlots(43093, 0, 0)
    end
    if(entry == 50254)then
        creature:AddAura(35838, creature)
    	--creature:SetEquipmentSlots(43617, 0, 0)
    end
    if(entry == 50255)then
        creature:AddAura(35847, creature)
        creature:AddAura(35838, creature)
    	--creature:SetEquipmentSlots(43618, 0, 0)
    end
    if(entry == 50256)then
    	creature:SetEquipmentSlots(43619, 0, 0)
    end
end

for i=50253,50255 do
    RegisterCreatureEvent(i, 5, spawn)
end


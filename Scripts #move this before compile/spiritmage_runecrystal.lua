local NPC_ID = 50127

function spawn(event, creature)
	creature:AddAura(42716, creature)
	--creature:SetScale(0.6)
	creature:CastSpell(creature, 65632, true)
	    creature:AddAura(42716, creature)

end

function seeUnit(event, creature, unit)
	if(creature:GetDistance(unit) <= 1)then
		if(unit == creature:GetOwner())then
			local aura = unit:AddAura(800305, unit)
			creature:SetScale(0.01)
			unit:CastSpell(creature, 70509, true)
			creature:DespawnOrUnsummon()
			unit:SendAreaTriggerMessage(generateIcon("Icons/inv_enchant_shardprismaticlarge", 16).." "..(aura:GetStackAmount()).." "..generateIcon("Icons/inv_enchant_shardprismaticlarge", 16))
		else
			if(unit:GetEntry() == 50122)then
				unit:AddAura(800305, unit:GetOwner())
				creature:SetScale(0.01)
				unit:CastSpell(creature, 70509, true)
				creature:DespawnOrUnsummon()
			end
		end
	end
end

RegisterCreatureEvent(NPC_ID, 27, seeUnit)
RegisterCreatureEvent(NPC_ID, 5, spawn)


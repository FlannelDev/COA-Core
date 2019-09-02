local NPC_ID = 50185

function spawn(event, creature)
	creature:AddAura(32570, creature)
	--creature:SetScale(0.6)
	creature:SetDisplayId(15435)
	creature:SetScale(0.3)
	--creature:CastSpell(creature, 64416, true)
	creature:DespawnOrUnsummon()
end

function seeUnit(event, creature, unit)
	if(creature:GetDistance(unit) <= 3 and creature:HasAura(64416) == false)then
		if(unit == creature:GetOwner())then
			creature:RegisterEvent(demon_despawn, 8000, 1)
			unit:AddAura(800431, unit)
			creature:CastSpell(creature, 68862, true)
			creature:CastSpell(creature, 64416, true)
		else
			if(unit:GetEntry() == 50122)then
				creature:DespawnOrUnsummon()
			end
		end
	end
end

RegisterCreatureEvent(NPC_ID, 27, seeUnit)
RegisterCreatureEvent(NPC_ID, 5, spawn)


local NPC_ID = 50068

function spawn(event, creature)
	tar = creature:GetOwner():GetSelection()
	creature:SetMaxHealth((creature:GetOwner():GetStat(2) * 1.5 +  creature:GetOwner():GetMaxHealth() / 2) * 9)
	creature:SetHealth(creature:GetMaxHealth())
	creature:CastSpell(tar, 59395, true)
	initPetAttack(creature)
	creature:RegisterEvent(necro_pet_die, 24000, 1)
	creature:RegisterEvent(necro_abom_taunt, 4000, 24000 / 4000)
	creature:RegisterEvent(necro_abom_taunt, 1000, 1)
	--creature:CastSpell(creature:GetOwner():GetSelection(), 59395, true)
	creature:SendUnitSay("We done waiting...", 0)
end

function necro_abom_taunt(i, ii, iii, creature)
	creature:CastSpell(creature, 9741, true)
end


function necro_pet_die(i, ii, iii, creature)
	creature:CastSpell(creature, 51929, true)
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(NPC_ID, 5, spawn)

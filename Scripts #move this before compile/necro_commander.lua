local NPC_ID = 50067

function spawn(event, creature)
	initPetAttack(creature)
	creature:SetMaxHealth(creature:GetOwner():GetStat(2) * 2 +  creature:GetOwner():GetStat(3) / 3 * 2)
	creature:SetHealth(creature:GetMaxHealth())
	creature:CastSpell(creature, 800696, true)
	creature:RegisterEvent(necro_pet_die, 10000, 1)
end

function necro_basic_activate(i, ii, iii, creature)
	tar = creature:GetOwner():GetVictim()
	creature:AttackStart(tar)
end


function necro_pet_die(i, ii, iii, creature)
	creature:CastSpell(creature, 51929, true)
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(NPC_ID, 5, spawn)

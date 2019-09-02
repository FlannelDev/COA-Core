local NPC_ID = 50078

function spawn(event, creature)
	local dur = 10000
	creature:SetMaxHealth(creature:GetOwner():GetStat(2) * 1.5 +  creature:GetOwner():GetStat(3) / 3 * 2)
	creature:SetHealth(creature:GetMaxHealth())
	creature:RegisterEvent(necro_geist_activate, 100, 1)
	creature:RegisterEvent(necro_pet_die, dur, 1)
	creature:RegisterEvent(necro_skeleton_attack, 2500, dur / 2500)
end

function necro_geist_activate(i, ii, iii, creature)
	tar = creature:GetOwner():GetVictim()
	creature:CastSpell(tar, 70150, true)
	creature:AttackStart(tar)
end


function necro_pet_die(i, ii, iii, creature)
	creature:CastSpell(creature, 51929, true)
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
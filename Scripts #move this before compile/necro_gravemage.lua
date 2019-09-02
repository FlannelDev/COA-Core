local NPC_ID = 50075

function spawn(event, creature)
	initPetAttack(creature)
	creature:SetMaxHealth(creature:GetOwner():GetStat(2) * 1.5 +  creature:GetOwner():GetStat(3) / 3 * 2)
	creature:SetHealth(creature:GetMaxHealth())
	--creature:RegisterEvent(necro_gravemage_activate, 100, 1)
	creature:RegisterEvent(necro_gravemage_attack, 1200, 15)
	creature:RegisterEvent(necro_pet_die, 12000, 1)
	local root = creature:AddAura(75215, creature)
    root:SetDuration(5000)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 1000)
    creature:SetPower(1000, 0)
end

function necro_gravemage_activate(i, ii, iii, creature)
	tar = creature:GetOwner():GetVictim()
	if(tar ~= nil)then
		creature:AttackStart(tar)
	end
end

function necro_gravemage_attack(i, ii, iii, creature)
	local owner = creature:GetOwner()
	petFindAttackTarget(owner, creature, 30, 0)
	tar = creature:GetVictim()
	if(tar ~= nil)then
		creature:CastSpell(tar, 500326, true)
	end
end


function necro_pet_die(i, ii, iii, creature)
	creature:CastSpell(creature, 51929, true)
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(NPC_ID, 5, spawn)

local NPC_ID = 50071

function spawn(event, creature)
	local dur = 12000
	--creature:RegisterEvent(necro_basic_activate, 2000, dur / 2000)
	creature:SetMaxHealth((creature:GetOwner():GetStat(2) * 1.5 +  creature:GetOwner():GetStat(3) / 3 * 2) * 2)
	creature:SetHealth(creature:GetMaxHealth())
	--creature:RegisterEvent(necro_basic_activate, 100, 1)
	initPetAttack(creature)
	creature:RegisterEvent(necro_zombie_infect, 2000, dur / 2000)
	creature:RegisterEvent(necro_pet_die, dur, 1)
end

function initPetAttack(creature)
	local tar = creature:GetOwner():GetSelection()
	local owner = creature:GetOwner()
	if(tar:HasAura(800695))then
		local aura = tar:GetAura(800695)
		if(aura:GetCaster() == owner)then
			creature:AttackStart(tar)
		else
			petFindAttackTarget(owner, creature, 30, 71553)
		end
	else
		petFindAttackTarget(owner, creature, 30, 71553)
	end
end

function necro_zombie_infect(i, ii, iii, creature)
	local owner = creature:GetOwner()
	petFindAttackTarget(owner, creature, 30, 70150)
	tar = creature:GetVictim()
	if(tar ~= nil and math.random(3) == 1)then
		if(tar:HasAura(500339))then
			local aura = tar:GetAura(500339)
			aura:SetStackAmount(aura:GetStackAmount() + 1)
		else
			local aura = owner:AddAura(500339, tar)
		end	
		creature:CastSpell(tar, 54350, true)
		creature:CastSpell(tar, 54578, true)
	end
end


function necro_pet_die(i, ii, iii, creature)
	creature:CastSpell(creature, 51929, true)
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(NPC_ID, 5, spawn)

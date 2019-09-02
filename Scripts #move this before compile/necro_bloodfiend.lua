local NPC_ID = 50073

function spawn(event, creature)
	local dur = 10000
	creature:SetMaxHealth((creature:GetOwner():GetStat(2) * 1.5 +  creature:GetOwner():GetStat(3) / 3 * 2) * 2)
	creature:SetHealth(creature:GetMaxHealth())
	initPetAttack(creature)
	creature:RegisterEvent(necro_bloodfiend_attack, 3000, dur / 3000)
	creature:SendUnitSay("Must... Feed!", 0)
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


function necro_bloodfiend_attack(i, ii, iii, creature)		
	local owner = creature:GetOwner()
	petFindAttackTarget(owner, creature, 30, 70150)
	tar = creature:GetVictim()
	if(tar ~= nil)then
		creature:CastSpell(tar, 54350, true)
		local dmg = (5 + math.random(5) + owner:GetLevel() * 3 + owner:GetStat(3) / 2)
		creature:DealDamage(tar, dmg)
		creature:DealHeal(owner, 500971, dmg)
		creature:CastSpell(owner, 54578, true)
	end
end


function necro_pet_die(i, ii, iii, creature)
	creature:CastSpell(creature, 51929, true)
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(NPC_ID, 5, spawn)

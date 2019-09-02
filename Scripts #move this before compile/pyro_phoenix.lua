local NPC_ID = 50043

function spawn(event, creature)
	creature:SetScale(0.4)
	creature:SetMaxHealth(creature:GetOwner():GetStat(2) * 1.2 +  creature:GetOwner():GetStat(3) / 2 * 15)
	creature:SetHealth(creature:GetMaxHealth())
	initPetAttack(creature)
	creature:RegisterEvent(pyro_pet_refollow, 1000, 1)
	applyFirePower(creature)
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

function applyFirePower(creature)
    local host = creature:GetOwner()
    local stacks = host:GetStat(3) / 10
    creature:AddAura(800823, creature):SetStackAmount(stacks)
end

function pyro_pet_attack(i, ii, iii, creature)
	local owner = creature:GetOwner()
	petFindAttackTarget(owner, creature, 30, 70150)
	tar = creature:GetVictim()
	if(tar ~= nil)then
		if(creature:GetDistance(tar) <= 2.5)then
			creature:CastSpell(tar, 54350, true)
			local owner = creature:GetOwner()
			local dmg = 0
			if(creature:GetMaxPower(0) == 2)then
				dmg = ((5 + math.random(5) + owner:GetLevel() * 3 + owner:GetStat(1) / 4 * 3) / 4) * 2
			else
				dmg = ((5 + math.random(5) + owner:GetLevel() * 3 + owner:GetStat(1) / 4 * 3) / 4) * 1.4
				if(math.random(2) == 1)then
					creature:CastSpell(tar, 800697, true)
				end
			end
			creature:GetOwner():DealDamage(tar, dmg)
		else
			creature:MoveFollow(tar)
		end
	end
end

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:CastSpell(target, 46239, true)
	creature:RegisterEvent(pyro_pet_attack, 2000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
	creature:RegisterEvent(pyro_pet_refollow, 1000, 1)
end

function pyro_pet_refollow(i, ii, iii, creature)
	creature:MoveFollow(creature:GetOwner(), 2, 0.75)
end

function pyro_pet_respawn(i, ii, iii, creature)
	creature:Respawn()
	creature:CastSpell(creature, 800810, true)
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
    creature:RegisterEvent(pyro_pet_respawn, 3000, 1)
end

function killTarget(event, creature, victim)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)

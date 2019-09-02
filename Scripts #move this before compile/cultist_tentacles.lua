local NPC_ID = 50096
local NPC_ID1 = 50097

function spawn(event, creature)
	creature:AddAura(42716, creature)

	creature:SetMaxHealth(creature:GetOwner():GetStat(2) * 1.2 +  creature:GetOwner():GetStat(3) / 2)
	creature:SetHealth(creature:GetMaxHealth())
	initPetAttack(creature)
	creature:RegisterEvent(cultist_tentacle_attack, 1500, 80)
end

function initPetAttack(creature)
	local tar = creature:GetOwner():GetSelection()
	if(tar:GetVictim() == nil)then
		tar:AttackStart(creature)
	end
	creature:AttackStart(tar)
end

function cultist_tentacle_attack(i, ii, iii, creature)
	petFindAttackTarget(owner, creature, 3, 0)
	tar = creature:GetVictim()
	owner = creature:GetOwner()
	if(tar ~= nil)then
		if(creature:GetDistance(tar) <= 3)then
			creature:CastSpell(tar, 54350, true)
			local dmg = 1.1 * ((5 + math.random(5) + owner:GetLevel() * 3 + owner:GetStat(3) / 2) / 2.3)
			if(owner:HasAura(500732))then
				dmg = (dmg * 2)
			end
			owner:DealDamage(tar, dmg, false, 5)
		else
			if(creature:GetVictim() == nil)then
				creature:AttackStart(creature:GetOwner():GetSelection())
			end
		end
	end
end

function petFindAttackTarget(owner, creature, r, charge)
	local findNewTarget = false
	if(creature:GetVictim() == nil)then
		findNewTarget = true
	else
		if(creature:GetDistance(creature, creature:GetVictim()) > r)then
			findNewTarget = true
		end
	end
	if(findNewTarget)then
		local list = creature:GetCreaturesInRange(range, 0, 1)
		for i,v in ipairs(list) do
			if(v:IsInCombat() and v:HasAura(800695))then
				local caster = v:GetAura(800695):GetCaster()
				if(caster == owner or caster:IsInSameGroupWith(owner))then
					if(charge > 0)then
						creature:CastSpell(v, charge, true)
					end
					creature:AttackStart(v)
				end
			end
		end
		local plist = creature:GetPlayersInRange(range, 0, 1, 1)
		for i,v in ipairs(plist) do
			if(v:IsInCombat() and v:HasAura(800695))then
				local caster = v:GetAura(800695):GetCaster()
				if(caster == owner or caster:IsInSameGroupWith(owner))then
					if(charge > 0)then
						creature:CastSpell(v, charge, true)
					end
					creature:AttackStart(v)
				end
			end
		end
	end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID1, 5, spawn)


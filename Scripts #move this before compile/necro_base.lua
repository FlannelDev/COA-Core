function onLeave(event, creature)
	creature:RegisterEvent(necro_follow, 500, 1)
end

function necro_follow(i, ii, iii, creature)
	local player = creature:GetOwner()
	creature:MoveFollow(player, math.random(250) / 100, math.random(360) / 100)
end

for i=50065,50085 do
	RegisterCreatureEvent(i, 2, onLeave)
end
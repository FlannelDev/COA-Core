CLASS_DRAGONKNIGHT = 1;
CLASS_WITCHDOCTOR = 2;
CLASS_DEMONHUNTER = 3;
CLASS_WITCHHUNTER = 4;
CLASS_STORMBRINGER = 5;
CLASS_SPIRITMAGE = 6;
CLASS_ABOMINATION = 7;
CLASS_GUARDIAN = 8;
CLASS_SAMURAI = 9;
CLASS_WORGEN = 10;
CLASS_THIEF = 11;
CLASS_RANGER = 12;
CLASS_BARD = 13;
CLASS_SPIDER = 14;
CLASS_DJINN = 15;
CLASS_PYROMANCER = 16;
CLASS_CULTIST = 17;
CLASS_NECROMANCER = 18;
CLASS_SUNDANCER = 19;
CLASS_TINKER = 20;
CLASS_RIFTBLADE = 21;
CLASS_REAPER = 22;
CLASS_GROVEWARDEN = 23;
CLASS_TEMPLAR = 24;
CLASS_TIDECALLER = 25;
CLASS_DOOMCALLER = 26;
CLASS_TIMEWARDEN = 27;
CLASS_STARLORD = 28;
CLASS_LION = 29;
CLASS_FELMAGE = 30;
CLASS_CHRONOMANCER = 31;
CLASS_TIMELORD = 32;
CLASS_DARKRANGER = 33;

OUTPOST_NAGA = 50275
OUTPOST_MANA = 50291
OUTPOST_SATYR = 50290
OUTPOST_FURBOLG = 50276
OUTPOST_NORTHMINE = 50292
OUTPOST_SOUTHMINE = 50293
OUTPOST_OGRE = 50294
OUTPOST_DEMON = 50295

CONQUEST_VERSION = 1;

HOME = true;
ENABLE_AUTOMOG = true;

CURRENT_EVENT = 4;

EVENT_PHASE = 2;
EVENT_CURRENCY = 900004;
EVENT_COST = 25;

MAX_LEVEL = 80;

EVENT_SHADOWFANG = 1;
EVENT_NORTHSHIRE = 2;
EVENT_RAZORHILL = 3;
EVENT_IRONFORGE = 4;
EVENT_THUNDERBLUFF = 5;
EVENT_JAEDENAR = 6;

TOTAL_EVENTS = 6;

function onCaptureOutpost(player, id)
	local spell = 0
	if(id == OUTPOST_FURBOLG)then
		spell = 801252
	end
	if(id == OUTPOST_MANA)then
		spell = 801257
	end
	if(id == OUTPOST_SATYR)then
		spell = 801256
	end
	if(id == OUTPOST_NAGA)then
		spell = 801253
	end

	if(player:IsAlliance())then
		local allis = GetPlayersInWorld(0)
		for i,v in ipairs(allis) do
			if(v:GetLevel() >= MAX_LEVEL)then
				v:LearnSpell(spell)
			end
		end
		local hordes = GetPlayersInWorld(1)
		for i,v in ipairs(hordes) do
			if(v:HasSpell(spell))then
				v:RemoveSpell(spell)
			end
		end
	else
		local hordes = GetPlayersInWorld(1)
		for i,v in ipairs(hordes) do
			if(v:GetLevel() >= MAX_LEVEL)then
				v:LearnSpell(spell)
			end
		end
		local allis = GetPlayersInWorld(0)
		for i,v in ipairs(allis) do
			if(v:HasSpell(spell))then
				v:RemoveSpell(spell)
			end
		end
	end
end

function getNameForClass(class)
	if(class == CLASS_TIDECALLER)then
		return "Tidecaller";
	end
	if(class == CLASS_SPIDER)then
		return "Disciple of Shadra";
	end
	if(class == CLASS_FELMAGE)then
		return "Fel Mage";
	end
	if(class == CLASS_VALKYRIE)then
		return "Valkyrie";
	end
	if(class == CLASS_STARLORD)then
		return "Starcaller";
	end
	if(class == CLASS_ABOMINATION)then
		return "Flesh Warden";
	end
	if(class == CLASS_TIMELORD)then
		return "Timelord";
	end
	if(class == CLASS_SPIRITMAGE)then
		return "Spirit Mage";
	end
	if(class == CLASS_STORMBRINGER)then
		return "Stormbringer";
	end
	if(class == CLASS_TIMEWARDEN)then
		return "Time Warden";
	end
	if(class == CLASS_WITCHHUNTER)then
		return "Witch Hunter";
	end
	if(class == CLASS_DEMONHUNTER)then
		return "Demon Hunter";
	end
	if(class == CLASS_WITCHDOCTOR)then
		return "Witch Doctor";
	end
	if(class == CLASS_DRAGONKNIGHT)then
		return "Barbarian";
	end
	if(class == CLASS_GUARDIAN)then
		return "Guardian";
	end
	if(class == CLASS_WORGEN)then
		return "Son of Arugal";
	end
	if(class == CLASS_SAMURAI)then
		return "Monk";
	end
	if(class == CLASS_DARKRANGER)then
		return "Dark Ranger";
	end
	if(class == CLASS_DRAGONKNIGHT)then
		return "Barbarian";
	end
	if(class == CLASS_BARD)then
		return "Brewmaster";
	end
	if(class == CLASS_FELMAGE)then
		return "Fel Mage";
	end
	if(class == CLASS_DOOMCALLER)then
		return "Doomcaller";
	end
	if(class == CLASS_RANGER)then
		return "Ranger";
	end
	if(class == CLASS_COLDWEAVER)then
		return "Coldweaver";
	end
	if(class == CLASS_CHRONOMANCER)then
		return "Chronomancer";
	end
	if(class == CLASS_PYROMANCER)then
		return "Pyromancer";
	end
	if(class == CLASS_SUNDANCER)then
		return "Sun Cleric";
	end
	if(class == CLASS_TINKER)then
		return "Tinker";
	end
	if(class == CLASS_RIFTBLADE)then
		return "Riftblade";
	end
	if(class == CLASS_REAPER)then
		return "Reaper";
	end
	if(class == CLASS_CULTIST)then
		return "Cultist";
	end
	if(class == CLASS_NECROMANCER)then
		return "Necromancer";
	end
	if(class == CLASS_GROVEWARDEN)then
		return "Wildwalker";
	end
	if(class == CLASS_TEMPLAR)then
		return "Templar";
	end
	if(class == CLASS_LION)then
		return "White Lion";
	end
	if(class == CLASS_DJINN)then
		return "Djinn";
	end
	return "NULL"
end

function onResurrect(event, player)

	initClass(player)
end

RegisterPlayerEvent(36, onResurrect)

function generateIcon(name, size)
    return "|TInterface/" ..name.. ":"..size..":"..size.."|t"
end

function generateRawIcon(name, size)
    return "|T" ..name.. ":"..size..":"..size.."|t"
end

function setPower(player, val1, pow1)
	local val = val1
	local pow = pow1
	if(pow > 6)then
		local tmp = val
		val = pow
		pow = tmp
	end
	if(HOME == true)then
		player:SetPower(pow, val)
	else
		player:SetPower(val, pow)
	end
end

function isBasicClass(class)
	if(class == CLASS_ABOMINATION or class == CLASS_STORMBRINGER or class == CLASS_THIEF or class == CLASS_PROPHET)then
		return true;
	else
		return false;
	end
end

function getClassID(player)
	local class = 0
	local classitem = 0
	for i=700001,700050 do
		if(player:HasItem(i))then
			class = i - 700000
			classitem = i;
		end
	end
	for j=700001,700050 do
		if(player:HasItem(j) and j ~= classitem)then
			player:RemoveItem(j, 1)
			local spells = getSpellsForClass((j - 700000))
			for x,v in ipairs(spells) do
				for y,s in ipairs(v) do
					if(s >= 500000)then
						player:RemoveSpell(s)
					end
				end
			end
		end
	end
	return class;
end

function getSpellsForClass(class)
	local levels = {}
	if(class == CLASS_WITCHHUNTER)then
		levels[1] = {9077, 196, 198, 201, 674,
		500082, 500085, 800665, 801069}
		levels[2] = {500083}
		levels[4] = {500900}
		levels[6] = {500084}
		levels[8] = {500901}
		levels[10] = {500088}
		levels[12] = {500089}
		levels[14] = {800165}
		levels[16] = {500093}
		levels[18] = {500091}
		levels[20] = {500086}
		levels[22] = {500092}
		levels[24] = {800164}
		levels[26] = {800161}
		levels[28] = {800162}
		levels[30] = {800163}
		levels[32] = {500094}
	end
	if(class == CLASS_CHRONOMANCER)then
		levels[1] = {9077, 8737, 198, 9116, 200, 266,
		801267, 800857, 800852, 801293}
		levels[2] = {801283}
		levels[4] = {801290}
		levels[6] = {801278}
		levels[8] = {801275}
		levels[10] = {801297}
		levels[12] = {801303}
		levels[14] = {801294, 800864}
		levels[16] = {801270}
		levels[18] = {801292}
		levels[20] = {801291}
		levels[22] = {800863}
		levels[24] = {801288}
		levels[26] = {801271}
		levels[28] = {801304}
		levels[30] = {801295}
		levels[32] = {801280}
		levels[34] = {801281}
		levels[36] = {801296}
		levels[38] = {801298}
		levels[40] = {801110}
		levels[42] = {801277}
	end
	if(class == CLASS_STARLORD)then
		levels[1] = {9077, 196, 198, 201, 674, 200, 264, 5011, 9116,
		800496, 801155, 75614, 801133, 801141}
		levels[2] = {800505}
		levels[4] = {800506}
		levels[5] = {801123}
		levels[6] = {801127}
		levels[8] = {800508}
		levels[10] = {801125}
		levels[12] = {800504}
		levels[14] = {801132}
		levels[16] = {800511}
		levels[18] = {800499}
		levels[20] = {801134}
		levels[22] = {800497}
		levels[24] = {800510}
		levels[26] = {801128}
		levels[28] = {801135}
		levels[30] = {800501}
		levels[32] = {801131}
		levels[34] = {801126}
		levels[36] = {801139}
		levels[38] = {801130}
		levels[40] = {801181}
	end
	if(class == CLASS_DARKRANGER)then
		levels[1] = {801310, 800695, 9077, 196, 198, 201, 674, 1180,
		500074, 500338, 800267, 801311, 75, 1494, 227, 5011}
		levels[2] = {500971}
		levels[4] = {500073}
		levels[6] = {500076}
		levels[8] = {500070}
		levels[10] = {500970}
		levels[12] = {500968}
		levels[14] = {500071}
		levels[16] = {500326}
		levels[18] = {800706}
		levels[20] = {500072}
		levels[22] = {500075}
		levels[24] = {500969}
		levels[26] = {500341}
		levels[28] = {500342}
		levels[30] = {500343}
		levels[32] = {800087}
		levels[34] = {500967}
		levels[36] = {800278}
		levels[38] = {500980}
		levels[40] = {800085}
		levels[42] = {800086}
		levels[44] = {500991}
		levels[46] = {500992}
	end
	if(class == CLASS_RANGER)then
		levels[1] = {9077, 196, 198, 201, 674, 1180,
		500074, 800083, 800267, 75, 1494, 800351, 801069, 801468}
		levels[2] = {500073}
		levels[3] = {800266}
		levels[4] = {500071}
		levels[5] = {800268}
		levels[6] = {800091}
		levels[7] = {800089}
		levels[8] = {500076}
		levels[9] = {800260, 801191}
		levels[10] = {800264}
		levels[11] = {801345}
		levels[12] = {800272}
		levels[14] = {500070}
		levels[16] = {800087}
		levels[18] = {800275}
		levels[20] = {800270}
		levels[22] = {800262}
		levels[24] = {800085}
		levels[26] = {800088}
		levels[28] = {800090}
		levels[30] = {800086}
		levels[32] = {500075}
		levels[34] = {500072}
		levels[36] = {800271}
		levels[38] = {800278}
		levels[40] = {800150}
		levels[42] = {800261}
		levels[44] = {800274}
		levels[46] = {800084}
		levels[48] = {800269}
		levels[50] = {801469}
	end
	if(class == CLASS_LION)then
		levels[1] = {9077, 196, 198, 201, 674, 1180,
		800564, 800532, 800535, 800594}
		levels[2] = {800537}
		levels[4] = {800572}
		levels[6] = {800576}
		levels[8] = {800575}
		levels[10] = {800582}
		levels[11] = {500594}
		levels[12] = {800565}
		levels[14] = {800500}
		levels[16] = {800539}
		levels[18] = {800568}
		levels[20] = {800584}
		levels[22] = {800295}
		levels[24] = {800570}
		levels[26] = {800563}
		levels[28] = {800581}
		levels[30] = {800585}
		levels[40] = {8737}
	end
	if(class == CLASS_NECROMANCER)then
		levels[1] = {1180, 201,
		500965, 500353}
		levels[2] = {500338}
		levels[4] = {500970}
		levels[5] = {800199}
		levels[6] = {500967}
		levels[8] = {500326}
		levels[10] = {800108}
		levels[12] = {500342}
		levels[11] = {800706}
		levels[14] = {500333}
		levels[16] = {500341}
		levels[18] = {500969}
		levels[20] = {500191}
		levels[22] = {500968}
		levels[24] = {500991}
		levels[26] = {500331}
		levels[28] = {500992}
		levels[30] = {500971}
		levels[32] = {500993}
		levels[34] = {500979}
		levels[36] = {500332}
		levels[38] = {500978}
		levels[40] = {500335}
		levels[42] = {500980}
		levels[44] = {500340}
		levels[46] = {500343}
		levels[50] = {500989}
		levels[60] = {500981}
	end
	if(class == CLASS_BARD)then
		levels[1] = {9077, 196, 198, 201, 674, 9116,
		500061, 500049, 500140}
		levels[2] = {500050}
		levels[4] = {500059}
		levels[6] = {500051}
		levels[8] = {500060}
		levels[10] = {500058}
		levels[12] = {500052}
		levels[14] = {500052}
		levels[16] = {500052}
	end
	if(class == CLASS_GROVEWARDEN)then
		levels[1] = {9077, 674, 198, 199, 196, 197, 200, 264, 5011, 15590, 9116, 200,
		800093, 500299, 800178, 800185, 801233, 801352, 801242, 801351}
		levels[2] = {800140}
		levels[4] = {500939}
		levels[5] = {800197}
		levels[6] = {500696}
		levels[8] = {500940}
		levels[10] = {500300, 800402, 801234, 982}
		levels[12] = {500303}
		levels[14] = {800135}
		levels[16] = {800139}
		levels[17] = {800142}
		levels[18] = {800137}
		levels[20] = {500938}
		levels[22] = {500942}
		levels[24] = {800133}
		levels[26] = {800134}
		levels[27] = {800181}
		levels[28] = {800147}
		levels[30] = {800145}
		levels[32] = {800094}
		levels[34] = {800141}
		levels[35] = {800143}
		levels[36] = {500305}
		levels[38] = {500402}
		levels[40] = {800146}
		levels[42] = {500935}
		levels[44] = {500943}
		levels[46] = {800136}
		levels[48] = {500302}
		levels[50] = {500307}
		levels[52] = {800144}
		levels[54] = {500941}
		levels[56] = {800138}
		levels[58] = {500692}
		levels[60] = {800180}
		--[[levels[1] = {9077, 674, 198, 199, 196, 197, 200, 264, 5011, 15590, 9116, 200,
		800093, 500299, 800178, 800185, 800200}
		levels[2] = {800140}
		levels[4] = {500939}
		levels[5] = {800197}
		levels[6] = {500696}
		levels[8] = {500940}
		levels[10] = {500300, 800402}
		levels[12] = {500303}
		levels[14] = {800135}
		levels[16] = {800139}
		levels[18] = {800137}
		levels[20] = {500938}
		levels[22] = {800942}
		levels[24] = {800133}
		levels[26] = {800134}
		levels[28] = {800147}
		levels[30] = {800145}
		levels[32] = {800094}
		levels[34] = {800141}
		levels[36] = {500305}
		levels[38] = {500402}
		levels[40] = {800146}
		levels[42] = {500935}
		levels[44] = {500943}
		levels[46] = {800136}
		levels[48] = {500302}
		levels[50] = {500307}
		levels[52] = {800144}
		levels[54] = {500941}
		levels[56] = {800138}
		levels[58] = {500692}
		levels[60] = {800180}
		levels[62] = {800142}
		levels[64] = {800181}
		levels[68] = {500676}]]--
	end
	if(class == CLASS_WORGEN)then
		levels[1] = {9077, 196, 198, 201, 674, 1180,
		500125, 500128, 15590}
		levels[2] = {500197}
		levels[4] = {800781}
		levels[6] = {800772}
		levels[8] = {800774}
		levels[10] = {500122, 500123}
		levels[12] = {500127}
		levels[14] = {800777}
		levels[16] = {500126}
		levels[18] = {800782, 801071}
		levels[20] = {800488, 800175}
		levels[22] = {800490}
		levels[24] = {800780}
		levels[26] = {500169}
		levels[28] = {800776}
		levels[30] = {500124}
		levels[32] = {800158}
		levels[34] = {800785}
		levels[36] = {800159}
		levels[38] = {800156}
		levels[40] = {801074}
	end
	if(class == CLASS_RIFTBLADE)then
		levels[1] = {9077, 1180, 674, 1180,
		500267, 500251, 801116, 801092}
		levels[2] = {801087}
		levels[3] = {500250}
		levels[4] = {500288}
		levels[6] = {801084}
		levels[8] = {500282}
		levels[10] = {500271}
		levels[12] = {500287}
		levels[14] = {500279, 500281}
		levels[16] = {500253}
		levels[18] = {801086}
		levels[20] = {500270}
		levels[22] = {801091}
		levels[24] = {500671}
		levels[26] = {500280}
		levels[28] = {800994}
		levels[30] = {500285}
		levels[32] = {800120}
		levels[34] = {800104}
		levels[36] = {800995}
		levels[38] = {801096}
		levels[40] = {500274}
		levels[42] = {800961}
	end
	if(class == CLASS_SPIDER)then
		levels[1] = {9077, 1180, 674, 1180,
		800869, 800870, 800895, 800894}
		levels[2] = {800876}
		levels[4] = {800841, 800880}
		levels[5] = {800889}
		levels[6] = {800883}
		levels[8] = {800843}
		levels[9] = {800891}
		levels[10] = {800901}
		levels[12] = {800911}
		levels[14] = {800882}
		levels[16] = {800897}
		levels[18] = {800878}
		levels[20] = {800871}
		levels[22] = {800902}
		levels[24] = {800848}
		levels[26] = {800900}
		levels[28] = {800885}
		levels[30] = {800879}
		levels[32] = {800899}
		levels[34] = {800888}
		levels[36] = {800896}
		levels[38] = {800887}
		levels[40] = {800877}
		levels[42] = {800904}
		levels[44] = {800905}
		levels[46] = {800914}
		levels[48] = {800892}
		levels[50] = {800946}
	end
	if(class == CLASS_TIDECALLER)then
		levels[1] = {9077, 674, 1180,
		800363, 800389, 800365, 800391, 800292}
		levels[2] = {800380}
		levels[4] = {800370}
		levels[6] = {800375}
		levels[8] = {800379}
		levels[10] = {800378, 800402}
		levels[12] = {800386}
		levels[14] = {800373}
		levels[15] = {800388}
		levels[16] = {800374}
		levels[18] = {800377}
		levels[20] = {800376}
		levels[22] = {800382}
		levels[24] = {800395}
		levels[26] = {800371}
		levels[28] = {800381}
		levels[30] = {800366}
		levels[32] = {800387}
		levels[34] = {800383}
	end
	if(class == CLASS_ABOMINATION)then
		levels[1] = {8737, 9116, 196, 198, 201,
		500904, 500020, 800606, 800984}
		levels[2] = {500021, 500313}
		levels[3] = {800997}
		levels[4] = {500909}
		levels[5] = {801042}
		levels[6] = {801048}
		levels[8] = {801038}
		levels[9] = {801059}
		levels[10] = {800168}
		levels[11] = {800169}
		levels[12] = {801053}
		levels[13] = {801065}
		levels[14] = {500907}
		levels[16] = {801002}
		levels[18] = {800340}
		levels[20] = {801046}
		levels[22] = {500025}
		levels[24] = {801036}
		levels[26] = {801054}
		levels[28] = {801016}
		levels[30] = {801001}
		levels[32] = {801040}
		levels[34] = {801045}
		levels[36] = {500023}
		levels[38] = {801067}
		levels[40] = {801061, 750}
		levels[42] = {801063}
		levels[44] = {801043}
		levels[46] = {800702}
		--801059 flames of xoroth
		-- foul bulwark
		-- vilehammer
	end
	if(class == CLASS_STORMBRINGER)then
		levels[1] = {9078, 227, 197, 199, 202,
		500040, 500929, 500933}
		levels[2] = {500038}
		levels[4] = {500922}
		levels[6] = {500042}
		levels[8] = {500041}
		levels[10] = {800098}
		levels[12] = {500039}
		levels[14] = {500928}
		levels[16] = {500932}
		levels[18] = {500043}
		levels[20] = {500932}
		levels[22] = {500045}
		levels[24] = {500923}
		levels[26] = {800227}
		levels[28] = {800699}
		levels[30] = {800692}
	end
	if(class == CLASS_DEMONHUNTER)then
		levels[1] = {9077, 196, 198, 201, 674, 1180}
		levels[2] = {0}
		levels[3] = {0}
		levels[4] = {0}
		levels[6] = {0}
		levels[8] = {0}
		levels[10] = {0}
		levels[12] = {0}
		levels[14] = {0}
		levels[16] = {0}
		levels[18] = {0}
		levels[20] = {0}
		levels[22] = {0}
		levels[24] = {0}
		levels[26] = {0}
		levels[28] = {0}
		levels[30] = {0}
		levels[32] = {0}
		levels[34] = {0}
		levels[36] = {0}
	end
	if(class == CLASS_DRAGONKNIGHT)then
		levels[1] = {8737, 197, 199, 202, 674, 200,
		500913, 800401, 800943}
		levels[2] = {500915}
		levels[4] = {500919}
		levels[5] = {800193}
		levels[6] = {500000}
		levels[8] = {500001}
		levels[10] = {500916}
		levels[12] = {800516}
		levels[14] = {500920}
		levels[16] = {500921}
		levels[18] = {500918}
		levels[20] = {500009}
		levels[22] = {500002}
		levels[30] = {800950}
		levels[40] = {750}
		levels[60] = {800637}
	end
	if(class == CLASS_PYROMANCER)then
		levels[1] = {9078, 227, 1180, 201,
		800790, 800791}
		levels[2] = {500129}
		levels[3] = {800196}
		levels[4] = {800805}
		levels[6] = {800809}
		levels[8] = {800811}
		levels[10] = {800794}
		levels[12] = {800792}
		levels[14] = {800807}
		levels[16] = {800808}
		levels[18] = {800806}
		levels[20] = {800796}
		levels[21] = {800816}
		levels[23] = {800813}
		levels[25] = {800818}
		levels[30] = {500135}
		levels[35] = {500167}
		levels[40] = {800819}
	end
	if(class == CLASS_FELMAGE)then
		levels[1] = {9078, 9116, 227, 1180, 201,
		801312, 800791}
		levels[2] = {500129}
		levels[3] = {800196}
		levels[4] = {800205}
		levels[6] = {800809}
		levels[8] = {800811}
		levels[10] = {800206}
		levels[12] = {800792}
		levels[14] = {800805}
		levels[16] = {500205}
		levels[18] = {0}
		levels[20] = {800796}
		levels[21] = {800816}
		levels[23] = {500032}
		levels[25] = {800808}
		levels[27] = {0}
		levels[30] = {500135}
		levels[35] = {800225}
		levels[37] = {800214}
		levels[39] = {0}
		levels[40] = {800256}
		levels[42] = {500029}
	end
	if(class == CLASS_SUNDANCER)then
		levels[1] = {9078, 227, 199, 198, 674, 200,
		800231, 500143, 8737, 800350}
		levels[2] = {500142}
		levels[4] = {800232}
		levels[6] = {500145}
		levels[8] = {800233}
		levels[10] = {500147, 800402}
		levels[12] = {500141}
		levels[14] = {500154}
		levels[16] = {500151}
		levels[18] = {500152}
		levels[20] = {800357}
		levels[22] = {500144}
		levels[24] = {500146}
		levels[26] = {800234}
		levels[28] = {500148}
		levels[30] = {800039}
		levels[32] = {800600}
	end
	if(class == CLASS_WITCHDOCTOR)then
		levels[1] = {9078, 9116, 196, 198, 227, 197, 199, 202,
		500017, 500015}
		levels[2] = {500948}
		levels[4] = {500016}
		levels[3] = {800195}
		levels[6] = {500951}
		levels[8] = {500013}
		levels[10] = {500954, 800402}
		levels[12] = {500957}
		levels[14] = {500014}
		levels[16] = {500953}
		levels[18] = {500019}
		levels[20] = {500018}
		levels[22] = {500960}
		levels[24] = {500950}
		levels[26] = {500949}
		levels[28] = {500947}
		levels[30] = {500962}
		levels[32] = {500961}
		levels[34] = {500963}
		levels[36] = {500952}
	end
	if(class == CLASS_SPIRITMAGE)then
		levels[1] = {9078, 9116, 196, 198, 227, 197, 199, 202,
		800335, 800735, 800495, 800126}
		levels[2] = {800713, 800720}
		levels[4] = {800732}
		levels[6] = {800741}
		levels[8] = {800757, 800748}
		levels[10] = {500118}
		levels[12] = {800745}
		levels[14] = {800723, 800306}
		levels[16] = {800718}
		levels[18] = {800736}
		levels[20] = {800725}
		levels[22] = {800501}
		levels[24] = {800308}
		levels[26] = {800125}
		levels[28] = {800721}
		levels[30] = {800747}
		levels[32] = {800749}
		levels[34] = {800733}
		levels[36] = {800746}
		levels[38] = {800333}
	end
	if(class == CLASS_SAMURAI)then
		levels[1] = {9078, 674, 227, 196, 197, 198, 199, 201, 202, 200, 1180,
		500680, 801441, 800518}
		levels[2] = {801445}
		levels[4] = {801455}
		levels[6] = {801478}
		levels[8] = {801443}
		levels[12] = {500678}
		levels[14] = {801458}
		levels[16] = {801457}
		levels[18] = {801461}
		levels[22] = {801465}
		levels[24] = {801477}
		levels[26] = {801446}
		levels[28] = {500689}
		levels[32] = {801463}
		levels[34] = {801451}
		levels[36] = {801440}
		levels[38] = {500694}
		levels[42] = {800424}
		levels[44] = {500688}
		levels[46] = {801481}
		levels[48] = {801466}
	end
	if(class == CLASS_TIMELORD)then
		levels[1] = {801310, 9077, 227, 266, 198, 199, 1180,
		500234, 500237, 801069}
		levels[2] = {500232}
		levels[4] = {500239}
		levels[6] = {}
		levels[8] = {}
		levels[10] = {}
		levels[12] = {}
		levels[14] = {500240}
		levels[16] = {}
		levels[18] = {}
		levels[20] = {500242}
		levels[22] = {500249}
		levels[24] = {500233}
		levels[26] = {}
		levels[28] = {}
		levels[30] = {800348, 8737}
		levels[32] = {}
		levels[34] = {801005}
	end
	if(class == CLASS_TINKER)then
		levels[1] = {9077, 227, 266, 198, 199, 1180,
		500234, 500237, 801069}
		levels[2] = {500232}
		levels[4] = {500239}
		levels[6] = {800347}
		levels[8] = {500235}
		levels[10] = {800095}
		levels[12] = {500244}
		levels[14] = {500240}
		levels[16] = {500236}
		levels[18] = {500241}
		levels[20] = {500242}
		levels[22] = {500249}
		levels[24] = {500233}
		levels[26] = {800345}
		levels[28] = {500243}
		levels[30] = {800348, 8737}
		levels[32] = {800346}
		levels[34] = {801005}
	end
	if(class == CLASS_GUARDIAN)then
		levels[1] = {8737, 9116, 227, 196, 198, 201,
		500155, 500168, 800319, 800984, 801121}
		levels[2] = {500170}
		levels[4] = {500174}
		levels[6] = {800311}
		levels[8] = {500268}
		levels[10] = {800315}
		levels[12] = {500257}
		levels[14] = {800313}
		levels[16] = {500269}
		levels[18] = {800312}
		levels[20] = {500261}
		levels[22] = {500258}
		levels[24] = {500259}
		levels[26] = {800316}
		levels[28] = {500260}
		levels[30] = {500263}
		levels[32] = {800318}
		levels[34] = {800317}
		levels[36] = {800314}
		levels[38] = {800321}
		levels[40] = {750}
		levels[42] = {801219}
	end
	if(class == CLASS_TIMEWARDEN)then
		levels[1] = {8737, 9116, 227, 196, 198, 201,
		800614, 801291, 801293, 801180, 801313}
		levels[2] = {801303}
		levels[4] = {800611}
		levels[6] = {800624}
		levels[8] = {801283}
		levels[10] = {801271}
		levels[12] = {800654}
		levels[14] = {801294}
		levels[16] = {801281}
		levels[18] = {800610}
		levels[20] = {800622}
		levels[22] = {801296}
		levels[24] = {800621}
		levels[26] = {801270}
		levels[28] = {801295}
		levels[40] = {750}
	end
	if(class == CLASS_CULTIST)then
		levels[1] = {8737, 9116, 9078, 51885, 674, 227, 196, 197, 198, 199, 201, 202, 200, 1180,
		500720, 500711, 500727}
		levels[2] = {500715, 800194}
		levels[4] = {500705}
		levels[6] = {500707}
		levels[8] = {500112}
		levels[10] = {500110, 800402}
		levels[11] = {800707}
		levels[12] = {500704}
		levels[13] = {801157}
		levels[14] = {500712}
		levels[16] = {500718}
		levels[20] = {500719}
		levels[22] = {500722}
		levels[24] = {500716}
		levels[26] = {500724}
		levels[28] = {500714}
		levels[30] = {800367}
		levels[32] = {500721}
		levels[34] = {500723}
		levels[36] = {500710}
		levels[38] = {800354}
		levels[40] = {500732}
		levels[42] = {800369}
		levels[44] = {800368}
		levels[46] = {800105}
		levels[48] = {801152}
		levels[50] = {801221}
	end
	if(class == CLASS_DOOMCALLER)then
		levels[1] = {8737, 9116, 9077, 9078, 51885, 674, 227, 196, 197, 198, 199, 201, 202, 200, 1180, 750,
		800411, 800446, 800445, 800464, 800466, 800560, 800694}
		levels[2] = {800412}
		levels[4] = {800416}
		levels[6] = {800417}
		levels[8] = {800468}
		levels[10] = {800413}
		levels[12] = {800433}
		levels[14] = {800440}
		levels[16] = {800429}
		levels[20] = {800432}
		levels[22] = {800452}
		levels[24] = {800435}
		levels[28] = {800437}
		levels[30] = {800442}
		levels[32] = {800463}
		levels[34] = {800448}
		levels[46] = {800430}
		--[[levels[48] = {800469}
		levels[50] = {800475}
		levels[52] = {800476}]]--
	end
	if(class == CLASS_REAPER)then
		levels[1] = {9078, 51885, 674, 227, 196, 197, 198, 199, 201, 202, 200,
		500357, 800338, (-9077), (-750)}
		levels[2] = {500365}
		levels[4] = {801330}
		levels[5] = {800198}
		levels[6] = {500366}
		levels[8] = {500358}
		levels[12] = {500359}
		levels[14] = {800797}
		levels[15] = {801337}
		levels[16] = {800940}
		levels[18] = {801328}
		levels[22] = {801041}
		levels[24] = {801332}
		levels[26] = {801329}
		levels[28] = {500361}
		levels[32] = {500355}
		levels[34] = {801321}
		levels[36] = {800939}
		levels[38] = {800938}
		levels[42] = {800845}
		levels[44] = {500376}
		levels[46] = {500373}
		levels[48] = {801335}
		levels[52] = {800172}
	end
	return levels;
end

function isDualWield(player)
	local item = player:GetEquippedItemBySlot(16)
	if(item~=nil)then
		return (item:GetEntry() > 0)
	end
	return false
end

function getFlags()
	local flags = {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil}
	flags[1] = {"Icons/inv_sword_04", "Physical", 1}
	flags[2] = {"Icons/ability_mage_firestarter", "Fire", 1}
	flags[3] = {"Icons/spell_frost_freezingbreath", "Frost", 1}
	flags[4] = {"Icons/spell_nature_protectionformnature", "Nature", 1}
	flags[5] = {"Icons/spell_arcane_arcanepotency", "Arcane", 1}
	flags[6] = {"Icons/spell_holy_aspiration", "Holy", 1}
	flags[7] = {"Icons/spell_shadow_chilltouch", "Shadow", 1}

	flags[8] = {"Icons/inv_chest_plate02", "Plate Armour", 2}
	flags[9] = {"Icons/inv_chest_chain_05", "Mail Armour", 2}
	flags[10] = {"Icons/inv_chest_wolf", "Leather Armour", 2}
	flags[11] = {"Icons/inv_chest_cloth_21", "Cloth Armour", 2}

	flags[12] = {"Icons/inv_shield_06", "Tanking", 3}
	flags[13] = {"Icons/ability_criticalstrike", "Damage", 3}
	flags[14] = {"Icons/spell_holy_heal", "Healing", 3}
	flags[15] = {"Icons/inv_banner_03", "Support", 3}

	flags[16] = {"Icons/ability_rogue_fleetfooted", "Mobility", 4}
	flags[17] = {"Icons/ability_warrior_shieldreflection", "Damage Mitigation", 4}
	flags[18] = {"Icons/spell_arcane_starfire", "Burst Damage", 4}
	flags[19] = {"Icons/spell_nature_polymorph", "Crowd Control", 4}
	flags[20] = {"Icons/spell_nature_nullifypoison", "Damage-Over-Time", 4}
	flags[21] = {"Icons/spell_shadow_summonvoidwalker", "Minions", 4}
	flags[30] = {"Icons/spell_nature_bloodlust", "Sustain", 4}
	flags[31] = {"Icons/spell_magic_greaterblessingofkings", "Buffs", 4}

	flags[22] = {"Icons/inv_misc_ammo_arrow_01", "Ranged", 5}
	flags[23] = {"Icons/ability_parry", "Melee", 5}
	flags[24] = {"Icons/spell_ice_magicdamage", "Caster", 5}

	flags[25] = {"Icons/ability_warrior_strengthofarms", "Strength", 6}
	flags[26] = {"Icons/ability_rogue_quickrecovery", "Agility", 6}
	flags[27] = {"Icons/inv_misc_rune_03", "Intellect", 6}
	flags[28] = {"Icons/spell_holy_divinespirit", "Spirit", 6}
	flags[29] = {"Icons/spell_holy_sealofprotection", "Stamina", 6}

	flags[32] = {"Icons/inv_elemental_primal_mana", "Mana", 7}
	flags[33] = {"Icons/ability_warrior_endlessrage", "Rage", 7}
	flags[34] = {"Icons/spell_nature_focusedmind", "Energy", 7}
	flags[35] = {"Icons/ability_hunter_focusedaim", "Focus", 7}
	flags[36] = {"Icons/inv_misc_rune_10", "Runic Power", 7}

	return flags;
end

--[[function getFlagsForClass(class)
	local flags = nil
	local DMG_PHYSICAL = 1, DMG_FIRE = 2, DMG_FROST = 3, DMG_NATURE = 4, DMG_ARCANE = 5, DMG_HOLY = 6, DMG_SHADOW = 7
	local PLATE = 8, MAIL = 9, LEATHER = 10, CLOTH = 11
	local TANK = 12, DMG = 13, HEALER = 14, SUPPORT = 15
	return flags
end]]

function getInfoForClass(class)
	if(class == CLASS_DRAGONKNIGHT)then
		return {"Icons/inv_misc_head_vrykul", 
		"The Barbarian is a brutish warrior that uses sheer strength to destroy their enemies. Masters of melee AoE and high impact combat. Good burst capabilities. Fairly simple class with the ability to be skillfully maximized for optimal damage.", 1}
	end
	if(class == CLASS_TIMEWARDEN)then
		return {"Icons/ability_paladin_hammeroftherighteous", 
		"The Timewarden is a multiclass that combines Chronomancer and Sun Cleric. To select this class, you must first advance a Chronomancer and a Sun Cleric to the maximum level.", 1}
	end
	if(class == CLASS_WITCHDOCTOR)then
		return {"Icons/spell_nature_poisoncleansingtotem", 
		"The Witch Doctor is a support role that uses voodoo hexxes to weaken enemies and a combination of nature magic and wards to heal and empower allies. Good damage output and utility with reasonable group healing.", 5}
	end
	if(class == CLASS_SPIRITMAGE)then
		return {"Icons/spell_holy_prayerofspirit", 
		"The Spirit Mage is a powerful wielder of Arcane magic that is very difficult to master. Spirit Mages have reduced health and damage is dealt to their mana pool. Their kit involves runic magic, trickery, conjuring, randomness, and excellent crowd control.", 8}
	end
	if(class == CLASS_STORMBRINGER)then
		return {"Icons/spell_shaman_thunderstorm", 
		"The Stormbringer commands the very lightning itself, striking down foes with the power of Thorim. A simple and easy to play ranged Nature damage class using a 'Static' resource system in combination with mana.", 8}
	end
	if(class == CLASS_FELMAGE)then
		return {"Icons/spell_fire_felrainoffire", 
		"The Fel Mage is a multiclass that combines Demon Hunter and Pyromancer. To select this class, you must first advance a Demon Hunter and a Pyromancer to the maximum level.", 8}
	end
	if(class == CLASS_DARKRANGER)then
		return {"Icons/ability_theblackarrow", 
		"The Dark Ranger is a multiclass that combines Necromancer and Ranger. To select this class, you must first advance a Necromancer and a Ranger to the maximum level.", 8}
	end
	if(class == CLASS_DEMONHUNTER)then
		return {"Icons/achievement_boss_illidan", 
		"The Demon Hunter is a mobile AoE melee class using the power of the Burning Legion to strike down foes. They build Rage in combat, and upon reaching capacity, will transform into a demon for a short time. A fairly easy to play melee damage class.", 4}
	end
	if(class == CLASS_WITCHHUNTER)then
		return {"Icons/inv_weapon_crossbow_01", 
		"The Witch Hunter is a unique, highly mobile ranged class that uses rage and mana. Witch Hunters are presented with many decisions on the fly that have to be quickly made in order to achieve the most efficient results. They are excellent at kiting enemies. Witch Hunters are fast paced and can be difficult to play.", 4}
	end
	if(class == CLASS_DOOMCALLER)then
		return {"Icons/ability_warlock_eradication", 
		"The Doomcaller is a plate-wearing mage that tears open gateways into the Twisting Nether, bringing forth armies of demons to trample their foes. Doomcallers fuel a large number of their abilities with Void Runes, which are attained during combat", 8}
	end
	if(class == CLASS_TIDECALLER)then
		return {"Icons/spell_frost_summonwaterelemental", 
		"The Tidecaller is a group-oriented healing support class that uses a FOCUS system, granting certain abilities bonus effects when used with full focus.", 5}
	end
	if(class == CLASS_BARD)then
		return {"Icons/inv_holiday_brewfestbuff_01", 
		"The Brewmaster is a resilient, high health mid-range support class that deals mostly physical damage. They use a Focus system that enables empowered versions of some of their abilities.", 5}
	end
	if(class == CLASS_WORGEN)then
		return {"Icons/ability_hunter_pet_wolf", 
		"The Son of Arugal is an assassin class that bounces in and out of Worgen form to deal damage. In Worgen form, this class gains a number of additional melee abilities that consume rage, whereas in mortal form, they have ranged abilities that generate rage. A fairly simple melee damage class.", 4}
	end
	if(class == CLASS_ABOMINATION)then
		return {"Icons/ability_fiegndead", 
		"The Flesh Warden is a sturdy warrior that commands the power of undeath to not only protect and heal itself, but also to cause harm to foes. Flesh Wardens are very sustainable and can last a long time in the heat of a battle. Easy to play but must be micro-managed for maximum effect.", 1}
	end
	if(class == CLASS_STARLORD)then
		return {"Icons/spell_nature_moonglow", 
		"The Starcaller is a magical tank that uses powerful Arcane spells to defend themselves and their allies. With substantially low base health, the Starcaller is defended by a permanent Mana Shield, and use a combination of ranged Arcane magic and melee attacks to slay foes.", 1}
	end
	if(class == CLASS_RANGER)then
		return {"Icons/inv_weapon_bow_02", 
		"The Ranger is a long-ranged sustain damage class specializing in picking off enemies from afar. Simple and easy to play.", 4}
	end
	if(class == CLASS_PYROMANCER)then
		return {"Icons/ability_mage_hotstreak", 
		"The Pyromancer is a ranged Fire damage class using spell combos and micromanagement to incinerate enemies. A complex class with a high skill cap especially in PvP situations.", 8}
	end
	if(class == CLASS_DJINN)then
		return {"Icons/inv_elemental_mote_air01", 
		".", 2}
	end
	if(class == CLASS_SUNDANCER)then
		return {"Icons/spell_holy_searinglightpriest", 
		"The Sun Cleric is a powerful support class that manages an additional resource called Solar Power to empower themselves and their abilities. Through proper management the Sun Cleric can snowball quickly into an efficient Holy healer and side damage dealer. Uses Anubisath magic and the power of the sun.", 5}
	end
	if(class == CLASS_SPIDER)then
		return {"Icons/spell_nature_nullifypoison", 
		"The Disciple of Shadra is devoted to service of the Spider Loa Shadra. This class can take on the form of a Spider to act as an assassin and deal immense Nature damage over time, or remain in mortal form to heal and protect allies with the power of Shadra.", 5}
	end
	if(class == CLASS_TINKER)then
		return {"Icons/inv_misc_gear_01", 
		"The Tinker uses a unique Ammunition system paired with powerful, explosive weaponry and handy gadgets to take down foes. Additionally, Tinkers can construct different mechanical allies to perform different tasks. An interesting and flexible ranged damage dealer class.", 4}
	end
	if(class == CLASS_LION)then
		return {"Icons/inv_throwingknife_07", 
		"The Lion is an agile, Intellect-using ranged class that uses a deadly arsenal of Shurikens, Arcane magic, and the aid of the ancient lion spirit Ra'gar, as a companion, to destroy foes and heal allies.\n\nThis class is ONLY available when BOOSTED. ", 4}
	end
	if(class == CLASS_GUARDIAN)then
		return {"Icons/ability_warrior_shieldreflection", 
		"The Guardian is an expert at protecting their allies from harm through the use of heavy armour, a special mechanic involving support banners, and a sub-resource called Inspiration. Through all of these things and more, the Guardian is a very effective energy-using tank. Steady paced and easy to pick up.", 1}
	end
	if(class == CLASS_CHRONOMANCER)then
		return {"Icons/inv_misc_pocketwatch_01", 
		"The Chronomancer is a heavily utility-focused magic class that alters bends and space using the forces of Order and Chaos to open up possibilities for their allies and destroy their foes. Requires an Enchanted Timepiece.", 8}
	end
	if(class == CLASS_RIFTBLADE)then
		return {"Icons/inv_weapon_shortblade_79", 
		"The Riftblade is a powerful combination of an assassin and a wizard. The ultimate mage-slayer, using subtelty, magical weapon essence, portal magic and cosmic power to defeat foes, especially those who cast spells themselves. A fun and interactive assassin style class that can swiftly take out enemies from the shadows with arcane magic. Excellent versus mages.", 8}
	end
	if(class == CLASS_REAPER)then
		return {"Icons/inv_staff_78", 
		"The Reaper uses health as a primary resource, constantly spending and stealing it to destroy foes and protect allies. Reapers collect the souls of fallen enemies for later use in combat,  in addition to bringing some unique utility to fights, including off-tanking and healing capabilities.", 1}
	end
	if(class == CLASS_SPARTAN)then
		return {"Icons/ability_warrior_shieldbash", 
		"The Spartan is a shield-bearing damage dealer that uses tactical ability combos to defeat foes, using rage and strength plate armour.", 1}
	end
	if(class == CLASS_SAMURAI)then
		return {"Icons/ability_paladin_blessedhands", 
		"The Monk is encouraged to use no weapons, enhancing their fists with Runes of holy magic to destroy foes and protect allies. Monks build Runes with auto attacks which they can use on powerful spells.", 1}
	end
	if(class == CLASS_CULTIST)then
		return {"Icons/achievement_boss_cthun", 
		"The Cultist uses the ancient Eldritch power of the Old Gods to support allies and destroy foes with both weapons and magic. Such power often comes at the cost of your sanity, however.", 5}
	end
	if(class == CLASS_NECROMANCER)then
		return {"Icons/spell_holy_turnundead",
		"The Necromancer commands a legion of undead servants in conjunction with an array of plagues and diseases to overwhelm and destroy foes. Necromancers are a micro-managing class that excel at dealing damage-over-time.", 8}
	end
	if(class == CLASS_GROVEWARDEN)then
		return {"Icons/ability_druid_lacerate",
		"The Wildwalker is a brutal warrior using a combination of animalistic power and life magic to destroy enemies and sustain allies. A simple close-ranged support and healing class with considerable defensive and offensive capabilities.", 5}
	end
	if(class == CLASS_TEMPLAR)then
		return {"Icons/ability_mage_shattershield",
		"HYBRID CLASS: Guardian + Riftblade\nThe Templar is a class that combines the defensive capabilities of a Guardian with the offensive combat-oriented arcane magics of a Riftblade.", 1}
	end
	return {"Icons/inv_misc_questionmark", "Description not found.", 0}
end

function getActiveBoon(unit)
	local boons = {500935, 500939, 500942, 500943, 800137, 800138}
	for i,v in ipairs(boons) do
		if(unit:HasAura(v))then
			return v;
		end
	end
	return 0;
end


function initResources(player, class)
	if(class == CLASS_WORGEN)then
		player:SetPowerType(1)
		player:SetMaxPower(1, 2000)
	end
	if(class == CLASS_DJINN)then
	end
	if(class == CLASS_STORMBRINGER)then
		player:SetPowerType(0)
		player:SetPowerType(5)
		player:SetMaxPower(5, 100)
		player:AddAura(500929, player)
	end
	if(class == CLASS_CULTIST)then
		player:AddAura(500727, player)
	end
	if(class == CLASS_WITCHHUNTER)then
		player:SetPowerType(0)
		player:SetMaxPower(0, 250)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
		if(player:GetPower(0) == 0)then
			setPower(player, 60, 0)
		end
	end
	if(class == CLASS_VALKYRIE)then
		player:SetPowerType(0)
	end
	if(class == CLASS_GROVEWARDEN)then
		player:SetPowerType(0)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1500)
	end
	if(class == CLASS_SPIDER)then
		player:SetPowerType(0)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1500)
	end
	if(class == CLASS_FELMAGE)then
		player:SetPowerType(0)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
	end
	if(class == CLASS_DEMONHUNTER)then
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1500)
	end

	if(class == CLASS_REAPER)then
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
	end

	if(class == CLASS_TIDECALLER)then
		player:SetPowerType(0)
		player:SetPowerType(2)
		player:SetMaxPower(2, 100)
	end

	if(class == CLASS_SAMURAI)then
		player:SetPowerType(5)
		player:SetMaxPower(5, 10)
	end

	if(class == CLASS_STARLORD)then
		player:SetPowerType(0)
		player:SetMaxPower(0, player:GetStat(3) * 10 + player:GetLevel() * 3 + 20)
	end

	if(class == CLASS_BARD)then
		player:SetPowerType(0)
		player:SetMaxPower(0, 250)
		player:SetPowerType(2)
		player:SetMaxPower(2, 250)
	end
	if(class == CLASS_RANGER)then
		player:SetPowerType(2)
		player:SetMaxPower(2, 100)
	end
	if(class == CLASS_DARKRANGER)then
		player:SetPowerType(0)
		player:SetPowerType(6)
		player:SetMaxPower(6, 1000)
	end
	if(class == CLASS_DRAGONKNIGHT)then
		player:SetPowerType(3)
		player:SetMaxPower(3, 120)
	end
	if(class == CLASS_RIFTBLADE)then
		player:SetPowerType(0)
		local maxmana = 450;
		if(player:HasSpell(800666))then
			maxmana = 550;
		else
		end
		player:SetMaxPower(0, maxmana)
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
	end
	if(class == CLASS_TIMEWARDEN)then
			player:SetPowerType(0)
			player:SetPowerType(1)
			player:SetMaxPower(1, 1000)
	end
	if(class == CLASS_SUNDANCER)then
		if(player:HasSpell(800586))then
			player:SetPowerType(0)
			player:SetPowerType(1)
			player:SetMaxPower(1, 1000)
		end
	end
	if(class == CLASS_TINKER)then
		player:SetPowerType(0)
		player:SetMaxPower(0, 400)
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
	end
	if(class == CLASS_GUARDIAN)then
		player:SetPowerType(3)
		player:SetMaxPower(3, 150)
	end
	if(class == CLASS_NECROMANCER)then
		player:SetPowerType(0)
		player:SetPowerType(6)
		player:SetMaxPower(6, 1500)
	end
end

function initClass(player, class)
	if(class == CLASS_DOOMCALLER or class == CLASS_LION)then
		player:KickPlayer()
	end
	player:LearnSpell(801273)
	if(player:GetLevel() >= MAX_LEVEL)then
		player:LearnSpell(801025)
		player:LearnSpell(801179)
		player:LearnSpell(801360)
		player:LearnSpell(801361)
	end
	if(getArchetype(player) == 5)then
		player:LearnSpell(800062)
	end
	player:RemoveSpell(800419)
	player:RemoveSpell(500931) --overload old
	player:LearnSpell(800670) --hp inc
	player:RemoveSpell(500024)
	player:RemoveSpell(500910)
	player:RemoveSpell(800200)
	--player:RemoveSpell(800157)

	player:RemoveSpell(500252)
	player:RemoveSpell(500286)
	player:RemoveSpell(500283)
	player:RemoveSpell(500284)

	player:RemoveSpell(800107)
	player:RemoveSpell(500708)

	player:RemoveSpell(800320) --selflessness

	player:RemoveSpell(800498)
	player:RemoveSpell(500926) -- wow

	player:RemoveSpell(800225) -- old dh
	player:RemoveSpell(800355) -- old dh
	local spells = getSpellsForClass(class)
	for i=1,player:GetLevel() do
		local level_list = spells[i]
		if(level_list ~= nil)then
			for i,v in ipairs(level_list) do
				if(v < 0)then
					player:RemoveSpell(math.abs(v))
				else
					player:LearnSpell(v)
				end
			end
		end
	end

	if(class == CLASS_ABOMINATION)then
		setEnchantVisual(player, player:GetItemByPos(255, 15), 3827)
		setEnchantVisual(player, player:GetItemByPos(255, 16), 3827)
	end
	if(class == CLASS_SPIRITMAGE)then
		local old_spells = {50119, 500121, 500113, 500105, 500106, 500097, 500098, 500099, 500100, 500101, 500102, 500103, 500104, 500095}
		for i,v in ipairs(old_spells) do
			player:RemoveSpell(v)
		end
		if(player:GetLevel() >= 10)then
			if(player:HasSpell(800758))then
				player:RemoveSpell(800757)
			else
				player:LearnSpell(800757)
			end
		end
		if(player:GetLevel() >= 20)then
			local portals = {}
			if(player:IsAlliance())then
				portals = {10059, 11416, 11419, 32266, 49360}
			else
				portals = {11417, 11418, 11420, 32267, 49361}
			end
			for i,v in ipairs(portals) do
				player:LearnSpell(v)
			end
		end
	end
	player:RemoveSpell(33691)
	player:RemoveSpell(28148)
	player:RemoveSpell(53142)
	if(class == CLASS_PYROMANCER)then
		local old_spells = {800128, 800130, 500209, 500210, 500165, 500166, 500138, 500137, 500136, 500133, 500132, 500130}
		for i,v in ipairs(old_spells) do
			player:RemoveSpell(v)
		end
	end
	if(class == CLASS_GUARDIAN)then
		if(player:HasSpell(800701))then
			player:LearnSpell(197)
			player:LearnSpell(199)
			player:LearnSpell(202)
			player:LearnSpell(227)
		else
			player:RemoveSpell(197)
			player:RemoveSpell(199)
			player:RemoveSpell(202)
			player:RemoveSpell(227)
		end
	end
	if(class == CLASS_ABOMINATION)then
		player:LearnSpell(674)
		player:RemoveSpell(197)
		player:RemoveSpell(199)
		player:RemoveSpell(202)
		player:RemoveSpell(227)
	end
	if(player:GetLevel() >= 20)then
		player:LearnSpell(33388)
	end
	if(player:GetLevel() >= 40)then
		player:LearnSpell(33391)
	end
	if(player:GetLevel() >= 60)then
		player:LearnSpell(34090)
	end
	if(player:GetLevel() >= 60)then
		player:LearnSpell(34092)
	end
	if(player:HasSpell(8737))then
		player:SetSkill(413, 1, 1, 1)
	end
	if(player:HasSpell(750))then
		player:SetSkill(293, 1, 1, 1)
	end
	if(player:HasSpell(9077))then
		player:SetSkill(414, 1, 1, 1)
	end
	if(player:HasSpell(9078))then
		player:SetSkill(415, 1, 1, 1)
	end
	player:RemoveSpell(800033)
	player:RemoveSpell(800349)
	player:RemoveSpell(668)
	player:RemoveSpell(669)
	player:LearnSpell(668)
	player:LearnSpell(700000)
	player:CastSpell(player, 700000, true)
	player:LearnSpell(800040)
	if(class == CLASS_WORGEN)then
		player:SetPowerType(1)
		player:SetMaxPower(1, 2000)
	end
	if(class == CLASS_DJINN)then
		local entry = 1469;
		local main = player:GetEquippedItemBySlot(15)
		if(main ~= nil)then
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then
			SetFakeEntry(off, entry)
		end
		local helm = player:GetEquippedItemBySlot(0)
		if(helm~=nil)then
			local entry = 21517;
			SetFakeEntry(helm, entry)
		end
	end
	if(class == CLASS_STORMBRINGER)then
		player:SetPowerType(0)
		player:SetPowerType(5)
		player:SetMaxPower(5, 100)
		player:AddAura(500929, player)
	end
	if(class == CLASS_CULTIST)then
		player:LearnSpell(51885)
		player:CastSpell(player, 51885, true)
		player:RemoveSpell(500717)
		player:AddAura(500727, player)
	end
	if(class == CLASS_WITCHHUNTER)then
		player:SetPowerType(0)
		player:SetMaxPower(0, 250)
		if(player:GetPower(0) == 0)then
			setPower(player, 250, 0)
		end
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
		local main = player:GetEquippedItemBySlot(15)
		if(main ~= nil)then
			local entry = 100001;
			if(main:GetSubClass() == 15)then
				entry = 100000;
			end
			if(player:GetLevel() >= 20)then
				entry = 100006;
			end
			local ranged = player:GetEquippedItemBySlot(17)
			if(ranged ~= nil)then
				if(ranged:GetSubClass() == 18 or ranged:GetSubClass() == 17)then
					entry = ranged:GetEntry()
				end
			end
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		
		if(off ~= nil)then
			local entry = 100001;
			if(off:GetSubClass() == 15)then
				entry = 100000;
			end
			if(player:GetLevel() >= 20)then
				entry = 100006;
			end
			local ranged = player:GetEquippedItemBySlot(17)
			if(ranged ~= nil)then
				if(ranged:GetSubClass() == 18 or ranged:GetSubClass() == 17)then
					entry = ranged:GetEntry()
				end
			end
			SetFakeEntry(off, entry)
		end
	end
	if(class == CLASS_LION)then
		if(player:GetPhaseMask() == 1 and player:GetLevel() > 1 and player:GetLevel() < 70)then
			player:SetLevel(70)
			player:SendBroadcastMessage("White Lions can no longer be played below level 70. Because of this, you have been boosted to level 70.")
		end
		player:CastSpell(player, 800532, true)
		player:SetPowerType(0)
		local main = player:GetEquippedItemBySlot(15)
		if(main ~= nil)then
			local entry = 28826;
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then
			local entry = 28826;
			SetFakeEntry(off, entry)
		end
		local helm = player:GetEquippedItemBySlot(0)
		if(helm~=nil)then
			local entry = 22478;
			SetFakeEntry(helm, entry)
		end
	end
	if(class == CLASS_VALKYRIE)then
		player:SetPowerType(0)
		
	end
	if(class == CLASS_GROVEWARDEN)then
		player:SetPowerType(0)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1500)
	end
	if(class == CLASS_SPIDER)then
		player:SetPowerType(0)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1500)

		local main = player:GetEquippedItemBySlot(15)
		if(main ~= nil)then
			local entry = 0;
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then
			local entry = 0;
			SetFakeEntry(off, entry)
		end
	end
	if(class == CLASS_FELMAGE)then
		player:SetPowerType(0)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
	end
	if(class == CLASS_DEMONHUNTER)then
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1500)
		player:RemoveSpell(800222)
		player:LearnSpell(800222)
		player:CastSpell(player, 800222, true)

		local main = player:GetEquippedItemBySlot(15)
		
		if(main ~= nil)then
			local entry = 100003;
			if(main:GetSubClass() == 15)then
				entry = 100002;
			end
			if(player:HasItem(100416, 1))then
				entry = 100005;
			end
			if(player:HasItem(100415, 1))then
				entry = 29419;
			end
			if(player:HasItem(100417, 1))then
				entry = 32837;
			end
			if(player:HasItem(8120268, 1))then
				entry = 8120268;
			end
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then
			local entry = 100003;
			if(off:GetSubClass() == 15)then
				entry = 100002;
			end
			if(player:HasItem(100416, 1))then
				entry = 100004;
			end
			if(player:HasItem(100415, 1))then
				entry = 29419;
			end
			if(player:HasItem(100417, 1))then
				entry = 32838;
			end
			if(player:HasItem(8120268, 1))then
				entry = 8120268;
			end
			SetFakeEntry(off, entry)
		end
		local chest = player:GetEquippedItemBySlot(4)
		if(chest~=nil)then
			SetFakeEntry(chest, 100408)
		else
			local shirt = player:GetEquippedItemBySlot(3)
			SetFakeEntry(shirt, 100408)
		end
		local helm = player:GetEquippedItemBySlot(0)
		if(helm~=nil)then
			SetFakeEntry(helm, 3536)
		end
	end

	if(class == CLASS_REAPER)then
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
		player:LearnSpell(800338)
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then --dual wield
			local entry = 100008;
			SetFakeEntry(off, entry)

			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				SetFakeEntry(main, entry)
			end
			--player:RemoveAura(500374)
		else --2h
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 25226;
				if(player:HasItem(600102))then
					entry = 600102;
				end
				SetFakeEntry(main, entry)
			end
			--player:AddAura(500374, player):SetStackAmount(1)
		end
	end

	if(class == CLASS_TIDECALLER)then
		player:SetPowerType(0)
		player:SetPowerType(2)
		player:SetMaxPower(2, 100)
		player:AddAura(800391, player)

		local main = player:GetEquippedItemBySlot(15)

		if(main ~= nil)then
			local entry = 25237;
			if(player:HasItem(900009))then
				entry = 30830;
			end
			if(player:HasItem(900010))then
				entry = 37461;
			end
			if(player:HasItem(900011))then
				entry = 36599;
			end
			SetFakeEntry(main, entry)
		end

		local off = player:GetEquippedItemBySlot(16)

		if(off ~= nil)then
			local entry = 25093;
			SetFakeEntry(off, entry)
		end
	end

	if(class == CLASS_WITCHDOCTOR)then
		player:RemoveAura(75214)
		local helm = player:GetEquippedItemBySlot(0)
		if(helm~=nil)then
			local entry = 8201;
			if(player:HasItem(900014))then
				entry = 27414;
			end
			if(player:HasItem(900015))then
				entry = 33327;
			end
			if(player:HasItem(900016))then
				entry = 33286;
			end
			if(player:HasItem(900017))then
				entry = 46860;
			end
			SetFakeEntry(helm, entry)
		end
	end

	if(class == CLASS_SAMURAI)then
		player:RemoveSpell(8737)
		player:RemoveSpell(750)
		player:RemoveSpell(9077)
		player:SetSkill(414, 0, 0, 0)
		player:SetSkill(413, 0, 0, 0)
		player:SetSkill(293, 0, 0, 0)
		player:RemoveSpell(196)
		player:RemoveSpell(197)
		player:RemoveSpell(198)
		player:RemoveSpell(199)
		player:RemoveSpell(201)
		player:RemoveSpell(202)
		player:RemoveSpell(9116)
		player:RemoveSpell(800124)
		player:RemoveSpell(500683)
		player:RemoveSpell(800519)
		player:RemoveSpell(800520)
		player:RemoveSpell(800521)
		player:RemoveSpell(800522)
		player:RemoveSpell(500681)
		player:RemoveSpell(500682)
		player:RemoveSpell(800419)
		player:RemoveSpell(500035)
		player:RemoveSpell(500033)
		player:RemoveSpell(800766)
		player:RemoveSpell(800760)
		player:RemoveSpell(800761)
		player:RemoveSpell(800762)
		player:RemoveSpell(500685)
		player:RemoveSpell(500034)
		player:RemoveSpell(800425)
		player:RemoveSpell(500679)
		player:RemoveSpell(801454)
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then --dual wield
			local entry = 12535;
			if(entry > 0)then
				SetFakeEntry(off, entry)
			end
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil and entry > 0)then
				SetFakeEntry(main, entry)
			end
		else --2h
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 0;
				if(main:GetSubClass() == 10)then
					entry = 89580;
				end
				if(entry > 0)then
					SetFakeEntry(main, entry)
				end
			end
		end
		player:RemoveSpell(8737)
		player:RemoveSpell(750)
		player:RemoveSpell(9077)
	end

	if(class == CLASS_STARLORD)then
		player:SetPowerType(0)
		player:SetMaxPower(0, player:GetStat(3) * 10 + player:GetLevel() * 3 + 20)
	end

	if(class == CLASS_BARD)then
		player:SetPowerType(0)
		player:SetMaxPower(0, 250)
		player:SetPowerType(2)
		player:SetMaxPower(2, 250)

		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then --dual wield
			local entry = 15972;
			SetFakeEntry(off, entry)

			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				SetFakeEntry(main, entry)
			end
		else --2h
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 15972;
				SetFakeEntry(main, entry)
			end
		end
	end
	if(class == CLASS_RANGER)then
		player:LearnSpell(264)
		player:LearnSpell(5011)
		player:SetPowerType(2)
		player:SetMaxPower(2, 100)
	end
	if(class == CLASS_DARKRANGER)then
		player:LearnSpell(264)
		player:LearnSpell(5011)

		player:SetPowerType(0)
		player:SetPowerType(6)
		player:SetMaxPower(6, 1000)
	end
	if(class == CLASS_DRAGONKNIGHT)then
		player:SetPowerType(3)
		player:SetMaxPower(3, 120)
	end
	if(class == CLASS_RIFTBLADE)then
		player:LearnSpell(674)
		player:LearnSpell(1180)
		player:LearnSpell(227)
		player:LearnSpell(201)
		player:SetPowerType(0)
		local maxmana = 450;
		local entry = 40386;
		if(player:HasSpell(800666))then
			player:LearnSpell(800668)
			player:LearnSpell(800667)
			player:LearnSpell(801117)
			player:LearnSpell(801118)
			player:RemoveSpell(500251)
			player:RemoveSpell(500267)
			player:RemoveSpell(801087)
			player:RemoveSpell(801091)
			entry = 42484;
			maxmana = 550;
		else
			player:RemoveSpell(800668)
			player:RemoveSpell(800667)
			player:LearnSpell(500251)
			player:LearnSpell(500267)
			player:LearnSpell(801087)
			player:LearnSpell(801091)
			player:RemoveSpell(801117)
			player:RemoveSpell(801118)
		end
		player:SetMaxPower(0, maxmana)
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)

		local main = player:GetEquippedItemBySlot(15)
		

		if(main ~= nil)then
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then
			SetFakeEntry(off, entry)
		end
	end
	if(class == CLASS_TIMEWARDEN)then
		player:LearnSpell(199)
		player:LearnSpell(198)
			player:SetPowerType(0)
			player:SetPowerType(1)
			player:SetMaxPower(1, 1000)
			local helm = player:GetEquippedItemBySlot(0)
			if(helm~=nil)then
				SetFakeEntry(helm, 71356)
			end
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				entry = 77214;
				SetFakeEntry(main, entry)
			end
			local off = player:GetEquippedItemBySlot(16)
			if(off ~= nil)then
				local entry = 77227;
				SetFakeEntry(off, entry)
			end
	end
	if(class == CLASS_SUNDANCER)then
		player:LearnSpell(199)
		player:LearnSpell(198)
		if(player:HasSpell(800586))then
			player:SetPowerType(0)
			player:SetPowerType(1)
			player:SetMaxPower(1, 1000)
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 19167;
				if(player:HasItem(900013))then
					entry = 45049;
				end
				SetFakeEntry(main, entry)
			end
			local off = player:GetEquippedItemBySlot(16)
			if(off ~= nil)then
				local entry = 45682;
				SetFakeEntry(off, entry)
			end
		end
		local valk_spells = {
			9116,750,196,201,800654,800626,800625,800624,800622,800621,800617,800614,800612,800611,800610,800455,800054,107,3124,81,801180
		}
		if(player:HasSpell(800586))then
			for i,v in ipairs(valk_spells) do
				player:LearnSpell(v)
			end
			player:RemoveSpell(200)
			player:RemoveSpell(227)
			player:RemoveSpell(199)
			player:RemoveSpell(197)
			player:RemoveSpell(800357)
		else
			for i,v in ipairs(valk_spells) do
				player:RemoveSpell(v)
			end
			player:LearnSpell(200)
			player:LearnSpell(227)
			player:LearnSpell(199)
			player:LearnSpell(197)
		end
	end
	if(class == CLASS_TINKER)then
		player:SetPowerType(0)
		player:SetMaxPower(0, 400)
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
	end
	if(class == CLASS_GUARDIAN)then
		player:SetPowerType(3)
		player:SetMaxPower(3, 150)
	end
	if(class == CLASS_NECROMANCER)then
		player:SetPowerType(0)
		player:SetPowerType(6)
		player:SetMaxPower(6, 1500)
	end
	if(this == CLASS_ABOMINATION)then
		player:RemoveSpell(202)
		player:RemoveSpell(197)
		player:RemoveSpell(199)
	end
	checkForRewards(player)
	if(player:HasSpell(9077))then
		local skill_id = 414
		local max = player:GetMaxSkillValue(skill_id)
		player:SetSkill(skill_id, 999, max, max)
	end
	if(player:HasSpell(8737))then
		local skill_id = 413
		local max = player:GetMaxSkillValue(skill_id)
		player:SetSkill(skill_id, 999, max, max)
	end
	if(player:HasSpell(750))then
		local skill_id = 293
		local max = player:GetMaxSkillValue(skill_id)
		player:SetSkill(skill_id, 999, max, max)
	end
	initResources(player, class)
end

function getArchetype(player)
	local pclass = getClassID(player)
	if(pclass ~= 0)then
		return getInfoForClass(pclass)[2]
	else
		return 0
	end
end

function doSkillUpdate(player, skill)
	local amt = 1;
	if(skill == 99 or skill == 109)then
		amt = 1;
	else
		amt = 300;
	end
	player:SetSkill(skill, amt, amt, amt)
	player:AdvanceSkill(skill, amt)
end

function getMaxLifeForce(player)
	local ret = 2 + player:GetLevel();
	if(ret > 10)then
		ret = 10;
	end
	return 0;
end

function getMulticlassRequirements(class)
	if(class == CLASS_DARKRANGER)then
		return {CLASS_NECROMANCER, CLASS_RANGER}
	end
	if(class == CLASS_FELMAGE)then
		return {CLASS_PYROMANCER, CLASS_DEMONHUNTER}
	end
	if(class == CLASS_TIMEWARDEN)then
		return {CLASS_CHRONOMANCER, CLASS_SUNDANCER}
	end
	return nil;
end


function hasClassOfLevel(player, classID, level)
	local qry = AuthDBQuery("SELECT level FROM character_logs WHERE account = "..player:GetAccountId().." AND classID = "..classID)
	if(qry ~= nil)then
		return (qry:GetUInt32(0) >= level)
	else
		return false;
	end
	return false;
end

function On_Login(event, player)
	player:RemoveAura(801382)
	player:RemoveAura(801381)
	player:RemoveAura(801387)
	player:RemoveAura(801388)
	player:RemoveAura(65985)

	player:LearnSpell(801348)
	player:LearnSpell(801349)
	AuthDBQuery("INSERT INTO character_logs VALUES ("..(player:GetAccountId())..", "..(player:GetGUIDLow())..", "..(getClassID(player))..", "..(player:GetLevel())..")")
	AuthDBQuery("UPDATE character_logs SET level = "..player:GetLevel().." WHERE account = "..player:GetAccountId().." AND GUID = "..player:GetGUIDLow())
	AuthDBQuery("UPDATE character_logs SET classID = "..(getClassID(player)).." WHERE account = "..player:GetAccountId().." AND GUID = "..player:GetGUIDLow())
	checkTalents(player)
	if(player:GetAccountId() <= 350)then
		player:LearnSpell(500973)
	end
	player:LearnSpell(1804)
	player:LearnSpell(800645)

	player:RemoveSpell(500925)
	local allow = false
	for i=0,25 do
		if(isAllowed(player, i))then
			allow = true
		end
	end

	local banned_spells = {
		500022, --flesh reg
		71, --defensive stance
		2458, --berserker stance
		800450, --doomhowl
		800469, --ritual
		800475, --ritual
		800476, --ritual		
		7386, --ritual		
		355, --taunt		
		2458, --zerk stance		
		800437, --death watcher		
	}
	

	if(allow == false)then
		player:KickPlayer()
	end

	checkForRewards(player)

	player:LearnSpell(668)
	player:LearnSpell(669)

	doSkillUpdate(player, 98)
	doSkillUpdate(player, 109)

	player:RemoveSpell(2457)
	player:RemoveSpell(78)
	player:RemoveSpell(6673)
	player:RemoveSpell(133)
	player:RemoveSpell(168)
	player:RemoveSpell(1752)
	player:RemoveSpell(2098)
	player:RemoveSpell(585)
	player:RemoveSpell(2050)

	local playerclass = getClassID(player)


	local classSpells = getSpellsForClass(playerclass)
	if(getMulticlassRequirements(playerclass) == nil)then
		for i=1,35 do
			if(i ~= playerclass and i ~= CLASS_DOOMCALLER)then
				local c = getSpellsForClass(i)
				local should_ban = true
				local mcr = getMulticlassRequirements(i)
				if(mcr ~= nil)then
					should_ban = false
				end
				if(c ~= {} and should_ban)then
					for i=1,80 do
						local v = c[i]
						if(v ~= nil)then
							for j,s in ipairs(v) do
								if(s ~= nil)then
									if(s > 0)then
										local rem = true
										for o=1,80 do
											local o1 = classSpells[o]
											if(o1 ~= nil)then
												for x,z in ipairs(o1) do
													if(z ~= nil)then
														if(z == s and z > 0)then
															rem = false
														end
													end
												end
											end
										end
										if(rem == true)then
											player:RemoveSpell(s)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	initClass(player, playerclass)
	for i,v in ipairs(banned_spells) do
		player:RemoveSpell(banned_spells[i])
	end

	local title = getClassTitle(player)
	if(title > 0)then
		player:SetKnownTitle(title)
	end

	if(getClassID(player) == 0 and player:GetLevel() <= 2)then
		player:SetPhaseMask(2)
		player:RemoveItem(6948, 1)
		player:AddQuest(500000)
	end
	craterSpellUpdate(player)

	local training = player:AddAura(500314, player)
	training:SetStackAmount(player:GetLevel())

end

function craterSpellUpdate(player)
	local pfac = 85
	if(player:IsAlliance())then
		pfac = 11;
	end
	local qry1 = WorldDBQuery("SELECT owner FROM outposts WHERE GUID = "..OUTPOST_FURBOLG)
	if(qry1~=nil)then
		local newspell = 801252
		local f = qry1:GetUInt32(0)
		if(f == pfac)then
			if(player:GetLevel() >= MAX_LEVEL)then
				player:LearnSpell(newspell)
			end
		else
			player:RemoveSpell(newspell)
		end
	end
	local qry2 = WorldDBQuery("SELECT owner FROM outposts WHERE GUID = "..OUTPOST_NAGA)
	if(qry2~=nil)then
		local newspell = 801253
		local f = qry2:GetUInt32(0)
		if(f == pfac)then
			if(player:GetLevel() >= MAX_LEVEL)then
				player:LearnSpell(newspell)
			end
		else
			player:RemoveSpell(newspell)
		end
	end
	local qry3 = WorldDBQuery("SELECT owner FROM outposts WHERE GUID = "..OUTPOST_SATYR)
	if(qry3~=nil)then
		local newspell = 801256
		local f = qry3:GetUInt32(0)
		if(f == pfac)then
			if(player:GetLevel() >= MAX_LEVEL)then
				player:LearnSpell(newspell)
			end
		else
			player:RemoveSpell(newspell)
		end
	end
	local qry4 = WorldDBQuery("SELECT owner FROM outposts WHERE GUID = "..OUTPOST_MANA)
	if(qry4~=nil)then
		local newspell = 801257
		local f = qry4:GetUInt32(0)
		if(f == pfac)then
			if(player:GetLevel() >= MAX_LEVEL)then
				player:LearnSpell(newspell)
			end
		else
			player:RemoveSpell(newspell)
		end
	end
	local newspell = 801259
	local f = 11
	if(f == pfac)then
		if(player:GetLevel() >= MAX_LEVEL)then
			player:LearnSpell(newspell)
		end
	else
		player:RemoveSpell(newspell)
	end
	local newspell = 801260
	local f = 85
	if(f == pfac)then
		if(player:GetLevel() >= MAX_LEVEL)then
			player:LearnSpell(newspell)
		end
	else
		player:RemoveSpell(newspell)
	end
end

function updateItemVisual(player, item, bag, slot)
	local pGUID = player:GetGUIDLow()
	local iGUID = item:GetGUIDLow()
	local useOutfit = false
	local qry = WorldDBQuery("SELECT id FROM equipped_outfit WHERE GUID = "..pGUID)
	if(qry ~= nil)then
		local outfit = qry:GetUInt32(0)
		if(outfit > 0)then
			qry = WorldDBQuery("SELECT value FROM outfit WHERE GUID = "..pGUID.." AND slot = "..(item:GetInventoryType()).." AND id = "..outfit)
			if(qry ~= nil)then
				local newitem = qry:GetUInt32(0)
				SetFakeEntry(item, newitem)
				useOutfit = true
			end
		end
	end
	if(useOutfit == false)then
		qry = CharDBQuery("SELECT fake FROM automogs WHERE GUID = "..iGUID)
		if(qry ~= nil)then
			SetFakeEntry(item, qry:GetUInt32(0))
		end
	end
end

function equip(event, player, item, bag, slot)
	updateItemVisual(player, item, bag, slot)
	initClass(player, getClassID(player))
	if(getClassID(player) == CLASS_REAPER)then
		if(player:HasAura(800797))then
			player:RemoveAura(800797)
		end
		if(player:IsInCombat())then
			player:AddAura(801338, player)
			player:SendBroadcastMessage("Changing weapons in combat will make you Lethargic.")
		end
	end
	--[[if(getClassID(player) == CLASS_SAMURAI)then
		local slot = item:GetInventoryType()
		if(slot == 5 or slot == 8 or slot == 16 or slot == 17 or slot == 18)then
			player:SendBroadcastMessage("You cannot equip items in this slot.")
			local enchs = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
			for i=1,8 do
				local e = 0
				if(item:GetEnchantmentId(i) ~= nil)then
					e = item:GetEnchantmentId(i)
				end
				if(e > 0)then
					enchs[i] = item:GetEnchantmentId(i)
				end
			end
			player:RemoveItem(item, 1)
			local newitem = player:AddItem(item, 1)
			for i,v in ipairs(enchs) do
				if(v > 0)then
					newitem:SetEnchantment(v, i)
				end
			end
		end
	end]]
	initResources(player, getClassID(player))
end

function enterMap(event, player)
	local training = player:AddAura(500314, player)
	training:SetStackAmount(player:GetLevel())


	--[[for i=1,10 do
		--player:SetStat(i, 10000)
	end
	if(player:GetMap():IsDungeon())then
		local firstPlayer = true
		if(player:IsInGroup())then
			for i,v in ipairs(player:GetGroup():GetMembers()) do
				if(player:GetMapId() == v:GetMapId())then
					firstPlayer = false;
					break;
				end	
			end
		end
		if(firstPlayer)then
			local meanLevel = 0;
			if(player:IsInGroup())then
				for i,v in ipairs(player:GetGroup():GetMembers()) do
					meanLevel = meanLevel + v:GetLevel()
				end
				meanLevel = meanLevel / player:GetGroup():GetMembersCount()
			else
				meanLevel = player:GetLevel()
			end
			local creaturesInMap = player:GetCreaturesInRange(5000)
			local level = getDungeonMobLevelForPlayerLevel(meanLevel)
			for i,v in ipairs(creaturesInMap) do
				updateMobLevel(v, level)
			end
		end
	end]]
	if(player:GetMap():IsDungeon())then
		if(player:HasAura(801025))then
			local valid = false
			if(player:IsInGroup())then
				if(player == player:GetGroup():GetLeader())then
					valid = true
				else
					player:SendBroadcastMessage("You must wait for your party leader before you can start this Mythic Dungeon.")
				end
			else
				valid = true
			end
			if(valid)then
				local x, y, z, o = player:GetLocation()
				local stone = player:SpawnCreature(50385, x, y, z, o)
				stone:SendUnitSay("Heroes, if you wish to start this content as Mythic, speak with me!", 0)
			end
		end
	end
end

function checkForRewards(player)
    local resid = WorldDBQuery("SELECT reward, rewardType, claimed from account_rewards where accountName='" .. player:GetAccountName() .. "'")
    if(resid) then
        repeat
            id = resid:GetUInt32(0)
            t = resid:GetUInt32(1)
            c = resid:GetUInt32(2)
            if(t == 0)then
            	player:LearnSpell(id)
            end
            if(t == 2)then
            	player:SetKnownTitle(id)
            end
            if(t == 1 and c == 0)then
            	player:AddItem(id)
            	WorldDBQuery("UPDATE account_rewards SET claimed = 1 WHERE reward = '"..id.."' AND accountName = '"..player:GetAccountName().."'")
            end
        until not resid:NextRow()
    end
end

function warprift_port(i, ii, iii, creature)
	local x, y, z = creature:GetLocation()
	creature:GetOwner():Teleport(creature:GetMapId(), x, y, z, creature:GetO())
	creature:GetOwner():CastSpell(creature:GetOwner(), 64446, true)
	creature:DespawnOrUnsummon()
end

function monk_monastic(i, ii, iii, player)
	local tar = player:GetSelection()
	if(tar:HasAura(500682))then
		local base = player:GetMaxPower(1) - (player:GetMaxPower(1) - player:GetPower(1))
		local dmg = (player:GetLevel() + player:GetStat(1) + math.random(3)) / 5 * (base / 25)
		player:DealDamage(tar, dmg, false, 4)
		player:DealHeal(player, 500682, dmg)
	end
end

function updateWorgenDuration(i, ii, iii, player)
			local worg_aura = player:GetAura(500122)

	if(player:HasSpell(800157))then
		player:RemoveAura(500122)
		player:SendBroadcastMessage("The curse is already active.")
	else
		local rage = player:GetPower(1) / 10
		worg_aura:SetDuration(1000 * (rage / 4.5))
		player:AddAura(48594, player)
		setPower(player, 0, 1)
	end
end

function stealMana(host, target, stolen)
	setPower(host, host:GetPower(0) + stolen, 0)
	local tp = target:GetPower(0)
	if(tp > 0)then
		if(tp > stolen)then
			setPower(target, tp - stolen, 0)
		else
			setPower(target, 0, 0)
		end
	end
end

function getLifeForceCostForMinion(id)
	if(id == 500327 or id == 50065)then --skele
		return 1;
	end
	if(id == 500328 or id == 50073)then --bloodfiend
		return 2;
	end
	if(id == 500329 or id == 50069)then --plague monster
		return 4;
	end
	if(id == 500330 or id == 50077)then --frost lich
		return 5;
	end
	if(id == 500331 or id == 50075)then --grave mage
		return 3;
	end
	if(id == 500332 or id == 50067)then --skeletal commander
		return 4;
	end
	if(id == 500333 or id == 50071)then --rot walker
		return 2;
	end
	if(id == 500334 or id == 50074)then --terror walker
		return 4;
	end
	if(id == 500335 or id == 50068)then --flesh golem
		return 5;
	end
	if(id == 500336 or id == 50066)then --putrid monstrosity
		return 5;
	end
	if(id == 500337 or id == 50070)then --skeletal horror
		return 5;
	end
	return 0;
end

function getAbsoluteDifference(n1, n2)
	return math.abs(n1-n2)
end

function awardToGroup(player, item, amt)
	local party = player:GetGroup()
	for i,v in ipairs(party:GetMembers()) do
		v:AddItem(item, amt)
		v:SendBroadcastMessage(">> You gain "..amt.." x "..GetItemLink(item).."! <<")
	end
end

function awardToGroup(player, item, amt, range)
	local party = player:GetGroup()
	if(party ~= nil)then
		for i,v in ipairs(party:GetMembers()) do
			if(v:GetDistance(player) <= range)then
				v:AddItem(item, amt)
				v:SendBroadcastMessage(">> You gain "..amt.." x "..GetItemLink(item).."! <<")
			end
		end
	else
		player:AddItem(item, amt)
		player:SendBroadcastMessage(">> You gain "..amt.." x "..GetItemLink(item).."! <<")
	end
end

function awardToAllies(player, item, amt, range)
	local party = player:GetPlayersInRange(range)
	for i,v in ipairs(party) do
		if((v:IsAlliance() and player:IsAlliance()) or (v:IsHorde() and player:IsHorde()))then
			v:AddItem(item, amt)
			v:SendBroadcastMessage(">> You gain "..amt.." x "..GetItemLink(item).."! <<")
		end
	end
end

function killedByCreature(event, killer, killed)
	if(killed:GetMapId() == 37)then
		if(killed:IsAlliance())then
			killed:Teleport(37, 825.856, 116.09, 269.33, 0)
		else
			killed:Teleport(37, 5.6, 556.874, 283.112, 0)
		end
		killed:ResurrectPlayer(10)
	end
	if(killed:HasAura(500981))then
		killed:ResurrectPlayer(killed, 30)
		killed:RemoveAura(500981)
	end
end

RegisterPlayerEvent(8, killedByCreature)

function killPlayer(event, killer, killed)
	if(killer:GetMapId() == 37)then
		if(killed:HasItem(900005, 5))then
			killer:AddItem(900005, 5)
			killed:RemoveItem(900005, 5)
		end
	end
	if(killed:GetMapId() == 37)then
		if(killed:IsAlliance())then
			killed:Teleport(37, 825.856, 116.09, 269.33, 0)
		else
			killed:Teleport(37, 5.6, 556.874, 283.112, 0)
		end
		killed:ResurrectPlayer(10)
	end
	if(killed:HasAura(500981))then
		killed:ResurrectPlayer(killed, 30)
		killed:RemoveAura(500981)
	end
	if(killer:HasAura(801356))then
		local stolen = 0
		if(killed:HasAura(801358))then
			stolen = killed:GetAura(801358):GetStackAmount()
			killed:RemoveAura(801358)
		end
		awardRaidPoints(killer, stolen / 2)
		sendTownraidMessage(killer, killer:GetName().." has slain "..killed:GetName()..", stealing "..stolen.." Raid Points!")
	end
end

RegisterPlayerEvent(6, killPlayer)

function awardRaidPoints(player, amt)
	local near = player:GetPlayersInRange(500, 2)
	local area = getAreaId(player)
	player:SendBroadcastMessage("You have earned "..amt.." Raid Points for your town raid!")
	if(player:HasAura(801358))then
		local aura = player:GetAura(801358)
		if(aura:GetStackAmount() + amt <= 255)then
			aura:SetStackAmount(aura:GetStackAmount() + amt)
		else
			aura:SetStackAmount(255)
		end
	else
		player:AddAura(801358, player):SetStackAmount(amt)
	end
	player:GetAura(801358):SetMaxDuration(1000 * 60 * 15)
	player:GetAura(801358):SetDuration(1000 * 60 * 15)
	for i,v in ipairs(near) do
		if(getAreaId(v) == area and v:HasAura(801356) and ((player:IsAlliance() and v:IsAlliance()) or player:IsHorde() and v:IsHorde()))then
			v:SendBroadcastMessage(player:GetName().." has earned "..amt.." Raid Points for your town raid!")
			if(v:HasAura(801358))then
				local aura = v:GetAura(801358)
				aura:SetStackAmount(aura:GetStackAmount() + amt)
			else
				v:AddAura(801358, v):SetStackAmount(amt)
			end
			v:GetAura(801358):SetMaxDuration(1000 * 60 * 15)
			v:GetAura(801358):SetDuration(1000 * 60 * 15)
		end
	end
end

function winTownRaid(player)
	awardRaidPoints(player, 75)
	local nearplayers = player:GetPlayersInRange(533)
	for i,v in ipairs(nearplayers) do
		if(v:HasAura(801356))then
			awardTownRaid(v)
			v:CastSpell(v, 47292, true)
		end
	end
	player:CastSpell(player, 47292, true)
	local nearest = awardTownRaid(player)
	raid_end(nil, nil, nil, nearest)
	player:SendBroadcastMessage("Interact with the Town Raid Starter to claim your rewards.")
end

function awardTownRaid(player)
	local x, y, z = player:GetLocation()
	local temp = player:SpawnCreature(50398, x, y, z, 0, 1, 1000)
	temp:SetPhaseMask(1)
	local nearest = temp:GetNearestCreature(533, 50384)
	--player:SetPhaseMask(2)
	if(nearest == nil)then
		nearest = temp:GetNearestCreature(533, 50399)
	end
	if(nearest ~= nil)then
		nearest:AddAura(801364, nearest)
		nearest:RemoveEvents()
		nearest:RemoveAura(801357)
		return nearest;
	end
	return nil;
end

function killCreature(event, killer, killed)
	if(killer:HasSpell(801185))then
		killer:CastCustomSpell(killer, 801186, true)
	end
	if(killer:HasAura(801356) and killer:IsHonorOrXPTarget(killed))then
		awardRaidPoints(killer, math.random(3))
		local left = countMobsLeft(killer)
		if(left <= 0)then
			local buildings = countBuildingsLeft(killer)
			if(buildings <= 0)then
				local facname = "Horde"
				if(killer:IsAlliance())then
					facname = "Alliance"
				end
				sendTownraidMessage(killer, "The town's buildings are ablaze, and its residents are slain. The day is won for The "..facname.."!")
				winTownRaid(killer)
			else
				sendTownraidMessage(killer, "All of the town's residents have been slain! Destroy "..buildings.." more buildings to achieve victory.")
			end
		else
			sendTownraidMessage(killer, (killer:GetName().." has slain a town resident! Only "..left.." residents remain alive!"))
		end
	end
	local entry = killed:GetEntry()
	if(getClassID(killer) == CLASS_REAPER)then
		killer:AddAura(500363, killer)
	end
	if(killer:HasSpell(801318))then
		killer:CastCustomSpell(killer, 500970, true)
	end
	if(killer:GetMapId() == 37 and killer:GetLevel() >= MAX_LEVEL)then
		local points = math.random(3)
		local ride = false
		local id = killed:GetEntry()
		if(id == 50346)then --bleakbranch
			awardToAllies(killer, 900005, 15, 500)
		end
		if(id == 50336)then --koromos
			awardToAllies(killer, 900005, 15, 500)
		end
		if(id == 50337)then --frostlord
			awardToAllies(killer, 900005, 15, 500)
		end
		if(id == 50265)then --jomoroth
			awardToAllies(killer, 900005, 15, 500)
		end
		if(killer:IsAlliance() and (ride or killed:GetFaction() == 2 or killed:GetFaction() == 85))then
			killer:AddItem(900005, points)
			killer:SendBroadcastMessage("You gain "..points.." x "..GetItemLink(900005))
		end
		if(killer:IsHorde() and (ride or killed:GetFaction() == 1 or killed:GetFaction() == 11))then
			killer:AddItem(900005, points)
			killer:SendBroadcastMessage("You gain "..points.." x "..GetItemLink(900005))
		end
	end

	if(killer:HasAura(800813))then
		local aura = killer:GetAura(800813)
		aura:SetDuration(aura:GetDuration() + 4500)
		if(aura:GetDuration() >= 12000)then
			player:AddAura(800820)
		end
	end

	if(getClassID(killer) == CLASS_NECROMANCER)then
		setPower(killer, killer:GetPower(6) + 300, 6)
	end

	if(killed:GetCreatureType() == 1)then
		if(killer:HasSpell(800267) and math.abs(killed:GetLevel() - killer:GetLevel()) <= 3)then
			killer:AddAura(800273, killer)
		end
	end

	if(killer:HasAura(500313))then
		range = 12;
			x = killed:GetX();
            y = killed:GetY();
            z = killed:GetZ();
            o = killed:GetO();
		 local flesh = killer:SpawnCreature(50082, x + (math.random(range) - math.random(range)), y + (math.random(range) - math.random(range)), z + 1, o, 8, 0);
		 flesh:SetOwnerGUID(killer:GetGUID())
		 flesh:CastSpell(flesh, 56840, true)
		 flesh:CastSpell(flesh, 46767, true)
		 killed:CastSpell(flesh, 72313, true)
	end

	if(getAbsoluteDifference(killer:GetLevel(), killed:GetLevel()) <= 5)then
		if(killer:GetMap():IsDungeon())then
			if(killed:IsElite())then
				if(math.random(30) == 1)then
					awardToGroup(killer, 900004, 1, 100)
				end
				if(killer:GetPhaseMask() == 2 and killer:GetLevel() == MAX_LEVEL)then
					if(math.random(30) == 1)then
						awardToGroup(killer, 900031, math.random(3), 100)
					end
					if(math.random(30) == 1)then
						awardToGroup(killer, 900004, 1, 100)
					end
				end
			end
		end
		if(killed:IsWorldBoss())then
			killer:AddItem(900004, 5)
			killer:SendBroadcastMessage(">> You gain 5 "..GetItemLink(900004).."! <<")
		end
	end

	if(getAbsoluteDifference(killer:GetLevel(), killed:GetLevel()) <= 5)then
		if(killer:GetMap():IsDungeon())then
			if(killed:IsElite() and killer:GetNearestCreature(70, 50385) ~= nil)then
				local bonus = 0
				local bonusdrop = 0
				if(math.random(15 - bonus) == 1)then
					awardToGroup(killer, 900031, math.random(3 + bonusdrop), 100)
				end
				if(math.random(15 - bonus) == 1)then
					awardToGroup(killer, 900004, math.random(3 + bonusdrop), 100)
				end
				if(math.random(100) == 1)then
					awardToGroup(killer, 900071, 1, 100)
				end
				if(math.random(20 - bonus) == 1)then
					awardToGroup(killer, 40752, math.random(2), 100)
				end
			end
		end
		if(killed:IsWorldBoss())then
			killer:AddItem(900004, 5)
			killer:SendBroadcastMessage(">> You gain 5 "..GetItemLink(900004).."! <<")
		end
	end
end

function getMythicSpell(t)
	if(t == 1)then
		local all = {31687, 71953, 8599, 43940}
		return all[math.random(tablelength(all))]
	end
end

function getRandomMythicDungeon()
	local dungeons = {
		{47, 1943, 1544.63, 81.99702, 1.38}, --rfk
		{209, 1213.52, 841.59, 8.93, 6.09}, --zf
		{70, -228.47, 54.6291, -46.038, 1.25}, --uld
		{36, -18.354, -377.82, 60.78202, 2.778}, --dm
		{289, 200.221, 124.67, 134.91005}, --scholo
		{329, 3397.0442, -3379.213, 142.69, 6.26}, --strat
		{429, -72.42, 163.155, -3465, 1.8}, --diremaul
	}
	local target = dungeons[math.random(tablelength(dungeons))]
	return target
end

function registerMythicCast(creature)
	local casts = {mythic_roc, mythic_slumber, mythic_slow, mythic_shred, mythic_starcall, mythic_prison, mythic_rupture, mythic_ward, mythic_blaze, mythic_boon, mythic_plague, mythic_torment, mythic_surge, mythic_hook}
	local event = casts[math.random(tablelength(casts))]
	creature:RegisterEvent(event, 5000 + math.random(6000), 20)
end

function mythic_roc(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
		creature:CastCustomSpell(target, 800206, true)
	end
end

function mythic_slumber(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 800145, true)
end
end

function mythic_slow(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 500953, true)
end
end

function mythic_shred(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(10)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 500940, true)
end
end

function mythic_starcall(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 800497, true)
end
end

function mythic_torment(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 500084, true)
end
end

function mythic_prison(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 800561, true)
end
end

function mythic_hook(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 500020, true)
end
end

function mythic_rupture(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 500303, true)
end
end

function mythic_plague(i, ii, iii, creature)
	playersInRange = creature:GetPlayersInRange(15)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 800218, true)
end
end

function mythic_ward(i, ii, iii, creature)
	if(creature:IsAlive())then
	creature:CastCustomSpell(creature, 500957, true)
end
end

function mythic_surge(i, ii, iii, creature)
	if(creature:IsAlive())then
	creature:CastCustomSpell(creature, 500041, true)
end
end

function mythic_blaze(i, ii, iii, creature)
	if(creature:IsAlive())then
	creature:CastCustomSpell(creature, 800218, true)
end
end

function mythic_boon(i, ii, iii, creature)
	playersInRange = creature:GetFriendlyUnitsInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	if(creature:IsAlive())then
	creature:CastCustomSpell(target, 800138, true)
end
end

RegisterPlayerEvent(7, killCreature)

function boostToSixty(player)
	player:SetLevel(70)
	player:AddItem(24245, 15)
	local archetype = getArchetype(player)
	local class = getClassID(player)
	--[[local HEAD = 0
	local NECK = 0
	local SHOULDER = 0
	local BACK = 0
	local WRIST = 0
	local HAND = 0
	local BELT = 0
	local LEGS = 0
	local BOOTS = 0
	local RING1 = 0
	local RING2 = 0
	local WEP = 0
	local OFFHAND = 0
	if(archetype == 1)then
		HEAD = 11746
		NECK = 13177
		SHOULDER = 12557
		CHEST = 10845
		BACK = 12465
		WEP = 13286
		OFFHAND = 11631
		HAND = 10277
		BELT = 10278
		BOOTS = 51990
		LEGS = 11927
		WRIST = 11767
		RING1 = 18464
		RING2 = 18522
	end
	if(archetype == 2)then
		HEAD = 10250
		NECK = 13177
		SHOULDER = 10253
		CHEST = 10254
		BACK = 10249
		WEP = 13286
		OFFHAND = 11631
		HAND = 10251
		BELT = 10255
		BOOTS = 10247
		LEGS = 10252
		WRIST = 10248
		RING1 = 18464
		RING2 = 18522
	end
	if(archetype == 3)then
		HEAD = 14676
		NECK = 13177
		SHOULDER = 14678
		CHEST = 14670
		BACK = 14673
		WEP = 13286
		OFFHAND = 11631
		HAND = 14675
		BELT = 14674
		BOOTS = 14671
		LEGS = 14677
		WRIST = 14672
		RING1 = 18464
		RING2 = 18522
	end]]
end

function bloodstore_heal(i, ii, iii, creature)
	creature:DealHeal(creature, 500359, iii)
	creature:RemoveEventById(i)
end

function player_takeitem(i, ii, iii, creature)
	creature:RemoveItem(iii, 1)
	creature:RemoveEventById(i)
end



function lordharvest_trigger(i, ii, souls, player)
	player:RemoveAura(500370)
	local aura = player:AddAura(500370, player)
	aura:SetMaxDuration(5000 * souls)
	aura:SetDuration(5000 * souls)
	player:RemoveEventById(i)
end

function chrono_addloop(i, ii, souls, player)
	player:AddAura(801297, player)
end

function chrono_recast(i, ii, souls, player)
	local tar = player:GetSelection()
	if(tar == nil)then
		tar = player
	end
	local valid = true
	local banned = {801190, 801300, 801299, 801309}
	for i,v in ipairs(banned) do
		if(v == souls)then
			valid = false
		end
	end
	if(valid)then
		player:CastSpell(tar, souls, true)
	end
	player:RemoveEventById(i)
end

function chrono_clonecast(i, ii, souls, player)
	local tar = player:GetOwner():GetSelection()
	if(tar == nil)then
		tar = player
	end
	player:SetFacingToObject(tar)
	local valid = true
	local banned = {801190, 801278, 801279, 801300, 801299, 801309}
	for i,v in ipairs(banned) do
		if(v == souls)then
			valid = false
		end
	end
	if(valid)then
		player:CastCustomSpell(tar, souls, true, nil, nil, nil, nil, player:GetOwner():GetGUID())
	end
	player:RemoveEventById(i)
end

function chrono_timeloop(i, ii, souls, player)
	player:ResetSpellCooldown(souls)
	player:RemoveEventById(i)
end

function cultist_pull(i, ii, souls, player)
	local tentacle = player:GetNearestCreature(20, 50097)
	tentacle:CastSpell(player:GetSelection(), 49576, true)
end

function reaper_resetrend(i, ii, souls, player)
	player:ResetSpellCooldown(800172)
end

function barb_resetripper(i, ii, souls, player)
	player:ResetSpellCooldown(500916)
end

function pyro_resetsurge(i, ii, souls, player)
	if(player:HasAura(800821))then
		player:ResetSpellCooldown(800121)
	end
end

function barb_resetwhirl(i, ii, souls, player)
	player:ResetSpellCooldown(500919)
end

function guardian_reset(i, ii, souls, player)
	player:ResetSpellCooldown(800311)
end

function remove_adap(i, ii, souls, player)
	player:RemoveAura(800089)
end

function remove_cosmic(i, ii, souls, player)
	player:RemoveAura(800498)
end

function remove_forti(i, ii, souls, player)
	player:RemoveAura(800895)
end

function guardian_reguard(i, ii, souls, player)
	player:AddAura(800313, player):SetDuration(40000)
end

function brewmaster_catch1(i, ii, souls, player)
	local tar = player:GetSelection()
	local npc = player:SpawnCreature(50125, tar:GetX(), tar:GetY(), tar:GetZ(), 0, 8, 0);
	local sel = nil
	for i,v in ipairs(player:GetCreaturesInRange(80, 50125)) do
		if(v:GetOwner() == player)then
			sel = v
		end
	end
	npc:CastSpell(sel, 800284, true)
	--npc:DespawnOrUnsummon()
end


function tidecaller_resetwave(i, ii, souls, player)
	player:ResetSpellCooldown(800378)
end

function tidecaller_resetfrosttorrent(i, ii, souls, player)
	player:ResetSpellCooldown(801229)
end

function tidecaller_resetburst(i, ii, souls, player)
	player:ResetSpellCooldown(800377)
end

function reaper_resetwaltz(i, ii, souls, player)
	player:ResetSpellCooldown(800839)
end

function spider_resetskitter(i, ii, souls, player)
	player:ResetSpellCooldown(800848)
end


function doc_manabrew(i, ii, souls, player)
	setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 100 * 15, 0)
end

function addStatic(player, amt1)
	if(player:HasAura(800692) == false)then
		local amt = amt1
		if(player:HasSpell(800101))then
			amt = (amt / 4 * 3)
		end
		if(player:GetPower(5) + amt > 0)then
			setPower(player, player:GetPower(5) + amt, 5)
		else
			setPower(player, 0, 5)
		end
		local static = player:GetPower(5)
		if(static >= 100)then
			player:CastSpell(player, 500048, true)
			player:SetHealth(player:GetMaxHealth() / 10)
			player:AddAura(800182, player)
			setPower(player, 0, 5)
			player:RemoveAura(800403)
			player:RemoveAura(800404)
			if(player:HasAura(500933))then
			else
				player:SendAreaTriggerMessage(generateIcon("Icons/spell_lightning_lightningbolt01", 32).." STATIC OVERLOAD "..generateIcon("Icons/spell_lightning_lightningbolt01", 32))
			end
		else
			if(player:HasAura(500933))then
			else
				player:SendAreaTriggerMessage(generateIcon("Icons/spell_lightning_lightningbolt01", 16).." "..(player:GetPower(5)).."% Static "..generateIcon("Icons/spell_lightning_lightningbolt01", 16))
			end
		end
		if(static >= 50)then
			if(static >= 75)then
				if(player:HasAura(800404))then
						player:RemoveAura(800404)
				end
				if(player:HasAura(800403))then
				else
					player:AddAura(800403, player)
					player:SendAreaTriggerMessage(generateIcon("Icons/spell_nature_purge", 32).. " STORMCHARGED! "..generateIcon("Icons/spell_nature_purge", 32))
				end
			else
				if(player:HasAura(800403))then
					player:RemoveAura(800403)
				end
				if(player:HasAura(800404))then
				else
					player:AddAura(800404, player)
					player:SendAreaTriggerMessage(generateIcon("Icons/spell_nature_lightning", 32).. " Surging Power! "..generateIcon("Icons/spell_nature_lightning", 32))
				end
			end
		end
		if(static <= 50)then
			player:RemoveAura(800404)
			player:RemoveAura(800403)
		end
	end
end

function remove_commander(i, ii, iii, player)
	player:RemoveAura(800464)
end

function doomcaller_possess(i, ii, iii, player)
	player:CastSpell(player:GetNearestCreature(50200, 20), 800470, false)
end

function doomcaller_possess1(i, ii, iii, player)
	player:CastSpell(player:GetNearestCreature(50201, 20), 800470, false)
end

function doomcaller_possess2(i, ii, iii, player)
	player:CastSpell(player:GetNearestCreature(50202, 20), 800470, false)
end


function lion_resummon(i, ii, iii, player)
	player:CastSpell(player, 800532, true)
end

function monk_alacrity(i, ii, stacks, player)
	player:AddAura(800419, player):SetStackAmount(stacks)
	player:RemoveEventById(i)
end

function reaper_drainhealth(player, percent)
	if(player:HasSpell(801325))then
		local aura = nil
		if(player:HasAura(801324))then
			aura = player:GetAura(801324)
		else
			player:CastSpell(player, 801324, true)
			aura = player:GetAura(801324)
		end
		aura:SetDuration(aura:GetDuration() + percent * 1000)
	else
		player:DealDamage(player, (player:GetMaxHealth() / 100) * percent)
	end
	if(math.random(10) == 1)then
		player:AddAura(800927, player)
	end
	if(player:HasAura(801335) and percent ~= 2)then
		local aura = player:GetAura(801335)
		aura:SetDuration(aura:GetDuration() + 2000)
	end
end


function doRangerCraft(player, spell, cost)
	if(player:GetAura(800273):GetStackAmount() >= cost)then
		player:GetAura(800273):SetStackAmount(player:GetAura(800273):GetStackAmount() - cost)
		return true;
	else
		spell:Finish()
		player:SendBroadcastMessage("Not enough Hide.")
		return false;
	end
end

function isFocus(player)
	print(player:GetPower(2))
	return (player:GetPower(2) >= 100)
end

function getClassTitle(player)
	local class = getClassID(player)
	local ids = {
		{CLASS_REAPER, 178},
		{CLASS_DRAGONKNIGHT, 179},
		{CLASS_GUARDIAN, 180},
		{CLASS_ABOMINATION, 181},
		{CLASS_SAMURAI, 182},
		{CLASS_TINKER, 183},
		{CLASS_DEMONHUNTER, 184},
		{CLASS_WITCHHUNTER, 185},
		{CLASS_RANGER, 186},
		{CLASS_WORGEN, 187},
		{CLASS_STORMBRINGER, 188},
		{CLASS_PYROMANCER, 189},
		{CLASS_SPIRITMAGE, 190},
		{CLASS_RIFTBLADE, 191},
		{CLASS_NECROMANCER, 192},
		{CLASS_SUNDANCER, 193},
		{CLASS_GROVEWARDEN, 194},
		{CLASS_CULTIST, 195},
		{CLASS_WITCHDOCTOR, 196},
		{CLASS_BARD, 197},
		{CLASS_TIDECALLER, 201},
		{CLASS_DOOMCALLER, 205},
	}
	for i,v in ipairs(ids) do
		if(class == v[1])then
			return v[2];
		end
	end
	return 0;
end

function applyRandomVulnerability(player, tar)
	local rand = 800637 + math.random(5)
	for i=800637,800642 do
		tar:RemoveAura(i)
	end
	player:SendBroadcastMessage(rand)
	tar:AddAura(rand, tar)
	tar:CastSpell(tar, rand, true)
	--tar:AddAura(rand, tar):SetDuration(10000)
end

function wh_hound_init(i, ii, iii, player)
	local hound_check = player:GetCreaturesInRange(80, 50124)
		local count = 0;
		for i,v in ipairs(hound_check) do
			if(v:GetOwner() == player)then
				if(count == 1)then
					v:MoveFollow(player, 2, -0.75)
					v:SetMaxPower(0, 1)
				else
					v:MoveFollow(player, 2, 0.75)
					v:SetMaxPower(0, 2)
				end
				count = count + 1;
			end
		end
end

function pyro_barrage(i, ii, iii, player)
	player:CastSpell(player:GetSelection(), 800794, true)
end

function pyro_resetmagmasurge(i, ii, iii, player)
	player:ResetSpellCooldown(800811)
end

function pyro_resetfire(i, ii, iii, player)
	player:ResetSpellCooldown(500129)
end

function spiritmage_unleash(i, ii, iii, player)
	local time = player:GetAura(800305):GetStackAmount() * 500
	local aura = player:GetSelection():GetAura(800725)
	aura:SetMaxDuration(aura:GetDuration() + time)
	aura:SetDuration(aura:GetDuration() + time)
	player:RemoveAura(800305)
end

function worgen_changepow(i, ii, iii, player)
	player:SetPowerType(1)
	player:SetMaxPower(1, 2000)
end

function reaper_whirl(i, ii, iii, player)
	if(player:IsFalling() or player:IsFlying())then
		player:RegisterEvent(reaper_whirl, 200, 1)
	else
		player:CastSpell(player, 48280, true)
	end
end

function player_demorph(i, ii, iii, player)
	player:SetDisplayId(player:GetNativeDisplayId())
end

function spiderform(i, ii, iii, player)
	if(player:HasAura(800843) == false)then
		if(player:GetRace() == 5)then
			player:SetDisplayId(539)
		end
		if(player:GetRace() == 4)then
			player:SetDisplayId(4456)
		end
	end
end

function prestilence_end(i, ii, iii, player)
	player:RemoveAura(801045)
	player:RemoveAura(801046)
	player:RemoveAura(801053)
	player:RemoveAura(801054)
end

function player_norage(i, ii, iii, player)
	setPower(player, 0, 1)
end


function ww_petfocus(i, ii, iii, player)
	local near = player:GetFriendlyUnitsInRange(10)
			for i,v in ipairs(near) do
				if(v:GetOwner() == player)then
					v:SetPowerType(2)
					v:SetMaxPower(2, 100)
				end
			end
end



function bloodmage_form(i, ii, iii, player)
	player:RemoveAura(500122)
	local rand = math.random(3)
	player:AddAura(801075 + rand, player)
	player:CastSpell(player, 73213, true)
end

function chrono_epoch(i, ii, iii, player)
	player:CastSpell(player:GetSelection(), 801290, true)
end

function reset_crusher(i, ii, iii, player)
	player:ResetSpellCooldown(500707)
end

function reaper_resetsoulrend(i, ii, iii, player)
	player:ResetSpellCooldown(500365)
end

function reaper_removestacks(i, ii, iii, player)
	player:RemoveAura(500357)
end

function addEssence(player, essence)
	if(canAddEssence(player))then
		player:AddAura(essence, player)
	end
end

function ww_extendboon(i, ii, iii, unit)
	local boon = getActiveBoon(unit)
	if(boon > 0)then
		local aura = unit:GetAura(boon)
		aura:SetDuration(aura:GetDuration() + 30000)
		aura:SetMaxDuration(aura:GetMaxDuration() + 30000)
	end
end

function reaper_shrieking(i, ii, iii, unit)
	unit:ResetSpellCooldown(801332)
end

function resetFocus(player)
	if(player:HasSpell(801226))then
		setPower(player, 40, 2)
	else
		setPower(player, 0, 2)
	end
end

function addChronoEssence(player, id)
	local auraid = 801287
	local chaoscount = 0
	local ordercount = 0
	if(player:HasAura(801286))then
		chaoscount = player:GetAura(801286):GetStackAmount()
	end
	if(player:HasAura(801287))then
		ordercount = player:GetAura(801287):GetStackAmount()
	end

	if(id == 2)then
		auraid = 801286
		if(chaoscount + ordercount < 4)then
			chaoscount = chaoscount + 1
		end
	else
		if(chaoscount + ordercount < 4)then
			ordercount = ordercount + 1
		end
	end

	if(chaoscount + ordercount >= 4)then
		if(chaoscount == 4)then
			local near = player:GetUnfriendlyUnitsInRange(40)
			for i,v in ipairs(near) do
				if(v:IsInCombat())then
					player:AddAura(800856, v)
					player:AddAura(800856, v)
					player:AddAura(800856, v)
				end
			end
		end
		if(ordercount == 4)then
			local near = player:GetFriendlyUnitsInRange(40)
			for i,v in ipairs(near) do
				player:AddAura(800857, v)
				player:AddAura(800857, v)
				player:AddAura(800857, v)
			end
		end
		if(chaoscount == 3 and ordercount == 1)then
			player:RegisterEvent(chrono_epoch, 333, 3)
		end
		if(chaoscount == 1 and ordercount == 3)then
			player:AddAura(801304, player)
			player:AddAura(801296, player)
			player:AddAura(801297, player)
		end
		if(chaoscount == 2 and ordercount == 2)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 10 * 3, 0)
			player:SetHealth(player:GetHealth() + player:GetMaxHealth() / 5)
			player:CastSpell(player, 801299, true)
		end
		player:RemoveAura(801286)
		player:RemoveAura(801287)
	else
		player:AddAura(auraid, player)
	end
end

function hasSoulInfusion(player)
	if(player:HasAura(500363))then
		if(player:GetAura(500363):GetStackAmount() >= 3)then
			player:RemoveAura(500363)
			return true
		end
	else
		return false
	end
end

function reaper_soulshudder(i, ii, iii, unit)
	local aura = unit:GetSelection():GetAura(801321)
	aura:SetDuration(aura:GetDuration() + 500)
	aura:SetMaxDuration(aura:GetMaxDuration() + 5000)
end

function canAddEssence(player)
	local stacks = 0
	if(player:HasAura(500271))then
		stacks = stacks + player:GetAura(500271):GetStackAmount()
	end
	if(player:HasAura(500282))then
		stacks = stacks + player:GetAura(500282):GetStackAmount()
	end
	if(player:HasAura(500285))then
		stacks = stacks + player:GetAura(500285):GetStackAmount()
	end
	return (stacks < 3)
end

function addMinionXP(player, creature, xp)
	local lastXP = WorldDBQuery("SELECT xp FROM player_minions WHERE minion = "..creature:GetEntry().." and equipped = 1 and GUID = "..player:GetGUIDLow()):GetUInt32(0)
	local lastlvl = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..creature:GetEntry().." and equipped = 1 and GUID = "..player:GetGUIDLow()):GetUInt32(0)
	if(lastlvl < MINION_MAXLVL)then
		local fullXP = getRequiredMinionXP(creature:GetLevel())
		local rem = 0
		if(lastXP+xp >= fullXP)then
			rem = fullXP - (lastXP+xp)
			if(rem < 0)then
				rem = 0;
			end
			WorldDBQuery("UPDATE player_minions SET xp = "..rem.." WHERE minion = "..creature:GetEntry().." and equipped = 1 and GUID = "..player:GetGUIDLow())
			WorldDBQuery("UPDATE player_minions SET level = "..(lastlvl + 1).." WHERE minion = "..creature:GetEntry().." and equipped = 1 and GUID = "..player:GetGUIDLow())
		else
			WorldDBQuery("UPDATE player_minions SET xp = "..(lastXP + xp).." WHERE minion = "..creature:GetEntry().." and equipped = 1 and GUID = "..player:GetGUIDLow())
		end
	end
end

function addMinionXPRaw(player, xp)
	local creature = WorldDBQuery("SELECT minion FROM player_minions WHERE equipped = 1 and GUID = "..player:GetGUIDLow()):GetUInt32(0)
	local lastXP = WorldDBQuery("SELECT xp FROM player_minions WHERE minion = "..creature.." and equipped = 1 and GUID = "..player:GetGUIDLow()):GetUInt32(0)
	local lastlvl = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..creature.." and equipped = 1 and GUID = "..player:GetGUIDLow()):GetUInt32(0)
	if(lastlvl < MINION_MAXLVL)then
		local fullXP = getRequiredMinionXP(lastlvl)
		local rem = 0
		player:SendBroadcastMessage("Current minion gains "..xp.." experience!")
		if(lastXP+xp >= fullXP)then
			rem = fullXP - (lastXP+xp)
			if(rem < 0)then
				rem = 0;
			end
			WorldDBQuery("UPDATE player_minions SET xp = "..rem.." WHERE minion = "..creature.." and equipped = 1 and GUID = "..player:GetGUIDLow())
			WorldDBQuery("UPDATE player_minions SET level = "..(lastlvl + 1).." WHERE minion = "..creature.." and equipped = 1 and GUID = "..player:GetGUIDLow())
			player:SendBroadcastMessage("Current minion advanced to level "..(lastlvl + 1).."!")
		else
			WorldDBQuery("UPDATE player_minions SET xp = "..(lastXP + xp).." WHERE minion = "..creature.." and equipped = 1 and GUID = "..player:GetGUIDLow())
		end
	end
end

function getRequiredMinionXP(level)
	return 5 + level * 2
end

function minion_win(event, tar, creature)
	if(creature:GetPhaseMask() == 4 and creature:GetMaxPower(6) == 1)then
		local player = creature:GetNearestPlayer(30)
		local lastXP = WorldDBQuery("SELECT xp FROM player_minions WHERE minion = "..creature:GetEntry().." and equipped = 1 and GUID = "..player:GetGUIDLow()):GetUInt32(0)
		local xp = tar:GetLevel() / 2 + math.random(4)
		local fullXP = getRequiredMinionXP(creature:GetLevel())
		local rem = 0
		local startlevel = creature:GetLevel()
		if(creature:GetLevel() < MINION_MAXLVL)then
			if(lastXP+xp >= fullXP)then
				rem = fullXP - (lastXP+xp)
				creature:SetLevel(creature:GetLevel() + 1)
				fullXP = getRequiredMinionXP(creature:GetLevel())
				player:SendBroadcastMessage(creature:GetName().." ["..(creature:GetLevel() - 1).."] has defeated "..tar:GetName().." ["..tar:GetLevel().."] - "..xp.." Experience Earned, advancing "..creature:GetName().." to level "..creature:GetLevel().."! ("..(rem).."/"..fullXP..")")
			else
				player:SendBroadcastMessage(creature:GetName().." ["..creature:GetLevel().."] has defeated "..tar:GetName().." ["..tar:GetLevel().."] - "..xp.." Experience Earned! ("..(lastXP+xp).."/"..fullXP..")")
			end
		end
		local chance = 0
		if(player:HasItem(900080))then
			chance = 9
			player:RemoveItem(900080, 1)
			player:SendBroadcastMessage("You used a Taming Manual.")
		end
		player:GiveXP(tar:GetLevel() * 35 + 10)
		if(math.random(10 - chance) == 1)then
			local mob = tar:GetEntry()
			local qry = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..mob.." AND GUID = "..player:GetGUIDLow())
			local total = WorldDBQuery("SELECT COUNT(*) FROM player_minions WHERE GUID = "..player:GetGUIDLow().." AND equipped = 0"):GetUInt32(0)
			if(tar:IsWorldBoss() == false)then
				if(qry == nil)then
					if(total < MAX_MINIONS)then
						WorldDBQuery("INSERT INTO player_minions VALUES ("..player:GetGUIDLow()..", "..mob..", 0, "..tar:GetLevel()..", 0, 0, 0, 0, '')")
						player:SendBroadcastMessage("The "..tar:GetName().." has been captured, and added to your Minion Collection! Visit a Minion Trainer to equip it.")
					else
						player:SendBroadcastMessage("The "..tar:GetName().." has escaped! You already have "..MAX_MINIONS.." stabled. You must abandon some before you can capture more.")
					end
				else
					player:SendBroadcastMessage("You have already collected a minion of this type.")
				end
			else
				player:SendBroadcastMessage("World bosses cannot be captured.")
			end
		end
		creature:RegisterEvent(minion_despawn, 5100, 1)
		player:RegisterEvent(minion_end, 5000, 1)
		if(getAbsoluteDifference(startlevel, tar:GetLevel()) <= 5)then
			addMinionXP(player, creature, xp)
		else
			player:SendBroadcastMessage("Enemies must be within 5 levels of your Minion to award experience - no Experience earned.")
		end
		creature:CastSpell(creature, 47292, true)

		getRuneDrop(player, tar)
	end
end

function minion_win_pvp(event, creature, tar)
	if(creature:GetPhaseMask() == 4)then
		local near = creature:GetPlayersInRange(40, 0, 0)
		creature:RegisterEvent(minion_despawn, 8100, 1)
		tar:RegisterEvent(minion_despawn, 8100, 1)
		creature:CastSpell(creature, 47292, true)
		for i,v in ipairs(near) do
			if(v:HasAura(801382))then
				v:SendBroadcastMessage(creature:GetName().." has defeated "..tar:GetName().."!")
				v:RegisterEvent(minion_end, 8000, 1)
			end
		end
	end
	creature:RegisterEvent(minion_despawn, 8100, 1)
	tar:RegisterEvent(minion_despawn, 8100, 1)
end

function minion_end(i, ii, iii, creature)
	creature:RemoveAura(801382)
	creature:RemoveAura(801381)
	creature:RemoveAura(801387)
	creature:RemoveAura(801388)
	creature:RemoveAura(65985)
end

function minion_despawn(i, ii, iii, creature)
	creature:RemoveAura(801381)
	--creature:Kill(creature)
	creature:DespawnOrUnsummon()
end

function minion_lose(event, tar, creature)
	if(creature:GetPhaseMask() == 4 and creature:GetMaxPower(6) == 1)then
		local player = creature:GetNearestPlayer(30)
		local lvl = creature:GetLevel()
		if(lvl > 2)then
			creature:SetLevel(creature:GetLevel() - 1)
			fullXP = getRequiredMinionXP(creature:GetLevel())
			player:SendBroadcastMessage(creature:GetName().." ["..(creature:GetLevel() + 1).."] has been defeated by "..tar:GetName().." ["..tar:GetLevel().."], returning them back to level "..creature:GetLevel().."!")
			WorldDBQuery("UPDATE player_minions SET level = "..creature:GetLevel().." WHERE minion = "..creature:GetEntry().." and equipped = 1 and GUID = "..player:GetGUIDLow())
		else
			player:SendBroadcastMessage(creature:GetName().." ["..(creature:GetLevel() + 1).."] has been defeated by "..tar:GetName().." ["..tar:GetLevel().."]!")
		end
		tar:CastSpell(tar, 47292, true)
		creature:RegisterEvent(minion_despawn, 5100, 1)
		tar:RegisterEvent(minion_despawn, 5100, 1)
		player:RegisterEvent(minion_end, 5000, 1)
	end
end

function minion_start(i, ii, iii, player)
	local pet = nil
	local near = player:GetCreaturesInRange(10)
	for i,v in ipairs(near) do
		if(v:GetMaxPower(6) == 1)then
			pet = v
		end
	end
	player:SetPhaseMask(4)
	player:ResetSpellCooldown(801381)
	player:CastSpell(pet, 801381, true)
	player:AddAura(801381, pet)
	pet:CastSpell(pet, 9741, true)
	pet:SetOwnerGUID(player:GetGUID())
end

function minion_start_pvp(i, ii, iii, player)
	local pet = nil
	local near = player:GetCreaturesInRange(10)
	for i,v in ipairs(near) do
		if((v:HasAura(801387) and player:HasAura(801387)) or (v:HasAura(801388) and player:HasAura(801388)))then
			pet = v
		end
	end
	player:SetPhaseMask(4)
	player:ResetSpellCooldown(801381)
	player:CastSpell(pet, 801381, true)
	player:AddAura(801381, pet)
	pet:CastSpell(pet, 9741, true)
	pet:SetOwnerGUID(player:GetGUID())
end

function minion_tick(i, ii, iii, pet)
	if(pet:IsAlive())then
	else
		local killer = nil
		local near = pet:GetCreaturesInRange(20)
		for i,v in ipairs(near) do
			if(v:HasAura(801387) and pet:HasAura(801388))then
				killer = v
			end
			if(v:HasAura(801388) and pet:HasAura(801387))then
				killer = v
			end
		end
		killer:RemoveEvents()
		pet:RemoveEventById(i)
		minion_win_pvp(1, killer, pet)
	end
end

function minion_tick_pve(i, ii, iii, pet)
	if(pet:IsAlive())then
	else
		local killer = pet:GetNearestCreature(30)
		killer:RemoveEvents()
		pet:RemoveEventById(i)
		if(pet:GetMaxPower(6) == 2)then
			minion_win(1, pet, killer)
		else
			minion_lose(1, killer, pet)
		end
	end
end

function minion_dummyattack(i, ii, iii, pet)
	if(pet:IsAlive())then
		if(pet:GetVictim() ~= nil)then
			if(pet:GetDistance(pet:GetVictim()) <= 5 and pet:IsCasting() == false)then
				--pet:CastCustomSpell(pet:GetVictim(), 1752, true)
				pet:CastCustomSpell(pet:GetVictim(), 801406, true)
				pet:CastCustomSpell(pet:GetVictim(), 54350, true)
			end
		end
	else
		pet:RemoveEventById(i)
	end
end


function dummy_combat(event, creature, tar)
	creature:SendUnitSay("Test", 0)
end

function getMinionType(creature)
	local q = WorldDBQuery("SELECT AIName FROM creature_template WHERE entry = "..(creature:GetEntry()))
	if(q ~= nil)then
		if(q:GetString(0) == "SmartAI")then
			return 2
		end
	end
	return 1
end

function registerMinionAttackEvent(creature)
	if(getMinionType(creature) == 2)then
		local speed = WorldDBQuery("SELECT BaseAttackTime FROM creature_template WHERE entry = "..(creature:GetEntry())):GetUInt32(0)
		if(speed == 0)then
			speed = 2500;
		end
		if(creature:HasAura(801383))then
			speed = (speed / 100 * 15)
		end
		creature:RegisterEvent(minion_dummyattack, speed, (60000 * MINION_MINS) / speed)
	end
end

function isFist(player)
	local ret = true;
	if(player:GetEquippedItemBySlot(15) ~= nil or player:GetEquippedItemBySlot(16) ~= nil)then
		ret = false;
	end
	if(isStaff(player) and player:HasSpell(801480))then
		ret = true;
	end
	return ret;
end

function isFistTrue(player)
	return (player:GetEquippedItemBySlot(15) == nil and player:GetEquippedItemBySlot(16) == nil)
end

function isStaff(player)
	if(player:GetEquippedItemBySlot(15) ~= nil)then
		return (player:GetEquippedItemBySlot(15):GetSubClass() == 10)
	end
	return false;
end

function onCast(event, player, spell, skipChek)
	--initResources(player, class)
	--player:SetPhaseMask(2)
	local spellid = spell:GetEntry()
	local tar = spell:GetTarget()
	--player:RemoveAllAuras()

	--[[if(player:HasAura(500929))then
		local static = player:GetPower(5) / 2
		if(tar ~= nil)then
			if(tar:IsTargetableForAttack(false))then
				if(tar ~= nil)then
					if(tar:ToPlayer() ~= nil)then
						player:DealDamage(tar, (player:GetStat(3) / 100) * static, false, 4, 500929)
					else
						if(tar:CanStartAttack(player) or (tar:GetVictim() == player))then
							player:DealDamage(tar, (player:GetStat(3) / 100) * static, false, 4, 500929)
						end
					end
				end
			end
		end
	end]] 
	--^^ STORMBRINGER OLD STATIC DAMAGE SYSTEM

	local cancast = true

	if(spellid == 800918 or spellid == 800919 or spellid == 800922)then
		player:RegisterEvent(player_demorph, 10, 1)
	end
	
	if(spellid == 800922)then
		player:AddAura(40927, player)
	end

	if(spellid == 801460)then
		local unit = tar;
		if(unit:HasAura(63772) == false)then
			unit:SetRespawnDelay(1000000)
			local near = unit:GetCreaturesInRange(20, 50398)
			for i,v in ipairs(near) do
				v:CastSpell(v, 34602, true)
			end
			player:CastSpell(player, 9741, true)
			awardRaidPoints(player, 3)
		    unit:AddAura(63772, unit)
		    local buildings = countBuildingsLeft(player)
		    
			if(buildings <= 0)then
				local left = countMobsLeft(player)
				if(left <= 0)then
					local facname = "Horde"
					if(player:IsAlliance())then
						facname = "Alliance"
					end
					sendTownraidMessage(player, "The town's buildings are ablaze, and its residents are slain. The day is won for The "..facname.."!")
					winTownRaid(player)
				else
					sendTownraidMessage(player, "All of the town's buildings are ablaze! Slay "..left.." more residents to achieve victory.")
				end
			else
				sendTownraidMessage(player, (player:GetName().." has set fire to a building! Burn "..buildings.." more buildings to achieve victory!"))
			end
		end
	end

	if(spellid ==800236)then
		spell:Cancel()
		setPower(player, player:GetPower(5) + 1, 5)
	end

	if(spellid == 801312)then
		setPower(player, player:GetPower(1)+150, 1)
	end

	if(spellid == 800343)then
		if(player:HasSpell(801318) and math.random(15) == 1)then
			player:CastCustomSpell(player, 500970, true)
		end
	end

	if(spell:GetEntry() > 100000 and player:HasSpell(800924) and spellid ~= 801179)then
		if(tar ~= nil)then
			if(player:GetDistance(tar) > 7)then
				spell:Cancel()
				cancast = false
				player:SendAreaTriggerMessage("You are too far away!")
			end
		end
	end

	function getMinionHealth(pet, minionlvl, lastlvl)
		return (pet:GetMaxHealth() + (12 + minionlvl) * ((minionlvl - lastlvl)))
	end

	function getMinionTraining(pet, minionlvl, lastlvl)
		return 1 + (minionlvl - lastlvl) * 1.5
	end

	if(player:HasAura(500122) and player:HasAura(800770) == false)then
		player:AddAura(800770, player)
	end

	if(spellid == 801179)then
		spell:Cancel()
		cancast = false
		takeitem = false
			if(player:GetLevel() >= MAX_LEVEL and tar ~= nil)then
				item = spell:GetTarget()
				if(item ~= nil)then
					if(player:HasItem(item:GetEntry(), 1))then
						if(string.find(item:GetName(), "Runic Tome:", 1) >= 1)then
							rune = 0
							spell_q = (WorldDBQuery("SELECT spellid_1 FROM item_template WHERE entry = "..(item:GetEntry()))):GetUInt32(0)
							if(spell_q ~= nil)then
								rune = spell_q
							end
							if(rune > 0)then
								guid = player:GetGUIDLow()
								item_name = (WorldDBQuery("SELECT name FROM item_template WHERE entry = "..(item:GetEntry()))):GetString(0)
								item_class = (WorldDBQuery("SELECT armor FROM item_template WHERE entry = "..(item:GetEntry()))):GetUInt32(0)
								item_level = (WorldDBQuery("SELECT itemlevel FROM item_template WHERE entry = "..(item:GetEntry()))):GetUInt32(0)
								sn = mysplit(item_name, ":")[2]
								--sn = string.gsub(sn, "'", "")
								--player:SendBroadcastMessage("INSERT INTO learned_spells VALUES (" .. guid .. ", " .. rune .. ", 1)")
								--player:SendBroadcastMessage("INSERT INTO spellbook_ref VALUES (" .. rune .. ", '" .. sn .. "', 0)")
								local tartable = "learned_spells"
								if(item_level == 1)then
									tartable = "learned_cosmetic"
								end
								if(getClassID(player) == item_class or item_class == 0)then
									WorldDBQuery("INSERT INTO "..tartable.." VALUES (" .. guid .. ", " .. rune .. ", 1)")
									WorldDBQuery("INSERT INTO spellbook_ref VALUES (" .. rune .. ", '" .. sn .. "', 0)")
									player:SendAreaTriggerMessage("New spell added to collection!")
									player:SendBroadcastMessage("Visit a Runic Library to change your loadout.")
									takeitem = true
									player:PlayDirectSound(37, player)
									player:CastSpell(player, 47292, true)
								else
									takeitem = false
									player:SendBroadcastMessage("This tome is "..getInfoForClass(item_class)[0].." only.")
									spell:Cancel()
								end
							else
								player:SendBroadcastMessage("Invalid spell. Report to developer.")
								spell:Cancel()
							end
						else
							player:SendBroadcastMessage("Must target a Runic Tome.")
							spell:Cancel()
						end
					else
						player:SendBroadcastMessage("Must target a Runic Tome.")
						spell:Cancel()
					end
					player:RegisterEvent(player_interrupt1, 100, 1)
					spell:Cancel()
				end
			else
				player:SendBroadcastMessage("Requires level "..MAX_LEVEL.."!")
				spell:Cancel()
			end
			if(takeitem)then
				player:RegisterEvent(player_takeitem, 100, (tar:GetEntry()))
			end
		end

		if(spellid == 801273)then
			spell:Cancel()
			cancast = false
			takeitem = false
			if(tar ~= nil)then
				item = spell:GetTarget()
				if(item ~= nil)then
					if(player:HasItem(item:GetEntry(), 1))then
						local qry = CharDBQuery("SELECT fake FROM automogs WHERE GUID = "..item:GetGUIDLow())
						if(qry ~= nil)then
							local fake = qry:GetUInt32(0)
							if(fake > 0)then
								takeitem = true
								player:AddItem(fake, 1)
							end
						end
					end
					player:RegisterEvent(player_interrupt1, 100, 1)
					spell:Cancel()
				end
			end
			if(takeitem)then
				player:RegisterEvent(player_takeitem, 100, (tar:GetEntry()))
			else
				player:SendBroadcastMessage("Invalid item.")
			end
		end



	if(cancast)then
		if(spellid == 500338 or spellid == 500965)then
			local near = player:GetCreaturesInRange(30, 50072)
			for i,v in ipairs(near) do
				if(v:GetOwner() == player)then
					v:AttackStart(tar)
				end
			end
		end
		if(spellid == 801360)then
			local can = true
			if((tar:HasAura(801365) and player:IsAlliance()) or (tar:HasAura(801366) and player:IsHorde()))then
				can = false;
			end
			if(tar:HasAura(801365) == false and tar:HasAura(801366) == false)then
				can = false;
			end
			if(tar:GetEntry() == 50397 and player:HasAura(801356) and can == true)then
				if(tar:HasAura(63772))then
					tar:RemoveAura(63772)
					sendTownraidMessage(player, player:GetName().." has repaired a building!")
					awardRaidPoints(player, 5)
				else
					spell:Cancel()
					player:SendBroadcastMessage("Building repair failed.")
				end
			else
				if(can == true and player:HasAura(801356) and tar:IsAlive() == false)then
					tar:Respawn()
					tar:SendUnitSay("Thank you, "..player:GetName()..", I am in your debt.", 0)
					sendTownraidMessage(player, player:GetName().." has revived "..tar:GetName().."!")
					awardRaidPoints(player, 5)
				else
					player:SendBroadcastMessage("Revive failed.")
					spell:Cancel()
				end
			end
		end
		if(spellid == 801363)then
			local minion = WorldDBQuery("SELECT minion, level, name FROM player_minions WHERE GUID = "..(player:GetGUIDLow()).." AND equipped = 1")
			local minion_other = nil
			if(minion ~= nil)then
				if(tar:ToPlayer() ~= nil)then
					minion_other = WorldDBQuery("SELECT minion, level, name FROM player_minions WHERE GUID = "..(tar:GetGUIDLow()).." AND equipped = 1")
					if(minion_other ~= nil)then
						if(player:HasAura(801363) and tar ~= player)then
							local runes = WorldDBQuery("SELECT rune1, rune2, rune3 FROM player_minions WHERE GUID = "..(player:GetGUIDLow()).." AND equipped = 1")
							local runes_other = WorldDBQuery("SELECT rune1, rune2, rune3 FROM player_minions WHERE GUID = "..(tar:GetGUIDLow()).." AND equipped = 1")
							local minion_other = WorldDBQuery("SELECT minion, level, name FROM player_minions WHERE GUID = "..(tar:GetGUIDLow()).." AND equipped = 1")
							MINION_MINS = 5
							local tarID = minion_other:GetUInt32(0)
							local tarLevel = minion_other:GetUInt32(1)
							local tarName = minion_other:GetString(2)

							local minionID = minion:GetUInt32(0)

							local minionlvl = minion:GetUInt32(1)
							local name = minion:GetString(2)
							local name1 = minion_other:GetString(2)
							player:AddAura(801382, player)
							player:AddAura(801387, player)
							player:SetPhaseMask(4)
							tar:AddAura(801382, tar)
							tar:AddAura(801388, tar)
							tar:SetPhaseMask(4)
							local x, y, z, o = player:GetLocation()
							local x1, y1, z1, o1 = tar:GetLocation()
							local enemy = tar:SpawnCreature(tarID, x1, y1, z1, o1, 1, 60000 * MINION_MINS)
							enemy:SetPhaseMask(4)
							local pet = player:SpawnCreature(minionID, x, y, z, o, 1, 60000 * MINION_MINS)
							pet:RegisterEvent(minion_tick, 1000, (60000 * MINION_MINS) / 1000)
							enemy:RegisterEvent(minion_tick, 1000, (60000 * MINION_MINS) / 1000)
							local lastlvl = pet:GetLevel()
							local enemylvl = enemy:GetLevel()
							pet:SetLevel(minionlvl)
							enemy:SetLevel(tarLevel)
							if(name ~= "")then
								pet:SetName(name)
							end
							if(name1 ~= "")then
								enemy:SetName(name1)
							end
							local hpmod = 0.1
							if(minionlvl - lastlvl >= 1)then
								pet:AddAura(801385, pet):SetStackAmount(getMinionTraining(pet, minionlvl, lastlvl))
								pet:SetMaxHealth(getMinionHealth(pet, minionlvl, lastlvl))
								pet:SetHealth(pet:GetMaxHealth())
							end
							if(tarLevel - enemylvl >= 1)then
								enemy:AddAura(801385, enemy):SetStackAmount(getMinionTraining(enemy, tarLevel, enemylvl))
								enemy:SetMaxHealth(getMinionHealth(pet, tarLevel, enemylvl))
								enemy:SetHealth(enemy:GetMaxHealth())
							end
							if(runes ~= nil)then
								local r1 = runes:GetUInt32(0)
								local r2 = runes:GetUInt32(1)
								local r3 = runes:GetUInt32(2)
								if(r1 > 0)then
									pet:AddAura(r1, pet)
								end
								if(r2 > 0)then
									pet:AddAura(r2, pet)
								end
								if(r3 > 0)then
									pet:AddAura(r3, pet)
								end
							end
							if(runes_other ~= nil)then
								local r1 = runes_other:GetUInt32(0)
								local r2 = runes_other:GetUInt32(1)
								local r3 = runes_other:GetUInt32(2)
								if(r1 > 0)then
									enemy:AddAura(r1, enemy)
								end
								if(r2 > 0)then
									enemy:AddAura(r2, enemy)
								end
								if(r3 > 0)then
									enemy:AddAura(r3, enemy)
								end
							end
							pet:AddAura(801387, pet)
							enemy:AddAura(801388, enemy)
							enemy:SetFaction(14)
							pet:SetFaction(14)
							pet:SetPhaseMask(4)
							pet:SetMaxPower(6, 1)
							enemy:SetMaxPower(6, 2)
							registerMinionAttackEvent(pet)
							registerMinionAttackEvent(enemy)
							player:RegisterEvent(minion_start_pvp, 100, 1)
							tar:RegisterEvent(minion_start_pvp, 100, 1)
							player:SendBroadcastMessage(player:GetName().."'s "..pet:GetName().." engages battle with "..tar:GetName().."'s "..tarName.."! Only one can leave alive!")
							tar:SendBroadcastMessage(player:GetName().."'s "..pet:GetName().." engages battle with "..tar:GetName().."'s "..tarName.."! Only one can leave alive!")
							local near = player:GetNearestCreature(15, 50401)
							if(near ~= nil)then
								if(near:GetOwner() == player)then
									near:DespawnOrUnsummon()
								end
							end
						else
							tar:SendBroadcastMessage("Cast Minion Challenge on your opponent to accept their challenge.")
							player:SendBroadcastMessage("If your opponent casts Minion Challenge back on you, the duel will begin.")
						end
					else
						player:SendBroadcastMessage("Must have a minion equipped!")
						tar:SendBroadcastMessage("Must have a minion equipped!")
					end
				else
					if(tar:HasAura(801386) == false and player:GetMap():IsDungeon() == false and player:GetMap():IsRaid() == false)then
						local debuff = tar:AddAura(801386, tar)
						local runes = WorldDBQuery("SELECT rune1, rune2, rune3 FROM player_minions WHERE GUID = "..(player:GetGUIDLow()).." AND equipped = 1")
						MINION_MINS = 5
						local tarID = tar:GetEntry()
						local minionID = minion:GetUInt32(0)

						--cancel = RegisterCreatureEvent(tarID, 4, minion_win)
						--cancel = RegisterCreatureEvent(tarID, 3, minion_lose)

						local minionlvl = minion:GetUInt32(1)
						local name = minion:GetString(2)
						player:AddAura(801382, player)
						player:SetPhaseMask(4)
						local x, y, z, o = player:GetLocation()
						local x1, y1, z1, o1 = tar:GetLocation()
						local enemy = player:SpawnCreature(tarID, x1, y1, z1, o1, 1, 60000 * MINION_MINS)
						enemy:SetPhaseMask(4)
						local pet = player:SpawnCreature(minionID, x, y, z, o, 1, 60000 * MINION_MINS)
						pet:SetFaction(14)
						local lastlvl = pet:GetLevel()
						pet:SetLevel(minionlvl)
						pet:SetName(name)
						local hpmod = 0.1
						if(minionlvl - lastlvl >= 1)then
							pet:AddAura(801385, pet):SetStackAmount(getMinionTraining(pet, minionlvl, lastlvl))
							pet:SetMaxHealth(pet:GetMaxHealth() + (12 + minionlvl / 3 * 2) * ((minionlvl - lastlvl)))
							pet:SetHealth(pet:GetMaxHealth())
						end
						if(runes ~= nil)then
							local r1 = runes:GetUInt32(0)
							local r2 = runes:GetUInt32(1)
							local r3 = runes:GetUInt32(2)
							if(r1 > 0)then
								pet:AddAura(r1, pet)
							end
							if(r2 > 0)then
								pet:AddAura(r2, pet)
							end
							if(r3 > 0)then
								pet:AddAura(r3, pet)
							end
						end
						registerMinionAttackEvent(pet)
						--pet:AddAura(801387, pet)
						--enemy:AddAura(801388, enemy)
						--pet:RegisterEvent(minion_reattack, 1000, (60000 * MINION_MINS) / 1000)
						--enemy:RegisterEvent(minion_reattack, 1000, (60000 * MINION_MINS) / 1000)
						for i=1,3 do
							if(math.random(15) == 1)then
								enemy:AddAura(getRandomRune(enemy), enemy)
							end
						end
						pet:RegisterEvent(minion_tick_pve, 1000, (60000 * MINION_MINS) / 1000)
						enemy:RegisterEvent(minion_tick_pve, 1000, (60000 * MINION_MINS) / 1000)
						enemy:SetFaction(14)
						pet:SetPhaseMask(4)
						pet:SetMaxPower(6, 1)
						enemy:SetMaxPower(6, 2)
						enemy:SetLevel(tar:GetLevel())
						player:RegisterEvent(minion_start, 100, 1)
						player:AddAura(65985, player)
						player:SendBroadcastMessage(pet:GetName().." engages battle with "..tar:GetName().."! Only one can leave alive!")
					else
						player:SendBroadcastMessage("This creature cannot be challenged yet.")
						spell:Cancel()
					end
				end
			else
				player:SendBroadcastMessage("You have no minion equipped. Visit a Minion Trainer to equip one.")
				spell:Cancel()
			end
		end
		if(spellid == 800090)then
			if(player:HasAura(800089))then
				if(math.random(5) == 1)then
					player:CastCustomSpell(tar, 801472, true, player:GetStat(2) / 3)
				end
			end
		end
		if(spellid == 500073 or spellid == 500075 or spellid == 500071)then
			if(player:HasAura(801468))then
				if(math.random(8) == 1)then
					player:ResetSpellCooldown(500072)
					player:SendBroadcastMessage("Hail of Arrows cooldown reset!")
				end
			end
		end
		if(spellid == 801384)then
			local minion = WorldDBQuery("SELECT minion, level, name FROM player_minions WHERE GUID = "..(player:GetGUIDLow()).." AND equipped = 1")
			if(minion ~= nil)then
				local runes = WorldDBQuery("SELECT rune1, rune2, rune3 FROM player_minions WHERE GUID = "..(player:GetGUIDLow()).." AND equipped = 1")
				MINION_MINS = 5
				local minionID = minion:GetUInt32(0)
				local minionlvl = minion:GetUInt32(1)
				local name = minion:GetString(2)
				local x, y, z, o = player:GetLocation()
				local pet = player:SpawnCreature(minionID, x + 1, y + 1, z + 0.2, o, 1, 60000)
				local lastlvl = pet:GetLevel()
				pet:SetLevel(minionlvl)
				pet:SetName(name)
				pet:SetFaction(35)
				pet:MoveFollow(player)
				local hpmod = 0.1
				if(minionlvl - lastlvl >= 1)then
					pet:AddAura(801385, pet):SetStackAmount(getMinionTraining(pet, minionlvl, lastlvl))
					pet:SetMaxHealth(pet:GetMaxHealth() + (12 + minionlvl / 3 * 2) * ((minionlvl - lastlvl)))
					pet:SetHealth(pet:GetMaxHealth())
				end
				if(runes ~= nil)then
					local r1 = runes:GetUInt32(0)
					local r2 = runes:GetUInt32(1)
					local r3 = runes:GetUInt32(2)
					if(r1 > 0)then
						pet:AddAura(r1, pet)
					end
					if(r2 > 0)then
						pet:AddAura(r2, pet)
					end
					if(r3 > 0)then
						pet:AddAura(r3, pet)
					end
				end
				player:SendBroadcastMessage(pet:GetName().." comes to your side!")
			else
				player:SendBroadcastMessage("You have no minion equipped. Visit a Minion Trainer to equip one.")
				spell:Cancel()
			end
		end
		if(spellid == 801361)then
			local qry = WorldDBQuery("SELECT x, y, z, map FROM lastraid WHERE id = 1")
			if(qry ~= nil)then
				local x = qry:GetFloat(0)
				local y = qry:GetFloat(1)
				local z = qry:GetFloat(2)
				local m = qry:GetUInt32(3)
				player:Teleport(m, x, y, z, 0)
			else
				player:SendBroadcastMessage("No last Town Raid found.")
				spell:Cancel()
			end
		end
		if(spellid == 800362)then
			local dmg = 3 + (2 + player:GetStat(3) / 5 * tar:GetAura(500339):GetStackAmount())
			playerclass:CastCustomSpell(tar, 801320, true, dmg)
		end
		if(spellid == 500971 or spellid == 500335 or spellid == 500333)then
			if(player:HasSpell(801318))then
				spell:Cancel()
				player:SendBroadcastMessage("You cannot use this ability with Lord of Bones.")
			end
		end
		if(spellid == 800803)then
			player:AddAura(500363, player)
		end
		if(spellid == 801259 or spellid == 801260 or spellid == 801252 or spellid == 801253 or spellid == 801256 or spellid == 801257)then
			if(player:GetMapId() == 37)then
				if(player:HasItem(900005, 20))then
					player:RemoveItem(900005, 20)
				else
					player:SendBroadcastMessage("Requires 20 x"..GetItemLink(900005))
					spell:Cancel()
				end
			else
				player:SendBroadcastMessage("Can only be used in Azshara Crater.")
				spell:Cancel()
			end
		end
		if(spellid == 800621)then
			if(player:HasSpell(801313))then
				player:CastSpell(player, 801299, true)
			end
		end
		if(spellid == 801097)then
			reaper_drainhealth(player, 2)
		end
		if(spellid == 801332)then
			if(hasSoulInfusion(player))then
				player:RegisterEvent(reaper_shrieking, 10, 1)
			else
				reaper_drainhealth(player, 20)
			end
		end
		if(spellid == 801441 or spellid == 801451 or spellid == 801461 or spellid == 801463 or spellid == 801466)then
			local runes = player:GetPower(5)
			if(runes >= 10)then
				setPower(player, 0, 5)
			end
		end
		if(spellid == 801330 or spellid == 801328 or spellid == 800797)then
			if(isDualWield(player) == false)then
				spell:Cancel()
				player:SendBroadcastMessage("Requires an off-hand weapon.")
			else
				if(spellid == 801328)then
					player:AddAura(500363, player)
				end
				if(spellid == 801330 and hasSoulInfusion(player))then
					player:AddAura(801336, tar)
				end
			end
		end
		if(spellid == 500357)then
			local stacks = 0
			if(player:HasAura(spellid))then
				stacks = player:GetAura(spellid):GetStackAmount()
			end
			if(stacks == 0)then
				player:CastCustomSpell(tar, 801327, true)
			end
			if(stacks == 1)then
				player:CastCustomSpell(tar, 801323, true)
			end
			if(stacks == 2)then
				player:CastCustomSpell(tar, 801326, true)
				player:RegisterEvent(reaper_removestacks, 100, 1)
			end
			player:AddAura(801333, player)
		end
		if(spellid == 800930 or spellid == 800940)then
			player:AddAura(801331, player)
		end
		if(spellid == 801321)then
			reaper_drainhealth(player, 10)
		end
		if(spellid == 801333)then
			player:DealDamage(player, player:GetMaxHealth() / 100)
		end
		if(spellid == 500365)then
			if(player:HasAura(800927))then
				player:RegisterEvent(reaper_resetsoulrend, 10, 1)
			end
		end
		if(spellid == 801321)then
			if(hasSoulInfusion(player))then
				player:RegisterEvent(reaper_soulshudder, 10, 1)
			end
		end
		if(spellid == 801325)then
			local total = player:GetAura(801324):GetDuration() / 1000
			player:DealDamage(player, player:GetMaxHealth() / 100 * total)
			player:RemoveAura(801324)
		end
		if(player:HasSpell(801308))then
			if(spellid == 801292)then
				player:AddAura(800856, tar)
				if(math.random(10) == 1)then
					player:RegisterEvent(chrono_addloop, 100, 1)
					player:SendBroadcastMessage("You gain Time Loop!")
				end
			end
			if(spellid == 801305)then
				if(math.random(4) == 1)then
					player:ResetSpellCooldown(801292)
					player:SendBroadcastMessage("Chaos Shard cooldown reset!")
				end
			end
			if(spellid == 801282)then
				player:ResetSpellCooldown(801290)
				player:ResetSpellCooldown(801291)
				player:SendBroadcastMessage("Epoch and Timerend cooldowns reset!")
			end
			if(spellid == 801309)then
				if(math.random(10) == 1)then
					player:ResetSpellCooldown(801290)
					player:SendBroadcastMessage("Epoch cooldown reset!")
				end
				if(math.random(10) == 1)then
					player:ResetSpellCooldown(801292)
					player:SendBroadcastMessage("Chaos Shard cooldown reset!")
				end
			end
		end

		if(spellid == 800418)then
			if(player:HasAura(800431))then
				local cost = 1
				local stacks = player:GetAura(800431):GetStackAmount()
				dif = stacks - cost
				if(dif >= 0)then
					if(dif == 0)then
						player:RemoveAura(800431)
					else
						player:GetAura(800431):SetStackAmount(dif)
					end
				else
					spell:Cancel()
				end
			else
				spell:Cancel()
			end
		end

		if(spellid == 800436)then
			if(player:HasAura(800431))then
				local cost = 2
				local stacks = player:GetAura(800431):GetStackAmount()
				dif = stacks - cost
				if(dif >= 0)then
					if(dif == 0)then
						player:RemoveAura(800431)
					else
						player:GetAura(800431):SetStackAmount(dif)
					end
				else
					spell:Cancel()
				end
			else
				spell:Cancel()
			end
		end

		if(spellid == 800439)then
			if(player:HasAura(800431))then
				local cost = 3
				local stacks = player:GetAura(800431):GetStackAmount()
				dif = stacks - cost
				if(dif >= 0)then
					if(dif == 0)then
						player:RemoveAura(800431)
					else
						player:GetAura(800431):SetStackAmount(dif)
					end
				else
					spell:Cancel()
				end
			else
				spell:Cancel()
			end
		end

		if(spellid == 800441)then
			if(player:HasAura(800431))then
				local cost = 2
				local stacks = player:GetAura(800431):GetStackAmount()
				dif = stacks - cost
				if(dif >= 0)then
					if(dif == 0)then
						player:RemoveAura(800431)
					else
						player:GetAura(800431):SetStackAmount(dif)
					end
				else
					spell:Cancel()
				end
			else
				spell:Cancel()
			end
		end

		if(spellid == 800443)then
			if(player:HasAura(800431))then
				local cost = 4
				local stacks = player:GetAura(800431):GetStackAmount()
				dif = stacks - cost
				if(dif >= 0)then
					if(dif == 0)then
						player:RemoveAura(800431)
					else
						player:GetAura(800431):SetStackAmount(dif)
					end
				else
					spell:Cancel()
				end
			else
				spell:Cancel()
			end
		end

		if(spellid == 801298)then
			tar:ResetAllCooldowns()
		end
		if(spellid == 801294)then
			local clone = nil
			local near = player:GetCreaturesInRange(60, 50381)
			for i,v in ipairs(near) do
				if(v:GetOwner() == player)then
					clone = v
				end
			end
			local x, y, z, o = clone:GetLocation()
			player:NearTeleport(x, y, z, o)
			player:SetHealth(clone:GetMaxHealth())
			setPower(player, clone:GetMaxPower(0), 0)
			clone:Kill(clone)
		end
		if(spellid == 801303 or spellid == 801304 or spellid == 801275 or spellid == 801294 or spellid == 801270 or spellid == 801296 or spellid == 800863 or spellid == 801288)then
			addChronoEssence(player, 1)
		end
		if(spellid == 801297 or spellid == 801295 or spellid == 801292 or spellid == 801291 or spellid == 801290 or spellid == 801283 or spellid == 801281 or spellid == 801267)then
			addChronoEssence(player, 2)
		end
		if(player:HasAura(801297))then
			if(spell:GetCastTime() > 0 or spell:GetPowerCost() > 0 and spellid ~= 801309 and spellid ~= 801307 and spellid ~= 801305 and spellid ~= 801299 and spellid ~= 801279)then
				setPower(player, spell:GetPowerCost(), player:GetPowerType())
				player:RegisterEvent(chrono_timeloop, 100, spellid)
				player:RemoveAura(801297)
			end
		end
		if(player:HasAura(801302))then
			if(spell:GetCastTime() > 0 or spell:GetPowerCost() > 0 and spellid ~= 801309 and spellid ~= 801307 and spellid ~= 801305 and spellid ~= 801299 and spellid ~= 801279)then
				player:RemoveAura(801302)
				player:CastSpell(tar, spellid, true)
				player:CastSpell(tar, spellid, true)
			end
		end
		if(player:HasAura(801190))then
			local clone = nil
			local near = player:GetCreaturesInRange(60, 50349)
			for i,v in ipairs(near) do
				if(v:GetOwner() == player)then
					clone = v
				end
			end
			clone:RegisterEvent(chrono_clonecast, 2000, spellid)
		end
		if(player:HasAura(801288))then
			player:RegisterEvent(chrono_recast, player:GetAura(801288):GetDuration(), spellid)
		end
		if(spellid == 801303)then
			if(tar:HasAura(800857))then
				local aura = tar:GetAura(800857)
				aura:SetStackAmount(aura:GetStackAmount() + 1)
				aura:SetDuration(aura:GetDuration() - (1000 * 10))
			end
		end
		if(spellid == 800857)then
			if(tar:HasAura(800857))then
				tar:RemoveAura(800857)
			else
				addChronoEssence(player, 1)
			end
		end
		if(spellid == 801305)then
			if(tar:HasAura(800856))then
				player:AddAura(800856, tar)
			end
		end
		if(player:HasSpell(801215))then
			if(spell:GetPowerCost() > 0 or spell:GetCastTime() > 0)then
				if(math.random(20) == 1)then
					player:CastSpell(tar, spellid, true)
				end
			end
		end
		if(spellid == 801250)then
			local mobs = {}
			local tarid = tar:GetEntry()
			if(tarid == OUTPOST_NAGA)then
				mobs = {50247, 50248, 50249}
			end
			if(tarid == OUTPOST_FURBOLG)then
				mobs = {50260, 50261, 50266}
			end
			if(tarid == OUTPOST_MANA)then
				mobs = {50299, 50298}
			end
			if(tarid == OUTPOST_SATYR)then
				mobs = {50182, 50183}
			end
			if(tarid == OUTPOST_OGRE)then
				mobs = {50245, 50244}
			end
			if(tarid == OUTPOST_DEMON)then
				mobs = {50306, 50307}
			end
			if(tarid == OUTPOST_NORTHMINE or tarid == OUTPOST_SOUTHMINE)then
				mobs = {50323, 50323}
			end
			local x, y, z, o = tar:GetLocation()
			for i,v in ipairs(mobs) do
				if(math.random(3) == 1)then
					local mob = tar:SpawnCreature(v, x, y, z, o, 4, 30000);
					local mobfac = 14
					local qry = WorldDBQuery("SELECT owner FROM outposts WHERE GUID = "..(tarid))
					if(qry ~= nil)then
						mobfac = qry:GetUInt32(0)
					end
					mob:SetFaction(mobfac)
					mob:AttackStart(player)
				end
			end
		end
		if(spellid == 801251)then
			player:SendBroadcastMessage("Outpost captured!")
			local tarid = tar:GetEntry()
			local facname = "Horde"
			local facid = 85
			if(player:IsAlliance())then
				facname = "Alliance"
				facid = 11;
			end
			WorldDBQuery("INSERT INTO outposts VALUES ("..tarid..", "..facid..")")
			WorldDBQuery("UPDATE outposts SET owner = "..facid.." WHERE GUID = "..tarid)

			local mobs = {}
			if(tarid == OUTPOST_NAGA)then
				mobs = {50247, 50248, 50249, 50250, 50303}
			end
			if(tarid == OUTPOST_FURBOLG)then
				mobs = {50260, 50261, 50264, 50266}
			end
			if(tarid == OUTPOST_MANA)then
				mobs = {50304, 50298, 50299, 50300}
			end
			if(tarid == OUTPOST_SATYR)then
				mobs = {50184, 50182, 50183, 50316}
			end
			if(tarid == OUTPOST_OGRE)then
				mobs = {50245, 50244, 50335}
			end
			if(tarid == OUTPOST_DEMON)then
				mobs = {50306, 50307, 50308}
			end
			for i,v in ipairs(mobs) do
				local near = tar:GetCreaturesInRange(350, v, 0, 0)
				for x,y in ipairs(near) do
					y:Respawn()
					if(math.random(5) == 1)then
						y:SendUnitYell("For the "..facname.."!", 0)
					end
					y:AttackStop()
					y:SetFaction(facid)
					y:CastSpell(y, 47292, true)
				end
			end
			onCaptureOutpost(player, tarid)
			sendWorldMessage(player:GetName().." has captured "..tar:GetName().." for the "..facname.."!", 1)
		end
		if(player:HasSpell(801222))then
			if(spell:GetPowerCost() > 0)then
				player:DealHeal(player, 801222, spell:GetPowerCost() / 10 * 8)
			end
		end
		if(spellid == 801220)then
			if(player:HasSpell(800701))then
				--player:CastCustomSpell(tar, 801220, true, (player:GetStat(0) * 0.8))
			end
		end
		if(spellid == 800705)then
			if(player:HasSpellCooldown(801219))then
				player:ResetSpellCooldown(801219)
				player:SendBroadcastMessage("Blitz cooldown reset!")
				player:SendAreaTriggerMessage("Blitz cooldown reset!")
			end
		end
		if(spellid == 801203)then
			local pow = player:GetPowerType()
			setPower(player, player:GetPower(pow) + player:GetMaxPower(pow) / 10 * 3, pow)
		end
		if(spellid == 800030)then
			player:DealHeal(player, 800030, player:GetMaxHealth() / 5)
		end
		if(spellid == 801221)then
			local crushers = player:GetCreaturesInRange(60, 50096)
			local flayers = player:GetCreaturesInRange(60, 50272)
			local x, y, z, o = tar:GetLocation()
			local range = 5
			for i,v in ipairs(crushers) do
				v:NearTeleport(x + math.random(range) - math.random(range), y + math.random(range) - math.random(range), z + 0.05, math.random(5))
			end
			range = 10
			for i,v in ipairs(flayers) do
				v:NearTeleport(x + math.random(range) - math.random(range), y + math.random(range) - math.random(range), z + 0.05, math.random(5))
			end
		end
		if(spellid == 801220)then
			if(player:HasSpell(800191))then
				tar:AddThreat(player, player:GetStat(0) + player:GetLevel() * 3)
			end
			if(math.random(20) == 1)then
				local a = player:GetAura(801219)
				a:SetDuration(a:GetDuration() + 500)
				a:SetMaxDuration(a:GetDuration())
			end
		end
		if(spell:GetPowerCost() > 0)then
			if(tar ~= nil)then
				if(tar:ToPlayer() ~= nil)then
					if(tar:HasSpell(801211))then
						local pt = tar:GetPowerType()
						setPower(tar, tar:GetPower(pt) + spell:GetPowerCost(), pt)
					end
				end
			end
		end
		if(player:HasSpell(801215))then
			if(spell:GetCastTime() > 0)then
				local pt = player:GetPowerType()
				setPower(player, player:GetPower(pt) + ((spell:GetCastTime() / 500) * (player:GetMaxPower(pt) / 100)), pt)
			end
		end
		if(spellid == 800841)then
			player:RegisterEvent(spiderform, 10, 1)
		end
		if(spellid == 801058)then
			if(math.random(20) == 1)then
				player:ResetSpellCooldown(801048)
				player:SendBroadcastMessage("Bouncing Blade cooldown reset!")
			end
		end
		if(spellid == 801236)then
			player:CastCustomSpell(tar, 801237, true, player:GetStat(1) / 3 * 2)
		end
		if(spellid == 801045)then
			player:RemoveAura(801054)
			player:RemoveAura(801053)
			player:RemoveAura(801046)
		end
		if(spellid == 801053)then
			player:RemoveAura(801054)
			player:RemoveAura(801045)
			player:RemoveAura(801046)
		end
		if(spellid == 801054)then
			player:RemoveAura(801045)
			player:RemoveAura(801053)
			player:RemoveAura(801046)
		end
		if(spellid == 801046)then
			player:RemoveAura(801054)
			player:RemoveAura(801053)
			player:RemoveAura(801045)
		end
		if(spellid == 500074)then
			if(player:HasSpell(801311))then
				setPower(player, player:GetPower(6) + 150, 6)
			end
			if(player:HasSpell(500076))then
				if(math.random(10) == 1)then
					player:ResetSpellCooldown(500076)
					setPower(player, player:GetPower(2) + player:GetMaxPower(2) / 5, 2)
					player:SendBroadcastMessage("Spread Shot cooldown reset!")
					player:SendAreaTriggerMessage("Spread Shot cooldown reset!")
				end
			end
			if(player:HasAura(800262))then
				player:CastCustomSpell(tar, 800259, true)
			end
			if(player:HasAura(800261))then
				player:CastCustomSpell(tar, 800258, true)
			end
			if(player:HasAura(800260))then
				player:CastCustomSpell(tar, 500081, true, player:GetStat(1) / 3)
			end
		end
		if(spellid == 800258)then
			if(tar:HasAura(800258))then
				local aura = tar:GetAura(800258)
				if(aura:GetStackAmount() >= 3)then
					player:RegisterEvent(ranger_popfrost, 10, 1)
				end
			end
		end
		if(spellid == 801192)then
			if(tar:HasAura(801191))then
				player:CastSpell(tar, 500074, true)
			end
		end
		if(spellid == 801157)then
			local insanity = player:GetAura(500706)
			if(insanity ~= nil)then
				local stacks = insanity:GetStackAmount()
				if(stacks >= 100)then
					if(math.random(20 - ((100 - player:GetHealthPct()) / 5)) == 1)then
						insanity:SetStackAmount(50)
						setPower(player, player:GetMaxPower(0), 0)
						player:SendBroadcastMessage("You regain your sanity!")
					else
						player:SendBroadcastMessage("Attempt failed!")
					end
				else
					player:SendBroadcastMessage("You are already sane.")
					spell:Cancel()
				end
			else
				player:SendBroadcastMessage("You are already sane.")
				spell:Cancel()
			end
		end
		if(spellid == 500724)then
			local stacks = -20
			if(player:HasAura(500706))then
				if(player:GetAura(500706):GetStackAmount() + stacks <= 0)then
					player:RemoveAura(500706)
				else
					player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
				end
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end
		if(spellid == 500110)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 100 * 6, 0)
			if(player:HasSpell(801153))then
				if(math.random(10) == 1)then
					player:ResetSpellCooldown(801153)
					player:SendBroadcastMessage("Summon Flayer cooldown reset!")
				end
			end
		end
		if(spell:GetPowerCost() > 0 or spell:GetCastTime() > 0)then
			if(getClassID(player) == CLASS_CULTIST)then
				if(player:HasSpell(801156))then
					local inrange = player:GetFriendlyUnitsInRange(40)
					for i,v in ipairs(inrange) do
						if(v:GetEntry() == 50271)then
							if(v:GetOwner() == player)then
								v:CastCustomSpell(tar, spellid, true, nil, nil, nil, nil, player:GetGUID())
							end
						end
					end
				end
				if(player:HasSpell(801154))then
					if(skipChek == false)then
						local enemies = player:GetUnfriendlyUnitsInRange(15)
						for i,v in ipairs(enemies) do
							if(v:HasAura(801154))then
								player:CastSpell(v, spellid, true)
							end
						end
					end
				end
			end
		end
		if(spellid == 500714)then --scripture
			local stacks = (100 - tar:GetHealthPct()) / 5;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end
		if(spellid == 801140)then
			setPower(player, player:GetPower(3) + 20, 0)
		end
		if(spellid == 800504)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 4, 0)
		end
		if(spellid == 801124)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 20, 0)
		end
		if(spellid == 800496)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 10, 0)
			if(math.random(10) == 1 and player:HasSpell(801125))then
				player:SendBroadcastMessage("Moonblade cooldown reset!")
				player:ResetSpellCooldown(801125)
			end
		end
		if(spellid == 801182)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 20, 0)
		end
		if(spellid == 801127)then
			local cost = player:GetMaxPower(0) / 5
			if(player:GetPower(0) >= cost)then
				setPower(player, player:GetPower(0) - cost, 0)
				if(player:HasSpell(801142))then
					player:CastCustomSpell(player, 801148, true, cost)
				end
				cost = cost * 1.5
				if(tar:HasAura(801131))then
					cost = cost * 1.5
				end
				player:CastCustomSpell(tar, 801136, true, cost)
			else
				player:SendBroadcastMessage("Not enough mana.")
				spell:Cancel()
			end
		end
		if(spellid == 801125)then
			local cost = player:GetPower(0) / 10 * 4
			if(player:HasSpell(801145))then
				cost = player:GetMaxPower(0) / 10 * 4
			end
			if(player:GetPower(0) >= cost)then
				setPower(player, player:GetPower(0) - cost, 0)
				if(player:HasSpell(801142))then
					player:CastCustomSpell(player, 801148, true, cost)
				end
				if(tar:HasAura(801131))then
					cost = cost * 1.5
				end
				player:CastCustomSpell(tar, 801137, true, cost)
			else
				player:SendBroadcastMessage("Not enough mana.")
				spell:Cancel()
			end
		end
		if(spellid == 800506)then
			if(player:HasSpell(801142))then
				if(player:HasAura(801123))then
					setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 10 * 3.5, 0)
				end
				if(player:HasAura(801128))then
					player:AddAura(801139, player)
				end
				if(player:HasAura(800508))then
					player:AddAura(15487, tar)
				end
				if(player:HasAura(800508))then
					local enemies = player:GetUnfriendlyUnitsInRange(14)
					for i,v in ipairs(enemies) do
						if(v:IsInCombat())then
							player:CastSpell(v, 800507, true)
						end
					end
				end
			end
		end
		if(spellid == 801129)then
			if(player:HasSpell(801145))then
				player:CastCustomSpell(tar, 801136, true, player:GetStat(1) / 4)
			end
		end
		if(spellid == 800499 or spellid == 800507)then
			if(player:HasSpell(801146))then
				local allies = player:GetPlayersInRange(30, 2, 1)
				for i,v in ipairs(allies) do
					player:CastCustomSpell(v, 801138, true, (player:GetPower(0) / 10))
				end
			end
		end
		if(spellid == 801130)then
			local cost = player:GetMaxPower(0) / 10 * 3
			if(player:GetPower(0) >= cost)then
				setPower(player, player:GetPower(0) - cost, 0)
				if(player:HasSpell(801146))then
					cost = cost * 6
				else
					cost = cost * 1.5
				end
				player:CastCustomSpell(tar, 801138, true, cost)
			else
				player:SendBroadcastMessage("Not enough mana.")
				spell:Cancel()
			end
		end
		if(spellid == 800961)then
			if(player:HasAura(500271))then
				local stacks = player:GetAura(500271):GetStackAmount()
				player:AddAura(500285, player):SetStackAmount(stacks)
				player:RemoveAura(500271)
			end
		end
		if(spellid == 801122)then
			if(tar:IsInCombat() == true)then
				if(player:HasSpell(800191))then
					tar:AddThreat(player, 30)
				end
				if(player:HasSpell(801146))then
					player:CastCustomSpell(tar, 801147, true, (player:GetStat(1) / 4 + player:GetStat(3) / 2))
				else
					player:CastCustomSpell(tar, 801149, true, (player:GetStat(1) / 10 * 3.5 + player:GetStat(3) / 5))
				end
			end
		end
		if(spellid == 801091 or spellid == 801118)then
			addEssence(player, 500285)
		end
		if(spellid == 801087 or spellid == 801117)then
			addEssence(player, 500271)
		end
		if(spellid == 500253)then
			addEssence(player, 500282)
		end
		if(spellid == 801086)then
			addEssence(player, 500282)
			addEssence(player, 500285)
			addEssence(player, 500271)
		end
		if(spellid == 500282)then
			if(canAddEssence(player))then
			else
				player:SendBroadcastMessage("You are already at maximum Essences.")
				spell:Cancel()
			end
		end
		if(spellid == 500285)then
			if(canAddEssence(player))then
			else
				player:SendBroadcastMessage("You are already at maximum Essences.")
				spell:Cancel()
			end
		end
		if(spellid == 500271)then
			if(canAddEssence(player))then
			else
				player:SendBroadcastMessage("You are already at maximum Essences.")
				spell:Cancel()
			end
		end
		if(spellid == 883)then
			player:RegisterEvent(ww_petfocus, 100, 1)
		end
		if(spellid == 801071)then
			player:RegisterEvent(player_norage, 100, 1)
		end
		if(spellid == 801072)then
			local stacks = player:GetPower(1) / 100
			if(player:HasAura(801078))then
				if(player:GetPower(1) >= player:GetMaxPower(1))then
					stacks = (player:GetMaxPower(1) / 100) 
				end
			end
			local dmg = (stacks * 0.3) * (5 + player:GetLevel() * 3 + player:GetStat(3) * 3 + math.random(6))
			player:CastCustomSpell(tar, 801073, true, dmg * 0.3)
		end
		if(spellid == 801021)then
			local family = WorldDBQuery("SELECT family FROM creature_template WHERE entry = "..tar:GetEntry()):GetUInt32(0)
			if(family > 0)then
				CharDBQuery("DELETE FROM character_pet WHERE owner = "..player:GetGUIDLow())
				local spell1 = WorldDBQuery("SELECT spell1 FROM creature_template WHERE entry = "..tar:GetEntry()):GetUInt32(0)
				local spell2 = WorldDBQuery("SELECT spell2 FROM creature_template WHERE entry = "..tar:GetEntry()):GetUInt32(0)
				local id = 2 + (CharDBQuery("SELECT max(id) FROM character_pet"):GetUInt32(0))
				player:SendBroadcastMessage("id: "..id)
				CharDBQuery("INSERT INTO character_pet (id, entry, owner, modelid, CreatedBySpell, PetType, level, name, renamed, slot, curhealth, curhappiness, abdata) VALUES ("..id..", "..tar:GetEntry()..", "..player:GetGUIDLow()..", "..tar:GetNativeDisplayId()..", 13481, 1, "..tar:GetLevel()..", '"..tar:GetName().."', 0, 0, "..(player:GetMaxHealth() / 3)..", 163820, '7 2 7 1 7 0 193 "..spell1.." 129 2649 193 "..spell2.." 1 0 6 2 6 1 6 0 ')")
				tar:DespawnOrUnsummon()
				player:SendBroadcastMessage("Creature tamed!")
			else
				player:SendBroadcastMessage("This creature cannot be tamed!")
			end
		end
		if(spellid == 800773)then
			if(player:HasAura(801077))then
				player:AddAura(15487, tar)
			end
		end
		if(spellid == 500125)then
			if(player:HasAura(801076))then
				if(math.random(5) == 1)then
					player:SendBroadcastMessage("Bloodbolt of Arugal cooldown reset!")
					player:SendAreaTriggerMessage("Bloodbolt of Arugal cooldown reset!")
					player:ResetSpellCooldown(500197)
				end
			end
		end
		if(spellid == 500907)then
			local stacks = player:GetAura(800999):GetStackAmount()
			player:RemoveAura(800999)
			local dmg = 6 + player:GetLevel() * 4 + player:GetStat(0) * 1.3 + math.random(6)
			player:CastCustomSpell(tar, 801047, true, dmg * stacks)
		end
		if(spellid == 801040)then
			player:AddAura(500906, player)
			player:AddAura(500906, player)
			player:AddAura(500906, player)
			local dmg = (player:GetMaxHealth() - player:GetHealth()) / 10
			player:CastCustomSpell(tar, 801062, true, dmg)
		end
		if(spellid == 801042)then
			if(tar:IsDead())then
				if(tar:GetDisplayId() == 25538)then
					spell:Cancel()
					player:SendBroadcastMessage("This corpse has already been rended.")
				else
					setPower(player, player:GetPower(1) + 200, 1)
					tar:SetDisplayId(25538)
				end
			else
				spell:Cancel()
				player:SendBroadcastMessage("Target must be a corpse.")
			end
		end
		if(spellid == 800168)then
			local stacks = player:GetAura(800999):GetStackAmount()
			player:RemoveAura(800999)
			local dmg = 1 + player:GetLevel() * 1.5 + player:GetStat(0) * 0.6 + math.random(3)
			player:CastCustomSpell(tar, 801057, true, dmg * stacks)
		end
		if(spellid == 801002)then
			player:RegisterEvent(prestilence_end, 100, 1)
		end
		if(spellid == 801050)then
			local dmg = 0.65 * (8 + player:GetLevel() * 3 + player:GetStat(0) * 1.2 + math.random(6))
			player:CastCustomSpell(tar, 801051, true, dmg / 5)
			player:DealHeal(player, 801051, dmg / 5)
		end
		if(spellid == 801059)then
			local dmg = 8 + player:GetLevel() * 3 + player:GetStat(0) * 1.2 + math.random(6)
			player:CastCustomSpell(tar, 801003, true, dmg)
		end
		if(spellid == 801063)then
			local stacks = player:GetAura(500906):GetStackAmount()
			player:RemoveAura(500906)
			local dmg1 = (player:GetLevel() + player:GetStat(1) * 0.5 + math.random(2))
			local duration = stacks * 6000
			player:CastCustomSpell(tar, 801064, true, dmg1)
			local aura = player:GetAura(801064)
			aura:SetDuration(duration)
			aura:SetMaxDuration(duration)
		end
		if(spellid == 801038)then
			local stacks = player:GetAura(500906):GetStackAmount()
			player:RemoveAura(500906)
			local dmg1 = 0.5 * ((player:GetLevel() * 1.75 + 4 + player:GetStat(0) * 0.75 + math.random(4)) * stacks)
			local dmg2 = (player:GetLevel() + 1 + player:GetStat(0) * 0.3 + math.random(2)) * stacks
			local duration = stacks * 1500
			player:CastCustomSpell(tar, 801004, true, dmg1)
			player:CastCustomSpell(tar, 801017, true, dmg2)
			local aura = player:GetAura(801017)
			aura:SetDuration(duration)
			aura:SetMaxDuration(duration)
		end
		if(spellid == 801001)then
			local stacks = player:GetAura(500906):GetStackAmount()
			player:RemoveAura(500906)
			local dmg1 = (player:GetLevel() * 7 + 5 + player:GetStat(2) * 2 + math.random(9)) * stacks 
			local dmg2 = (player:GetLevel() + 1 + player:GetStat(2) * 0.3) * stacks
			local duration = stacks * 3000
			player:CastCustomSpell(tar, 801060, true, dmg1, dmg2)
			local aura = player:GetAura(801060)
			aura:SetDuration(duration)
			aura:SetMaxDuration(duration)
		end
		if(spellid == 801016)then
			if(tar:HasAura(801003))then
				local dmg = 8 + player:GetLevel() * 3 + player:GetStat(0) * 1.2 + math.random(6)
				player:CastCustomSpell(tar, 801037, true, dmg / 2)
			end
			local stacks = player:GetAura(801016):GetStackAmount()
			if(stacks >= 3)then
				local dmg = 6 + player:GetLevel() * 2 + player:GetStat(0) * 0.8 + math.random(6)
				player:CastCustomSpell(tar, 801006, true, dmg)
				player:RemoveAura(801016)
			end
		end
		if(spellid == 801036)then
			tar:CastCustomSpell(player, 801066, true, nil)
		end
		if(spellid == 801048)then
			player:CastSpell(player, 54350, true)
		end
		if(spellid == 500909)then
			if(math.random(10) == 1)then
				player:ResetSpellCooldown(801059)
				player:SendBroadcastMessage("Flames of Xoroth cooldown reset!")
			end
		end
		if(spellid == 801056)then
			if(player:HasAura(801045))then
				player:AddAura(801052, tar)
			end
			if(player:HasAura(801046))then
				local dmg = 0.5 * (10 + (player:GetStat(0) * 2.5 + math.random(4) + player:GetLevel() * 3))
				player:CastCustomSpell(tar, 801051, true, dmg)
				player:DealHeal(player, 801051, dmg)
			end
			if(player:HasAura(801053))then
				player:AddAura(15487, tar)
			end
			if(player:HasAura(801054))then
				local dmg = ((100 - player:GetHealthPct()) / 50) * (player:GetStat(0) * 2.5)
				local absorb = player:GetStat(0) * 5
				player:CastCustomSpell(tar, 801055, true, dmg, absorb)
			end
		end
		if(spellid == 800998)then
			local dmg = (player:GetLevel() * 1.3 + 5 + 1.2 * (player:GetStat(1)))
			player:CastCustomSpell(tar, 801019, true, 0.4 * (player:GetLevel() * 1.3 + 5 + 1.2 * (player:GetStat(1))))
			player:DealHeal(player, 801019, dmg)
		end
		if(spellid == 801008)then
			player:CastCustomSpell(tar, 801009, true, (player:GetLevel() * 1.3 + 5 + 1.2 * (player:GetStat(1))))
		end
		if(spellid == 500237)then
			setPower(player, player:GetPower(3) + 20, 3)
		end
		if(spellid == 800991)then
			player:CastCustomSpell(tar, 800992, true, (player:GetLevel() * 1.5 + 4 + 0.7 * (player:GetStat(2))))
			if(player:HasSpell(800191))then
				tar:AddThreat(player, 2 * (player:GetLevel() * 1.5 + 4 + 0.7 * (player:GetStat(2))))
			end
			if(tar:HasAura(801220))then
				local stacks = tar:GetAura(801220):GetStackAmount()
				player:CastCustomSpell(tar, 800992, true, (player:GetMaxHealth() / 20 * stacks))
				tar:RemoveAura(801220)
			end
		end
		if(spellid == 800313)then
			player:CastCustomSpell(player, 800993, true, player:GetMaxHealth() / 10)
		end
		if(spellid == 800125)then
				spell:Cancel()
				player:SendBroadcastMessage("This ability is temporarily disabled.")
		end
		if(spellid == 500916)then
			if(math.random(10) == 1)then
				player:ResetSpellCooldown(800516)
				player:SendBroadcastMessage("Savage Smash cooldown reset!")
			end
		end
		if(spellid == 800951)then
			setPower(player, player:GetPower(3) + 5, 3)
			if(math.random(20) == 1)then
				player:ResetSpellCooldown(500001)
				player:SendBroadcastMessage("Wrecker cooldown reset!")
			end
			if(player:HasSpell(800132))then
				if(math.random(10) == 1)then
					setPower(player, player:GetPower(3) + 10, 3)
				end
				if(math.random(10) == 1)then
					player:ResetSpellCooldown(500920)
					player:SendBroadcastMessage("Impale cooldown reset!")
				end
				if(math.random(10) == 1)then
					player:ResetSpellCooldown(500915)
					player:SendBroadcastMessage("Crushing Slam cooldown reset!")
				end
			end
		end
		if(spellid == 800516)then
			player:RemoveAura(800948)
			player:RemoveAura(800949)
			player:RemoveAura(800952)
			player:RemoveAura(800953)
			local rand = math.random(4)
			if(rand == 1)then buff = 800948; end
			if(rand == 2)then buff = 800949; end
			if(rand == 3)then buff = 800952; end
			if(rand == 4)then buff = 800953; end
			player:AddAura(buff, player)
		end
		if(spellid == 500001)then
			if(player:HasAura(800948))then
				player:RemoveAura(800948)
				setPower(player, player:GetPower(3) + 75, 3)
				player:ResetSpellCooldown(800516)
			end
			if(player:HasAura(800949))then
				player:RemoveAura(800949)
				player:AddAura(800954, player)
			end
			if(player:HasAura(800952))then
				player:RemoveAura(800952)
				if(tar:HasAura(500917))then
					local count = tar:GetAura(500917):GetStackAmount()
					player:CastCustomSpell(tar, 800956, true, (count * (4 * player:GetLevel() + player:GetStat(0) / 3 + count)) * 1.25)
					tar:RemoveAura(500917)
				end
			end
			if(player:HasAura(800953))then
				player:RemoveAura(800953)
				if(skipChek == false and tar:HasAura(500917))then
					local near1 = player:GetUnfriendlyUnitsInRange(10)
					for i,v in ipairs(near1) do
						if(v:HasAura(500917))then
							player:CastSpell(v, spellid, true)
						end
					end
				end
			end
		end
		if(spellid == 800869)then
			if(player:HasAura(800912))then
				if(math.random(10) == 1)then
					player:AddAura(800946, player)
				end
				if(skipChek == false)then
					local near2 = player:GetFriendlyUnitsInRange(30)
					if(near2~=nil)then
						for i,v in ipairs(near2) do
							if(v:HasAura(800870))then
								player:DealHeal(v, 800869, (player:GetStat(3) / 100) * 3)
							end
						end
					end
				end
				if(skipChek == false and tar:HasAura(800871))then
					local near1 = player:GetUnfriendlyUnitsInRange(30)
					for i,v in ipairs(near1) do
						if(v:HasAura(800871))then
							player:CastSpell(v, spellid, true)
						end
					end
				end
			end
		end

		if(spellid == 800532)then
			if(player:IsInCombat())then
				player:CastSpell(player, spellid, true)
			end
		end

		if(spellid == 800940)then
			player:RegisterEvent(reaper_whirl, 400, 1)
		end

		if(spellid == 500125 or spellid == 500197 or spellid == 800772 or spellid == 800774 or spellid == 800780 or spellid == 800785 or spellid == 800781)then
			if(player:HasAura(500122))then
				player:SendBroadcastMessage("Requires Mortal Form")
				player:SendAreaTriggerMessage("Requires Mortal Form")
				spell:Cancel()
			end
		end

		if(spellid == 800794)then
			if(skipChek == false)then
				local stacks = player:GetAura(800790):GetStackAmount()
				if(tar:HasAura(800825))then
					tar:RemoveAura(800825)
					stacks = stacks * 2
				end
				player:RegisterEvent(pyro_barrage, 200, stacks)
				player:RemoveAura(800790)
			end
		end

		if(spellid == 800901)then
			if(tar:HasAura(800870))then
				tar:RemoveAura(800870)
				if(tar:HasAura(800903))then
					local aura = tar:GetAura(800903)
					aura:SetDuration(aura:GetDuration() + 30000)
					aura:SetMaxDuration(aura:GetMaxDuration() + 30000)
				end
			else
				spell:Cancel()
				player:SendBroadcastMessage("The target must be affected by Shadra's Vigil")
			end
		end

		if(spellid == 800869)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 100 * 3, 0)
		end

		if(spellid == 800897)then
			if(tar:HasAura(800870))then
				local aura = tar:GetAura(800870)
				aura:SetDuration(aura:GetDuration() + 30000)
				aura:SetMaxDuration(aura:GetMaxDuration() + 30000)
			end
		end

		if(spellid == 800899)then
			if(skipChek == false)then
				local allies = tar:GetFriendlyUnitsInRange(30)
				for i,v in ipairs(allies) do
					if(v:HasAura(800870))then
						player:CastSpell(v, spellid, true)
					end
				end
			end
		end

		if(spellid == 800902)then
			if(tar:HasAura(800870))then
				tar:RemoveAura(800870)
				if(tar:HasAura(800901))then
					player:AddAura(800903, tar)
				end
			else
				player:SendAreaTriggerMessage("The target must be affected by Shadra's Vigil")
				spell:Cancel()
			end
		end

		local isSpiderForm = false
		if(player:HasAura(800841))then
			isSpiderForm = true
		else
			isSpiderForm = false
		end

		if(spellid == 800848 or spellid == 800843 or spellid == 800878 or spellid == 800879 or spellid == 800880 or spellid == 800882 or spellid == 800883 or spellid == 800885 or spellid == 800887 or spellid == 800888 or spellid == 800892 or spellid == 800893 or spellid == 800896 or spellid == 800907)then
			if(isSpiderForm == false)then
				spell:Cancel()
				player:SendAreaTriggerMessage("Requires Stalker Form")
			end
		end

		if(spellid == 800869 or spellid == 800870 or spellid == 800897 or spellid == 800899 or spellid == 800900 or spellid == 800901 or spellid == 800902 or spellid == 800904 or spellid == 800905 or spellid == 800914)then
			if(isSpiderForm == true)then
				player:RegisterEvent(spiderform, 10, 1)
				spell:Cancel()
				player:SendAreaTriggerMessage("Cannot be used in Stalker Form")
			end
		end

		if(isSpiderForm)then
			if(spellid == 800878)then
				if(player:HasAura(800906))then
					player:AddAura(800884, tar)
					setPower(player, player:GetPower(1) + 200, 1)
				end
			end

			if(spellid == 800879)then
				setPower(player, player:GetPower(1) + 200, 1)
			end

			if(spellid == 800843)then
				player:AddAura(800906, player)
			end

			if(spellid == 800883)then
				setPower(player, player:GetPower(1) + 200, 1)
				if(math.random(4) == 1)then
					player:ResetSpellCooldown(800882)
				end
			end

			if(spellid == 800893)then
				setPower(player, player:GetPower(1) + 100, 1)
				local aura = tar:GetAura(800890)
				local stacks = aura:GetStackAmount()
				while(stacks > 1)do
					player:AddAura(spellid, tar)
					local newstacks = aura:GetStackAmount() - 1
					stacks = newstacks
					if(newstacks > 0)then
						aura:SetStackAmount(newstacks)
					else
						tar:RemoveAura(800890)
					end
				end
			end

			if(spellid == 800898)then
				local aura = tar:GetAura(800886)
				aura:SetStackAmount(aura:GetStackAmount() + 1)
			end

			if(spellid == 800880)then
				if(tar:HasAura(800880))then
					local aura = tar:GetAura(800880)
					local stacks = aura:GetStackAmount()
					if(stacks == 2)then
						tar:RemoveAura(800880)
						player:AddAura(800886, tar)
					end
				end
				if(player:HasAura(800906))then
					player:AddAura(800880, tar)
					player:AddAura(800877, tar)
				end
			end

			if(spellid == 800888)then
				if(tar:HasAura(800880))then
					local aura = tar:GetAura(800880)
					local stacks = aura:GetStackAmount()
					if(stacks == 2)then
						tar:RemoveAura(800880)
						player:DealDamage(tar, player:GetStat(3) * 1.75 + player:GetLevel() * 2.25 + math.random(12))
					else
						tar:RemoveAura(800880)
						player:AddAura(800884, tar)
					end
				end
			end


			if(spellid == 800885)then
				if(tar:HasAura(800882))then
					tar:RemoveAura(800882)
					player:AddAura(800881, tar)
				end
			end

			if(spellid == 800882)then
				if(tar:HasAura(800886))then
					local aura = tar:GetAura(800886)
					aura:SetDuration(aura:GetDuration() + 3000)
					aura:SetMaxDuration(aura:GetMaxDuration() + 3000)
				end
			end
		end

		if(spellid == 800797)then
			player:SetPowerType(1)
			player:SetMaxPower(1, 1000)
		end

		if(spellid == 800122)then
			player:ResetSpellCooldown(800796)
		end

		if(spellid == 500129 or spellid == 800808 or spellid == 800805 or spellid == 800791)then
			if(skipChek == false and tar:HasAura(800815))then
				local near1 = player:GetUnfriendlyUnitsInRange(30)
				for i,v in ipairs(near1) do
					if(v:HasAura(800815))then
						player:CastSpell(v, spellid, true)
					end
				end
			end
		end

		if(spellid == 800816)then
			local near = player:GetCreaturesInRange(50, 50258)
			for i,v in ipairs(near) do
				if(v:GetOwner() == player)then
					local x, y, z = spell:GetTargetDest()
					v:MoveTo(0, x, y, z)
				end
			end
		end

		if(spellid == 800791)then
			if(tar:HasAura(800825))then
				tar:RemoveAura(800825)
				player:DealDamage(tar, player:GetStat(3) * 1.75 + player:GetLevel() * 2.25 + math.random(12))
			end
		end

		if(spellid == 500129)then
			if(tar:HasAura(800825))then
				tar:RemoveAura(800825)
				player:DealHeal(player, 800825, player:GetMaxHealth() / 5)
				setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 5, 0)
			end
		end

		if(spellid == 800811)then
			local chance = 25

			if(tar:HasAura(800791))then
				tar:RemoveAura(800791)
				chance = 99;
			end

			if(player:HasAura(800812))then
				local stacks = player:GetAura(800812):GetStackAmount()
				chance = (chance + stacks * 10)
			end

			if(chance > 99)then chance = 99; end

			if(math.random(100 - chance) == 1 or chance == 99)then
				player:AddAura(800812, player)
				player:RegisterEvent(pyro_resetmagmasurge, 100, 1)
			end
		else
			if(player:HasAura(800812))then
				player:RemoveAura(800812)
			end
		end

		if(spellid == 800810)then
			if(tar:HasAura(500129))then
				player:AddAura(800814, tar)
				player:DealDamage(tar, player:GetStat(3) * 2 + player:GetLevel() * 3 + math.random(12))
			end
		end

		if(spellid == 800790)then
			if(player:HasSpellCooldown(500129))then
				setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 10, 0)
			end
		end

		if(spellid == 800808)then
			if(tar:IsCasting())then
				player:AddAura(800791, tar)
			else
				player:AddAura(800790, player)
				player:AddAura(800790, player)
			end
		end

		if(spellid == 800792)then
			if(tar:HasAura(800791))then
				tar:RemoveAura(800791)
				player:AddAura(800814, tar)
			end
		end

		if(spellid == 800805)then
			if(tar:HasAura(800791))then
				tar:RemoveAura(800791)
				player:AddAura(800793, tar)
			end
		end

		if(spellid == 800806)then
			if(tar:HasAura(800791))then
				tar:RemoveAura(800791)
				player:DealHeal(player, 800806, (tar:GetMaxHealth() - tar:GetHealth()) / 2)
			end
		end

		if(spellid == 800645)then
			local quests = WorldDBQuery("SELECT * FROM broken_quests")
			if(quests) then
	        repeat
	            local qid = quests:GetUInt32(0)
				if(player:HasQuest(qid))then
					player:CompleteQuest(qid)
				end
	        until not quests:NextRow()
	        end
		end

		if(tar ~= nil)then
			if(tar:ToUnit() ~= nil or tar:ToPlayer() ~= nil)then
				if(tar:HasAura(500962))then
					local aura = tar:GetAura(500962)
					if(aura:GetCaster() == player and not (spellid == 800195))then
						aura:SetDuration(aura:GetDuration() + 2000)
						aura:SetStackAmount(aura:GetStackAmount() + 1)
					end
				end
			end
		end

		if(spellid == 500685)then
			if(player:HasSpell(800518))then
				player:AddAura(800518, player)
			end
		end

		if(spellid == 500689)then
			player:CastCustomSpell(tar, 801474, true, player:GetMaxHealth() / 7)
		end

		if(spellid == 801465)then
			setPower(player, 10, 5)
		end

		if(player:HasSpell(801448))then
			if(spellid == 801446 or spellid == 801443 or spellid == 801445)then
				if(isFist(player))then
					setPower(player, player:GetPower(5) + 1, 5)
				end
			end
		end

		if(spellid == 500680)then
			if(isFist(player))then
				setPower(player, player:GetPower(5) + 1, 5)
			end
		end

		if(spellid == 801445)then
			if(player:HasAura(801454))then
				player:CastCustomSpell(tar, 801475, true, player:GetStat(3) / 3 * 2)
				setPower(player, player:GetPower(5) + 3, 5)
				player:RemoveAura(801454)
			end
		end

		if(spellid == 500680)then
			if(player:HasAura(801453))then
				player:CastCustomSpell(tar, 801475, true, player:GetStat(3) / 3 * 2)
				setPower(player, player:GetPower(5) + 3, 5)
				player:RemoveAura(801453)
			end
		end

		if(spellid == 801443)then
			if(player:HasAura(801452))then
				player:CastCustomSpell(tar, 801475, true, player:GetStat(3) / 3 * 2)
				setPower(player, player:GetPower(5) + 3, 5)
				player:RemoveAura(801452)
			end
		end
		
		if(spellid == 800526)then
			if(isFist(player))then
				setPower(player, player:GetPower(5) + 1, 5)
				local dmg = player:GetStat(3) / 10 + player:GetLevel()
				if(player:HasAura(801465))then
					dmg = dmg + dmg / 2
				end
				if(player:HasSpell(801479))then
					if(math.random(10) == 1)then
						dmg = dmg * 3
					end
				end
				player:CastCustomSpell(tar, 801450, true, dmg)
				player:AddAura(801476, player)
				local stacks = player:GetAura(801476):GetStackAmount()
				if(stacks >= 10)then
					player:ResetSpellCooldown(500689)
					player:RemoveAura(801476)
				end
			end
			if(player:HasSpell(801479))then
				if(math.random(10) == 1)then
					player:AddAura(801452, player)
					player:SendAreaTriggerMessage("Combo triggered: Uppercut!")
					player:SendBroadcastMessage("Combo triggered: Uppercut!")
				end
				if(math.random(10) == 1)then
					player:AddAura(801453, player)
					player:SendAreaTriggerMessage("Combo triggered: Jab!")
					player:SendBroadcastMessage("Combo triggered: Jab!")
				end
				if(math.random(10) == 1)then
					player:AddAura(801454, player)
					player:SendAreaTriggerMessage("Combo triggered: Sweeping Kick!")
					player:SendBroadcastMessage("Combo triggered: Sweeping Kick!")
				end
			end
			if(player:HasAura(801441))then
				player:CastCustomSpell(tar, 801449, true, player:GetStat(3) / 2)
			end
			if(player:HasAura(801461))then
				player:CastCustomSpell(tar, 801462, true, player:GetStat(3) / 5)
			end
			if(player:HasAura(801463))then
				player:CastCustomSpell(player, 801464, true, player:GetStat(3) / 2)
			end
			if(player:HasAura(801466))then
				player:DealDamage(player, player:GetMaxHealth() / 100)
				player:CastCustomSpell(player, 801467, true, player:GetStat(3) / 2)
			end
			--[[if(math.random(10) == 1)then
				local r = math.random(3)
				local aura = 800763
				if(r == 1)then aura = 800764 end
				if(r == 2)then aura = 800765 end
				player:AddAura(aura, player)
			end]]
		end

		if(spellid == 800766)then
			local r = math.random(3)
			local aura = 800763
			if(r == 1)then aura = 800764 end
			if(r == 2)then aura = 800765 end
			player:AddAura(aura, player)
		end

		if(spellid == 801470)then
			if(player:IsMoving())then
			else
				player:AddAura(801471, player)
			end
		end

		if(spellid == 800760)then
			if(player:HasAura(800763))then
				player:RemoveAura(800763)
				local r = math.random(3)
				local aura = 800763
				if(r == 1)then aura = 800764 end
				if(r == 2)then aura = 800765 end
				player:AddAura(aura, player)

				player:AddAura(800528, player)

				player:DealDamage(tar, player:GetLevel() * 1.5 + (player:GetStat(1) / 3 * 2), false, 1)

				player:AddAura(800789, tar)
			end
		end

		if(spellid == 500680)then
			if(player:HasSpell(800124))then
				player:DealDamage(tar, player:GetLevel() * 1.1 + (player:GetStat(1) / 3) + 3, false, 1)
			end
		end

		if(spellid == 800761)then
			if(player:HasAura(800764))then
				player:RemoveAura(800764)
				local r = math.random(3)
				local aura = 800763
				if(r == 1)then aura = 800764 end
				if(r == 2)then aura = 800765 end
				player:AddAura(aura, player)

				player:AddAura(800528, player)

				player:DealDamage(tar, player:GetLevel() * 1.5 + (player:GetStat(1) / 3 * 2), false, 1)

				player:AddAura(800788, tar)
			end
		end

		if(spellid == 800762)then
			if(player:HasAura(800765))then
				player:RemoveAura(800765)
				local r = math.random(3)
				local aura = 800763
				if(r == 1)then aura = 800764 end
				if(r == 2)then aura = 800765 end
				player:AddAura(aura, player)

				player:AddAura(800528, player)

				player:DealDamage(tar, player:GetLevel() * 1.5 + (player:GetStat(1) / 3 * 2), false, 1)

				player:AddAura(800787, tar)
			end
		end

		if(spellid == 800335 or spellid == 800732 or spellid == 800306 or spellid == 800308 or spellid == 800333 or spellid == 500118 or spellid == 800748)then
			if(player:HasAura(800735))then
				if(math.random(10) == 1)then
					local rand = math.random(3)
					local spell = 800726
					if(rand == 1)then
						spell = 800727
					end
					if(rand == 2)then
						spell = 800728
					end
					player:AddAura(spell, tar)
				end
			end
			if(player:HasAura(800736))then
				if(math.random(100) <= 15)then
					local spell = 800737
					player:AddAura(spell, tar)
				end
			end
		end

		--[[if(spellid == 800729 or spellid == 800730 or spellid == 800731)then
			if(player:HasAura(800733))then
				if(math.random(20) == 1)then
					local rand = math.random(3)
					local spell = 800726
					if(rand == 1)then
						spell = 800727
					end
					if(rand == 2)then
						spell = 800728
					end
					player:AddAura(spell, tar)
				end
			end
		end]]

		if(spellid == 500326)then
			setPower(player, player:GetPower(6) + 200, 6)
		end

		if(player:HasAura(800736))then
			setPower(player, player:GetPower(0) + spell:GetPowerCost() / 3, 0)
		end

		if(spellid == 800734)then
			local rand = math.random(3)
			local spell = 800726
			if(rand == 1)then
				spell = 800727
			end
			if(rand == 2)then
				spell = 800728
			end
			player:AddAura(spell, tar)
		end

		if(spellid == 800705)then
			setPower(player, player:GetPower(3) + 15, 3)
			if(tar:HasAura(800705))then
				if(tar:GetAura(800705):GetStackAmount() >= 4)then
					player:ResetSpellCooldown(800316)
					player:DealDamage(tar, player:GetStat(0) / 3 * 2)
				end
			end
		end

		if(spellid == 800732)then
			if(tar:HasAura(800335))then
				local stacks = tar:GetAura(800335):GetStackAmount()
				if(stacks <= 4 and stacks >= 1)then
					player:AddAura(800305, player)
					player:AddAura(800305, player)
				else
					player:AddAura(800738, player)
				end
			else
				setPower(player, player:GetPower(0) + player:GetPower(0) / 5, 0)
			end
		end

		if(spellid == 800741 or spellid == 800745 or spellid == 800746 or spellid == 800747)then
			local x, y, z = spell:GetTargetDest()
			local near = player:GetCreaturesInRange(50, 50257)
			for i,v in ipairs(near) do
				if(v:GetOwner() == player)then
					v:NearTeleport(x + math.random(5) - math.random(5), y + math.random(5) - math.random(5), z, v:GetO())
					v:RemoveAura(800740)
					v:CastSpell(v, spellid - 3, true)
					v:AddAura(800740, v)
					v:CastSpell(v, 60427, true)
				end
			end
		end

		if(player:HasSpell(800758))then
			if((spellid == 800731 or spellid == 800729 or spellid == 800730 or spellid == 800724 or spellid == 800335 or spellid == 500118))then
				if(tar:IsInCombat() == false)then
					tar:AttackStart(player)
				end
				local near = player:GetCreaturesInRange(50, 50257)
				for i,v in ipairs(near) do
					if(v:GetOwner() == player and (player:HasAura(800759) or math.random(5) == 1))then
						v:CastCustomSpell(tar, spellid, true, nil, nil, nil, nil, player:GetGUID())
					end
				end
			end
		end

		if(spellid == 800748)then
			local range = 40
			local anger = 50253
			local sadness = 50254
			local fear = 50255
				
			for i,v in ipairs(player:GetCreaturesInRange(range, anger)) do
				if(v:GetOwner() == player)then
					local intellect = player:GetStat(4)
					v:CastSpell(v, 70509, true)
					v:CastSpell(tar, 500150, true)
					local damage = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect  * 1.5)
					player:AddAura(800750, tar)
					player:DealDamage(tar, (damage), false, 5)
					v:RegisterEvent(spirit_despawn, (v:GetDistance(tar) * 20), 1)
				end
			end

			for i,v in ipairs(player:GetCreaturesInRange(range, sadness)) do
				if(v:GetOwner() == player)then
					local intellect = player:GetStat(4)
					v:CastSpell(v, 70509, true)
					v:CastSpell(tar, 500150, true)
					local damage = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect  * 1.5)
					player:AddAura(800751, tar)
					player:DealDamage(tar, (damage), false, 5)
					v:RegisterEvent(spirit_despawn, (v:GetDistance(tar) * 20), 1)
				end
			end

			for i,v in ipairs(player:GetCreaturesInRange(range, fear)) do
				if(v:GetOwner() == player)then
					local intellect = player:GetStat(4)
					v:CastSpell(v, 70509, true)
					v:CastSpell(tar, 500150, true)
					local damage = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect  * 1.5)
					player:AddAura(800752, tar)
					player:DealDamage(tar, (damage), false, 5)
					v:RegisterEvent(spirit_despawn, (v:GetDistance(tar) * 20), 1)
				end
			end
		end

		if(spellid == 800749)then
			local range = 40
			local anger = 50253
			local sadness = 50254
			local fear = 50255
				
			for i,v in ipairs(player:GetCreaturesInRange(range, anger)) do
				if(v:GetOwner() == player)then
					local intellect = player:GetStat(4)
					v:CastSpell(v, 70509, true)
					v:CastSpell(tar, 500150, true)
					local heal = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect  * 1.5)
					player:AddAura(800753, tar)
					player:DealHeal(tar, spellid, (heal))
					v:RegisterEvent(spirit_despawn, 100, 1)
				end
			end

			for i,v in ipairs(player:GetCreaturesInRange(range, sadness)) do
				if(v:GetOwner() == player)then
					local intellect = player:GetStat(4)
					v:CastSpell(v, 70509, true)
					v:CastSpell(tar, 500150, true)
					local heal = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect  * 1.5)
					player:AddAura(800754, tar)
					player:DealHeal(tar, spellid, (heal))
					v:RegisterEvent(spirit_despawn, 100, 1)
				end
			end

			for i,v in ipairs(player:GetCreaturesInRange(range, fear)) do
				if(v:GetOwner() == player)then
					local intellect = player:GetStat(4)
					v:CastSpell(v, 70509, true)
					v:CastSpell(tar, 500150, true)
					local heal = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect  * 1.5)
					player:AddAura(800755, tar)
					player:DealHeal(tar, spellid, (heal))
					v:RegisterEvent(spirit_despawn, 100, 1)
				end
			end
		end

		if(spellid == 800725)then
			player:AddAura(800738, player)
			player:RegisterEvent(spiritmage_unleash, 10, 1)
		end

		if(spellid == 800720)then
			spell:Cancel()
			local pet = player:GetNearestCreature(30, 50257)
			pet:RemoveAura(800721)
			pet:AddAura(spellid, pet)
		end

		if(spellid == 800721)then
			spell:Cancel()
			local pet = player:GetNearestCreature(30, 50257)
			pet:RemoveAura(800720)
			pet:AddAura(spellid, pet)
		end

		if(spellid == 800718 or spellid == 500118)then
			player:AddAura(800738, player)
		end

		if(spellid == 800718)then
			local x, y, z = spell:GetTargetDest()
			player:Teleport(player:GetMapId(), x, y, z, player:GetO())
			--player:CastSpell(player, 64446, true)
			player:CastSpell(player, 60427, true)
			for i=50253,50256 do
				local near = player:GetCreaturesInRange(30, i)
				for i,v in ipairs(near) do
					if(v:GetOwner() == player)then
						v:NearTeleport(x + math.random(5) - math.random(5), y + math.random(5) - math.random(5), z, v:GetO())
						v:CastSpell(v, 60427, true)
					end
				end
			end
		end

		if(spellid == 800839)then
			local x, y, z = spell:GetTargetDest()
			player:Teleport(player:GetMapId(), x, y, z, player:GetO())
			--player:CastSpell(player, 64446, true)
			player:CastSpell(player, 61456, true)
			if(player:HasAura(800839))then
				local stacks = player:GetAura(800839):GetStackAmount()
				if(stacks < 3)then
					player:RegisterEvent(reaper_resetwaltz, 100, 1)
				end
			else
				player:RegisterEvent(reaper_resetwaltz, 100, 1)
			end
		end

		if(spellid == 800848)then
			if(player:HasAura(800848))then
				local stacks = player:GetAura(800848):GetStackAmount()
				if(stacks < 3)then
					player:RegisterEvent(spider_resetskitter, 100, 1)
				end
			else
				player:RegisterEvent(spider_resetskitter, 100, 1)
			end
		end

		if(spellid == 800709 or spellid == 800710 or spellid == 800711)then
			if(player:IsCasting())then
				spell:Cancel()
			end
		end

		if(player:HasAura(800561))then
			local aura = player:GetAura(800561)
			aura:SetDuration(aura:GetDuration() + 3000)
			player:DealDamage(player, player:GetStat(3) * 1.5)
		end

		if(spellid == 800694)then
			if(player:IsInCombat() == false)then
				player:AddAura(800694, player)
				player:AddAura(800694, player)
				player:AddAura(800694, player)
			end
		end

		if(spellid == 800479)then
			if(math.random(2) == 1)then
				spell:Cancel()
			end
		end

		if(spellid == 800430)then
			if(player:HasSpell(800462))then
				player:AddAura(800694, player)
			end
		end

		if(spellid == 800624 and skipChek == false)then
			local list = player:GetCreaturesInRange(20)
			for i,v in ipairs(list) do
				if(v:HasAura(800616))then
					if(v:GetAura(800616):GetCaster() == player)then
						player:CastSpell(v, 800624, true)
					end
				end
			end
		end

		if(spellid == 800234)then
			if(tar:HasAura(800357))then
				player:AddAura(800579, tar)
			end
		end

		if(spellid == 800193 or spellid == 800194 or spellid == 800195 or spellid == 800196 or spellid == 800197 or spellid == 800198 or spellid == 800199)then --buffs
			if(player:IsInGroup())then
				local grp = player:GetGroup()
				for i,v in ipairs(grp) do
					player:AddAura(spellid, v)
				end
			end
		end

		if(spellid == 800611)then
			if(math.random(10) == 1)then
				player:AddAura(800601, player)
			end
		end

		if(spellid == 800625)then
			if(tar:HasAura(800616))then
				player:ResetSpellCooldown(800626)
			end
		end

		if(spellid == 800632)then
			if(tar:HasAura(800639))then
				dmg = player:GetStat(0) / 3
				player:DealDamage(tar, dmg, false, 1)
				applyRandomVulnerability(player, tar)
			else
				applyRandomVulnerability(player, tar)
			end
		end

		if(spellid == 800633)then
			if(tar:HasAura(800638))then
				dmg = player:GetStat(0) / 3
				player:DealDamage(tar, dmg, false, 1)
				applyRandomVulnerability(player, tar)
			else
				applyRandomVulnerability(player, tar)
			end
		end

		if(spellid == 800634)then
			if(tar:HasAura(800640))then
				dmg = player:GetStat(0) / 3
				player:DealDamage(tar, dmg, false, 1)
				applyRandomVulnerability(player, tar)
			else
				applyRandomVulnerability(player, tar)
			end
		end

		if(spellid == 800635)then
			if(tar:HasAura(800641))then
				dmg = player:GetStat(0) / 3
				player:DealDamage(tar, dmg, false, 1)
				applyRandomVulnerability(player, tar)
			else
				applyRandomVulnerability(player, tar)
			end
		end

		if(spellid == 800636)then
			if(tar:HasAura(800642))then
				dmg = player:GetStat(0) / 3
				player:DealDamage(tar, dmg, false, 1)
				applyRandomVulnerability(player, tar)
			else
				applyRandomVulnerability(player, tar)
			end
		end

		if(spellid == 800606)then
			local list = player:GetCreaturesInRange(40, 50082)
			x = player:GetX();
		            y = player:GetY();
		            z = player:GetZ();
		            o = player:GetO();
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player, 72313, true)
					v:NearTeleport(x, y, z, o)
					--player:CastSpell(v, 800607, true)
					break
				end
			end
		end

		if(spellid == 800531)then
			local shuriken = 800530
			local dmg = 0
			local dmg = (player:GetLevel() * 3 + player:GetStat(3) / 2)
			if(player:HasAura(800563))then
				dmg = dmg * 2.5
			end
			player:AddAura(800530, tar)
			local school = 1
			player:CastSpell(tar, shuriken, true)
			player:DealDamage(tar, dmg, false, school)
		end

		if(spellid == 800575)then
			if(skipChek == true)then
			else
				local nearCreatures = tar:GetCreaturesInRange(30)
				for i,v in ipairs(nearCreatures) do
					if(v:HasAura(800573))then
						if(v:GetAura(800573):GetCaster() == player)then
							player:CastSpell(v, spellid, true)
						end
					end
				end
				local nearPlayers = tar:GetPlayersInRange(30, 2)
				for i,v in ipairs(nearPlayers) do
					if(v:HasAura(800573))then
						if(v:GetAura(800573):GetCaster() == player)then
							player:CastSpell(v, spellid, true)
						end
					end
				end
			end
		end

		if(spellid == 800535)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800536, true)
					local dmg = 0
					dmg = (player:GetLevel() * 2 + player:GetStat(3) + math.random(5)) * 2.5
					local school = 1
					player:DealDamage(tar, dmg, false, school)
					if(v:HasAura(800603))then
						tar:AddThreat(v, dmg * 1.5)
					end
				end
			end
		end

		if(spellid == 800537)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800538, true)
				end
			end
		end

		if(spellid == 800594)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					if(v:HasAura(800603))then
						v:RemoveAura(800603)
					else
						v:AddAura(800603, v)
					end
				end
			end
		end

		if(spellid == 800581)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(tar, 800567, true)
					player:AddAura(800580, tar)
				end
			end
		end

		if(spellid == 800563)then
			player:RegisterEvent(lion_resummon, 12100, 1)
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:DespawnOrUnsummon()
				end
			end
		end

		if(spellid == 800568)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:AddAura(800569, v)
				end
			end
		end

		if(spellid == 800572)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800573, true)
					player:GetSelection():RemoveAura(800573)
					player:AddAura(800573, player:GetSelection())
				end
			end
		end

		if(spellid == 800570)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800571, true)
					local dmg = 0
					dmg = (player:GetLevel() * 4 + player:GetStat(3) * 1.8 + math.random(3)) * 2.5
					if(player:GetSelection():HasAura(800569))then
						dmg = dmg * 2
					end
					local school = 1
					player:DealDamage(tar, dmg, false, school)
					if(v:HasAura(800603))then
						tar:AddThreat(v, dmg * 1.5)
					end
				end
			end
		end

		if(spellid == 800582)then
			local list = player:GetCreaturesInRange(60, 50205)
			local stacks = 0
			if(tar:HasAura(800530))then
				stacks = tar:GetAura(800530):GetStackAmount()
			end
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800583, true)
					local dmg = 0
					dmg = (player:GetLevel() * 4 + player:GetStat(3) * 2 + math.random(3)) * stacks / 2
					local school = 1
					if(stacks > 0)then
						player:DealDamage(tar, dmg, false, school)
						player:GetSelection():RemoveAura(800530)
					end
					if(v:HasAura(800603))then
						tar:AddThreat(v, dmg * 1.5)
					end
				end
			end
		end

		if(spellid == 800576)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800577, true)
					player:AddAura(800578, tar)
				end
			end
		end

		if(spellid == 800565)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800566, true)
					amount = (player:GetLevel() + player:GetStat(3) + math.random(3))  * 4
					player:DealHeal(player:GetSelection(), 800565, amount, false)
					if(player:GetSelection():HasAura(800578))then
						player:AddAura(800538, tar)
					end
				end
			end
		end

		if(spellid == 800584)then
			local list = player:GetCreaturesInRange(60, 50205)
			for i,v in ipairs(list) do
				if(v:GetOwner() == player)then
					v:CastSpell(player:GetSelection(), 800566, true)
					amount = (player:GetLevel() + player:GetStat(3) * 1.25 + math.random(3))  * 8
					player:DealHeal(player:GetSelection(), 800584, amount, false)
				end
			end
		end

		if(spellid >= 800518 and spellid <= 800522)then
			--player:AddAura(800528, player)
		end

		if(spellid == 800519)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 20, 0)
		end

		if(spellid == 800525)then
			setPower(player, player:GetPower(1) + 50, 1)
		end

		if(spellid == 800524)then
			setPower(player, player:GetPower(1) - 100, 1)
		end

		if(spellid == 800523)then
			player:DealHeal(player, 800523, player:GetMaxHealth() / 10)
		end

		--[[if(spellid == 800526)then
				local dmg = 0
				local base = 1
				if(player:GetPower(1) >= player:GetMaxPower(1) / 2)then
					base = (player:GetMaxPower(1) / 2) - (player:GetPower(1) - (player:GetMaxPower(1) / 2))
				else
					base = player:GetPower(1)
				end
				if(base == player:GetMaxPower(1) / 2)then
					base = base * 2
				end
				dmg = (player:GetLevel() + player:GetStat(1) + math.random(3)) / 5 * (base / 50) * 0.1
				local school = 4
				player:DealDamage(tar, dmg, false, school)
		end]]

		if(spellid == 800425)then
				local dmg = 0
				local base = 1
				if(player:GetPower(1) >= player:GetMaxPower(1) / 2)then
					base = (player:GetMaxPower(1) / 2) - (player:GetPower(1) - (player:GetMaxPower(1) / 2))
				else
					base = player:GetPower(1)
				end
				if(base == player:GetMaxPower(1) / 2)then
					base = base * 2
				end
				dmg = (player:GetLevel() + player:GetStat(1) + math.random(3)) / 5 * (base / 50) * 3
				local school = 4
				player:DealDamage(tar, dmg, false, school)
		end

		if(spellid == 800419)then
			local stacks = 0
			local rage = player:GetPower(1) / 10
			
			if(rage < 50)then
				stacks = (rage / 10)
				if(rage >= 42)then
					stacks = 8
				end
			end
			if(rage > 50)then
				stacks = (100 - rage) / 10
				if(rage <= 58)then
					stacks = 8
				end
			end
			if(rage >= 48 or rage <= 52)then
				stacks = 10
			end 
			player:RegisterEvent(monk_alacrity, 50, 1)
		end

		if(spellid == 500338 or spellid == 500084 or spellid == 500342 or spellid == 500968 or spellid == 500705 or spellid == 500705)then
			if(tar:GetVictim() == nil)then
				tar:AttackStart(player)
				player:AddAura(spellid, tar)
			end
		end

		if(spellid == 800468)then
			if(tar:GetVictim() == player)then
			else
				local dmg = (math.random(3) + player:GetLevel() * 2 + player:GetStat(3) / 3 * 2) * 1.2
				player:DealDamage(tar, dmg, false, 2)
				player:AddAura(800431, player)
			end
		end

		if(player:HasAura(800509))then
			if(spell:GetCastTime() > 1)then
				player:RemoveAura(800509)
			end
		end

		if(spellid == 800507)then
			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 20, 0)
		end

		if(spellid == 800489)then
			if(player:HasSpell(800157))then
				if(not player:HasAura(800515))then
					player:AddAura(800515, player)
					for i,v in ipairs(tar:GetCreaturesInRange(8, 0, 2)) do
						if(v:IsInCombat())then
							player:CastSpell(v, spellid, true)
						end
					end
				end
			end
			local chance_nightbane = 5
			local chance_infect = 15
			if(player:HasSpell(800486))then
				chance_nightbane = 15;
				chance_infect = 25;
			end
			if(math.random(100) <= chance_nightbane)then
				player:ResetSpellCooldown(800490)
				player:SendAreaTriggerMessage(generateIcon("Icons/ability_druid_catform", 32).." |cFFFF33FFNightbane Shred cooldown reset! "..generateIcon("Icons/ability_druid_catform", 32))
			end
			if(math.random(100) <= chance_infect)then
				player:AddAura(800491, tar)
			end

			player:DealHeal(player, 800489, player:GetStat(1) / (27 + math.random(3)) + player:GetStat(1) / 15 + player:GetLevel())
			
		end

		if(spellid == 800490)then
			local dmg = (math.random(3) + player:GetLevel() * 1.2 + player:GetStat(1) * 1.8) * 1.2
			local buffs = 0
			if(tar:IsRooted())then dmg = dmg*1.25; buffs = buffs + 1; end
			if(tar:GetHealthPct() <= 50)then dmg = dmg*1.25; buffs = buffs + 1; end
			if(tar:IsCasting())then dmg = dmg*1.25; buffs = buffs + 1; end
			if(tar:HasAura(500124))then dmg = dmg*1.25; buffs = buffs + 1; end
			if(tar:GetSpeed(0) <= 0.6)then dmg = dmg*1.25; buffs = buffs + 1; end
			if(player:IsMoving())then dmg = dmg*1.25; buffs = buffs + 1; end
			if(player:IsFalling())then dmg = dmg*1.25; buffs = buffs + 1; end
			if(player:GetHealthPct() >= 75)then dmg = dmg*1.25; buffs = buffs + 1; end
			if(player:GetHealthPct() >= 100)then dmg = dmg*1.25; buffs = buffs + 1; end
			player:DealDamage(tar, dmg, false, 5)
			if(buffs >= 5)then
				player:ResetSpellCooldown(800486)
			end
			player:SendAreaTriggerMessage("Nightbane Shred dealt "..(buffs * 25).."% additional damage!")
		end

		if(spellid == 800411 and (skipChek == false or player:HasSpell(800462)))then
			player:AddAura(800431, player)
		end

		if(spellid == 800464)then
			if(player:HasAura(800464))then
				player:RegisterEvent(remove_commander, 100, 1)
			end
		end

		if(spellid == 800429 or spellid == 800430 or spellid == 800416 or spellid == 800446 or spellid == 800463)then
			local runecost = 1
			if(player:HasAura(800431))then
				local aura = player:GetAura(800431)
				local stacks = aura:GetStackAmount()
				if(stacks >= runecost)then
					if(skipChek == false)then
						aura:SetStackAmount(stacks - runecost)
					end
				else
					spell:Cancel()
					player:SendBroadcastMessage("Requires "..runecost.." Void Rune!")
					player:SendAreaTriggerMessage("Requires "..runecost.." Void Rune!")
				end
			else
				spell:Cancel()
				player:SendBroadcastMessage("Requires "..runecost.." Void Rune!")
				player:SendAreaTriggerMessage("Requires "..runecost.." Void Rune!")
			end
			if(player:HasAura(800431))then
				local aura = player:GetAura(800431)
				local stacks = aura:GetStackAmount()
				if(stacks <= 0)then
					player:RemoveAura(800431)
				end
			end
		end

		if(spellid == 800417 or spellid == 800413 or spellid == 800440 or spellid == 800452)then
			local runecost = 2
			local cancast = true
			if(spellid == 800417 or spellid == 800440)then
				cancast = false
				if(player:HasAura(800694))then
					cancast = true;
					local aura = player:GetAura(800694)
					local stacks = aura:GetStackAmount()
					if(stacks >= 1)then
						if(stacks == 1)then
							player:RemoveAura(800694)
						else
							aura:SetStackAmount(aura:GetStackAmount() - 1)
						end
					end
				end
			end
			if(cancast)then
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks >= runecost)then
						aura:SetStackAmount(stacks - runecost)
					else
						spell:Cancel()
						player:SendBroadcastMessage("Requires "..runecost.." Void Runes!")
						player:SendAreaTriggerMessage("Requires "..runecost.." Void Runes!")
					end
				else
					spell:Cancel()
					player:SendBroadcastMessage("Requires "..runecost.." Void Rune!")
					player:SendAreaTriggerMessage("Requires "..runecost.." Void Rune!")
				end
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks <= 0)then
						player:RemoveAura(800431)
					end
				end
			else
				spell:Cancel()
				player:SendBroadcastMessage("Requires Rift Weaving!")
				player:SendAreaTriggerMessage("Requires Rift Weaving!")
			end
		end

		if(spellid == 800451 or spellid == 800435)then
			local runecost = 3
			local cancast = true
			if(spellid == 800435)then
				cancast = false
				if(player:HasAura(800694))then
					cancast = true;
					local aura = player:GetAura(800694)
					local stacks = aura:GetStackAmount()
					if(stacks >= 1)then
						if(stacks == 1)then
							player:RemoveAura(800694)
						else
							aura:SetStackAmount(aura:GetStackAmount() - 1)
						end
					end
				end
			end
			if(cancast)then
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks >= runecost)then
						aura:SetStackAmount(stacks - runecost)
					else
						spell:Cancel()
						player:SendBroadcastMessage("Requires "..runecost.." Void Runes!")
						player:SendAreaTriggerMessage("Requires "..runecost.." Void Runes!")
					end
				else
					spell:Cancel()
					player:SendBroadcastMessage("Requires "..runecost.." Void Rune!")
					player:SendAreaTriggerMessage("Requires "..runecost.." Void Rune!")
				end
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks <= 0)then
						player:RemoveAura(800431)
					end
				end
			else
				spell:Cancel()
				player:SendBroadcastMessage("Requires Rift Weaving!")
				player:SendAreaTriggerMessage("Requires Rift Weaving!")
			end
		end

		if(spellid == 800437)then
			local runecost = 4
			local cancast = false
			if(player:HasAura(800694))then
				cancast = true;
				local aura = player:GetAura(800694)
				local stacks = aura:GetStackAmount()
				if(stacks >= 1)then
					if(stacks == 1)then
						player:RemoveAura(800694)
					else
						aura:SetStackAmount(aura:GetStackAmount() - 1)
					end
				end
			end
			if(cancast)then
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks >= runecost)then
						aura:SetStackAmount(stacks - runecost)
					else
						spell:Cancel()
						player:SendBroadcastMessage("Requires "..runecost.." Void Runes!")
						player:SendAreaTriggerMessage("Requires "..runecost.." Void Runes!")
					end
				else
					spell:Cancel()
					player:SendBroadcastMessage("Requires "..runecost.." Void Rune!")
					player:SendAreaTriggerMessage("Requires "..runecost.." Void Rune!")
				end
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks <= 0)then
						player:RemoveAura(800431)
					end
				end
			else
				spell:Cancel()
				player:SendBroadcastMessage("Requires Rift Weaving!")
				player:SendAreaTriggerMessage("Requires Rift Weaving!")
			end
		end

		if(spellid == 800442 or spellid == 800469 or spellid == 800475 or spellid == 800476)then
			local runecost = 5
			local cancast = true
			if(spellid == 800442)then
				cancast = false
				if(player:HasAura(800694))then
					cancast = true;
					local aura = player:GetAura(800694)
					local stacks = aura:GetStackAmount()
					if(stacks >= 1)then
						if(stacks == 1)then
							player:RemoveAura(800694)
						else
							aura:SetStackAmount(aura:GetStackAmount() - 1)
						end
					end
				end
			end
			if(cancast)then
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks >= runecost)then
						aura:SetStackAmount(stacks - runecost)
					else
						spell:Cancel()
						player:SendBroadcastMessage("Requires "..runecost.." Void Runes!")
						player:SendAreaTriggerMessage("Requires "..runecost.." Void Runes!")
					end
				else
					spell:Cancel()
					player:SendBroadcastMessage("Requires "..runecost.." Void Rune!")
					player:SendAreaTriggerMessage("Requires "..runecost.." Void Rune!")
				end
				if(player:HasAura(800431))then
					local aura = player:GetAura(800431)
					local stacks = aura:GetStackAmount()
					if(stacks <= 0)then
						player:RemoveAura(800431)
					end
				end
			else
				spell:Cancel()
				player:SendBroadcastMessage("Requires Rift Weaving!")
				player:SendAreaTriggerMessage("Requires Rift Weaving!")
			end
		end

		

		if(tar ~= nil and (spellid == 800433 == false and spellid == 800434 == false and spellid == 800432 == false))then
			if(tar:HasAura(800412))then
				if(tar:GetAura(800412):GetCaster() == player)then
					spell:Finish()
					local nearCreatures = tar:GetCreaturesInRange(30, 0, 2)
					for i,v in ipairs(nearCreatures) do
						if(v:HasAura(800412))then
							local dur = v:GetAura(800412):GetDuration()
							v:RemoveAura(800412)
							player:CastSpell(v, spellid, true)
							player:AddAura(800412, v):SetDuration(dur)
						end
					end
					local nearPlayers = tar:GetPlayersInRange(30, 2)
					for i,v in ipairs(nearPlayers) do
						if(v:HasAura(800412))then
							local dur = v:GetAura(800412):GetDuration()
							v:RemoveAura(800412)
							player:CastSpell(v, spellid, true)
							player:AddAura(800412, v):SetDuration(dur)
						end
					end
					local dur = tar:GetAura(800412):GetDuration()
					tar:RemoveAura(800412)
					player:CastSpell(tar, spellid, true)
					player:AddAura(800412, tar):SetDuration(dur)
				end
			end
		end

		if(spellid == 800412)then
			player:AddAura(spellid, tar)
		end

		if(spellid == 800380)then
			if(isFocus(player))then
				player:AddAura(800396, tar)
				resetFocus(player)
			end
		end

		if(spellid == 800382)then
			if(isFocus(player))then
				player:AddAura(800382, tar)
				resetFocus(player)
			end
		end

		if(spellid == 800373)then
			if(isFocus(player))then
				player:AddAura(800373, tar)
				player:AddAura(800373, tar)
				resetFocus(player)
			end
		end

		if(spellid == 800379)then
			if(isFocus(player))then
				player:AddAura(800400, player)
				resetFocus(player)
			end
		end

		if(spellid == 800363)then
			if(isFocus(player))then
				player:CastCustomSpell(tar, 801230, true, (player:GetLevel() * 2 + player:GetStat(3) / 2 + math.random(5)))
				resetFocus(player)
			end
		end

		if(spellid == 800374)then
			if(isFocus(player))then
				local nearAllies = player:GetPlayersInRange(30, 2)
				for i,v in ipairs(nearAllies) do
					player:AddAura(800399, v)
				end
				player:AddAura(800399, player)
				resetFocus(player)
			end
		end

		if(spellid == 800375)then
			if(isFocus(player))then
				local nearAllies = tar:GetPlayersInRange(15, 2)
				for i,v in ipairs(nearAllies) do
					player:AddAura(800375, v)
				end
				resetFocus(player)
			end
		end

		if(spellid == 800370)then
			if(isFocus(player))then
				player:DealHeal(tar, 800370, (tar:GetMaxHealth() / 10))
				player:AddAura(800398, player)
				resetFocus(player)
			end
		end

		if(spellid == 800377)then
			if(isFocus(player))then
				setPower(player, 0, player:GetPower(0) + player:GetMaxPower(0) / 5)
				player:RegisterEvent(tidecaller_resetburst, 100, 1)
				resetFocus(player)
			end
		end

		if(spellid == 801229)then
			if(isFocus(player))then
				player:RegisterEvent(tidecaller_resetfrosttorrent, 100, 1)
				resetFocus(player)
			end
		end

		if(spellid == 800390)then
			if(isFocus(player))then
				setPower(player, 0, player:GetPower(0) + player:GetMaxPower(0) / 4)
				player:AddAura(800397, player)
				resetFocus(player)
			end
		end

		if(spellid == 800378)then
			if(isFocus(player))then
				player:RegisterEvent(tidecaller_resetwave, 100, 1)
				resetFocus(player)
			end
		end

		if(spellid == 800381)then
			if(tar:HasAura(800382))then
				player:DealHeal(tar, 800370, (tar:GetMaxHealth() / 5))
				tar:RemoveAura(800382)
			end
		end

		if(spellid == 800392)then
			if(player:HasAura(800393))then
				local stacks = player:GetAura(800393):GetStackAmount()
				if(stacks >= 5)then
					player:RemoveAura(800393)
					player:AddAura(800394, player)
				else
					player:AddAura(800393, player)
					player:GetAura(800393):SetStackAmount(stacks + 1)
				end
			else
				if(player:HasAura(800394))then
					local stacks = player:GetAura(800394):GetStackAmount()
					if(stacks >= 5)then
						player:RemoveAura(800394)
						player:AddAura(800393, player)
					else
						player:AddAura(800394, player)
					end
				else
					--player:RemoveAura(800394)
					player:AddAura(800393, player)
				end
			end
		end

		if(spellid == 800165)then
			setPower(player, player:GetPower(0) + 25, 0)
		end

		if(spellid == 800359)then
			player:ResetSpellCooldown(800086)
			player:ResetSpellCooldown(800087)
			player:ResetSpellCooldown(800088)
			player:ResetSpellCooldown(800278)
		end

		if(spellid == 800340)then
			local near = player:GetCreaturesInRange(8)
			for i,v in ipairs(near) do
				if(v:GetVictim() == player)then
					stacks = (stacks + 1)
				end
			end
		end

		if(spellid == 800300)then
			if(math.random(2) == 1 or not (player:IsInCombat()))then
				spell:Finish()
			end
		end

		if(spellid == 500075)then
			if(player:HasSpell(800358))then
				setPower(player, player:GetPower(2) + 40, 2)
			end
		end

		if(spellid == 800333 or spellid == 800306 or spellid == 800308)then
			if(player:HasAura(800305))then
				local aura = player:GetAura(800305)
				local MIN = 2
				local stacks = aura:GetStackAmount()
				if(stacks >= MIN)then
					aura:SetStackAmount(stacks - MIN)
				else
					spell:Finish()
				end
			else
				spell:Finish()
			end
		end

		if(spellid == 800323)then
			local stacks = 0
			local near = player:GetCreaturesInRange(30)
			for i,v in ipairs(near) do
				if(v:GetVictim() == player)then
					stacks = (stacks + 1)
				end
			end
			setPower(player, player:GetPower(3) + (stacks * 10), 3)
			for i=1,stacks-1 do
				player:AddAura(800323, player)
			end
		end

		if(spellid == 800311)then
			local dmg = player:GetMaxHealth() / 10 * 1.2
			if(player:HasSpell(800701))then
				dmg = player:GetStat(0) * 2.15
				player:ResetSpellCooldown(800316)
			end
			player:CastCustomSpell(tar, 801227, true, dmg)
			--player:DealDamage(tar, dmg, false, 1)

			if(player:HasAura(500256))then
				local amt = player:GetAura(500256):GetStackAmount()
				if(amt >= 6 and player:HasAura(800321) == false)then
					player:RegisterEvent(guardian_reset, 100, 1)
					player:RemoveAura(500256)
				end
			end
		end

		if(spellid == 500257)then
			if(player:HasSpell(800701))then
				player:CastSpell(tar, 800705, true)
			end
		end

		if(spellid == 800313)then
			if(player:HasAura(500256))then
				local amt = player:GetAura(500256):GetStackAmount()
				if(amt >= 7 and player:HasAura(800321) == false)then
					player:RegisterEvent(guardian_reguard, 100, 1)
					player:RemoveAura(500256)
				end
			end
		end

		if(spellid == 800316)then
			player:AddAura(500256, player)
			player:AddAura(500256, player)

			if(player:HasSpell(800191))then
				tar:AddThreat(player, 400)
			end
		end

		if(spellid == 800285)then
			player:RegisterEvent(brewmaster_catch1, 100, 1)
		end

		if(spellid == 800287)then
			player:ResetSpellCooldown(800282)
		end

		if(spellid == 800289)then
			local dmg = (3 + player:GetLevel() * 1.5 + player:GetStat(3) / 2) 
			if(tar:ToPlayer() ~= nil)then
				dmg = dmg / 3 * 2
			end
			player:DealDamage(tar, dmg, false, 2)
		end

		if(spellid == 800083)then
			if(math.random(6) == 1)then
				player:AddAura(800265, player)
				player:SendAreaTriggerMessage("Hack damage bonus procced!")
				player:SendBroadcastMessage("Hack damage bonus procced!")
			end
			if(player:GetAura(800083):GetStackAmount() >= 3)then
				player:RemoveAura(800083)
				setPower(player, player:GetPower(2) + 30, 2)
				player:DealHeal(player, 800083, player:GetMaxHealth() / 10)
			end
		end

		if(spellid == 800264)then
			if(math.random(4) == 1)then
				player:ResetSpellCooldown(800091)
				player:SendAreaTriggerMessage("Ravage cooldown reset!")
				player:SendBroadcastMessage("Ravage cooldown reset!")
			end
			if(player:HasAura(800265))then
				player:RemoveAura(800265)
				setPower(player, player:GetPower(2) + 50, 2)
				local dmg = (3 + player:GetLevel() * 1.5 + player:GetStat(1)) / 3 * 2
				if(tar:ToPlayer() ~= nil)then
					dmg = dmg / 3 * 2
				end
				player:DealDamage(tar, dmg, false, 2)
			end
		end

		if(spellid == 800268)then
			doRangerCraft(player, spell, 3)
		end
		if(spellid == 800269)then
			if(doRangerCraft(player, spell, 2))then
				player:DealHeal(tar, 800269, tar:GetMaxHealth() / 2)
				setPower(tar, tar:GetPower(tar:GetPowerType())+tar:GetMaxPower(tar:GetPowerType())/2, tar:GetPowerType())
			end
		end
		if(spellid == 800270)then
			doRangerCraft(player, spell, 2)
		end
		if(spellid == 800271)then
			doRangerCraft(player, spell, 3)
		end
		if(spellid == 800272)then
			doRangerCraft(player, spell, 5)
		end
		if(spellid == 800274)then
			doRangerCraft(player, spell, 4)
		end

		if(spellid == 800089)then
			if(player:HasAura(800089))then
				player:RegisterEvent(remove_adap, 100, 1)
			end
		end

		if(spellid == 801155)then
			if(player:HasAura(800498))then
				player:RegisterEvent(remove_cosmic, 100, 1)
			else
				player:AddAura(800498, player)
			end
		end

		if(spellid == 800895)then
			if(player:HasAura(800895))then
				player:RegisterEvent(remove_forti, 100, 1)
			end
		end

		if(spellid == 800091)then
			local dmg = (3 + player:GetLevel() * 1.5 + player:GetStat(1) / 2) / 2
			if(tar:ToPlayer() ~= nil)then
				dmg = dmg / 4 * 3
			end
			player:CastCustomSpell(tar, 800975, true, dmg)
		end

		if(spellid == 800275)then
			if(tar:ToPlayer() ~= nil)then
				player:AddAura(801217, tar)
			else
				local aura = player:AddAura(800276, player):SetStackAmount(tar:GetEntry())
			end
		end

		if(player:HasAura(800276) and tar ~= nil)then
			if(tar:ToPlayer() ~= nil)then
			else
				if(tar:GetEntry() == player:GetAura(800276):GetStackAmount())then
					if(tar:HasAura(801217))then
					else
						player:AddAura(801217, tar)
					end
				end
			end
		end

		if(spellid == 800167)then
			player:RegisterEvent(wh_hound_init, 500, 1)
		end

		if(spellid == 800236)then
			local dmg = (3 + player:GetLevel() * 1.5 + player:GetStat(3) / 4 + player:GetStat(0) / 2)
			if(tar:ToPlayer() ~= nil)then
				dmg = dmg / 3 * 2
			end
			player:DealDamage(tar, dmg, false, 2)
		end

		if(spellid == 500028)then
			setPower(player, player:GetPower(1) + 60, 1)
		end

		if(spellid == 500032)then
			setPower(player, player:GetPower(3) + 75, 3)
		end
		if(spellid == 801239)then
			if(player:HasAura(801207))then
			else
				spell:Cancel()
				player:SendAreaTriggerMessage("Requires metamorphosis.")				
			end
		end
		if(spellid == 400001)then
			if(player:HasAura(399999))then
			else
				spell:Cancel()
				player:SendAreaTriggerMessage("Requires Rain from Above.")				
			end
		end
		if(spellid == 800223)then
			if(player:GetPower(1) >= (player:GetMaxPower(1) - 2))then
				setPower(player, 0, 1)
				form = 399997;
				if(player:HasSpell(800352))then
					form = 500031;
				end
				if(player:HasSpell(801207))then
					form = 400012;
				end
				if(player:HasSpell(801235))then
					form = 801208;
				end
				player:CastSpell(player, form, true)
				player:AddAura(form, player)
				player:CastSpell(player, 48582, true)
				player:CastSpell(player, 51384, true)
				if(player:HasSpell(800352))then
					player:CastCustomSpell(player, 801240, true, 10 + player:GetLevel() + player:GetStat(2) * 1.25)
				end
			end
		end

		if(spellid == 500020)then
			setPower(player, player:GetPower(1) + 100, 1)
		end

		if(spellid == 800191)then
			player:RemoveAura(800192)
			player:RemoveAura(800409)
			player:RemoveAura(800485)
		end

		if(spellid == 800192)then
			player:RemoveAura(800191)
			player:RemoveAura(800409)
			player:RemoveAura(800485)
		end

		if(spellid == 800409)then
			player:RemoveAura(800191)
			player:RemoveAura(800192)
			player:RemoveAura(800485)
		end

		if(spellid == 800485)then
			player:RemoveAura(800191)
			player:RemoveAura(800192)
			player:RemoveAura(800409)
		end

		if(spellid == 800093)then
			if(player:HasAura(800136))then
				local dmg = ((player:GetLevel() * 1.5 + player:GetStat(3) * 2)) / 4 * 3
				if(tar:ToPlayer() ~= nil)then
					dmg = (dmg) / 3 * 2
				end
				player:DealDamage(tar, dmg, false, 5)
				player:CastSpell(tar, 46440, true)
				player:RemoveAura(800136)
			end
			if(player:HasAura(800146))then
				player:CastSpell(tar, 800182, true)
				player:RemoveAura(800146)
				tar:CastSpell(tar, 28136, true)
				player:CastSpell(tar, 28136, true)
			end
			if(player:HasAura(800147))then
				player:CastSpell(tar, 800183, true)
				player:RemoveAura(800147)
			end
			if(player:HasSpell(800184))then
				if(math.random(4) == 1)then
					player:SendBroadcastMessage("Savage Bite cooldown reset!")
					player:ResetSpellCooldown(800139)
				end
			end
		end

		if(player:HasSpell(800184))then
			if(spellid == 500938)then
				player:ResetSpellCooldown(800136)
				player:ResetSpellCooldown(800146)
				player:ResetSpellCooldown(800147)
				player:SendAreaTriggerMessage("Elemental Fist cooldowns reset.")
				player:SendBroadcastMessage("Elemental Fist cooldowns reset.")
			end
			if(spellid == 800140 and math.random(5) == 1)then
				player:ResetSpellCooldown(500938)
				player:SendAreaTriggerMessage("Ursine Crush cooldown reset.")
				player:SendBroadcastMessage("Ursine Crush cooldown reset.")
			end
			if(spellid == 800093 and math.random(4) == 1)then
				player:ResetSpellCooldown(800140)
				player:SendAreaTriggerMessage("Savage Bite cooldown reset.")
				player:SendBroadcastMessage("Savage Bite cooldown reset.")
			end
			if(spellid == 800135 and math.random(2) == 1)then
				player:ResetSpellCooldown(800093)
				player:SendAreaTriggerMessage("Stoneslam cooldown reset.")
				player:SendBroadcastMessage("Stoneslam cooldown reset.")
			end
			if(spellid == 800139 and math.random(2) == 1)then
				player:ResetSpellCooldown(800133)
				player:ResetSpellCooldown(800141)
				player:ResetSpellCooldown(800142)
				player:ResetSpellCooldown(800181)
				player:SendAreaTriggerMessage("Roar cooldowns reset.")
				player:SendBroadcastMessage("Roar cooldowns reset.")
			end
		end
		if(spellid == 800135)then
			if(player:HasAura(801233))then
				local boon = getActiveBoon(tar)
				if(boon > 0)then
					local aura = tar:GetAura(boon)
					if(aura:GetCaster() == player)then
						aura:SetDuration(aura:GetDuration() + 12000)
						aura:SetMaxDuration(aura:GetMaxDuration() + 12000)
					end
				end
			end
		end
		if(spellid == 800141)then
			local tars = player:GetPlayersInRange(30, 2, 1)
			for i,v in ipairs(tars) do
				local boon = getActiveBoon(v)
				if(boon > 0)then
					local aura = v:GetAura(boon)
					if(aura:GetCaster() == player)then
						aura:SetDuration(aura:GetDuration() + 10000)
					end
				end
			end
			local tars1 = player:GetPlayersInRange(30, 0, 2, 1)
			for i,v in ipairs(tars1) do
				local boon = getActiveBoon(v)
				if(boon > 0)then
					local aura = v:GetAura(boon)
					if(aura:GetCaster() == player)then
						aura:SetDuration(aura:GetDuration() + 10000)
					end
				end
			end
			local boon = getActiveBoon(player)
				if(boon > 0)then
					local aura = player:GetAura(boon)
					if(aura:GetCaster() == player)then
						aura:SetDuration(aura:GetDuration() + 10000)
					end
				end
		end

		if(spellid == 500954)then
			player:RegisterEvent(doc_manabrew, 7999, 1)
		end

		if(spellid == 500935 or spellid == 500939 or spellid == 500942 or spellid == 500943 or spellid == 800137 or spellid == 800138)then
			local boon = getActiveBoon(tar)
			if(boon == 0 or boon == spellid)then
			else
				tar:RemoveAura(boon)
			end
			if(player:HasSpell(800177))then
				player:AddAura(spellid, tar)
				tar:GetAura(getActiveBoon(tar)):SetStackAmount(3)

			end
			if(player:HasSpell(801244))then
				tar:RegisterEvent(ww_extendboon, 100, 1)
			end
		end

		if(spellid == 800040)then
			local class = getClassID(player)
	        local list = getTalentList(player)
	        local name = (getNameForClass(class))
	        AIO.Handle(player, "AIOExample", "ShowFrame", class, list, name)
		end

		if(spellid == 800942)then
			local class = getClassID(player)
	        local list = getRuneList(player)
	        local name = (getNameForClass(class))
	        AIO.Handle(player, "Runes", "ShowFrame", class, list, getEquipList(player), name)
		end


		if(spellid == 500951)then
			if(math.random(10) == 1)then
				player:ResetSpellCooldown(500016)
			end
		end

		if(spellid == 800128)then
			local nearCreatures = player:GetCreaturesInRange(30)
			local nearPlayers = player:GetPlayersInRange(30)
			for i,v in ipairs(nearCreatures) do
				if(v:HasAura(500130))then
					local aura = v:GetAura(500130)
					if(aura:GetCaster() == player)then
						local stacks = aura:GetStackAmount()
						local dmg = (2.6 * ((math.random(3) + player:GetLevel() * 2 + player:GetStat(3) / 3 * 2) / 20) * stacks / 3 + stacks * 3) * 1.4
						player:DealDamage(v, dmg, false, 2)
						player:CastSpell(v, 800129, true)
						aura:SetStackAmount(stacks / 2)
					end
				end
			end
			for i,v in ipairs(nearPlayers) do
				if(v:HasAura(500130))then
					local aura = v:GetAura(500130)
					if(aura:GetCaster() == player)then
						local stacks = aura:GetStackAmount()
						local dmg = (2.6 * ((math.random(3) + player:GetLevel() * 2 + player:GetStat(3) / 3 * 2) / 20) * stacks / 3 + stacks * 3) * 1.4
						player:DealDamage(v, dmg, false, 2)
						player:CastSpell(v, 800129, true)
						aura:SetStackAmount(stacks / 2)
					end
				end
			end
		end

		if(spellid == 800120)then
			local x, y, z, o = tar:GetLocation()
			local x1, y1, z1, o1 = player:GetLocation()
			player:NearTeleport(x, y, z, o)
			tar:NearTeleport(x1, y1, z1, o1)
			player:CastSpell(player, 64446, true)
			tar:CastSpell(tar, 64446, true)
		end


		if(spellid == 800343)then
			setPower(player, player:GetPower(6) + 50, 6)
		end

		if(spellid == 500339)then
			if(tar:HasAura(500339))then
				aura = tar:GetAura(500339)
				aura:SetStackAmount(aura:GetStackAmount() + 1)
				player:CastSpell(player, 60957, true)
			else
			end
		end

		if(spellid == 800108)then
			player:CastCustomSpell(tar, 500339, true)
			if(tar:HasAura(500339))then
				local aura = tar:GetAura(500339)
				aura:SetStackAmount(aura:GetStackAmount() + math.random(2))
			else
				local aura = player:AddAura(500339, tar)
				aura:SetStackAmount(math.random(3))
			end
			if(player:HasSpell(800072))then
				if(player:HasSpellCooldown(800072) == false)then
					player:ResetSpellCooldown(500333)
				end
			end
		end

		if(spellid == 500968)then
			if(player:HasSpell(800072))then
				if(player:HasSpellCooldown(800072) == false)then
					player:AddAura(800708, player)
					setPower(player, player:GetPower(6) + 100, 6)
				end
			end
		end

		if(spellid == 500343)then
			if(tar:HasAura(500342) and tar:HasAura(500338))then
				if(player:HasSpell(800072))then
					player:AddAura(800110, player)
				end
				setPower(player, player:GetPower(6) + 500, 6)
				tar:RemoveAura(500342)
				tar:RemoveAura(500338)
				if(tar:HasAura(500339))then
					local plague = tar:GetAura(500339)
					plague:SetStackAmount(plague:GetStackAmount() + 10)
				else
					local plague = player:AddAura(500339, tar)
					plague:SetStackAmount(plague:GetStackAmount() + 10)
				end
			else
				player:SendAreaTriggerMessage("The target must be afflicted with 'Flesh to Worms' and 'Bloodflame Flesh'.")
				spell:Finish()
			end
		end

		if(spellid == 500978)then
			local nearUnits = player:GetCreaturesInRange(60)
			for i,v in ipairs(nearUnits) do
				if(v:GetOwner() == player)then
					if(v:GetVictim() ~= nil)then
						local amt = v:GetHealth() / 2
						if(v:GetEntry() == 50068)then
							amt = v:GetHealth() / 20
						end
						v:DealDamage(v:GetVictim(), amt, false, 4)
						v:CastSpell(v:GetVictim(), 54578, true)
					end
					v:Kill(v)
				end
			end
		end

		if(spellid == 500991)then
			local nearUnits = player:GetCreaturesInRange(60)
			for i,v in ipairs(nearUnits) do
				if(v:GetOwner() == player)then
					if(player:GetSelection() ~= nil)then
						local charge_id = 74399
						if(v:GetEntry() == 50073 or v:GetEntry() == 50078)then 
							charge_id = 70150 
						end
						v:AttackStart(player:GetSelection())
						v:CastSpell(player:GetSelection(), charge_id, true)
						v:AttackStart(player:GetSelection())
					end
				end
			end
		end

		if(spellid == 500979)then
			local nearUnits = player:GetCreaturesInRange(60)
			for i,v in ipairs(nearUnits) do
				if(v:GetOwner() == player)then
					v:CastSpell(v, 9741, true)
				end
			end
		end

		if(spellid == 500980)then
			local nearUnits = player:GetCreaturesInRange(60)
			for i,v in ipairs(nearUnits) do
				if(v:GetOwner() == player)then
					v:CastSpell(v:GetOwner(), 54578, true)
					local amt = v:GetHealth() / 2
					if(v:GetEntry() == 50068)then
						amt = v:GetHealth() / 20
					end
					v:DealHeal(v:GetOwner(), 500980, amt)
					v:GetOwner():SetPower(v:GetOwner():GetPower(6) + 100, 6)
					v:Kill(v)
				end
			end
		end

		if(spellid == 500981)then
			player:AddAura(800339, player)
		end

		if(player:HasAura(75214) and spell:GetPowerCost() > 0)then
			if(player:HasAura(500945))then
				local aura = player:GetAura(500945)
				aura:SetStackAmount(aura:GetStackAmount() + math.random(3))
			else
				player:AddAura(500945, player)
			end
		end

		if(spellid == 500016)then
			local aura = player:GetAura(500945)
			if(aura ~= nil)then
				player:DealHeal(tar, 500945, (player:GetStat(3) / 4 * 2 + player:GetStat(4) / 4 * 2 + (player:GetLevel() * 2 + 12) / 12) * aura:GetStackAmount())
				player:RemoveAura(500945)
			end
		end

		if(spellid == 500933)then
			if(player:HasAura(500933))then
				player:RemoveAura(500933)
			end
		end

		if(spellid == 500000)then
			local energy = player:GetPower(3)
			if(energy < 50)then
				setPower(player, player:GetPower(3) + 50, 3)
			else
				player:ResetSpellCooldown(500919)
			end
		end



		if(spellid == 500916)then
			player:AddAura(800344, tar)
			if(player:HasAura(500916))then
				count = player:GetAura(500916):GetStackAmount()
				if(count >= 7)then
					player:RemoveAura(500916)
				else
					player:RegisterEvent(barb_resetripper, 200, 1)
				end
			else
				player:RegisterEvent(barb_resetripper, 200, 1)
			end
		end

		if(spellid == 800121)then
			if(player:HasAura(800121) == false)then
				player:AddAura(800821, player)
				player:RegisterEvent(pyro_resetsurge, 100, 1)
			else
				player:RegisterEvent(pyro_resetsurge, 100, 1)
			end
		end

		if(spellid == 500919 and player:HasSpell(800132))then
			if(player:HasAura(800151))then
				count = player:GetAura(800151):GetStackAmount()
				if(count >= 4)then
					player:RemoveAura(800151)
				else
					player:RegisterEvent(barb_resetwhirl, 200, 1)
				end
			else
				player:RegisterEvent(barb_resetwhirl, 200, 1)
			end
			player:AddAura(800151)
		end

		if(spellid == 800152)then
			setPower(player, player:GetPower(3) + 35, 3)
		end

		if(spellid == 500915)then
			local near = player:GetCreaturesInRange(3)
			for i,v in ipairs(near) do
				if(v:HasAura(500917))then
					local count = v:GetAura(500917):GetStackAmount()
					player:CastCustomSpell(tar, 800956, true, (count * (3 * player:GetLevel() + player:GetStat(0) / 3 + count)) * 0.8)
					v:RemoveAura(500917)
				end
			end
			local near1 = player:GetPlayersInRange(3)
			for i,v in ipairs(near1) do
				if(v:HasAura(500917))then
					local count = v:GetAura(500917):GetStackAmount()
					player:CastCustomSpell(tar, 800956, true, (count * (3 * player:GetLevel() + player:GetStat(0) / 3 + count)) * 0.8)
					v:RemoveAura(500917)
				end
			end
		end

		if(spellid == 800131)then
			if(tar:HasAura(500917))then
				local count = tar:GetAura(500917):GetStackAmount()
				player:CastCustomSpell(tar, 800956, true, 1.6 * (count * (3 * player:GetLevel() + player:GetStat(0) / 3 + count)))
				tar:RemoveAura(500917)
			end
		end

		if(spellid == 500920)then
			player:DealDamage(tar, player:GetLevel() / 3 * (100 - tar:GetHealthPct()), false, 0)
			if(tar:GetHealthPct() < 20)then
				player:ResetSpellCooldown(500001)
			end
			if(tar:HasAura(500917))then
				local aura = tar:GetAura(500917)
				aura:SetStackAmount(aura:GetStackAmount() + 5)
			else
				local aura = player:AddAura(500917, tar)
				aura:SetStackAmount(aura:GetStackAmount() + 4)
			end
		end

		if(spellid == 500704)then
			player:RegisterEvent(cultist_pull, 500, 1)
		end

		if(spellid == 500909)then
			if(player:HasAura(500906))then
				if((player:GetAura(500906):GetStackAmount() - 1) > 0)then
					player:GetAura(500906):SetStackAmount(player:GetAura(500906):GetStackAmount() - 1)
				else
					player:RemoveAura(500906)
				end
			else
				spell:Finish()
				player:SendBroadcastMessage("Requires a Hellfire Orb.")
			end
		end

		if(spellid == 800175)then
			if(player:HasSpell(800157))then
				if(player:IsInCombat())then
					player:SendBroadcastMessage("Cannot be used in combat.")
				else
					player:AddAura(800170, player)
				end
			else
				spell:Finish()
				player:SendBroadcastMessage("Requires 'Eternal Curse'.")
			end
		end

		if(spellid == 500710)then
			local near = player:GetCreaturesInRange(50, 50096)
			for i,v in ipairs(near) do
				v:CastCustomSpell(v, 801150, true, (player:GetStat(3) / 3))
			end
		end

		if(spellid == 500024)then
			if(tar:HasAura(500024))then
				player:DealHeal(player, 500024, player:GetMaxHealth() / 100 * 3)
				tar:RemoveAura(500024)
			end
		end

		if(player:HasAura(500313))then
			if(spell:GetPowerCost() > 0)then
				if(math.random(12) == 1)then
					range = 12;
					x = player:GetX();
		            y = player:GetY();
		            z = player:GetZ();
		            o = player:GetO();
				 local flesh = player:SpawnCreature(50082, x + (math.random(range) - math.random(range)), y + (math.random(range) - math.random(range)), z + 1, o, 8, 0);
				 flesh:SetOwnerGUID(player:GetGUID())
				 flesh:CastSpell(flesh, 56840, true)
				 flesh:CastSpell(flesh, 46767, true)
				 player:CastSpell(flesh, 72313, true)
				end
			end
		end

		if(spellid == 500904)then
			if(player:HasSpell(800191))then
				player:CastSpell(tar, 70428, true)
			end
			range = 12;
					x = player:GetX();
		            y = player:GetY();
		            z = player:GetZ();
		            o = player:GetO();
				 local flesh = player:SpawnCreature(50082, x + (math.random(range) - math.random(range)), y + (math.random(range) - math.random(range)), z + 1, o, 8, 0);
				 flesh:SetOwnerGUID(player:GetGUID())
				 flesh:CastSpell(flesh, 56840, true)
				 player:CastSpell(flesh, 72313, true)
		end

		if(spellid == 500719)then
			local near = player:GetCreaturesInRange(30, 50097)
			for i,v in ipairs(near) do
				v:AttackStart(tar)
				v:CastSpell(tar, 500719, false)
			end
		end

		if(spellid == 500900)then --witching bolt
			setPower(player, player:GetPower(0) + (player:GetDistance(tar) * 3) * 80, 0)
		end

		if(spellid == 500723)then
			local near = player:GetCreaturesInRange(30, 50096)
			for i,v in ipairs(near) do
				v:CastSpell(v, 500723, false)
			end
		end

		if(spellid == 500707)then --crusher
			local stacks = 10;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end

		if(spellid == 800367)then --void kiss
			local stacks = 5;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end



		if(spellid == 800369)then --twisted renewal
			local stacks = 10;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end

		if(spellid == 500712)then --eld curse
			local stacks = 20;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end


		if(spellid == 500705)then --dot
			if(player:HasAura(500727))then
			else
				player:AddAura(500727, player)
			end
			local stacks = 5;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end

		if(spellid == 500120)then --glimpse tick
			local stacks = 5;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end

		if(spellid == 500726)then --doomsday
			local rand = math.random(4)
			if(rand == 1)then
				player:ResetSpellCooldown(500720, true)
			end
			if(rand == 2)then
				player:ResetSpellCooldown(500722, true)
			end
			if(rand == 3)then
				player:ResetSpellCooldown(500721, true)
			end
			if(rand == 4)then
				player:ResetSpellCooldown(500112, true)
			end
			player:AddAura(500706, player)
		end

		if(spellid == 500732)then
			player:AddAura(500725, player)
		end

		if(spellid == 500728)then --grounding thoughts
			if(player:HasAura(500706))then
				local curstacks = player:GetAura(500706):GetStackAmount()
				if(curstacks >= 100)then
					player:AddAura(39048, player):SetDuration(3000)
					player:DealDamage(player, player:GetMaxHealth() / 15, false, 5)
					player:GetAura(500706):SetStackAmount(100)
					local rand = math.random(7)
					local spell = 500712
					if(rand == 2)then
						spell = 500707
					end
					if(rand == 3)then
						spell = 500715
					end
					if(rand == 4)then
						spell = 500716
					end
					if(rand == 5)then
						spell = 500718
					end
					if(rand == 6)then
						spell = 500704
					end
					if(rand == 7)then
						spell = 500723
					end
					player:ResetSpellCooldown(spell, true)
					player:CastSpell(player:GetSelection(), spell, true)
					player:ResetSpellCooldown(spell, true)
					player:CastSpell(player, spell, true)
				else
					local remove_amt = 4;
					if(player:IsInCombat())then
						remove_amt = 1;
					end
					if(curstacks > remove_amt)then
						player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() - remove_amt)
					else
						player:RemoveAura(500706)
					end
				end
			end
		end

		if(spellid == 500720)then --nzoth
			if(math.random(3) == 1)then
				player:ResetSpellCooldown(500707)
				player:CastSpell(player, 500707, true)
				player:RegisterEvent(reset_crusher, 100, 1)
			end
			local stacks = 5;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end

		if(spellid == 500722)then --cthun
			local curstacks = 0

			local stacks = 20;
			player:AddAura(500706, player)
			if(player:HasAura(500706))then
				curstacks = player:GetAura(500706):GetStackAmount()
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
			if(curstacks >= 60)then
				player:ResetSpellCooldown(500110)
			end
			local amt = ((player:GetStat(3) / 4) * (curstacks / 10))
			player:CastCustomSpell(tar, 801026, true, amt)
		end

		if(spellid == 500110)then
			local curstacks = player:GetAura(500706):GetStackAmount()
			local amt = ((player:GetStat(3) / 3) * (curstacks / 10))
			player:CastCustomSpell(tar, 801026, true, amt)
		end

		if(spellid == 500721)then --yshaarj
			local curstacks = player:GetAura(500706):GetStackAmount()
			tar:AddAura(39048, tar):SetDuration(75 * curstacks)

			local stacks = 15;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end

		if(spellid == 500112)then --yogg
			local curstacks = player:GetAura(500706):GetStackAmount()

			setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 10, 0)

			local amt = ((player:GetLevel() / 2) * (curstacks / 10))
			player:DealHeal(player, 500112, amt)
		end

		if(spellid == 500711)then --eld mend
			local curstacks = player:GetAura(500706):GetStackAmount()
			if(curstacks >= 5)then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() - 5)
			else
				spell:Finish()
			end
		end

		if(spellid == 500711)then --maddening scripture
			local dif = 100 - tar:GetHealthPct()

			local stacks = dif / 5;
			if(player:HasAura(500706))then
				player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			else
				player:AddAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
			end
		end

		if(spellid == 500686)then --enlighten
			local energy = 0
			local rage = 0
			if(player:IsMoving() and player:IsInCombat())then
				rage = 40
			else
				mana = 0
			end
			setPower(player, player:GetPower(3) + energy, 0)
			setPower(player, player:GetPower(1) + rage, 1)
		end

		if(spellid == 500690)then --meditate per
			local rage = -100
			setPower(player, player:GetPower(1) + rage, 1)
		end

		if(spellid == 500681)then --monastic strike
			local rage = -200
			setPower(player, player:GetPower(1) + rage, 1)
		end

		if(spellid == 500035)then
			local dmg = 0
			local base = 1
			if(player:GetPower(1) >= player:GetMaxPower(1) / 2)then
				base = (player:GetMaxPower(1) / 2) - (player:GetPower(1) - (player:GetMaxPower(1) / 2))
			else
				base = player:GetPower(1)
			end
			if(base == player:GetMaxPower(1) / 2)then
				base = base * 2
			end
			dmg = (player:GetLevel() + player:GetStat(1) + math.random(3)) / 5 * (base / 50)
			local school = 4
			player:DealDamage(tar, dmg, false, school)
		end

		if(spellid == 500682)then
			player:SetFacingToObject(tar)
			if(player:GetPower(1) >= player:GetMaxPower(1) / 2)then
				player:RegisterEvent(monk_monastic, 100, 1)
			else
				local stun = player:AddAura(52402, tar)
				stun:SetDuration(player:GetPower(1) * 4)
			end
		end

		if(spellid == 800089)then
			player:RemoveAura(801468)
			player:RemoveAura(801469)
		end

		if(spellid == 801468)then
			player:RemoveAura(800089)
			player:RemoveAura(801469)
		end

		if(spellid == 801469)then
			player:RemoveAura(801468)
			player:RemoveAura(800089)
		end

		if(spellid == 800172)then
			local base = 100 - tar:GetHealthPct()
			local dmg = (player:GetLevel() * 1.5 + player:GetStat(0) / 2 + math.random(3)) / 2.5 * (base / 3)
			player:DealDamage(tar, dmg, false, 3)
			player:DealHeal(player, 800172, dmg)

			if(tar:GetHealth() <= 0 or target:IsDead())then
				player:RegisterEvent(reaper_resetrend, 100, 1)
			end
		end

		if(spellid == 500679)then
			setPower(player, player:GetMaxPower(1)/2, 1)
		end

		if(spellid == 500370)then
			local souls = 0
			if(player:HasAura(500363))then
				souls = souls + player:GetAura(500363):GetStackAmount()
				player:RemoveAura(500363)
			end
			player:RegisterEvent(lordharvest_trigger, 100, souls)
		end

		if(spellid == 500365)then
			reaper_drainhealth(player, 7)
		end

		if(spellid == 500372)then
			player:AddAura(500363, player)
			player:AddAura(500363, player)
			player:AddAura(500363, player)
		end

		if(spellid == 500376)then
			if(tar:IsInCombat() == false)then
				tar:AttackStart(player)
			end
			local amt = player:GetMaxHealth() / 100 * 7
			player:DealDamage(player, amt, false, 5)
			player:DealDamage(tar, amt * 2, false, 5)
			player:AddAura(500363, player)
		end

		if(spellid == 500366)then
			if(player:HasAura(500363))then
				local stacks = player:GetAura(500363):GetStackAmount()
				if(stacks > 1)then
					player:GetAura(500363):SetStackAmount(stacks - 1)
				else
					player:RemoveAura(500363)
				end
				if(player:HasSpell(800191))then
					tar:AddThreat(player, player:GetStat(0) + player:GetLevel() * 3)
				end
			else
				spell:Finish()
				player:SendBroadcastMessage("Requires a Reaped Soul.")
			end
		end

		if(spellid == 500357)then
			local amt = player:GetMaxHealth() / 100 * 5
			player:DealHeal(player, 801327, amt)
		end

		if(spellid == 500359)then
			local amt = player:GetMaxHealth() / 100 * 12
			player:DealHeal(player, 500359, amt)
			if(player:HasAura(800940))then
				player:RegisterEvent(reaper_scytheslam, 250, 1)
			end
		end

		if(spellid == 500361)then
			reaper_drainhealth(player, 10)
			--player:DealDamage(player, amt)
			tar:RegisterEvent(bloodstore_heal, 5000, (player:GetMaxHealth() / 10) * 1.5)
		end

		if(spellid == 500377)then
			local hp = (player:GetHealth() + player:GetMaxHealth() / 100 * 30)
			if(hp > player:GetMaxHealth())then
				hp = player:GetMaxHealth()
			end
			player:SetHealth(hp)
		end

		if(spellid == 500360)then
			local amt = player:GetMaxHealth() / 100 * 5
			player:DealDamage(player, amt)
		end

		if(spellid == 500215)then
			local near = player:GetCreaturesInRange(50)
			for i,v in ipairs(near) do
				local entry = v:GetEntry()
				if(getLifeForceCostForMinion(entry) > 0)then
					v:AttackStart(tar)
				end
			end
		end

		if(spellid == 500145)then --sun ray
			local solarpow = player:GetAura(500149)
			local pow_amt = solarpow:GetStackAmount()
			if(pow_amt >= 5)then
				player:ResetSpellCooldown(500154, true)
				if(pow_amt >= 10)then
					local damage = 10 + 3 * player:GetLevel()
					player:DealDamage(tar, damage, false, 1)
					if(pow_amt >= 20)then
						setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 5, 0)
						if(pow_amt >= 30)then
							local damage1 = 5 * player:GetLevel()
							player:DealDamage(tar, damage1, false, 1)
						end
					end
				end
			end
		end

		if(spellid == 500147)then --eye of anubisath
			local solarpow = player:GetAura(500149)
			local pow_amt = solarpow:GetStackAmount()
			if(pow_amt >= 5)then
				player:AddAura(500142, tar)
				if(pow_amt >= 10)then
					setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 5, 0)
					if(pow_amt >= 20)then
						setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 10 * 3, 0)
						if(player:IsInGroup())then
							local members = player:GetGroup():GetMembers()
							for i,v in ipairs(members) do
								player:AddAura(500142, v)
							end
						end
					end
				end
			end
			local chance = 5
			if(tar:HasAura(800223))then chance = chance + 5 end
			if(tar:HasAura(500142))then chance = chance + 5 end
			if(tar:HasAura(800234))then chance = chance + 5 end
			if(math.random(100) <= chance)then
				player:AddAura(800601, player)
			end
		end

		if(spellid == 500152)then
			local solarpow = player:GetAura(500149)
			local pow_amt = solarpow:GetStackAmount()
			player:DealHeal(tar, 500152, 12 + pow_amt * 3 + (pow_amt * player:GetLevel() * 1.5) + player:GetLevel() * 1.75)
			player:RemoveAura(500149)
		end

		if(spellid == 500170)then
			if(player:GetAura(500170):GetStackAmount() >= 8)then
				player:CastSpell(player, 500673, true)
				player:CastSpell(player, 42963, true)			
				player:RemoveAura(500170)
			end
		end

		if(spellid == 500270)then
			local x, y, z = player:GetLocation()
			local pillar = player:SpawnCreature(50059, x, y, z, 0)
			pillar:CastSpell(player, 55840, false)
			pillar:SetOwnerGUID(player:GetGUID())
			pillar:RegisterEvent(warprift_port, 5000, 1)
		end

		if(spellid == 500040)then
			local x, y, z = tar:GetLocation()
			local pillar = player:SpawnCreature(50034, x, y, z, 0)
			pillar:SetScale(1.5)
			pillar:CastSpell(pillar, 500048, true)
			pillar:SetScale(1.5)
			pillar:RegisterEvent(pillar_despawn, 300, 1)

			addStatic(player, 8)
		end

		if(spellid == 801035)then
			addStatic(player, 8)
		end

		if(spellid == 500045)then
			addStatic(player, 30)
		end

		if(spellid == 500922)then
			addStatic(player, 10)
			player:AddAura(500926, player)
		end

			if(player:HasSpell(800101))then
		if(spellid == 500923)then
			addStatic(player, 10)
				local static_pct = (player:GetPower(5) / player:GetMaxPower(5))
				local hp_pct = (player:GetMaxHealth() / 5)
				local amt = (static_pct * hp_pct)
				player:DealHeal(player, 800101, amt)
			end
		end

		if(spellid == 800046)then
			setPower(player, player:GetPower(0) + (player:GetMaxPower(0) / 100 * 35), 0)
		end

		if(spellid == 800106)then
			player:DealHeal(player, 800106, player:GetMaxHealth() / 100 * 8)

			local aura = player:GetAura(500706)
			local newamt = aura:GetStackAmount() - 20
			if(newamt <= 0)then
				player:RemoveAura(500706)
			else
				aura:SetStackAmount(newamt)
			end
		end

		if(spellid == 800098)then
			setPower(player, 0, 5)
		end

		if(spellid == 500925)then
			addStatic(player, 40)
		end

		if(spellid == 500926)then
			addStatic(player, 15)
		end

		if(spellid == 500927)then
			addStatic(player, 20)
		end

		if(spellid == 500928)then
			addStatic(player, 15)
		end

		if(spellid == 500930)then
			addStatic(player, (-2))
		end

		if(spellid == 500932)then
			addStatic(player, (-20))
		end

		if(spellid == 500267)then
			local stolen = 30 + (player:GetStat(3) + player:GetPower(1))
			setPower(player, player:GetPower(0) + stolen, 0)
			local tp = tar:GetPower(0)
			if(tp > 0)then
				if(tp > stolen)then
					tar:SetPower(tp - stolen, 0)
				else
					tar:SetPower(0, 0)
				end
			end
			if(math.random(10) == 1)then
				addEssence(player, 500282)
			end
		end

		if(spellid == 800668)then
			local stolen = 30 + (player:GetStat(3) + player:GetPower(1))
			setPower(player, player:GetPower(0) + stolen, 0)
			local tp = tar:GetPower(0)
			if(tp > 0)then
				if(tp > stolen)then
					tar:SetPower(tp - stolen, 0)
				else
					tar:SetPower(0, 0)
				end
			end
		end

		if(spellid == 500280)then
			local managate = tar:GetNearestCreature(60, 50058)
			local x, y, z = managate:GetLocation()
			tar:NearTeleport(x, y, z, 0)
			tar:CastSpell(tar, 64446, true)
			player:AddAura(500308, tar):SetDuration(tar:GetDistance(managate) * 100)
		end

		if(spellid == 500281)then
			player:DealHeal(player, 500281, (player:GetMaxHealth() / 10))
			local managate = player:GetNearestCreature(800, 50058)
			local x, y, z = managate:GetLocation()
			player:NearTeleport(x, y, z, 0)
			player:CastSpell(player, 64446, true)
		end

		if(spellid == 500251)then
			local fire = player:GetAura(500271)
			local fis = 0
			local arc = player:GetAura(500282)
			local ars = 0
			local umb = player:GetAura(500283)
			local ums = 0
			local frost = player:GetAura(500285)
			local frs = 0
			if(fire ~= nil)then
				fis = fire:GetStackAmount()
			end
			if(frost ~= nil)then
				frs = frost:GetStackAmount()
			end
			if(arc ~= nil)then
				ars = arc:GetStackAmount()
			end
			if(umb ~= nil)then
				ums = umb:GetStackAmount()
			end
			if(canAddEssence(player))then
				spell:Cancel()
				player:SendBroadcastMessage("Requires 3 Essences.")
			else
				if(fis == 3)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 800959, true, dmg)
				end
				if(fis == 2 and arc == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:AddAura(500252, tar)
					player:CastCustomSpell(tar, 500252, true, -11, dmg / 8)
				end
				if(frs == 3)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801105, true, -1, dmg / 3 * 2)
				end
				if(frs == 2 and ars == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 800960, true, -1, dmg / 5)
					player:CastCustomSpell(tar, 801108, true)
				end
				if(ars == 3)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					player:CastCustomSpell(tar, 801102, true, dmg / 3)
				end
				if(ars == 2 and fis == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801103, true, dmg / 3, dmg / 14)
				end
				if(ars == 2 and frs == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801104, true, dmg)
				end
				--[[if(ars == 1 and frs == 2)then
					player:CastCustomSpell(tar, 801108, true)
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					player:CastCustomSpell(tar, 800960, true, dmg  / 2)
				end]]--
				if(ars == 1 and frs == 1 and fis == 1)then
					player:CastCustomSpell(player, 801115, true)
				end
				if(fis == 1 and frs == 2)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801114, true, dmg / 2)
					if(tar:HasAura(801108))then
						player:AddAura(801105, tar)
						player:CastCustomSpell(tar, 800960, true, dmg / 2)
					end
				end
				if(frs == 1 and fis == 2)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107) or player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801113, true, nil, dmg / 2, dmg / 8)
				end
				if(player:HasAura(800103) == false)then
					player:RemoveAura(500271)
					player:RemoveAura(500282)
					player:RemoveAura(500283)
					player:RemoveAura(500285)
				end
			end
		end

		if(spellid == 801093)then
			local dmg = (4 + player:GetLevel() * 2 + player:GetStat(3) / 5 + player:GetStat(3) * 0.8) * 0.1
			if(player:HasAura(801096))then
				dmg = dmg * 1.5
			end
			if(player:HasSpell(801109))then
				if(math.random(10) == 1)then
					local r = math.random(3)
					if(r == 1)then
						addEssence(player, 500271)
						player:SendBroadcastMessage("Fire Essence generated!")
					end
					if(r == 2)then
						addEssence(player, 500282)
						player:SendBroadcastMessage("Arcane Essence generated!")
					end
					if(r == 3)then
						addEssence(player, 500285)
						player:SendBroadcastMessage("Frost Essence generated!")
					end
				end
				player:CastCustomSpell(tar, 801119, true, dmg)
			else
				player:CastCustomSpell(tar, 801095, true, dmg)
			end
		end

		if(spellid == 801112)then
			if(player:HasAura(801107) == false and player:HasAura(801106) == false)then
				player:AddAura(801107, player)
			end
		end

		if(spellid == 800667)then
			local fire = player:GetAura(500271)
			local fis = 0
			local arc = player:GetAura(500282)
			local ars = 0
			local umb = player:GetAura(500283)
			local ums = 0
			local frost = player:GetAura(500285)
			local frs = 0
			if(fire ~= nil)then
				fis = fire:GetStackAmount()
			end
			if(frost ~= nil)then
				frs = frost:GetStackAmount()
			end
			if(arc ~= nil)then
				ars = arc:GetStackAmount()
			end
			if(umb ~= nil)then
				ums = umb:GetStackAmount()
			end
			if(canAddEssence(player))then
				spell:Cancel()
				player:SendBroadcastMessage("Requires 3 Essences.")
			else
				if(fis == 3)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 800959, true, dmg)
				end
				if(fis == 2 and arc == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 500252, true, -11, dmg / 8)
				end
				if(frs == 3)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801105, true, -1, dmg / 3 * 2)
				end
				if(frs == 2 and ars == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 800960, true, -1, dmg / 5)
					player:CastCustomSpell(tar, 801108, true)
				end
				if(ars == 3)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					player:CastCustomSpell(tar, 801102, true, dmg / 3)
				end
				if(ars == 2 and fis == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801103, true, dmg / 3, dmg / 14)
				end
				if(ars == 2 and frs == 1)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801104, true, dmg)
				end
				--[[if(ars == 1 and frs == 2)then
					player:CastCustomSpell(tar, 801108, true)
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					player:CastCustomSpell(tar, 800960, true, dmg  / 2)
				end]]--
				if(ars == 1 and frs == 1 and fis == 1)then
					player:CastCustomSpell(player, 801115, true)
				end
				if(fis == 1 and frs == 2)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801114, true, dmg / 2)
					if(tar:HasAura(801108))then
						player:AddAura(801105, tar)
						player:CastCustomSpell(tar, 800960, true, dmg / 2)
					end
				end
				if(frs == 1 and fis == 2)then
					local dmg = (4 + math.random(8) + player:GetLevel() * 3.25 + player:GetStat(3) * 1.5)
					if(tar:ToPlayer() ~= nil)then
						if(dmg >= tar:GetMaxHealth() / 2)then
							dmg = tar:GetMaxHealth() / 2
						end
					end
					if(player:HasAura(801107) or player:HasAura(801106))then
						dmg = dmg * 1.5
					end
					player:CastCustomSpell(tar, 801113, true, nil, dmg / 2, dmg / 8)
				end
				if(player:HasAura(800103) == false)then
					player:RemoveAura(500271)
					player:RemoveAura(500282)
					player:RemoveAura(500283)
					player:RemoveAura(500285)
				end
			end
		end

		if(spellid == 800112)then
			local life = player:GetAura(500283)
			local haste = player:GetAura(500284)
			local destruction = player:GetAura(500286)
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500283)
				player:RemoveAura(500284)
				player:RemoveAura(500286)
			end
			if(life ~= nil)then
				local amt = tar:GetMaxHealth() / 20 * life:GetStackAmount()
				player:DealHeal(tar, 71121, amt)
			end
			if(haste ~= nil)then
				local stacks = haste:GetStackAmount()
				for i=1,stacks do
					player:AddAura(500309, tar)
				end
			end
			if(destruction ~= nil)then
				local stacks = destruction:GetStackAmount()
				for i=1,stacks do
					player:AddAura(500310, tar)
				end
			end
		end

		if(spellid == 500082)then
			setPower(player, player:GetPower(1) + 100, 1)
			if(player:HasAura(500082) ~= true)then
				setPower(player, player:GetPower(1) + 150, 1)
			end
		end
		if(spellid == 500083)then
			if(player:HasAura(500082))then
				setPower(player, player:GetPower(1) + 150, 1)
			else
				spell:Finish()
				player:SendBroadcastMessage("Can only be cast within 2 seconds of Coiling Bolt.")
			end
		end

		if(spellid == 800161)then
			if(player:HasAura(500082))then
				setPower(player, player:GetPower(1) + 100, 1)
			else
				spell:Finish()
				player:SendBroadcastMessage("Can only be cast within 2 seconds of Coiling Bolt.")
			end
		end

		if(spellid == 800162)then
			if(player:HasAura(500082))then
				setPower(player, player:GetPower(1) + 100, 1)
			else
				spell:Finish()
				player:SendBroadcastMessage("Can only be cast within 2 seconds of Coiling Bolt.")
			end
		end

		if(spellid == 800163)then
			if(player:HasAura(500082))then
				setPower(player, player:GetPower(1) + 100, 1)
			else
				spell:Finish()
				player:SendBroadcastMessage("Can only be cast within 2 seconds of Coiling Bolt.")
			end
		end

		if(spellid == 800164)then
			if(player:HasAura(500082))then
				setPower(player, player:GetPower(1) + 100, 1)
			else
				spell:Finish()
				player:SendBroadcastMessage("Can only be cast within 2 seconds of Coiling Bolt.")
			end
		end

		if(spellid == 500085)then
			setPower(player, player:GetPower(0) + 45, 0)
		end
		if(spellid == 500094)then
			setPower(player, player:GetPower(0) + 50, 0)
			player:DealDamage(player, player:GetMaxHealth() / 10, false, 5)
		end
		if(spellid == 500138)then
			if(player:HasAura(500130))then
				if(tar:HasAura(500130))then
					player:AddAura(500130, tar):SetStackAmount(tar:GetAura(500130):GetStackAmount() + player:GetAura(500130):GetStackAmount())
				else
					player:AddAura(500130, tar):SetStackAmount(player:GetAura(500130):GetStackAmount())
				end
				player:RemoveAura(500130)
			else
				local aura = tar:GetAura(500130)
				player:AddAura(500130, player):SetStackAmount(aura:GetStackAmount())
			end
		end
		if(spellid == 500174)then --inspiring strike
			player:AddAura(500256, player)
			player:AddAura(500256, player)
			
		end
		if(spellid == 800316)then
			if(player:HasSpell(800322))then
				player:ResetSpellCooldown(500259)
				player:ResetSpellCooldown(500260)
				player:ResetSpellCooldown(500261)
				player:ResetSpellCooldown(500263)
				player:ResetSpellCooldown(500264)
				player:ResetSpellCooldown(500265)
				player:ResetSpellCooldown(500266)
			end
		end
		if(spellid == 500168)then --block
			player:AddAura(500256, player)
		end
		if(spellid == 800159)then
			local stacks = tar:GetAura(800158):GetStackAmount()
			player:DealHeal(player, 800159, player:GetMaxHealth() / 20 * stacks)
			setPower(player, player:GetPower(1) + player:GetMaxPower(1) / 20 * stacks, 1)
			tar:RemoveAura(800158)
		end
		if(spellid == 500155)then --arcing strike
			if(player:HasAura(500256))then
				local amt = player:GetAura(500256):GetStackAmount()
				if(amt >= 5 and player:HasAura(800321) == false)then
					player:DealHeal(player, 66112, player:GetMaxHealth() / 10)
					player:RemoveAura(500256)
				end
			end
		end

		if(spellid == 500143)then
			if(player:HasAura(500149))then
				local aura = player:GetAura(500149)
				local amt = aura:GetStackAmount()
				aura:SetStackAmount(amt + 2)
			else
				player:AddAura(500149, player)
				player:AddAura(500149, player)
			end
		end

		if(spellid == 800357)then
			if(tar:HasAura(800357))then
				spell:Finish()
				player:SendBroadcastMessage("Target already affected by Shine.")
			else
				if(player:HasAura(500149))then
					local aura = player:GetAura(500149)
					local amt = aura:GetStackAmount()
					local inc = 1
					if(tar:HasAura(500142))then
						inc = inc + 1
					end
					aura:SetStackAmount(amt + inc)
				else
					player:AddAura(500149, player)
				end
			end
		end
		if(spellid == 500144 or spellid == 800231)then
			if(player:HasAura(500149))then
				local aura = player:GetAura(500149)
				local amt = aura:GetStackAmount()
				aura:SetStackAmount(amt + 1)
			else
				player:AddAura(500149, player)
			end
		end
		if(spellid == 500146 or spellid == 800232)then
			if(player:HasAura(500149))then
				local aura = player:GetAura(500149)
				local amt = aura:GetStackAmount()
				if(amt >= 5)then
					aura:SetStackAmount(amt + 2)
					if(tar:HasAura(800600))then
						aura:SetStackAmount(amt + 2)
					end
				else
					spell:Finish()
					player:SendBroadcastMessage("You must have at least 5 Solar Power to use this.")
				end
			else
				spell:Finish()
				player:SendBroadcastMessage("You must have at least 5 Solar Power to use this.")
			end
		end
		if(spellid == 800602)then
			if(player:HasAura(500149))then
				local aura = player:GetAura(500149)
				aura:SetDuration(aura:GetDuration() + 15000)
				player:AddAura(800601, player)
				player:ResetSpellCooldown(800234)
			else
				spell:Finish()
				player:SendBroadcastMessage("You have no Solar Power.")
			end
		end
		if(spellid == 500142)then
			if(tar:HasAura(500151))then
				if(player:HasAura(500149))then
					local aura = player:GetAura(500149)
					local amt = aura:GetStackAmount()
					aura:SetStackAmount(amt + 1)
				else
					player:AddAura(500149, player)
				end
				tar:RemoveAura(500151)
			end
		end
		if(spellid == 500122)then
			if(player:HasSpell(801075))then
				player:RegisterEvent(bloodmage_form, 100, 1)
			else
				if(player:HasSpell(800157))then
					spell:Cancel()
					player:SendBroadcastMessage("You cannot use this ability with Eternal Curse.")
				else
					player:SetPowerType(1)
					player:AddAura(800770, player)
					player:RegisterEvent(worgen_changepow, 10, 1)
					if(player:HasSpell(800488))then
						player:AddAura(800488, player)
					end
				end
			end
		end
		if(spellid == 500128)then
			if(player:HasSpell(800488))then
				player:AddAura(800488, player)
			end
		end
		if(spellid == 800771)then
			player:SetPowerType(1)
			newamt = player:GetPower(1) - 50
			if(player:HasAura(801070))then
				newamt = newamt - (player:GetAura(801070):GetStackAmount() * 10)
			end
			if(newamt < 0)then
				newamt = 0
				player:RegisterEvent(worgen_changepow, 10, 1)
				player:SetPowerType(1)
				player:RemoveAura(800770)
				player:RemoveAura(500122)
				player:CastSpell(player, 72313, true)
				player:RemoveAura(801070)
			else
				player:AddAura(801070, player)
			end
			setPower(player, 1, newamt)
		end
		if(spellid == 800790 or spellid == 800791)then
			local near = player:GetNearestCreature(50379, 10)
			if(near ~= nil)then
				near:CastSpell(tar, 800567, true)
				near:CastCustomSpell(tar, 801488, true, -51, player:GetStat(3) / 6)
				near:RegisterEvent(spirit_despawn, 1500, 1)
			end
		end
		if(spellid == 500129 or spellid == 800604)then
			setPower(player, player:GetPower(0) + (5 * (player:GetMaxPower(0) / 100)), 0)
			if(tar:GetHealthPct() <= 20)then
				player:RegisterEvent(pyro_resetfire, 100, 1)
			end
			if(player:HasSpellCooldown(800811))then
				player:AddAura(800791, tar)
			end
		end
		if(spellid == 500130)then
			if(tar:HasAura(500131))then
				setPower(player, player:GetPower(0) + player:GetMaxPower(0) / 10, 0)
			end
			local amt = 1
			if(tar:HasAura(500129))then
				amt = tar:GetAura(500129):GetStackAmount()
			end
			if(tar:HasAura(500130))then
				local aura = player:GetAura(500130)
				aura:SetStackAmount(aura:GetStackAmount() + amt)
			else
				local aura = player:AddAura(500130, tar)
				aura:SetStackAmount(aura:GetStackAmount() + amt - 1)
			end
		end
		if(spellid == 500132)then
			local amt = 12
			if(tar:IsCasting())then
				amt = amt + 5
			end
			if(tar:HasAura(500130))then
				local aura = tar:GetAura(500130)
				aura:SetStackAmount(aura:GetStackAmount() + amt)
			else
				player:AddAura(500130, tar)
				local aura = tar:GetAura(500130)
				aura:SetStackAmount(aura:GetStackAmount() + amt - 1)
			end
		end
		if(spellid == 500131)then
			local amt = 5
			if(tar:GetHealthPct() >= 70)then
				amt = amt + 3
			end
			if(tar:HasAura(500130))then
				local aura = tar:GetAura(500130)
				aura:SetStackAmount(aura:GetStackAmount() + amt)
			else
				player:AddAura(500130, tar)
				local aura = tar:GetAura(500130)
				aura:SetStackAmount(aura:GetStackAmount() + amt - 1)
			end
		end
		if(spellid == 500199)then --gift of the firelands
			if(tar:HasAura(500130))then
				local aura = tar:GetAura(500130)
				local amt = (4 + player:GetStat(3) / 30)
				local stacks = aura:GetStackAmount()
				player:DealHeal(player, 2050, stacks * amt, true)
				tar:RemoveAura(500130)
			else
				spell:Finish()
			end
		end
		if(spellid == 500136)then
			aura = tar:GetAura(500130)
			local near = tar:GetCreaturesInRange(10, 0, 2)
			for i,v in ipairs(near) do
				if(v:HasAura(800695))then
					player:AddAura(500130, v)
					v:GetAura(500130):SetStackAmount(aura:GetStackAmount())
				end
			end
		end
		if(spellid == 500123 or spellid == 500124 or spellid == 500127 or spellid == 800156 or spellid == 800158 or spellid == 800159 or spellid == 800782)then
			if(player:HasSpell(800157))then
				if(not player:HasAura(800514))then
					player:AddAura(800514, player)
					for i,v in ipairs(tar:GetCreaturesInRange(8, 0, 2)) do
						if(v:IsInCombat())then
							player:CastSpell(v, spellid, true)
						end
					end
				end
			end
			if(player:HasAura(500122) or player:HasSpell(800157))then
			else
				spell:Finish()
				player:SendBroadcastMessage("Can only be used in Worgen Form.")
			end
		end
		if(spellid == 500098)then --spirit charge, anger
			local spirits = player:GetCreaturesInRange(60, 50036)
			if(spirits == nil)then
				spell:Finish()
			else
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						local intellect = player:GetStat(4)
						v:CastSpell(v, 70509, true)
						v:CastSpell(tar, 500803, true)
						local damage = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect  * 1.5)
						player:DealDamage(tar, (damage), false, 5)
						v:RegisterEvent(spirit_despawn, 100, 1)
					end
				end
				tar:AttackStart(player)
			end
		end
		if(spellid == 500100)then --spirit charge, fear
			local spirits = player:GetCreaturesInRange(60, 50037)
			if(spirits == nil)then
				spell:Finish()
			else
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						local intellect = player:GetStat(4)
						v:CastSpell(v, 70509, true)
						v:CastSpell(tar, 500803, true)
						local damage = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect * 1.5)
						player:DealDamage(tar, (damage), false, 5)
						v:RegisterEvent(spirit_despawn, 100, 1)
					end
				end
				tar:AttackStart(player)
			end
		end
		if(spellid == 500102)then --spirit charge, sadness
			local spirits = player:GetCreaturesInRange(60, 50038)
			if(spirits == nil)then
				spell:Finish()
			else
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						local intellect = player:GetStat(4)
						v:CastSpell(v, 70509, true)
						v:CastSpell(tar, 500803, true)
						local damage = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect * 1.5)
						player:DealDamage(tar, (damage), false, 5)
						v:RegisterEvent(spirit_despawn, 100, 1)
					end
				end
				tar:AttackStart(player)
			end
		end
		if(spellid == 500104)then --spirit charge, joy
			local spirits = player:GetCreaturesInRange(60, 50039)
			if(spirits == nil)then
				spell:Finish()
			else
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						local intellect = player:GetStat(4)
						v:CastSpell(v, 70509, true)
						v:CastSpell(tar, 500803, true)
						local heal = (20 + math.random(3) + player:GetLevel() * 1.75 + intellect * 1.5) * 1.5
						player:DealHeal(tar, 2055, heal, false)
						v:RegisterEvent(spirit_despawn, 100, 1)
					end
				end
			end
		end
		if(spellid == 500106)then --provocation
			local spirits = player:GetNearestCreature(60, 50036)
			v:CastSpell(tar, 56222, true)
		end
		if(spellid == 500105)then --spirit bomb
			for i=50253,50255 do
				local spirits = player:GetCreaturesInRange(60, i)
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						v:CastSpell(v, 500105, true)
					end
				end
			end
		end
		if(spellid == 500118)then --spirit blast
			for i=50253,50255 do
				local spirits = player:GetCreaturesInRange(60, i)
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						v:CastCustomSpell(tar, 800958, true, player:GetLevel() * 1.5 + player:GetStat(4) / 3 + 5)
					end
				end
			end
		end
		if(spellid == 800335)then --spiritwrath
			setPower(player, player:GetPower(0) + (player:GetMaxPower(0) / 100 * 5), 0)
			if(tar:IsInCombat())then
				for i=50253,50255 do
					local spirits = player:GetCreaturesInRange(60, i)
					for i,v in ipairs(spirits) do
						if(v:GetOwner() == player)then
							v:CastCustomSpell(tar, 800957, true, nil, 3 + player:GetLevel() + player:GetStat(4) / 4)
						end
					end
				end
			end
		end
		if(spellid == 500113)then --singularity
			for i=50036,50039 do
				local spirits = player:GetCreaturesInRange(60, i)
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						player:AddAura(500113, player)
						v:CastSpell(v, 35426, true)
						v:DespawnOrUnsummon()
					end
				end
			end
		end
		if(spellid == 500119)then --phantomshell
			for i=50036,50039 do
				local spirits = player:GetCreaturesInRange(60, i)
				for i,v in ipairs(spirits) do
					if(v:GetOwner() == player)then
						player:AddAura(500119, player)
						v:CastSpell(v, 35426, true)
						v:DespawnOrUnsummon()
					end
				end
			end
		end
		if(spellid == 500202)then
			local pet = player:GetNearestCreature(60, 50043)
			pet:AddAura(500203, pet)
			pet:CastSpell(pet, 32475, true)
			pet:RegisterEvent(phoenix_empower_attack, 1999, 6)
		end
		if(spellid == 500137)then --magma volley
			local targets = player:GetCreaturesInRange(60, 0, 1)
			for i,v in ipairs(targets) do
				if(v:HasAura(500130))then
					player:CastSpell(v, 500131, true)
				end
			end
		end
		if(spellid == 500237)then
			local amt = 4
			local aura = player:AddAura(500238, player)
			aura:SetStackAmount(aura:GetStackAmount() + (amt - 1))
			local max = 6;
			if(player:HasSpell(800035))then
				max = 12;
			end
			if(aura:GetStackAmount() > max)then
				aura:SetStackAmount(max)
			end
		end

		if(spellid == 800348)then
			local amt = 5
			local aura = player:AddAura(500238, player)
			aura:SetStackAmount(aura:GetStackAmount() + (amt - 1))
			local max = 6;
			if(player:HasSpell(800035))then
				max = 12;
			end
			if(aura:GetStackAmount() > max)then
				aura:SetStackAmount(max)
			end
		end
		if(spellid == 500246)then
			local amt = 4
			local aura = player:AddAura(800117, player)
			aura:SetStackAmount(aura:GetStackAmount() + (amt - 1))
			local max = 6;
			if(player:HasSpell(800035))then
				max = 12;
			end
			if(aura:GetStackAmount() > max)then
				aura:SetStackAmount(max)
			end
		end
		if(spellid == 500234 or spellid == 800346)then
			local ammoType = 0
			if(player:HasAura(500238))then
				ammoType = 500238
			end
			if(player:HasAura(800117))then
				ammoType = 800117
			end
			if(ammoType > 0)then
				local aura = player:GetAura(ammoType)
				if(aura:GetStackAmount() <= 1)then
					player:RemoveAura(ammoType)
				end
				aura:SetStackAmount(aura:GetStackAmount() - 1)

				if(ammoType == 800117)then
					player:AddAura(800118, tar)
				end

				if(ammoType == 500238)then
					player:CastCustomSpell(tar, 801010, true, (player:GetLevel() * 1.25 + 2 + 0.6 * (player:GetStat(1))))
				end

				if(tar:HasAura(800095) and spellid == 800346)then
					local aura = tar:GetAura(800095)
					if(aura:GetCaster() == player)then
						local perc = ((8000 - aura:GetDuration()) / 8000)
						local dmg = (player:GetLevel() * 3 + player:GetStat(0) * 1.5 + player:GetStat(1)) * 2.5
						player:DealDamage(tar, dmg * perc, false, 2)
						tar:RemoveAura(800095)
						local dummy = player:SpawnCreature(50034, tar:GetX(), tar:GetY(), tar:GetZ(), 0, 1, 1500)
						dummy:CastSpell(dummy, 60081, true)
						dummy:RegisterEvent(pillar_despawn1, 1500, 1)
						--dummy:DespawnOrUnsummon()
					end
				end
			else
				spell:Finish()
				player:SendBroadcastMessage("No ammunition!")
			end
		end

		if(spellid == 800345)then
			local ammoType = 0
			if(player:HasAura(500238))then
				ammoType = 500238
			end
			if(player:HasAura(800117))then
				ammoType = 800117
			end
			if(ammoType > 0)then
				local aura = player:GetAura(ammoType)
				if(aura:GetStackAmount() <= 2)then
					player:RemoveAura(ammoType)
				end
				aura:SetStackAmount(aura:GetStackAmount() - 2)

				if(ammoType == 800117)then
					player:AddAura(800118, tar)
				end
			else
				spell:Finish()
				player:SendBroadcastMessage("No ammunition!")
			end
		end
	end
end

function phoenix_empower_attack(i, ii, iii, tar)
	if(tar:HasAura(500203))then
		tar:CastSpell(tar:GetVictim(), 500130, true)
	end
end

function ranger_popfrost(i, ii, iii, tar)
	if(tar:GetSelection():HasAura(800258))then
		tar:CastCustomSpell(tar:GetSelection(), 801347, true, tar:GetStat(1))
		tar:GetSelection():RemoveAura(800258)
	end
end



function reaper_scytheslam(i, ii, iii, tar)
	tar:CastCustomSpell(tar, 801334, true)
end

function spirit_despawn(i, ii, iii, tar)
	tar:Kill(tar)
	--tar:DespawnOrUnsummon()
end

function pillar_despawn(i, ii, iii, tar)
	local x, y, z = tar:GetLocation()
	local pillar = tar:SpawnCreature(50034, x, y, z, 0)
	pillar:SetScale(1.5)
	pillar:CastSpell(pillar, 500048, true)
	tar:DespawnOrUnsummon()
	pillar:SetScale(1.5)
	pillar:RegisterEvent(pillar_despawn1, 300, 1)
end	

function pillar_despawn1(i, ii, iii, creature)
	creature:DespawnOrUnsummon()
end	

function starts_with(str, start)
   return str:sub(1, #start) == start
end

function enterCombat(event, player, enemy)
	if(player:GetMap():IsDungeon())then
		if(enemy:IsElite() and enemy:HasAura(801024))then
			if(enemy:GetLevel() < MAX_LEVEL - 2)then
				enemy:SetLevel(MAX_LEVEL + math.random(2) - math.random(2))
			end
			if(math.random(12) == 1)then
				enemy:CastSpell(enemy, getMythicSpell(1), true)
			end
			for i=1,3 do
				if(math.random(10) == 1)then
					registerMythicCast(enemy)
				end
			end
			local qry = WorldDBQuery("SELECT ScriptName FROM creature_template WHERE entry = "..enemy:GetEntry())
			if(qry~=nil)then
				local str = qry:GetString(0)
				if(starts_with(str, "boss_"))then
					enemy:AddAura(801353, enemy)
				end
			end
		end
	end
end
RegisterPlayerEvent(33, enterCombat)

function deleteItem(i, ii, id, player)
	local item = player:GetItemByEntry( id )
	local count = player:GetItemCount(item:GetEntry())
	player:RemoveItem(item:GetEntry(), count)
	player:RemoveEventById(i)
end

function afterLootItem(i, ii, id, player)
	local item = player:GetItemByEntry( id )
	local count = player:GetItemCount(item:GetEntry())
	if(item:GetEntry() == 900073)then
		player:RegisterEvent(deleteItem, 100, id)
		addMinionXPRaw(player, 50 * count)
	end
	if(item:GetEntry() == 900074)then
		player:RegisterEvent(deleteItem, 100, id)
		for i=1,count do
			getRuneDrop(player, nil)
		end
	end
	if(item:GetEntry() == 900075)then
		player:RegisterEvent(deleteItem, 100, id)
			local mob = 50403
			local qry = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..mob.." AND GUID = "..player:GetGUIDLow())
			local total = WorldDBQuery("SELECT COUNT(*) FROM player_minions WHERE GUID = "..player:GetGUIDLow().." AND equipped = 0"):GetUInt32(0)
			if(qry == nil)then
				if(total < MAX_MINIONS)then
					WorldDBQuery("INSERT INTO player_minions VALUES ("..player:GetGUIDLow()..", "..mob..", 0, 75, 0, 0, 0, 0, '')")
					player:SendBroadcastMessage("You have earned a rare minion!")
				else
					player:SendBroadcastMessage("The "..tar:GetName().." has escaped! You already have "..MAX_MINIONS.." minions stabled. You must abandon some before you can stable more.")
				end
			else
				player:SendBroadcastMessage("You have already collected a minion of this type.")
			end
	end
	if(item:GetEntry() == 900076)then
		player:RegisterEvent(deleteItem, 100, id)
			local mob = 50404
			local qry = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..mob.." AND GUID = "..player:GetGUIDLow())
			local total = WorldDBQuery("SELECT COUNT(*) FROM player_minions WHERE GUID = "..player:GetGUIDLow().." AND equipped = 0"):GetUInt32(0)
			if(qry == nil)then
				if(total < MAX_MINIONS)then
					WorldDBQuery("INSERT INTO player_minions VALUES ("..player:GetGUIDLow()..", "..mob..", 0, 75, 0, 0, 0, 0, '')")
					player:SendBroadcastMessage("You have earned a rare minion!")
				else
					player:SendBroadcastMessage("The minion has escaped! You already have "..MAX_MINIONS.." minions stabled. You must abandon some before you can stable more.")
				end
			else
				player:SendBroadcastMessage("You have already collected a minion of this type.")
			end
	end
	if(item:GetEntry() == 900077)then
		player:RegisterEvent(deleteItem, 100, id)
			local mob = 50405
			local qry = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..mob.." AND GUID = "..player:GetGUIDLow())
			local total = WorldDBQuery("SELECT COUNT(*) FROM player_minions WHERE GUID = "..player:GetGUIDLow().." AND equipped = 0"):GetUInt32(0)
			if(qry == nil)then
				if(total < MAX_MINIONS)then
					WorldDBQuery("INSERT INTO player_minions VALUES ("..player:GetGUIDLow()..", "..mob..", 0, 75, 0, 0, 0, 0, '')")
					player:SendBroadcastMessage("You have earned a rare minion!")
				else
					player:SendBroadcastMessage("The minion has escaped! You already have "..MAX_MINIONS.." minions stabled. You must abandon some before you can stable more.")
				end
			else
				player:SendBroadcastMessage("You have already collected a minion of this type.")
			end
	end
	if(item:GetEntry() == 900078)then
		player:RegisterEvent(deleteItem, 100, id)
			local mob = 50406
			local qry = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..mob.." AND GUID = "..player:GetGUIDLow())
			local total = WorldDBQuery("SELECT COUNT(*) FROM player_minions WHERE GUID = "..player:GetGUIDLow().." AND equipped = 0"):GetUInt32(0)
			if(qry == nil)then
				if(total < MAX_MINIONS)then
					WorldDBQuery("INSERT INTO player_minions VALUES ("..player:GetGUIDLow()..", "..mob..", 0, 75, 0, 0, 0, 0, '')")
					player:SendBroadcastMessage("You have earned a rare minion!")
				else
					player:SendBroadcastMessage("The minion has escaped! You already have "..MAX_MINIONS.." minions stabled. You must abandon some before you can stable more.")
				end
			else
				player:SendBroadcastMessage("You have already collected a minion of this type.")
			end
	end
	if(item:GetEntry() == 900079)then
		player:RegisterEvent(deleteItem, 100, id)
			local mob = 50407
			local qry = WorldDBQuery("SELECT level FROM player_minions WHERE minion = "..mob.." AND GUID = "..player:GetGUIDLow())
			local total = WorldDBQuery("SELECT COUNT(*) FROM player_minions WHERE GUID = "..player:GetGUIDLow().." AND equipped = 0"):GetUInt32(0)
			if(qry == nil)then
				if(total < MAX_MINIONS)then
					WorldDBQuery("INSERT INTO player_minions VALUES ("..player:GetGUIDLow()..", "..mob..", 0, 75, 0, 0, 0, 0, '')")
					player:SendBroadcastMessage("You have earned a rare minion!")
				else
					player:SendBroadcastMessage("The minion has escaped! You already have "..MAX_MINIONS.." minions stabled. You must abandon some before you can stable more.")
				end
			else
				player:SendBroadcastMessage("You have already collected a minion of this type.")
			end
	end
	
	player:RemoveEventById(i)
end

function onLootItem(event, player, item, count)
	player:RegisterEvent(afterLootItem, 100, item:GetEntry())
	if(ENABLE_AUTOMOG)then
		if(item:GetClass() == 2 or item:GetClass() == 4 and math.random(3) == 1)then
			local qry = nil
			local buffed = false
			if(player:GetNearestCreature(70, 50385) ~= nil and player:HasAura(801025))then
				buffed = true
			end
			local minilvl = math.random(300)
			for i=1,3 do
				if(math.random(5)  == 1 or buffed)then
					minilvl = minilvl + math.random(100)
				end
			end
			if(math.random(1000) == 1 or (math.random(500) == 1 and buffed))then
				qry = WorldDBQuery("SELECT entry FROM item_template WHERE VerifiedBuild = 27500 AND inventorytype = "..(item:GetInventoryType()).." AND quality = 11 AND subclass = "..(item:GetSubClass()).." AND class = "..(item:GetClass()).." ORDER BY RAND() LIMIT 1")
			else
				local invtype = item:GetInventoryType()
				if(invtype == 16)then
					qry = WorldDBQuery("SELECT entry FROM item_template WHERE VerifiedBuild = 27500 AND inventorytype = "..(invtype).." AND itemlevel <= "..minilvl.." ORDER BY RAND() LIMIT 1")
				else
					qry = WorldDBQuery("SELECT entry FROM item_template WHERE VerifiedBuild = 27500 AND inventorytype = "..(invtype).." AND itemlevel <= "..minilvl.." AND subclass = "..(item:GetSubClass()).." AND class = "..(item:GetClass()).." ORDER BY RAND() LIMIT 1")
				end
			end
			if(qry~=nil)then
				local fakeid = qry:GetUInt32(0)
				player:SendBroadcastMessage(fakeid)
				local iGUID = item:GetGUIDLow()
				CharDBQuery("INSERT INTO automogs VALUES ("..iGUID..", "..(fakeid)..")")
			end
		end
	end
	if(player:GetMap():IsDungeon())then
		if(player:HasAura(801025) and player:GetNearestCreature(70, 50385) ~= nil)then
			if(item:GetEntry() == 100186 or item:GetEntry() == 100206 or item:GetClass() == 2 or item:GetClass() == 4)then
				local socketChance = 20;
				local isGear = true;
				if(item:GetEntry() == 100186 or item:GetEntry() == 100206)then isGear = false; end
				local crystals = math.random(14)
				if(item:GetEntry() == 100206)then crystals = 40; end
				if(isGear)then
					if(math.random(socketChance) == 1)then
						item:SetEnchantment(3729, 6)
						player:SendAreaTriggerMessage("|cff00ff00"..item:GetName().." has a socket!")
						player:SendBroadcastMessage("|cff00ff00"..item:GetName().." has a socket!")
					end
				end
				local chance = 40 - crystals
		        if(chance < 1) then chance = 1; end
		        local success = item:SetEnchantment(GetRandomEnchantScaling(item), 1)
		        if(success)then
		           player:CastSpell(player, 65632, true)
		            player:SendAreaTriggerMessage(generateIcon("Icons/inv_enchant_essencecosmicgreater", 20).." |cffffffff"..item:GetName().." has a |cff00ff00BONUS EFFECT! "..generateIcon("Icons/inv_enchant_essencecosmicgreater", 20))
		            player:SendBroadcastMessage(generateIcon("Icons/inv_enchant_essencecosmicgreater", 20).." |cffffffff"..item:GetName().." has a |cff00ff00BONUS EFFECT! "..generateIcon("Icons/inv_enchant_essencecosmicgreater", 20))
		        else
		            for i=1,crystals do
		                local work = item:SetEnchantment(GetRandomEnchantScaling(item), 1)
		                if(work)then
		                    player:CastSpell(player, 65632, true)
		                    player:SendAreaTriggerMessage(generateIcon("Icons/inv_enchant_essencecosmicgreater", 20).." |cffffffff"..item:GetName().." has a |cff00ff00BONUS EFFECT! "..generateIcon("Icons/inv_enchant_essencecosmicgreater", 20))
		                    player:SendBroadcastMessage(generateIcon("Icons/inv_enchant_essencecosmicgreater", 20).." |cffffffff"..item:GetName().." has a |cff00ff00BONUS EFFECT! "..generateIcon("Icons/inv_enchant_essencecosmicgreater", 20))
		                    break;
		                end
		            end
		        end
			end
		end
	end
end

RegisterPlayerEvent(32, onLootItem)


function updateMobLevel(creature, level)
	local mob_perks = {800003, 800004, 800005, 800006, 800007, 800009, 800011}

	--creature:Kill(creature)
	--creature:Respawn()

	local orig_lvl = creature:GetLevel()
	creature:CastSpell(creature,801024,true)
	creature:AddAura(801024, creature)
	local aura = creature:GetAura(801024)
	aura:SetStackAmount((level-orig_lvl))
	if(aura:GetStackAmount() < 10)then
		aura:SetStackAmount(10)
	end
	if((level-orig_lvl) >= 12)then
		aura:SetStackAmount(aura:GetStackAmount() + 12 + math.random(8))
	end
	creature:SetLevel(level + (math.random(2) - math.random(2)))
	local hp = creature:GetMaxHealth() / orig_lvl * level
	--hp = hp + (math.random(hp / 10) - math.random(hp / 10))
	local hpmod = (1)
	--hpmod = hpmod + ((level-orig_lvl) * 0.075)
	creature:SetMaxHealth(creature:GetMaxHealth() * hpmod)
	
	
	for i,v in ipairs(mob_perks) do
		if(math.random(100) == 1)then
			creature:AddAura(v, creature)
		end
	end
end

function getDungeonMobLevelForPlayerLevel(level)
	local ret = 1;
	local brackets = {
		{1, 4},
		{5, 9},
		{10, 14},
		{15, 19},
		{20, 24},
		{25, 29},
		{30, 34},
		{35, 39},
		{40, 44},
		{45, 49},
		{50, 54},
		{55, 59},
		{60, 64},
		{65, 69},
		{70, 74},
		{75, 80},
	}
	for i,v in ipairs(brackets) do
		if(level >= v[1] and level <= v[2])then
			return v[2] - 1
		end	
	end
end

function mysplit(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end


function isBalanceTester(player)
	local qry = WorldDBQuery("SELECT flag FROM account_flags WHERE account = '"..player:GetAccountName().."' or id = "..player:GetAccountId())
	if(qry~=nil)then
		local flag = qry:GetUInt32(0)
		if(flag == 1)then
			return true;
		end
	end
	return false;
end

function onCommand(event, player, cmd)
	if(isBalanceTester(player) or player:IsGM())then
		if(cmd == "boost")then
			player:SetLevel(80)
			player:LearnSpell(800595)
			player:LearnSpell(500977)
			player:LearnSpell(54197)
			player:CastSpell(player, 34093, true)
			player:SetCoinage(100000000)
			player:AddItem(23162, 4)
			player:SendBroadcastMessage("Successfully boosted level")
		end
		if(cmd == "revive")then
			player:ResurrectPlayer(100)
			player:SendBroadcastMessage("Successfully revived self")
		end
		if(cmd == "geartokens")then
			local resid = WorldDBQuery("SELECT entry FROM item_template WHERE RequiredLevel = 80 AND SellPrice = 50000 AND InventoryType = 0 AND ItemLevel = 80 AND Quality = 4 AND class = 15")
			if(resid) then
		        repeat
		            player:AddItem(resid:GetUInt32(0))
		        until not resid:NextRow()
		    end
		    local emblems = {49426, 45624, 40752, 40753, 47241}
		    for i,v in ipairs(emblems) do
		    	player:AddItem(v, 100000)
		    end
		end
		if(cmd == "emblems")then
		    local emblems = {49426, 45624, 40752, 40753, 47241}
		    for i,v in ipairs(emblems) do
		    	player:AddItem(v, 100000)
		    end
		end
		if(string.find(cmd, "spawngear"))then
			local id = tonumber(mysplit(cmd)[2])
			local count = tonumber(mysplit(cmd)[3])
			if(count == nil or count == 0)then
				count = 1
			end
			local item = player:AddItem(id, count)
			if(item:GetClass() == 2 or item:GetClass() == 4 or item:GetClass() == 3 or item:GetClass() == 6)then
				player:SendBroadcastMessage("Successfully spawned "..count.." x "..GetItemLink(id))
			else
				player:RemoveItem(id, count)
			end
		end
	end
end

function isAllowedTransmog(player, item)
	local class = getClassID(player)
	if(class == CLASS_REAPER)then

	end
end

RegisterPlayerEvent(42, onCommand)

function onChat(event, player, msg, Type, lang)
	if(string.lower(msg) == "togglephase")then
			if(player:GetPhaseMask() == PHASE_OVERWORLD)then
				player:SetPhaseMask(PHASE_SHADOWLANDS, true)
			else
				player:SetPhaseMask(PHASE_OVERWORLD, true)
			end
			player:SendBroadcastMessage("Phase set to "..player:GetPhaseMask()..".")
		end
	if(player:IsGM())then
		if(msg == "AUTH_REBOOT")then
			Kick(player)
			--io.open("E:/Dev/woWServer/CoreRPG/script_shutdown.bat")
			os.execute[[E:\Dev\woWServer\CoreRPG\script_shutdown.bat]]
			--os.execute[[E:\Dev\woWServer\CoreRPG\startworld.bat]]
		end
		if(string.lower(msg) == "simserverstart")then
			player:SendBroadcastMessage("Restarting timers.")
			onServerStart(0)
		end
		if(string.lower(msg) == "=gdata")then
			player:SendBroadcastMessage("-------------------------------")
			player:SendBroadcastMessage("Name:  |cFF87CEFA"..(player:GetGuild():GetName()).."")
			player:SendBroadcastMessage("Power: |cFFFFFFFF"..(GetGuildPoints(player:GetGuild():GetId())).."")
			player:SendBroadcastMessage("Words: |cFFFFFFFF"..(player:GetGuild():GetInfo()).."")
			player:SendBroadcastMessage("-------------------------------")
			return false;
		end
		if(string.lower(msg) == "=checkdebt")then
			player:SendBroadcastMessage("Your total debt is: |cFFFFFFFF"..GetDebt(player).." silver coins.")
			return false;
		end
		if(string.lower(msg) == "genroom")then
			generateRoom(player, player:GetX(), player:GetY(), player:GetZ(), -1, 0)
		end
		if(string.lower(msg) == "lowstairs")then
			t = 2
			worldObject = PerformIngameSpawn(t, 201709, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 5, player:GetO(), true)
		end
		if(string.lower(msg) == "lowall")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000063, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 10, player:GetO(), true)
		end
		if(string.lower(msg) == "greek")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000071, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 2, player:GetO(), true)
		end
		if(string.lower(msg) == "greekbig")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000098, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 4, player:GetO(), true)
		end
		if(string.lower(msg) == "greekbiglow")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000098, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 15, player:GetO(), true)
		end
		if(string.lower(msg) == "greeklow")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000071, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 7, player:GetO(), true)
		end
		if(string.lower(msg) == "greeklow1")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000071, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 10, player:GetO(), true)
		end
		if(string.lower(msg) == "houselow")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000045, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 2, player:GetO(), true)
		end
		if(string.lower(msg) == "oldhouse")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000025, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 2, player:GetO(), true)
		end
		if(string.lower(msg) == "oldhouselow")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000025, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 10, player:GetO(), true)
		end
		if(string.lower(msg) == "greekhigh")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000071, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true)
		end
		if(string.lower(msg) == "inviswall")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000085, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 5, player:GetO(), true)
		end
		if(string.lower(msg) == "lowdock")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000079, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 8, player:GetO(), true)
		end
		if(string.lower(msg) == "lowdock1")then
			t = 2
			worldObject = PerformIngameSpawn(t, 1000079, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 18, player:GetO(), true)
		end
		if(string.lower(msg) == "tent")then
			t = 2
			worldObject = PerformIngameSpawn(t, 194839, player:GetMap():GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ() - 0.5, player:GetO(), true)
		end
		if(string.find(msg, "startquest"))then
			local entry = player:GetSelection():GetEntry()
			local quid = mysplit(msg, " ")[2]
			WorldDBQuery("INSERT INTO creature_queststarter VALUES ("..entry..", "..quid..")")
		end
		if(string.find(msg, "addbrokenquest"))then
			local quid = mysplit(msg, " ")[2]
			WorldDBQuery("INSERT INTO broken_quests VALUES ("..quid..")")
		end
		if(string.find(msg, "questaddonupdate"))then
			for i=500100,501000 do
				WorldDBQuery("INSERT INTO quest_template_addon (ID) VALUES ("..i..")")
			end
		end
		if(string.find(msg, "endquest"))then
			local entry = player:GetSelection():GetEntry()
			local quid = mysplit(msg, " ")[2]
			WorldDBQuery("INSERT INTO creature_questender VALUES ("..entry..", "..quid..")")
		end
		if(string.find(msg, "addquest"))then
			local entry = player:GetSelection():GetEntry()
			local quid = mysplit(msg, " ")[2]
			WorldDBQuery("INSERT INTO creature_queststarter VALUES ("..entry..", "..quid..")")
			WorldDBQuery("INSERT INTO creature_questender VALUES ("..entry..", "..quid..")")
		end
		if(string.find(msg, "delquest"))then
			local entry = player:GetSelection():GetEntry()
			local quid = mysplit(msg, " ")[2]
			WorldDBQuery("DELETE FROM creature_queststarter WHERE ID = "..entry.." AND quest = "..quid)
			WorldDBQuery("DELETE FROM creature_questender WHERE ID = "..entry.." AND quest = "..quid)
		end
		if(string.find(msg, "sendvoidmail"))then
			local entry = player:GetSelection():GetAccountId()
			local quid = mysplit(msg, " ")[2]
			sendVoidMail(player:GetSelection(), quid, 1)
		end
		if(string.find(msg, "arq"))then
			local quid1 = mysplit(msg, " ")[2]
			local quid2 = mysplit(msg, " ")[3]
			WorldDBQuery("INSERT INTO quest_template_addon (ID, PrevQuestID) VALUES ("..quid1..", "..quid2..")")
			WorldDBQuery("UPDATE quest_template_addon SET PrevQuestID =  "..quid2.." WHERE ID = "..quid1)
			player:SendBroadcastMessage("Quest requirement added/updated.")
		end
		if(string.find(msg, "equipunit"))then
			local entry = player:GetSelection():GetEntry()
			local item1 = mysplit(msg, " ")[2];
			local item2 = mysplit(msg, " ")[3];
			local item3 = mysplit(msg, " ")[4];
			WorldDBQuery("INSERT INTO creature_equip_template VALUES ("..entry..", 1, "..item1..", "..item2..", "..item3..", 0)")
			player:SendBroadcastMessage("Unit equipped with "..item1..", "..item2..", "..item3.."")
		end
		if(string.find(msg, "addpath"))then
			local set = mysplit(msg, " ")[2];
			x, y, z, o = player:GetLocation()
			local id = 0
			id = (getFinishPointForSet(set) + 1)
			WorldDBQuery("INSERT INTO custom_paths VALUES ("..set..", "..id..", "..x..", "..y..", "..z..")")
			player:SendBroadcastMessage("Path point added.")
		end
		if(string.find(msg, "ael"))then
			x, y, z, o = player:GetLocation()
			WorldDBQuery("INSERT INTO world_event_locations (X, Y, Z, mapID) VALUES ("..x..", "..y..", "..z..", "..(player:GetMapId())..")")
			player:SendBroadcastMessage("Event location added.")
		end
		if(string.find(msg, "uel"))then
			x, y, z, o = player:GetLocation()
			local set = mysplit(msg, " ")[2];
			WorldDBQuery("UPDATE world_event_locations SET X = "..x.." WHERE ID = "..set.."")
			WorldDBQuery("UPDATE world_event_locations SET Y = "..y.." WHERE ID = "..set.."")
			WorldDBQuery("UPDATE world_event_locations SET Z = "..z.." WHERE ID = "..set.."")
			WorldDBQuery("UPDATE world_event_locations SET mapID = "..player:GetMapId().." WHERE ID = "..set.."")
			player:SendBroadcastMessage("Event location added.")
		end
		if(string.find(msg, "addloot"))then
			local entry = player:GetSelection():GetEntry()
			local name = player:GetSelection():GetName()
			local item = mysplit(msg, " ")[2]
			local chance = mysplit(msg, " ")[3]
			local max = mysplit(msg, " ")[4]
			WorldDBQuery("INSERT INTO creature_loot_template VALUES ("..entry..", "..item..", 0, "..chance..", 0, 1, 0, 1, "..max..", 'auto')")
			--WorldDBQuery("UPDATE creature_template SET lootid = "..entry.." where entry = "entry"")
			player:SendBroadcastMessage("Loot added to "..name..": "..item.." @ "..chance.."%, 1 - "..max..".")
		end
		if(msg == "clear")then
			player:RemoveAllAuras()
		end
		player:Say(msg, 0)
		return false;
	end
end

function On_Level(event, player, old)
	--[[local guid = player:GetGUIDLow();
	WorldDBQuery("INSERT INTO player_stats VALUES ("..guid..", 0, 0, 0, 0, 0, 0, 0)")
	local oldunused = getLeft(guid)
	WorldDBQuery("UPDATE player_stats SET unused = "..(oldunused + 5).." WHERE GUID = "..(player:GetGUIDLow()))]]
	local training = player:AddAura(500314, player)
	training:SetStackAmount(player:GetLevel())
	local classid = getClassID(player)
	initClass(player, classid)
	if(classid == CLASS_NECROMANCER or classid == CLASS_CULTIST or classid == CLASS_WITCHHUNTER or classid == CLASS_TINKER or classid == CLASS_PYROMANCER or getArchetype(player) == 8)then
		player:AddAura(800695, player)
	end
	local spells = getSpellsForClass(classid)
	local archetype = getArchetype(player)
	if(archetype == 4 or archetype == 1)then
		player:LearnSpell(3124)
	end
	for i=1,player:GetLevel() do
		local level_list = spells[i]
		if(level_list ~= nil)then
			for i,v in ipairs(level_list) do
				if(v < 0)then
					player:RemoveSpell(math.abs(v))
				else
					player:LearnSpell(v)
				end
			end
		end
	end
	if(player:GetLevel() % 10 == 0)then
		local class = getClassID(player)
        local list = getTalentList(player)
        local name = (getNameForClass(class))
        AIO.Handle(player, "AIOExample", "ShowFrame", class, list, name)
        player:SendBroadcastMessage("You have traits to allocate.\nYou can access this menu at any time by using the spell in your spellbook.")
        player:SendBroadcastMessage("You gain 5 x "..GetItemLink(900004))
        player:AddItem(900004, 5)
	end
	player:ModifyHonorPoints(-9999999)
end

function isWithinRange(base, comparator, range)
	local ret = false;
	for i=(base-range),(base+range) do
		if(comparator == i)then
			ret = true;
		end
	end
	return ret;
end

function onGetXP(event, player, amount, victim)
	local addition = 0
	local nearMembers = 0
	if(player:IsInGroup())then
		for i,v in ipairs(player:GetGroup():GetMembers()) do
			if(v:GetDistance(player) <= 60 and isWithinRange(player:GetLevel(), v:GetLevel(), 5))then
				nearMembers = nearMembers + 1
			end
		end
		addition = (amount / 10 * nearMembers)
	end
	local mult = 0;
	if(victim ~= nil)then
		mult = 1
	end
	local basemult = 1
	if(player:GetMap():IsDungeon())then
		basemult = basemult * 2;
	end
	if(player:GetLevel() <= 80)then
		basemult = basemult * 2
	end
	return amount * basemult + (amount * nearMembers * 0.9 * mult) + addition
end

function addGroupMember(event, group, guid)
	for i,v in ipairs(group:GetMembers()) do
		v:RemoveAura(500278)
		local buff = v:AddAura(500278, v)
		buff:SetStackAmount(group:GetMembersCount())
	end
end

function removeGroupMember(event, group, guid, method, kicker, reason)
	GetPlayerByGUID(guid):RemoveAura(500278)
end

function changeZone(event, player, newZone, newArea)
	player:RemoveSpell(668)
	player:RemoveSpell(669)
	player:LearnSpell(668)
	player:LearnSpell(700000)
	player:CastSpell(player, 700000, true)
	player:LearnSpell(800040)

	--[[if(player:GetMapId() == 571)then
		if(player:IsAlliance())then
			player:Teleport(0, -9005.2, 874.36, 148.62, 3.62)
		else
			player:Teleport(1, 1778.133, -4311.985, 6.19, 2.36)
		end
		player:CastSpell(player, 32752, true)
		player:CastSpell(player, 73078, true)
		player:SendBroadcastMessage("Uh oh! Looks like you got lost somewhere you shouldn't have been.")
	end]]

	--[[local banned_maps = {649, 650, 632, 658, 668, 724, 631, 672, 673, 718}

	local map = player:GetMapId()
	for i,v in ipairs(banned_maps) do
		if(map == v and player:IsGM() == false)then
			player:Teleport(571, 5800, 630, 647.43, 1.6)
			player:CastSpell(player, 32752, true)
			player:CastSpell(player, 73078, true)
			player:SendBroadcastMessage("This instance has not opened yet.")
		end
	end]]--
	if(player:HasAura(801025))then
		if(player:GetMap():IsDungeon())then
			local units = player:GetUnfriendlyUnitsInRange(533)
			for i,v in ipairs(units) do
				if(v:HasAura(801024) == false)then
					--updateMobLevel(v, MAX_LEVEL)
				end
			end
		end
	end
	player:RemoveAura(800947)
	local map = player:GetMapId()

	if(map == 37)then
		player:SetPvP(true)
		player:SetPvPDeath(true)
		craterSpellUpdate(player)
	end
	if(MAX_LEVEL == 60)then
		if(player:GetZoneId() == 3483 or player:GetZoneId() == 3521 or player:GetZoneId() == 3523 or player:GetZoneId() == 3522 or player:GetZoneId() == 3518)then
			player:Teleport(0, -11877.7, -3204.5, -18.502, 0.23)
		end
	end
	if(map == 571 and MAX_LEVEL ~= 80)then
		if(player:IsAlliance())then
			player:Teleport(0, -8833.38, 628.63, 94.007, 1.065)
		else
			player:Teleport(1, 1629.36, -4373.4, 31.26, 3.55)
		end
	end
	if(map == 109 and player:GetLevel() >= 60)then
		if(player:HasAura(800660) == false)then
			player:SendBroadcastMessage("|cFFFFFFFFYou feel a dark presence wash over you. Something is amiss here, and it won't be easy to make it right again.")
			player:SendAreaTriggerMessage("|cFFFFFFFFYou feel a dark presence wash over you. Something is amiss here, and it won't be easy to make it right again.")
			player:SendBroadcastMessage("Welcome to the level "..MAX_LEVEL.." heroic Sunken Temple scenario - The Saronite Cavern. You can earn "..GetItemLink(900031).." and "..GetItemLink(900004).." here.")
			player:AddAura(800660, player)
			player:CastSpell(player, 47292, true)
		end
	else
		player:RemoveAura(800660)
	end
end

local BOSS_EVENT_MINS = 120
local WORLD_EVENT_MINS = 60

function onServerStart(event)
	CreateLuaEvent(worldBossTimer, (60 * 1000) * WORLD_EVENT_MINS, 0)
	CreateLuaEvent(worldBossTimer, 10000, 1)
end

RegisterServerEvent(14, onServerStart)

RegisterPlayerEvent(27, changeZone)

RegisterGroupEvent(1, addGroupMember)
RegisterGroupEvent(3, removeGroupMember)

RegisterPlayerEvent(13, On_Level)

RegisterPlayerEvent(28, enterMap)
RegisterPlayerEvent(5, onCast)
RegisterPlayerEvent(3, On_Login)
RegisterPlayerEvent(29, equip)
RegisterPlayerEvent(18, onChat)
RegisterPlayerEvent(12, onGetXP)

function player_interrupt1(event, delay, pCall, creature)
	--creature:CastSpell(creature, 54350, false)
	creature:CastSpell(creature, 73213, false)
end

function onUsed(event, player, item, target)
	if(player:HasItem(item:GetEntry(), 1))then
		if(item:GetEntry() == 100169)then
			player:KilledMonsterCredit(500872)
		end
		local spell = 0
		local spell_q = (WorldDBQuery("SELECT spellid_1 FROM item_template WHERE entry = "..(item:GetEntry()))):GetUInt32(0)
		if(spell_q ~= nil)then
			spell = spell_q
		end
		if(spell > 0)then
			local guid = player:GetGUIDLow()
			local item_name = (WorldDBQuery("SELECT name FROM item_template WHERE entry = "..(item:GetEntry()))):GetString(0)
			local sn = mysplit(item_name, ":")[2]
			sn = sn:gsub("'", "")
			WorldDBQuery("INSERT INTO `learned_spells` (`GUID`, `spell`, `flag`) VALUES ('" .. guid .. "', " .. spell .. ", 1)")
			WorldDBQuery("INSERT INTO `spellbook_ref` (`spell`, `name`, `desc`) VALUES (" .. spell .. ", '" .. sn .. "', '0')")
			player:SendAreaTriggerMessage("New spell added to collection!")
			player:SendBroadcastMessage("Visit a Personal Library to change your loadout.")
			player:RemoveItem(item, 1)
			--local tele = CreateTelegraphAtCaster(player, 62848, 62579, 800)
			--tele:SetFaction(7)
			player:CastSpell(player, 47292, true)
		else
			player:SendBroadcastMessage("Invalid spell. Report to developer.")
		end
		player:RegisterEvent(player_interrupt1, 100, 1)
		--player:LearnSpell(spell)
	end
end
function worldBossTimer(i, ii, iii, iv)
	local rand = 1
	local worldEventID = 0
	local X, Y, Z, MAPID = -412.772, -182.255, 300.417, 37

	local SPAWN_TYPE = 1
	local random_boss_movement = 15

	local bosses = {50265, 50336, 50337}
	local boss_count = 3
	worldEventID = bosses[math.random(boss_count)]

	if(worldEventID > 0)then
		--execute event
		trigger = PerformIngameSpawn(1, 501086, MAPID, 0, X, Y, Z, 0, false)
		local boss = trigger:SpawnCreature(worldEventID, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
		boss:MoveRandom(random_boss_movement)
		sendWorldMessage(boss:GetName().." has spawned in Azshara Crater!", 1)
		WORLD_EVENT_OVERRIDE = -1;
		trigger:DespawnOrUnsummon()
	end
end

function worldEventTimer(i, ii, iii, iv)
	local rand = 1
	local worldEventID = 0
	local X, Y, Z, MAPID = 0.0, 0.0, 0.0, 0
	local location_name = "UNKNOWN_LOCATION"
	local locationChosen = false

	local SPAWN_TYPE = 1
	local var = 36
	local random_movement = 15
	local random_boss_movement = 8

	local location = 0

	local EVENT_ORC = 1
	local EVENT_STYGIAN = 2
	local EVENT_UNDEAD = 3
	local EVENT_GOBLIN = 4
	local EVENT_DRAGON = 5
	local EVENT_WOLF = 6
	local EVENT_STAG = 7
	local EVENT_SPIRITS = 8
	local EVENT_GROWTH = 9
	local EVENT_BANDITS = 10
	local EVENT_WORMS = 11
	local EVENT_PICT = 12
	local EVENT_WISDOM = 13
	local EVENT_GIANT = 14
	local EVENT_DISEASE = 15
	local EVENT_TREASURE = 16
	local EVENT_STARS = 17
	local EVENT_DEMON = 18
	local EVENT_FIRE = 19
	local EVENT_EARTHQUAKE = 20
	local EVENT_BEARS = 21
	local EVENT_TRADER = 22
	local EVENT_TEACHER = 23
	local EVENT_STYGIANLORD = 24
	local EVENT_SKRETHI = 25
	local EVENT_BRAINCLEAVE = 26
	local EVENT_NIGHTMARE = 27
	local EVENT_JHARNOS = 28
	local EVENT_INCINEROTH = 29
	local EVENT_BELTHORN = 30
	local EVENT_STONERAGE = 31
	local EVENT_VENOMQUEEN = 32
	local EVENT_YALAGYR = 33
	local EVENT_TORNADO = 34
	local EVENT_SPELL = 35


	local location_list = {}

	if(rand == 1)then
		--event should occur; select an event
		worldEventID = math.random(45)
		if(WORLD_EVENT_OVERRIDE > -1)then
			worldEventID = WORLD_EVENT_OVERRIDE
		end
		if(worldEventID >= EVENT_SPELL and worldEventID <= (EVENT_SPELL + 10))then
			worldEventID = EVENT_SPELL
		end

		if(worldEventID == EVENT_ORC)then
			location_list = {1, 2, 4, 6, 7, 9, 11, 12, 14, 16, 17, 18}
		end
		if(worldEventID == EVENT_GOBLIN or worldEventID == EVENT_BANDITS)then
			location_list = {1, 2, 4, 6, 7, 9, 11, 12, 14, 16, 17, 18}
		end
		if(worldEventID == EVENT_EARTHQUAKE or worldEventID == EVENT_STARS or worldEventID == EVENT_TREASURE or worldEventID == EVENT_DISEASE or worldEventID == EVENT_TRADER or worldEventID == EVENT_TEACHER or worldEventID == EVENT_GROWTH 
			or worldEventID == EVENT_UNDEAD or worldEventID == EVENT_FIRE or worldEventID == EVENT_DRAGON or worldEventID == EVENT_GIANT or worldEventID == EVENT_BRAINCLEAVE or worldEventID == EVENT_GIANT or worldEventID == EVENT_NIGHTMARE or worldEventID == EVENT_JHARNOS
			 or worldEventID == EVENT_INCINEROTH or worldEventID == EVENT_BELTHORN or worldEventID == EVENT_STONERAGE or worldEventID == EVENT_VENOMQUEEN or worldEventID == EVENT_YALAGYR or worldEventID == EVENT_TORNADO or worldEventID == EVENT_SPELL)then
			location = math.random(61)
		end
		if(worldEventID == EVENT_WOLF or worldEventID == EVENT_BEARS or worldEventID == EVENT_STAG)then
			lcoation_list = {1, 2, 4, 5, 6, 7, 9, 11, 12, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 31, 34, 35, 38, 39, 40, 41, 42}
		end
		if(worldEventID == EVENT_STYGIAN)then
			location_list = {43, 44, 45, 46, 47, 48}
		end
		if(worldEventID == EVENT_STYGIANLORD or worldEventID == EVENT_WORMS)then
			location_list = {49, 50, 51, 46, 47, 48}
		end
		if(worldEventID == EVENT_SPIRITS)then
			location_list = {13, 3}
		end
		if(worldEventID == EVENT_SKRETHI)then
			location_list = {45, 60}
		end
		if(worldEventID == EVENT_WISDOM)then
			location_list = {4, 29, 33, 39, 31, 30, 24, 23, 7, 2}
		end
		if(worldEventID == EVENT_PICT)then
			location_list = {22, 23, 24, 25, 26, 27, 28, 29, 31, 34, 35, 38, 39, 40, 41, 42}
		end
	end

	if(worldEventID > 0)then
		--select location
		if(location == 0)then
			location = location_list[math.random(tablelength(location_list))]
		end
		location_name = "|cFF87CEFA"..WorldDBQuery("SELECT name FROM world_event_locations WHERE ID = "..location..""):GetString(0).."|cFFFFFFFF"
		X = WorldDBQuery("SELECT X FROM world_event_locations WHERE ID = "..location..""):GetFloat(0)
		Y = WorldDBQuery("SELECT Y FROM world_event_locations WHERE ID = "..location..""):GetFloat(0)
		Z = WorldDBQuery("SELECT Z FROM world_event_locations WHERE ID = "..location..""):GetFloat(0)
		MAPID = WorldDBQuery("SELECT mapID FROM world_event_locations WHERE ID = "..location..""):GetUInt32(0)
		locationChosen = true
	end
	if(IS_ALPHA_DOWNTIME)then
		X = -1998.464
		y = 6199.36
		z = 79.88
		MAPID = 530
		location_name = "|cFF87CEFAUpper Windyreed Village|cFFFFFFFF"
	end

	if(worldEventID > 0)then
		--execute event
		trigger = PerformIngameSpawn(1, 501086, MAPID, 0, X, Y, Z, 0, false)

		if(worldEventID == 1)then --orc raid
			sendWorldMessage("An orcish warband been spotted in "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					local npc = trigger:SpawnCreature(501088, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				else
					local npc = trigger:SpawnCreature(501087, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				end
			end
			local boss = trigger:SpawnCreature(501089, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			boss:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 2)then --stygian raid
			sendWorldMessage("A stygian raiding party has attacked "..location_name.."! Fight them off!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					local npc = trigger:SpawnCreature(500426, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				else
					local npc = trigger:SpawnCreature(500424, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				end
			end
			local boss = trigger:SpawnCreature(501090, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			boss:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 3)then --undead raid
			sendWorldMessage("A dark force has released undead upon "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					local npc = trigger:SpawnCreature(501092, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				else
					local npc = trigger:SpawnCreature(501093, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				end
			end
			local boss = trigger:SpawnCreature(501091, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			boss:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 4)then --goblin
			sendWorldMessage("A pack of goblins are causing mischief in "..location_name.."! ", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					local npc = trigger:SpawnCreature(500067, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				else
					local npc = trigger:SpawnCreature(500065, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				end
			end
			local boss = trigger:SpawnCreature(500068, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			boss:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 5)then --dragon
			sendWorldMessage("A fiery dragon has descended upon "..location_name.."! It must be slain!", 2)
			local boss = trigger:SpawnCreature(500081, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			boss:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 6)then --wolf pack
			sendWorldMessage("A pack of hungry wolves are roaming in "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				local npc = trigger:SpawnCreature(500014, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				npc:MoveRandom(random_movement)
			end
		end

		if(worldEventID == 7)then --stag herd
			sendWorldMessage("A herd of wild stags have been spotted in "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				local npc = trigger:SpawnCreature(500011, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				npc:MoveRandom(random_movement)
			end
		end

		if(worldEventID == 8)then --spirits
			sendWorldMessage("Some evil spirits have awoken in "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				local npc = trigger:SpawnCreature(500833, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				npc:MoveRandom(random_movement)
			end
		end

		if(worldEventID == 9)then --growth
			sendWorldMessage("A powerful magic has caused unnatural plant growth in "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					trigger:SpawnCreature(500814, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				else
					trigger:SpawnCreature(500083, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				end
				if(math.random(2) == 1)then
					trigger:SpawnCreature(500082, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				end
				if(math.random(2) == 1)then
					trigger:SpawnCreature(500084, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				end
			end
		end

		if(worldEventID == 10)then --bandits
			sendWorldMessage("A group of bandits are ransacking "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					local npc = trigger:SpawnCreature(500109, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				else
					local npc = trigger:SpawnCreature(500110, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				end
			end
		end

		if(worldEventID == 11)then --worm
			sendWorldMessage("Sandworms have appeared in "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				local npc = trigger:SpawnCreature(500457, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				npc:MoveRandom(random_movement)
			end
			trigger:SpawnCreature(500476, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
		end

		if(worldEventID == 12)then --pict
			sendWorldMessage("A pictish raiding party has arrived in "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					local npc = trigger:SpawnCreature(100440, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				else
					local npc = trigger:SpawnCreature(100456, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				end
			end
			local npc = trigger:SpawnCreature(100448, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 13)then --wisdom spill
			sendWorldMessage("A mana spill has occured at "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					trigger:SpawnCreature(501037, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				else
					trigger:SpawnCreature(501029, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				end
			end
			trigger:SpawnCreature(501038, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
		end

		if(worldEventID == 14)then --giant
			sendWorldMessage("A wayward giant has been spotted at "..location_name.."!", 2)
			local boss = trigger:SpawnCreature(500076, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			boss:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 15)then --disease
			sendWorldMessage("Disease has broken loose at "..location_name.."! Take care when in the area.", 2)
			local near = trigger:GetNearObjects(40)
			for i,v in ipairs(near) do
				diseasePlayer(v, 18633)
			end
		end

		if(worldEventID == 16)then --treasure
			sendWorldMessage("Treasure has been dropped at "..location_name.."! Be first to claim it!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					PerformIngameSpawn(2, 1000050, trigger:GetMapId(), 0, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z - (math.random(5)-1), (math.random(360) / 200), false, 900000)
				else
					PerformIngameSpawn(2, 1000049, trigger:GetMapId(), 0, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z - (math.random(5)-1), (math.random(360) / 200), false, 900000)
				end
			end
		end

		if(worldEventID == 17)then --stars
			sendWorldMessage("Some stars have fallen at "..location_name.."! Be first to claim them!", 2)
			for i=1,5+math.random(4) do
				trigger:SpawnCreature(500925, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
			end
		end

		if(worldEventID == 18)then --demon
			sendWorldMessage("The horrible demon Baloroc has emerged at "..location_name.."! Band together to slay it!", 2)
			local npc = trigger:SpawnCreature(500775, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 19)then --fire
			sendWorldMessage("A fire has broken loose at "..location_name.."!", 2)

		end

		if(worldEventID == 20)then --earthquake
			local nearPlayers = GetPlayersInMap(trigger:GetMapId(), 0, 2)
			for i,v in ipairs(nearPlayers) do
				v:CastSpell(v, 36455, true)
			end
			var = 40
			sendWorldMessage("An earthquake has occured at "..location_name.."! Ore and stone has breached the surface!", 2)
			for i=1,8+math.random(6) do
				PerformIngameSpawn(2, 1000133, trigger:GetMapId(), 0, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z - (math.random(10)-1), (math.random(360) / 200), false, 900000)
			end
			for i=1,5+math.random(4) do
				trigger:SpawnCreature(500174, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
			end
		end

		if(worldEventID == 21)then --bears
			var = 15
			sendWorldMessage("A group of bears have appeared at "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				local npc = trigger:SpawnCreature(500051, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
				npc:MoveRandom(random_boss_movement)
			end
		end

		if(worldEventID == 22)then --trader
			sendWorldMessage("A travelling merchant has arrived near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501096, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 23)then --teacher
			sendWorldMessage("An old hermit has arrived near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501095, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 24)then --stg
			sendWorldMessage("A stygian merchant has arrived near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501094, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 25)then --skrethi
			sendWorldMessage("A Skrethi swarm has descended upon "..location_name.."!", 2)
			for i=1,5+math.random(4) do
				if(math.random(4) == 1)then
					local npc = trigger:SpawnCreature(501092, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				else
					local npc = trigger:SpawnCreature(501093, X + (math.random(var) - math.random(var)), Y + (math.random(var) - math.random(var)), Z + (math.random(3)-1), (math.random(360) / 200), SPAWN_TYPE, 900000)
					npc:MoveRandom(random_movement)
				end
			end
			local boss = trigger:SpawnCreature(501091, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			boss:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 26)then --braincleave
			sendWorldMessage("Braincleave, a foul undead abomination, has been spotted near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501100, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 27)then --nightmare
			sendWorldMessage("Nightmare, the demonic steed, is on a rampage near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501101, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 28)then --jharnos
			sendWorldMessage("Jharnos, comitter of high treason, is roaming near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501102, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 29)then --incineroth
			sendWorldMessage("The cursed dragon Incineroth has descended upon "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501103, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 30)then --belthorn
			sendWorldMessage("The twisted ent Belthorn has been emerged near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501104, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 31)then --stonerage
			sendWorldMessage("The furious Earth elemental Stonerage has erupted near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501105, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 32)then --venomqueen
			sendWorldMessage("The Venomqueen has been spotted lurking in "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501106, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 33)then --yalagyr
			sendWorldMessage("The fabled Great Wolf Yalagyr is roaming around "..location_name.."! Claim his hide!", 2)
			local npc = trigger:SpawnCreature(501107, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 34)then --tornado
			sendWorldMessage("An enormous tornado has formed near "..location_name.."!", 2)
			local npc = trigger:SpawnCreature(501160, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 300000)
			npc:MoveRandom(random_boss_movement)
		end

		if(worldEventID == 35)then --spellbook
			sendWorldMessage("A mysterious spellbook has been spotted near "..location_name.."... What could it be?", 2)
			local npc = trigger:SpawnCreature(501141, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
			local npc1 = trigger:SpawnCreature(500175, X, Y, Z, (math.random(360) / 200), SPAWN_TYPE, 900000)
		end

		WORLD_EVENT_OVERRIDE = -1;
		trigger:DespawnOrUnsummon()
	end
end

function sendWorldMessage(message, type)
	local icon = "Icons/achievement_bg_takexflags_ab"
	local size = 25
	local color = "|cFFFFFFFF"
	worldPlayers = GetPlayersInWorld(2)
	for i,v in ipairs(worldPlayers) do
		if(type >= 1)then
			v:SendBroadcastMessage(color .. generateIcon(icon, size).." "..message.." "..generateIcon(icon, size))
		end
		if(type >= 2)then
			v:SendAreaTriggerMessage(color .. generateIcon(icon, size).." "..message.." "..generateIcon(icon, size))
			v:PlayDirectSound(5775, v)
		end
	end
end

function sendStandardWorldMessage(message, type)
	worldPlayers = GetPlayersInWorld(2)
	for i,v in ipairs(worldPlayers) do
		if(type >= 1)then
			v:SendBroadcastMessage(message)
		end
		if(type >= 2)then
			v:SendAreaTriggerMessage(message)
		end
	end
end

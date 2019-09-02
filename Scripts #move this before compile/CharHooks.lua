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
CLASS_PROPHET = 14;
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
CLASS_HELLION = 27;
CLASS_STARLORD = 28;
CLASS_LION = 29;
CLASS_VALKYRIE = 30;
CLASS_SPARTAN = 31;

CONQUEST_VERSION = 1;

HOME = true;

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

function getNameForClass(class)
	if(class == CLASS_TIDECALLER)then
		return "Tidecaller";
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
	if(class == CLASS_SPIRITMAGE)then
		return "Spirit Mage";
	end
	if(class == CLASS_STORMBRINGER)then
		return "Stormbringer";
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
		return "Rhonin";
	end
	if(class == CLASS_DRAGONKNIGHT)then
		return "Barbarian";
	end
	if(class == CLASS_BARD)then
		return "Brewmaster";
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
	if(class == CLASS_HELLION)then
		return "Hellion";
	end
	if(class == CLASS_LION)then
		return "White Lion";
	end
	if(class == CLASS_SPARTAN)then
		return "Spartan";
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
	for i=700001,700050 do
		if(player:HasItem(i))then
			return i - 700000;
		end
	end
	return 0;
end

function getSpellsForClass(class)
	local levels = {}
	if(class == CLASS_WITCHHUNTER)then
		levels[1] = {9077, 196, 198, 201, 674,
		500082, 500085, 800665}
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
	if(class == CLASS_HELLION)then
		levels[1] = {9077, 196, 198, 201, 674,
		800453, 800235}
		levels[2] = {800455}
		levels[4] = {800456}
		levels[6] = {800461}
		levels[8] = {800459}
		levels[10] = {800460}
	end
	if(class == CLASS_STARLORD)then
		levels[1] = {9077, 196, 198, 201, 674,
		800496, 800498, 800495}
		levels[2] = {800505}
		levels[4] = {800506}
		levels[6] = {800499}
		levels[8] = {800508}
		levels[10] = {800511}
		levels[12] = {800504}
		levels[14] = {800502}
		levels[16] = {800501}
		levels[18] = {800503}
		levels[20] = {800500}
		levels[22] = {800497}
		levels[24] = {800510}
	end
	if(class == CLASS_RANGER)then
		levels[1] = {9077, 196, 198, 201, 674, 1180,
		500074, 800083, 800267, 75, 1494, 800351}
		levels[2] = {500073}
		levels[3] = {800266}
		levels[4] = {500071}
		levels[5] = {800268}
		levels[6] = {800091}
		levels[7] = {800089}
		levels[8] = {500076}
		levels[9] = {800260}
		levels[10] = {800264}
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
		levels[68] = {500676}
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
		levels[18] = {800782}
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
	end
	if(class == CLASS_RIFTBLADE)then
		levels[1] = {9077, 1180, 674, 1180,
		500267, 500251}
		levels[2] = {500271}
		levels[3] = {500250}
		levels[4] = {500252}
		levels[6] = {500282}
		levels[8] = {500288}
		levels[10] = {500274}
		levels[12] = {500287}
		levels[14] = {500279, 500280}
		levels[16] = {500281}
		levels[18] = {500283}
		levels[20] = {500270}
		levels[22] = {500253}
		levels[24] = {500671}
		levels[26] = {500286}
		levels[28] = {500284}
		levels[30] = {500285}
		levels[32] = {800120}
		levels[34] = {800104}
	end
	if(class == CLASS_TEMPLAR)then
		levels[1] = {9077, 1180, 674, 1180,
		500267, 500250}
		levels[2] = {500251, 500271}
		levels[4] = {500252}
		levels[6] = {500282}
		levels[8] = {500288}
		levels[10] = {500274}
		levels[12] = {500287}
		levels[14] = {500279, 500280}
		levels[16] = {500281}
		levels[18] = {500283}
		levels[20] = {500270}
		levels[22] = {500253}
		levels[24] = {500671}
		levels[26] = {500286}
		levels[28] = {500284}
		levels[30] = {500285}
		levels[32] = {800120}
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
		500904, 500020, 800606}
		levels[2] = {500021, 500313}
		levels[4] = {500909}
		levels[6] = {500024}
		levels[8] = {500023}
		levels[10] = {800168}
		levels[12] = {500025}
		levels[14] = {500907}
		levels[16] = {500910}
		levels[18] = {800340}
		levels[20] = {800169}
		levels[40] = {750}
	end
	if(class == CLASS_STORMBRINGER)then
		levels[1] = {9078, 227, 197, 199, 202,
		500040, 500929, 500933}
		levels[2] = {500038}
		levels[4] = {500922}
		levels[6] = {500042}
		levels[8] = {500041}
		levels[10] = {500926}
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
		levels[1] = {9077, 196, 198, 201, 674, 1180,
		500028, 800222}
		levels[2] = {500037}
		levels[3] = {800212}
		levels[4] = {800205}
		levels[6] = {800210}
		levels[8] = {500032}
		levels[10] = {800218}
		levels[12] = {800220}
		levels[14] = {800207}
		levels[16] = {800203}
		levels[18] = {800214}
		levels[20] = {800204}
		levels[22] = {800206}
		levels[24] = {800209}
		levels[26] = {800211}
		levels[28] = {500030}
		levels[30] = {500029}
		levels[32] = {800215}
		levels[34] = {800353}
		levels[36] = {800356}
	end
	if(class == CLASS_DRAGONKNIGHT)then
		levels[1] = {8737, 197, 199, 202, 674, 200,
		500913, 800401}
		levels[2] = {500915}
		levels[4] = {500919}
		levels[5] = {800193}
		levels[6] = {500000}
		levels[8] = {500001}
		levels[10] = {500916}
		levels[12] = {500002}
		levels[14] = {500920}
		levels[16] = {500921}
		levels[18] = {500918}
		levels[20] = {500009}
		levels[40] = {750}
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
		levels[1] = {9078, 51885, 674, 227, 196, 197, 198, 199, 201, 202, 200, 1180,
		500035, 500681, 500685}
		levels[2] = {500680}
		levels[3] = {800518}
		levels[4] = {500678}
		levels[6] = {500034}
		levels[8] = {800521}
		levels[10] = {800760, 800761, 800762}
		levels[12] = {800424}
		levels[14] = {800520}
		levels[16] = {800425}
		levels[18] = {500033}
		levels[20] = {800522}
		levels[22] = {500682}
		levels[24] = {500679}
		levels[26] = {800519}
		levels[28] = {800766}
		levels[40] = {8737}
	end
	if(class == CLASS_TINKER)then
		levels[1] = {9077, 227, 266, 198, 199, 1180,
		500234, 500237}
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
	end
	if(class == CLASS_GUARDIAN)then
		levels[1] = {8737, 9116, 227, 196, 198, 201,
		500155, 500168, 800320, 800319}
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
	end
	if(class == CLASS_CULTIST)then
		levels[1] = {8737, 9116, 9078, 51885, 674, 227, 196, 197, 198, 199, 201, 202, 200, 1180,
		500720, 500711, 500708, 500727}
		levels[2] = {500715, 800194}
		levels[4] = {500705}
		levels[6] = {500707}
		levels[8] = {500112}
		levels[10] = {500110, 800402}
		levels[12] = {500704}
		levels[14] = {500712}
		levels[16] = {500718}
		levels[20] = {500719}
		levels[22] = {500722}
		levels[24] = {500716}
		levels[26] = {500724}
		levels[28] = {500714}
		levels[30] = {500709}
		levels[32] = {500721}
		levels[34] = {500723}
		levels[36] = {500710}
		levels[38] = {800354}
		levels[40] = {500732}
		levels[42] = {800367}
		levels[44] = {800368}
		levels[46] = {800369}
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
		500357, 500366, 500362, 800338, (-9077), (-750)}
		levels[2] = {500359}
		levels[4] = {500365}
		levels[6] = {500358, 800198}
		levels[8] = {500361}
		levels[10] = {500370, 500368}
		levels[12] = {500376}
		levels[14] = {500373}
		levels[16] = {500355}
		levels[18] = {500356}
		levels[20] = {500360}
		levels[22] = {500367}
		levels[24] = {500372}
		levels[26] = {500371}
		levels[28] = {500377}
		levels[30] = {500369, 8737}
		levels[40] = {500687}
	end
	return levels;
end

function getInfoForClass(class)
	if(class == CLASS_DRAGONKNIGHT)then
		return {"Icons/inv_misc_head_vrykul", 
		"The Barbarian is a brutish warrior that uses sheer strength to destroy their enemies. Masters of melee AoE and high impact combat. Good burst capabilities. Fairly simple class with the ability to be skillfully maximized for optimal damage.", 1}
	end
	if(class == CLASS_WITCHDOCTOR)then
		return {"Icons/spell_nature_poisoncleansingtotem", 
		"The Witch Doctor is a support role that uses voodoo hexxes to weaken enemies and a combination of nature magic and wards to heal and empower allies. Good damage output and utility with reasonable healing.", 5}
	end
	if(class == CLASS_SPIRITMAGE)then
		return {"Icons/spell_holy_prayerofspirit", 
		"The Spirit Mage is a powerful wielder of Arcane magic that is very difficult to master. Spirit Mages have reduced health and damage is dealt to their mana pool. Their kit involves runic magic, trickery, conjuring, randomness, and excellent crowd control.", 8}
	end
	if(class == CLASS_STORMBRINGER)then
		return {"Icons/spell_shaman_thunderstorm", 
		"The Stormbringer commands the very lightning itself, striking down foes with the power of Thorim. A simple and easy to play ranged Nature damage class using a 'Static' resource system in combination with mana.", 8}
	end
	if(class == CLASS_DEMONHUNTER)then
		return {"Icons/achievement_boss_illidan", 
		"The Demon Hunter is a mobile melee class using the power of the Legion to strike down foes. They build Rage in combat, and upon reaching capacity, will transform into a demon for a short time. A fairly easy to play melee damage class.", 4}
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
		"The Pyromancer is a damage class based around managing an effect called Incineration. A unique caster that is easy to grasp and difficult to master. Decent area of effect, high sustain damage.", 8}
	end
	if(class == CLASS_DJINN)then
		return {"Icons/inv_elemental_mote_air01", 
		".", 2}
	end
	if(class == CLASS_SUNDANCER)then
		return {"Icons/spell_holy_searinglightpriest", 
		"The Sun Cleric is a powerful support class that manages an additional resource called Solar Power to empower themselves and their abilities. Through proper management the Sun Cleric can snowball quickly into an efficient Holy healer and side damage dealer. Uses Anubisath magic and the power of the sun.", 5}
	end
	if(class == CLASS_TINKER)then
		return {"Icons/inv_misc_gear_01", 
		"The Tinker uses a unique Ammunition system paired with powerful, explosive weaponry and handy gadgets to take down foes. Additionally, Tinkers can construct different mechanical allies to perform different tasks. An interesting and flexible ranged damage dealer class.", 4}
	end
	if(class == CLASS_LION)then
		return {"Icons/inv_throwingknife_07", 
		"The Lion is an agile, Intellect-using ranged class that uses a deadly arsenal of Shurikens, Arcane magic, and the aid of the ancient lion spirit Ra'gar, as a companion, to destroy foes and heal allies. ", 4}
	end
	if(class == CLASS_GUARDIAN)then
		return {"Icons/ability_warrior_shieldreflection", 
		"The Guardian is an expert at protecting their allies from harm through the use of heavy armour, a special mechanic involving support banners, and a sub-resource called Inspiration. Through all of these things and more, the Guardian is a very effective energy-using tank. Steady paced and easy to pick up.", 1}
	end
	if(class == CLASS_RIFTBLADE)then
		return {"Icons/inv_weapon_shortblade_79", 
		"The Riftblade is a powerful combination of an assassin and a wizard. The ultimate mage-slayer, using subtelty, magical weapon essence, portal magic and cosmic power to defeat foes, especially those who cast spells themselves. A fun and interactive assassin style class that can swiftly take out enemies from the shadows with arcane magic. Excellent versus mages.", 8}
	end
	if(class == CLASS_REAPER)then
		return {"Icons/inv_staff_78", 
		"The Reaper uses health as a primary resource, constantly spending and stealing it to destroy foes and protect allies. Reapers collect the souls of fallen enemies for later use in combat,  in addition to bringing some unique utility to fights, including off-tanking and healing capabilities.", 4}
	end
	if(class == CLASS_SPARTAN)then
		return {"Icons/ability_warrior_shieldbash", 
		"The Spartan is a shield-bearing damage dealer that uses tactical ability combos to defeat foes, using rage and strength plate armour.", 1}
	end
	if(class == CLASS_SAMURAI)then
		return {"Icons/inv_sword_41", 
		"The Rhonin is the master of balance. To get the most out of their combat abilities, monks must be able to balance their own anger through meditation and ancient teachings. Focuses on empowered auto attacks and rage balancing.", 1}
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
	if(class == CLASS_HELLION)then
		return {"Icons/spell_fire_flameblades",
		"The Hellion is a powerful and resilient warrior using ancient Draconic magic to destroy foes and absorb damage. Basic and fun class with spell-based melee combat.", 1}
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

function initClass(player, class)
	player:RemoveSpell(800419)
	player:RemoveSpell(500931) --overload old
	player:LearnSpell(800670) --hp inc
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
				portals = {10059, 11416, 11419, 32266, 49360, 33691, 28148, 53142}
			else
				portals = {11417, 11418, 11420, 32267, 49361, 33691, 28148, 53142}
			end
			for i,v in ipairs(portals) do
				player:LearnSpell(v)
			end
		end
	end
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
		local entry = 0;
		local main = player:GetEquippedItemBySlot(15)
		if(main ~= nil)then
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then
			SetFakeEntry(off, entry)
		end
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
	if(class == CLASS_SPARTAN)then
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)

		local main = player:GetEquippedItemBySlot(15)
		if(main ~= nil)then
			local entry = 19167;
			SetFakeEntry(main, entry)
		end
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then
			local entry = 45682;
			SetFakeEntry(off, entry)
		end
		local helm = player:GetEquippedItemBySlot(0)
		if(helm~=nil)then
			local entry = 24946;
			SetFakeEntry(helm, entry)
		end
		local chest = player:GetEquippedItemBySlot(4)
		if(chest~=nil)then
			SetFakeEntry(chest, 0)
		else
			local shirt = player:GetEquippedItemBySlot(3)
			SetFakeEntry(shirt, 0)
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
	if(class == CLASS_DEMONHUNTER)then
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1500)

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
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
		player:LearnSpell(800338)
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then --dual wield
			local entry = 100008;
			SetFakeEntry(off, entry)

			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				SetFakeEntry(main, entry)
			end
			player:RemoveAura(500374)
		else --2h
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 25226;
				if(player:HasItem(600102))then
					entry = 600102;
				end
				SetFakeEntry(main, entry)
			end
			player:AddAura(500374, player):SetStackAmount(1)
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
		player:SetPowerType(3)
		player:SetMaxPower(3, 100)
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
		player:SetMaxPower(0, 125)
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then --dual wield
			local entry = 12535;
			SetFakeEntry(off, entry)

			local main = player:GetEquippedItemBySlot(15)
			if(player:HasSpell(800124))then
				entry = 0;
			end
			if(main ~= nil)then
				SetFakeEntry(main, entry)
			end
		else --2h
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 9385;
				if(player:HasItem(900012))then
					entry = 23540;
				end
				if(player:HasSpell(800124))then
					entry = 0;
				end
				SetFakeEntry(main, entry)
			end
		end
	end

	if(class == CLASS_STARLORD)then
		player:SetPowerType(0)
		player:SetMaxPower(0, player:GetStat(3) * 10 + player:GetLevel() * 3 + 20)
		--player:SetPowerType(1)
		--player:SetMaxPower(1, 1000)
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then --dual wield
			local entry1 = 43661;
			local entry2 = 45170;
			SetFakeEntry(off, entry1)

			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				SetFakeEntry(main, entry)
			end
		else --2h
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 9385;
				SetFakeEntry(main, entry)
			end
		end
	end

	if(class == CLASS_HELLION)then
		player:SetPowerType(1)
		player:SetMaxPower(1, 1000)
		local off = player:GetEquippedItemBySlot(16)
		if(off ~= nil)then --dual wield
			local o_entry = 19348;
			SetFakeEntry(off, o_entry)

			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local m_entry = 28439
				SetFakeEntry(main, m_entry)
			end
		else --2h
			local main = player:GetEquippedItemBySlot(15)
			if(main ~= nil)then
				local entry = 25603;
				--[[if(player:IsAlliance() == true)then
					entry = 46069;
				end]]
				SetFakeEntry(main, entry)
			end
		end
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
			player:RemoveSpell(500251)
			player:RemoveSpell(500267)
			entry = 42484;
			maxmana = 550;
		else
			player:RemoveSpell(800668)
			player:RemoveSpell(800667)
			player:LearnSpell(500251)
			player:LearnSpell(500267)
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
			9116,750,196,201,800654,800626,800625,800624,800622,800621,800617,800614,800612,800611,800610,800455,800054,107,3124,81
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

	if(player:GetClass() == 5)then
		player:LearnSpell(800062)
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

function On_Login(event, player)
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

	if(getClassID(player) == CLASS_REAPER and player:GetClass() == 1)then
		local guid = player:GetGUIDLow()
		CharDBQuery("UPDATE characters SET class = 4 WHERE guid = "..(guid))
		--player:KickPlayer()
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
	initClass(player, getClassID(player))
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

	local training = player:AddAura(500314, player)
	training:SetStackAmount(player:GetLevel())
end

function equip(event, player, item, bag, slot)
	initClass(player, getClassID(player))
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

function killCreature(event, killer, killed)
	local entry = killed:GetEntry()
	if(getClassID(killer) == CLASS_REAPER)then
		killer:AddAura(500363, killer)
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
					awardToGroup(killer, 900004, 1)
				end
				if(player:GetPhaseMask() == 2 and player:GetLevel() == MAX_LEVEL)then
					if(math.random(30) == 1)then
						awardToGroup(killer, 900031, math.random(3))
					end
					if(math.random(30) == 1)then
						awardToGroup(killer, 900004, 1)
					end
				end
			end
		end
		if(killed:IsWorldBoss())then
			killer:AddItem(900004, 5)
			player:SendBroadcastMessage(">> You gain 1 "..GetItemLink(900004).."! <<")
		end
	end
end

RegisterPlayerEvent(7, killCreature)

function boostToSixty(player)
	player:SetLevel(70)
	player:AddItem(24245, 15)
	local archetype = player:GetClass()
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

function lordharvest_trigger(i, ii, souls, player)
	player:RemoveAura(500370)
	local aura = player:AddAura(500370, player)
	aura:SetMaxDuration(5000 * souls)
	aura:SetDuration(5000 * souls)
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

function tidecaller_resetburst(i, ii, souls, player)
	player:ResetSpellCooldown(800377)
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
			if(static >= 80)then
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

function onCast(event, player, spell, skipChek)
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

	if(spellid == 800532)then
		if(player:IsInCombat())then
			player:CastSpell(player, spellid, true)
		end
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
		local chance = 10

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
					aura:SetDuration(aura:GetDuration() + 1000)
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

	if(spellid == 800526)then
		if(math.random(10) == 1)then
			local r = math.random(3)
			local aura = 800763
			if(r == 1)then aura = 800764 end
			if(r == 2)then aura = 800765 end
			player:AddAura(aura, player)
		end
	end

	if(spellid == 800766)then
		local r = math.random(3)
		local aura = 800763
		if(r == 1)then aura = 800764 end
		if(r == 2)then aura = 800765 end
		player:AddAura(aura, player)
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

	if(spellid == 800729 or spellid == 800730 or spellid == 800731)then
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
	end

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
				if(v:GetOwner() == player)then
					v:CastSpell(tar, spellid, true)
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
					tar:AddThreat(v, 20)
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
					tar:AddThreat(v, 20)
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
					tar:AddThreat(v, 20)
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

	if(spellid == 800526)then
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
	end

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
		if(player:HasSpell(800493))then
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

		player:DealHeal(player, 800489, player:GetStat(1) / (20 + math.random(10)) + player:GetStat(1) / 8 + player:GetLevel() * 2 )
		
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
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800382)then
		if(isFocus(player))then
			player:AddAura(800382, tar)
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800373)then
		if(isFocus(player))then
			player:AddAura(800373, tar)
			player:AddAura(800373, tar)
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800379)then
		if(isFocus(player))then
			player:AddAura(800400, tar)
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800363)then
		if(isFocus(player))then
			player:DealDamage(tar, (player:GetLevel() * 2 + player:GetStat(3) / 2 + math.random(5)), false, 4)
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800374)then
		if(isFocus(player))then
			local nearAllies = player:GetPlayersInRange(30, 2, 1)
			for i,v in ipairs(nearAllies) do
				player:AddAura(800399, v)
			end
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800375)then
		if(isFocus(player))then
			local nearAllies = tar:GetPlayersInRange(15, 2, 1)
			for i,v in ipairs(nearAllies) do
				player:AddAura(v, 800375)
			end
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800370)then
		if(isFocus(player))then
			player:DealHeal(tar, 800370, (tar:GetMaxHealth() / 10))
			player:AddAura(800398, player)
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800377)then
		if(isFocus(player))then
			setPower(player, 0, player:GetPower(0) + player:GetMaxPower(0) / 5)
			player:RegisterEvent(tidecaller_resetburst, 100, 1)
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800390)then
		if(isFocus(player))then
			setPower(player, 0, player:GetPower(0) + player:GetMaxPower(0) / 4)
			player:AddAura(800397, player)
			setPower(player, 0, 2)
		end
	end

	if(spellid == 800378)then
		if(isFocus(player))then
			player:RegisterEvent(tidecaller_resetwave, 100, 1)
			setPower(player, 0, 2)
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
		local dmg = player:GetMaxHealth() / 100 * 12
		if(player:HasSpell(800701))then
			dmg = player:GetStat(0) * 2.15
			player:ResetSpellCooldown(800316)
		end
		player:DealDamage(tar, dmg, false, 1)

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
		if(math.random(5) == 1)then
			player:ResetSpellCooldown(800091)
			player:SendAreaTriggerMessage("Ravage cooldown reset!")
			player:SendBroadcastMessage("Ravage cooldown reset!")
		end
		if(player:HasAura(800265))then
			player:RemoveAura(800265)
			local dmg = (3 + player:GetLevel() * 1.5 + player:GetStat(1) / 2) / 3 * 2
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

	if(spellid == 800091)then
		local dmg = (3 + player:GetLevel() * 1.5 + player:GetStat(1) / 2) / 2
		if(tar:ToPlayer() ~= nil)then
			dmg = dmg / 3 * 2
		end
		player:DealDamage(tar, dmg, false, 2)
	end

	if(spellid == 800275)then
		local aura = player:AddAura(800275, player)
		if(tar:ToPlayer() ~= nil)then
			player:AddAura(800276, tar)
		else
			player:SetMaxPower(3, tar:GetEntry())
		end
	end

	if(player:HasAura(800275) and tar ~= nil)then
		if(tar:ToPlayer() == nil)then
		else
			local aura = player:GetAura(800275)
			if(tar:GetEntry() == player:GetMaxPower(3))then
				if(tar:HasAura(800276))then
				else
					player:AddAura(800276, tar)
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
		setPower(player, player:GetPower(1) + 50, 1)
	end

	if(spellid == 500032)then
		setPower(player, player:GetPower(3) + 75, 3)
	end

	if(spellid == 800223)then
		if(player:GetPower(1) >= (player:GetMaxPower(1) - 2))then
			setPower(player, 0, 1)
			player:CastSpell(player, 500031, true)
			player:CastSpell(player, 48582, true)
			if(player:HasSpell(800352))then
				player:DealHeal(player, 800352, player:GetMaxHealth()/4)
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
	end

	if(spellid == 800040)then
		local class = getClassID(player)
        local list = getTalentList(player)
        local name = (getNameForClass(class))
        AIO.Handle(player, "AIOExample", "ShowFrame", class, list, name)
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
		if(tar:HasAura(500339))then
			local aura = tar:GetAura(500339)
			aura:SetStackAmount(aura:GetStackAmount() + math.random(3))
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
		player:DealHeal(tar, 500945, (player:GetStat(3) / 5 * 2 + player:GetStat(4) / 3 * 2 + (player:GetLevel() * 2 + 12) / 15) * aura:GetStackAmount())
		player:RemoveAura(500945)
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
				player:DealDamage(v, (count * (3 * player:GetLevel() + player:GetStat(0) / 3 + count)) * 0.8, false, 0)
				v:RemoveAura(500917)
			end
		end
		local near1 = player:GetPlayersInRange(3)
		for i,v in ipairs(near1) do
			if(v:HasAura(500917))then
				local count = v:GetAura(500917):GetStackAmount()
				player:DealDamage(v, (count * (3 * player:GetLevel() + player:GetStat(0) / 3 + count)) * 0.8, false, 0)
				v:RemoveAura(500917)
			end
		end
	end

	if(spellid == 800131)then
		if(tar:HasAura(500917))then
			local count = tar:GetAura(500917):GetStackAmount()
			player:DealDamage(tar, 2 * (count * (3 * player:GetLevel() + player:GetStat(0) / 3 + count)), false, 0)
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
			player:AddAura(500022, player)
			player:GetAura(500906):SetStackAmount(player:GetAura(500906):GetStackAmount() - 1)
		else
			spell:Finish()
			player:SendBroadcastMessage("Requires a Rended Corpse.")
		end
	end

	if(spellid == 800168)then
		if(player:HasAura(500906))then
			player:GetAura(500906):SetStackAmount(player:GetAura(500906):GetStackAmount() - 1)
		else
			spell:Finish()
			player:SendBroadcastMessage("Requires a Rended Corpse.")
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
			v:SetFacingToObject(tar)
			v:AttackStart(tar)
			v:CastSpell(tar, 54350, true)
			v:CastSpell(tar, 500695, false)
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
		local stacks = 10;
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
			player:CastSpell(player, 500707, true)
			player:ResetSpellCooldown(500707, true)
		end
		local stacks = 5;
		if(player:HasAura(500706))then
			player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
		else
			player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
		end
	end

	if(spellid == 500722)then --cthun
		local curstacks = player:GetAura(500706):GetStackAmount()
		if(curstacks >= 75)then
			player:ResetSpellCooldown(500110, true)
		end
		local amt = ((player:GetLevel() / 2) * (curstacks / 10))
		player:DealDamage(tar, amt, false, 5)

		local stacks = 20;
		if(player:HasAura(500706))then
			player:GetAura(500706):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
		else
			player:AddAura(500706, player):SetStackAmount(player:GetAura(500706):GetStackAmount() + stacks)
		end
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

	if(spellid == 500689)then
		if(player:IsMoving())then
			player:AddAura(500691, tar)
		else
			local amt = player:GetLevel() * 3 + player:GetStat(1) * 2 + math.random(5)
			player:DealDamage(tar, amt, false, 4)
			setPower(player, player:GetPower(0) + 30, 0)
		end
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
		local amt = player:GetMaxHealth() / 100 * 7
		player:DealDamage(player, amt, false, 5)
		if(math.random(4) == 1)then
			player:AddAura(500363, player)
		end
	end

	if(spellid == 500372)then
		player:AddAura(500363, player)
		player:AddAura(500363, player)
		player:AddAura(500363, player)
	end

	if(spellid == 500376)then
		local amt = player:GetMaxHealth() / 100 * 7
		player:DealDamage(player, amt, false, 5)
		player:DealDamage(tar, amt * 2, false, 5)
		player:AddAura(500363, player)
	end

	if(spellid == 500366 or spellid == 500367)then
		if(player:HasAura(500363))then
			local stacks = player:GetAura(500363):GetStackAmount()
			if(stacks > 1)then
				player:GetAura(500363):SetStackAmount(stacks - 1)
			else
				player:RemoveAura(500363)
			end
			if(spellid == 500367)then
				local amt = player:GetMaxHealth() / 100 * 8
				player:DealHeal(player, 500357, amt)
			end
		else
			spell:Finish()
			player:SendBroadcastMessage("Requires a Reaped Soul.")
		end
	end

	if(spellid == 500357)then
		local amt = player:GetMaxHealth() / 100 * 5
		player:DealHeal(player, 500357, amt)
	end

	if(spellid == 500359)then
		local amt = player:GetMaxHealth() / 100 * 12
		player:DealHeal(player, 500359, amt)
	end

	if(spellid == 500361)then
		local amt = player:GetMaxHealth() / 100 * 10
		player:DealDamage(player, amt)
		tar:RegisterEvent(bloodstore_heal, 5000, amt * 1.5)
	end

	if(spellid == 500377)then
		local amt = player:GetMaxHealth() / 100 * 5
		player:DealDamage(player, amt)
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

	if(spellid == 500045)then
		addStatic(player, 30)
	end

	if(spellid == 500922)then
		addStatic(player, 10)
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
		local managate = player:GetNearestCreature(800, 50058)
		local x, y, z = managate:GetLocation()
		player:NearTeleport(x, y, z, 0)
		player:CastSpell(player, 64446, true)
	end

	if(spellid == 500271 or spellid == 500282 or spellid == 500283 or spellid == 500284 or spellid == 500285 or spellid == 500286)then
		local aura = player:GetAura(spellid)
		if(aura ~= nil and player:IsInCombat() == false)then
			local stacks = aura:GetStackAmount()
			if(stacks >= 2)then
				spell:Cancel()
				player:SendBroadcastMessage("You cannot exceed 2 essence stacks outside of combat.")
			end
		end
		player:SetMaxPower(0, 450)
	end

	if(spellid == 500251)then
		local fire = player:GetAura(500271)
		local magic = player:GetAura(500282)
		local life = player:GetAura(500283)
		local haste = player:GetAura(500284)
		local frost = player:GetAura(500285)
		local destruction = player:GetAura(500286)
		if(fire ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500271)
			end
			local dmg = (4 + player:GetLevel() * 2 + player:GetStat(3) / 4 + player:GetStat(3) * 1.1) * (fire:GetStackAmount() * 1.1) / 3 * 2
			if(tar:ToPlayer() ~= nil)then
				if(dmg >= tar:GetMaxHealth() / 2)then
					dmg = tar:GetMaxHealth() / 2
				end
			end
			player:DealDamage(tar, dmg, false, 2)
		end
		if(life ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500283)
			end
			local amt = player:GetMaxHealth() / 20 * life:GetStackAmount()
			player:DealHeal(player, 71121, amt)
		end
		if(frost ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500285)
			end
			local stacks = frost:GetStackAmount()
			local dmg = ((4 + player:GetLevel() * 2 + player:GetStat(3) / 3) * (stacks * 1.1)) / 5 * 3
			if(tar:ToPlayer() ~= nil)then
				if(dmg >= tar:GetMaxHealth() / 2)then
					dmg = tar:GetMaxHealth() / 2
				end
			end
			player:DealDamage(tar, dmg, false, 4)
			if(stacks >= 3)then
				player:AddAura(500308, tar):SetDuration(500 * stacks)
			end
		end
		if(haste ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500284)
			end
			local stacks = haste:GetStackAmount()
			for i=1,stacks do
				player:AddAura(500309, player)
			end
		end
		if(destruction ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500286)
			end
			local stacks = destruction:GetStackAmount()
			for i=1,stacks do
				player:AddAura(500310, player)
			end
		end
		if(magic ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500282)
			end
			local amt = tar:GetMaxPower(0) / 20 * magic:GetStackAmount()
			stealMana(player, tar, amt)
			if(stacks >= 2)then
				tar:InterruptSpell(0)
				tar:StopSpellCast(0)
			end
		end
	end

	if(spellid == 800667)then
		local fire = player:GetAura(500271)
		local magic = player:GetAura(500282)
		local life = player:GetAura(500283)
		local haste = player:GetAura(500284)
		local frost = player:GetAura(500285)
		local destruction = player:GetAura(500286)
		if(fire ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500271)
			end
			local dmg = (4 + player:GetLevel() * 2 + player:GetStat(3) / 4 + player:GetStat(3) * 1.1) * (fire:GetStackAmount() * 1.1) / 3 * 2
			if(tar:ToPlayer() ~= nil)then
				if(dmg >= tar:GetMaxHealth() / 2)then
					dmg = tar:GetMaxHealth() / 2
				end
			end
			player:DealDamage(tar, dmg, false, 2)
		end
		if(life ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500283)
			end
			local amt = player:GetMaxHealth() / 20 * life:GetStackAmount()
			player:DealHeal(player, 71121, amt)
		end
		if(frost ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500285)
			end
			local stacks = frost:GetStackAmount()
			local dmg = ((4 + player:GetLevel() * 2 + player:GetStat(3) / 3) * (stacks * 1.1)) / 5 * 3
			if(tar:ToPlayer() ~= nil)then
				if(dmg >= tar:GetMaxHealth() / 2)then
					dmg = tar:GetMaxHealth() / 2
				end
			end
			player:DealDamage(tar, dmg, false, 4)
			if(stacks >= 3)then
				player:AddAura(500308, tar):SetDuration(500 * stacks)
			end
		end
		if(haste ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500284)
			end
			local stacks = haste:GetStackAmount()
			for i=1,stacks do
				player:AddAura(500309, player)
			end
		end
		if(destruction ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500286)
			end
			local stacks = destruction:GetStackAmount()
			for i=1,stacks do
				player:AddAura(500310, player)
			end
		end
		if(magic ~= nil)then
			if(player:HasAura(800103) == false)then
				player:RemoveAura(500282)
			end
			local amt = tar:GetMaxPower(0) / 20 * magic:GetStackAmount()
			stealMana(player, tar, amt)
			if(stacks >= 2)then
				tar:InterruptSpell(0)
				tar:StopSpellCast(0)
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
	if(spellid == 500268)then --guardian slam
		if(player:HasAura(500256))then
			local amt = player:GetAura(500256):GetStackAmount()
			if(amt >= 10 and player:HasAura(800321) == false)then
				player:ResetSpellCooldown(500258)
				player:RemoveAura(500256)
			else
				player:AddAura(500256, player)
				player:AddAura(500256, player)
			end
		else
			player:AddAura(500256, player)
			player:AddAura(500256, player)
		end
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
		player:SetPowerType(1)
		player:AddAura(800770, player)
		player:RegisterEvent(worgen_changepow, 10, 1)
		if(player:HasSpell(800488))then
			player:AddAura(800488, player)
		end
	end
	if(spellid == 500128)then
		if(player:HasSpell(800488))then
			player:AddAura(800488, player)
		end
	end
	if(spellid == 800771)then
		player:SetPowerType(1)
		newamt = player:GetPower(1) - 100
		if(newamt < 0)then
			newamt = 0
			player:RegisterEvent(worgen_changepow, 10, 1)
			player:SetPowerType(1)
			player:RemoveAura(800770)
			player:RemoveAura(500122)
			player:CastSpell(player, 72313, true)
		end
		setPower(player, 1, newamt)
	end
	if(spellid == 500129 or spellid == 800604)then
		setPower(player, player:GetPower(0) + (15 * (player:GetMaxPower(0) / 100)), 0)
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
		if(player:HasSpell(800493))then
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
					v:CastSpell(tar, 500118, true)
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
						v:CastSpell(tar, 800335, true)
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

function phoenix_empower_attack(i, ii, iii, tar)
	if(tar:HasAura(500203))then
		tar:CastSpell(tar:GetVictim(), 500130, true)
	end
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

function updateMobLevel(creature, level)
	local mob_perks = {800003, 800004, 800005, 800006, 800007, 800009, 800011}

	creature:Kill(creature)
	creature:Respawn()

	local orig_lvl = creature:GetLevel()
	if(orig_lvl > level)then
		local aura = creature:AddAura(800002, creature)
		aura:SetStackAmount((orig_lvl-level) - 7)
	else
		local aura = creature:AddAura(800000, creature)
		aura:SetStackAmount((level-orig_lvl))
	end
	creature:SetLevel(level + (math.random(2) - math.random(2)))
	local hp = creature:GetMaxHealth() / orig_lvl * level
	--local hp = level * 70 + math.random(10) - math.random(10)
	hp = hp + (math.random(hp / 10) - math.random(hp / 10))
	creature:SetMaxHealth(hp)
	
	
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
	local training = player:AddAura(500314, player)
	training:SetStackAmount(player:GetLevel())
	local classid = getClassID(player)
	initClass(player, classid)
	if(classid == CLASS_NECROMANCER or classid == CLASS_CULTIST or classid == CLASS_WITCHHUNTER or classid == CLASS_TINKER or classid == CLASS_PYROMANCER)then
		player:AddAura(800695, player)
	end
	local spells = getSpellsForClass(classid)
	if(player:GetLevel() >= 10)then
		player:LearnSpell(800191)
		player:LearnSpell(800192)
		player:LearnSpell(800409)
		player:LearnSpell(800485)
	end
	if(player:GetClass() == 4 or player:GetClass() == 1)then
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
	if(player:GetLevel() >= 70)then
		basemult = 1.5;
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

	if(map == 109 and player:GetLevel() >= MAX_LEVEL)then
		if(player:GetPhaseMask() == 1)then
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
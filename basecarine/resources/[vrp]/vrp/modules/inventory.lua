local itemlist = {
	--=== Legal ===--

	-- Utilitários --
	["dinheiro"] = { index = "dinheiro", name = "Dinheiro", type = "use", weight = 0.0 },
	["dinheirosujo"] = { index = "dinheirosujo", name = "Dinheiro Sujo", type = "use", weight = 0.0 },
	["celular"] = { index = "celular", name = "Celular", type = "use", weight = 1.0 },
	["mochilap"] = { index = "mochilap", name = "Mochila Pequena", type = "use", weight = 1.0 },
	["mochilam"] = { index = "mochilam", name = "Mochila Média", type = "use", weight = 1.0 },
	["mochilag"] = { index = "mochilag", name = "Mochila Grande", type = "use", weight = 1.0 },
	["mochilax"] = { index = "mochilax", name = "Mochila Extra Grande", type = "use", weight = 1.0 },
	["radio"] = { index = "radio", name = "Rádio", type = "use", weight = 1.0 },
	["colete"] = { index = "colete", name = "Colete", type = "use", weight = 5.0 },
	["bandagem"] = { index = "bandagem", name = "Bandagem", type = "use", weight = 0.5 },
	["energetico"] = { index = "energetico", name = "Energético", type = "use", weight = 0.5 },
	["pneus"] = { index = "pneus", name = "Pneus", type = "use", weight = 2.0 },
	["cordas"] = { index = "cordas", name = "Cordas", type = "use", weight = 1.5 },
	-- Pesca --
	["isca"] = { index = "isca", name = "Isca", type = "use", weight = 0.3 },
	["lambari"] = { index = "lambari", name = "Lambari", type = "use", weight = 0.6	},
	["pirarucu"] = { index = "pirarucu", name = "Pirarucu", type = "use", weight = 0.4 },
	["corvina"] = { index = "corvina", name = "Corvina", type = "use", weight = 0.5 },
	-- Lenhador --
	["tora"] = { index = "tora", name = "Tora de Madeira", type = "use", weight = 0.5 },

	--=== Ilegal ===--

	-- Utilitários --
	["placa"] = { index = "placa", name = "Placa", type = "use", weight = 5.0 },
	["lockpick"] = { index = "lockpick", name = "Lockpick", type = "use", weight = 5.0 },
	["ticket"] = { index = "ticket", name = "Ticket", type = "use", weight = 2 },
	["algemas"] = { index = "algemas", name = "Algemas", type = "use", weight = 0.75 },
	["capuz"] = { index = "capuz", name = "Capuz", type = "use", weight = 1.5 },
	["c4"] = { index = "c4", name = "C4", type = "use", weight = 3.0 },
	-- Maconha --
	["maconha"] = { index = "maconha", name = "Maconha", type = "use", weight = 0.3 },
	["fertilizante"] = { index = "fertilizante", name = "Fertilizante", type = "use", weight = 0.3 },
	["adubo"] = { index = "adubo", name = "Adubo", type = "use", weight = 0.3 },
	-- Cocaina --
	["cocaina"] = { index = "cocaina", name = "Cocaina", type = "use", weight = 0.2 },
	["pasta"] = { index = "cocaina", name = "Cocaina", type = "use", weight = 0.2 },
	["folha"] = { index = "cocaina", name = "Cocaina", type = "use", weight = 0.2 },
	-- Metanfetamina --
	["metanfetamina"] = { index = "metanfetamina", name = "Metanfetamina", type = "use", weight = 0.4 },
	["dietilamina"] = { index = "dietilamina", name = "Dietilamina", type = "use", weight = 0.4 },
	["fungo"] = { index = "fungo", name = "Fungo", type = "use", weight = 0.4 },
	-- Armamentos --
	["armacao"] = { index = "armacao", name = "Armação", type = "use", weight = 0.01 },
	["aluminio"] = { index = "aluminio", name = "Alumínio", type = "use", weight = 0.01 },
	["cobre"] = { index = "cobre", name = "Cobre", type = "use", weight = 0.01 },
	
	--=== Armas ===--

	["WEAPON_KNIFE"] = { index = "knife", name = "Faca", type = "equip", weight = 0.50 },
	["WEAPON_HATCHET"] = { index = "hatchet", name = "Machado", type = "equip", weight = 0.75 },
	["WEAPON_BAT"] = { index = "bat", name = "Bastão de Beisebol", type = "equip", weight = 0.75 },
	["WEAPON_BATTLEAXE"] = { index = "battleaxe", name = "Machado de Batalha", type = "equip", weight = 0.75 },
	["WEAPON_BOTTLE"] = { index = "bottle", name = "Garrafa", type = "equip", weight = 0.75 },
	["WEAPON_CROWBAR"] = { index = "crowbar", name = "Pé de Cabra", type = "equip", weight = 0.75 },
	["WEAPON_DAGGER"] = { index = "dagger", name = "Adaga", type = "equip", weight = 0.50 },
	["WEAPON_GOLFCLUB"] = { index = "golfclub", name = "Taco de Golf", type = "equip", weight = 0.75 },
	["WEAPON_HAMMER"] = { index = "hammer", name = "Martelo", type = "equip", weight = 0.75 },
	["WEAPON_MACHETE"] = { index = "machete", name = "Facão", type = "equip", weight = 0.75 },
	["WEAPON_POOLCUE"] = { index = "poolcue", name = "Taco de Sinuca", type = "equip", weight = 0.75 },
	["WEAPON_STONE_HATCHET"] = { index = "stonehatchet", name = "Machado de Pedra", type = "equip", weight = 0.75 },
	["WEAPON_SWITCHBLADE"] = { index = "switchblade", name = "Canivete", type = "equip", weight = 0.50 },
	["WEAPON_WRENCH"] = { index = "wrench", name = "Chave Inglesa", type = "equip", weight = 0.75 },
	["WEAPON_KNUCKLE"] = { index = "knuckle", name = "Soco Inglês", type = "equip", weight = 0.50 },
	["WEAPON_FLASHLIGHT"] = { index = "flashlight", name = "Lanterna", type = "equip", weight = 0.50 },
	["WEAPON_NIGHTSTICK"] = { index = "nightstick", name = "Cassetete", type = "equip", weight = 0.75 },
	["WEAPON_PISTOL"] = { index = "m1911", name = "M1911", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.25 },
	["WEAPON_PISTOL_MK2"] = { index = "fiveseven", name = "FN Five Seven", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
	["WEAPON_COMPACTRIFLE"] = { index = "akcompact", name = "AK Compact", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 2.25 },
	--["WEAPON_APPISTOL"] = { index = "kochvp9", name = "Koch Vp9", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.25 },
	["WEAPON_HEAVYPISTOL"] = { index = "atifx45", name = "Ati FX45", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
	["WEAPON_MACHINEPISTOL"] = { index = "tec9", name = "Tec-9", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 1.75 },
--	["WEAPON_MICROSMG"] = { index = "uzi", name = "Uzi", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 1.25 },
	--["WEAPON_MINISMG"] = { index = "skorpionv61", name = "Skorpion V61", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 1.75 },
	["WEAPON_SNSPISTOL"] = { index = "amt380", name = "AMT 380", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_SNSPISTOL_MK2"] = { index = "hkp7m10", name = "HK P7M10", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_VINTAGEPISTOL"] = { index = "m1922", name = "M1922", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_PISTOL50"] = { index = "desert", name = "Desert Eagle", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
--	["WEAPON_REVOLVER"] = { index = "magnum", name = "Magnum 44", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.50 },
	["WEAPON_COMBATPISTOL"] = { index = "glock", name = "Glock", type = "equip", ammo = "WEAPON_PISTOL_AMMO", weight = 1.0 },
	["WEAPON_CARBINERIFLE"] = { index = "m4a1", name = "M4A1", type = "equip", ammo = "WEAPON_RIFLE_AMMO", weight = 8.0 },
	--["WEAPON_PUMPSHOTGUN"] = { index = "remington", name = "Remington", type = "equip", ammo = "WEAPON_SHOTGUN_AMMO", weight = 6.0 },
	--["WEAPON_SAWNOFFSHOTGUN"] = { index = "mossberg590", name = "Mossberg 590", type = "equip", ammo = "WEAPON_SHOTGUN_AMMO", weight = 6.0 },
	["WEAPON_SMG"] = { index = "mp5", name = "MP5", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 4.0 },
	["WEAPON_ASSAULTRIFLE"] = { index = "ak103", name = "AK-103", type = "equip", ammo = "WEAPON_RIFLE_AMMO", weight = 8.0 },
	--["WEAPON_ASSAULTRIFLE_MK2"] = { index = "ak74", name = "AK-74", type = "equip", ammo = "WEAPON_RIFLE_AMMO", weight = 8.0 },
	["WEAPON_ASSAULTSMG"] = { index = "mtar21", name = "MTAR-21", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 5.0 },
	--["WEAPON_GUSENBERG"] = { index = "thompson", name = "Thompson", type = "equip", ammo = "WEAPON_SMG_AMMO", weight = 6.0 },
	["WEAPON_PETROLCAN"] = { index = "gallon", name = "Galão", type = "equip", ammo = "WEAPON_PETROLCAN_AMMO", weight = 1.25 },
	["GADGET_PARACHUTE"] = { index = "parachute", name = "Paraquedas", type = "use", weight = 2.25 },
	["WEAPON_STUNGUN"] = { index = "stungun", name = "Tazer", type = "equip", weight = 0.75 },
	["WEAPON_FIREEXTINGUISHER"] = { index = "extinguisher", name = "Extintor", type = "equip", weight = 2.25 },

	--=== Munições ===--

	["WEAPON_PISTOL_AMMO"] = { index = "pistolammo", name = "M. Pistola", type = "recharge", weight = 0.02 },
	["WEAPON_SMG_AMMO"] = { index = "smgammo", name = "M. Sub Metralhadora", type = "recharge", weight = 0.03 },
	["WEAPON_RIFLE_AMMO"] = { index = "rifleammo", name = "M. Rifle", type = "recharge", weight = 0.04 },
	--["WEAPON_SHOTGUN_AMMO"] = { index = "shotgunammo", name = "M. Escopeta", type = "recharge", weight = 0.05 },
	["WEAPON_PETROLCAN_AMMO"] = { index = "fuel", name = "Combustível", type = "recharge", weight = 0.001 }
}

local vehglobal = {
	["dinghy"] = { "Dinghy",40,100,nil },
	["dinghy2"] = { "Dinghy 2",40,100,nil },
	["dinghy3"] = { "Dinghy 3",40,100,nil },
	["dinghy4"] = { "Dinghy 4",40,100,nil },
	["jetmax"] = { "Jetmax",40,100,nil },
	["marquis"] = { "Marquis",40,100,nil },
	["seashark"] = { "Seashark",40,100,nil },
	["seashark2"] = { "Seashark 2",40,100,nil },
	["seashark3"] = { "Seashark 3",40,100,nil },
	["speeder"] = { "Speeder",40,100,nil },
	["speeder2"] = { "Speeder 2",40,100,nil },
	["squalo"] = { "Squalo",40,100,nil },
	["submersible"] = { "Submersible",40,100,nil },
	["submersible2"] = { "Submersible 2",40,100,nil },
	["suntrap"] = { "Suntrap",40,100,nil },
	["toro"] = { "Toro",40,100,nil },
	["toro2"] = { "Toro 2",40,100,nil },
	["tropic"] = { "Tropic",40,100,nil },
	["tropic2"] = { "Tropic 2",40,100,nil },
	["tug"] = { "Tug",40,100,nil },
	["benson"] = { "Benson",300,900000,"cars" },
	["biff"] = { "Biff",40,100,nil },
	["cerberus"] = { "Cerberus",40,100,nil },
	["cerberus2"] = { "Cerberus 2",40,100,nil },
	["cerberus3"] = { "Cerberus 3",40,100,nil },
	["hauler"] = { "Hauler",40,100,nil },
	["hauler2"] = { "Hauler 2",40,100,nil },
	["mule"] = { "Mule",200,600000,"cars" },
	["mule2"] = { "Mule 2",40,100,nil },
	["mule3"] = { "Mule 3",40,2000,nil },
	["mule4"] = { "Mule 4",40,100,nil },
	["packer"] = { "Packer",40,100,nil },
	["phantom"] = { "Phantom",40,100,nil },
	["phantom2"] = { "Phantom 2",40,100,nil },
	["phantom3"] = { "Phantom 3",40,100,nil },
	["pounder"] = { "Pounder",400,1200000,"cars" },
	["pounder2"] = { "Pounder 2",40,100,nil },
	["stockade"] = { "Stockade",50,2000,nil },
	["stockade3"] = { "Stockade 3",40,100,nil },
	["terbyte"] = { "Terbyte",40,100,nil },
	["blista"] = { "Blista",30,30000,"cars" },
	["brioso"] = { "Brioso",30,30000,"cars" },
	["dilettante"] = { "Dilettante",30,40000,"cars" },
	["dilettante2"] = { "Dilettante 2",40,100,nil },
	["issi2"] = { "Issi 2",50,50000,"cars" },
	["issi3"] = { "Issi 3",50,90000,"cars" },
	["issi4"] = { "Issi 4",40,100,nil },
	["issi5"] = { "Issi 5",40,100,nil },
	["issi6"] = { "Issi 6",40,100,nil },
	["panto"] = { "Panto",20,5000,"cars" },
	["prairie"] = { "Prairie",20,10000,"cars" },
	["rhapsody"] = { "Rhapsody",20,7500,"cars" },
	["cogcabrio"] = { "Cogcabrio",50,75000,"cars" },
	["exemplar"] = { "Exemplar",20,60000,"cars" },
	["f620"] = { "F620",30,45000,"cars" },
	["felon"] = { "Felon",50,60000,"cars" },
	["felon2"] = { "Felon 2",40,70000,"cars" },
	["jackal"] = { "Jackal",30,60000,"cars" },
	["oracle"] = { "Oracle",50,50000,"cars" },
	["oracle2"] = { "Oracle 2",60,70000,"cars" },
	["sentinel"] = { "Sentinel",40,50000,"cars" },
	["sentinel2"] = { "Sentinel 2",40,50000,"cars" },
	["windsor"] = { "Windsor",30,90000,"cars" },
	["windsor2"] = { "Windsor 2",40,100000,"cars" },
	["zion"] = { "Zion",40,50000,"cars" },
	["zion2"] = { "Zion 2",40,50000,"cars" },
	["bmx"] = { "Bmx",0,1000,"bikes" },
	["cruiser"] = { "Cruiser",0,1000,"bikes" },
	["fixter"] = { "Fixter",0,1000,"bikes" },
	["scorcher"] = { "Scorcher",0,1000,"bikes" },
	["tribike"] = { "Tribike",0,1000,"bikes" },
	["tribike2"] = { "Tribike 2",0,1000,"bikes" },
	["tribike3"] = { "Tribike 3",0,1000,"bikes" },
	["ambulance"] = { "Ambulance",20,100,nil },
	["fbi"] = { "Fbi",20,100,nil },
	["fbi2"] = { "Fbi 2",20,100,nil },
	["firetruk"] = { "Firetruk",20,100,nil },
	["lguard"] = { "Lguard",40,100,nil },
	["pbus"] = { "Pbus",40,100,nil },
	["police"] = { "Police",40,100,nil },
	["police2"] = { "Police 2",40,100,nil },
	["police3"] = { "Police 3",40,100,nil },
	["police4"] = { "Police 4",20,100,nil },
	["policeb"] = { "Police B",20,100,nil },
	["policebike"] = { "Police Bike",20,100,nil },
	["polmav"] = { "Polmav",20,100,nil },
	["policeold1"] = { "Policeold 1",40,100,nil },
	["policeold2"] = { "Policeold 2",40,100,nil },
	["policet"] = { "Police T",40,100,nil },
	["pranger"] = { "Pranger",40,100,nil },
	["predator"] = { "Predator",40,100,nil },
	["riot"] = { "Riot",20,100,nil },
	["riot2"] = { "Riot 2",40,100,nil },
	["sheriff"] = { "Sheriff",40,100,nil },
	["sheriff2"] = { "Sheriff 2",40,100,nil },
	["akula"] = { "Akula",40,100,nil },
	["annihilator"] = { "Annihilator",40,100,nil },
	["buzzard"] = { "Buzzard",40,100,nil },
	["buzzard2"] = { "Buzzard 2",40,100,nil },
	["cargobob"] = { "Cargobob",40,100,nil },
	["cargobob2"] = { "Cargobob 2",40,100,nil },
	["cargobob3"] = { "Cargobob 3",40,100,nil },
	["cargobob4"] = { "Cargobob 4",40,100,nil },
	["frogger"] = { "Frogger",40,100,nil },
	["frogger2"] = { "Frogger 2",40,100,nil },
	["havok"] = { "Havok",40,100,nil },
	["hunter"] = { "Hunter",40,100,nil },
	["maverick"] = { "Maverick",40,100,nil },
	["savage"] = { "Savage",40,100,nil },
	["seasparrow"] = { "Seasparrow",40,100,nil },
	["skylift"] = { "Skylift",40,100,nil },
	["supervolito"] = { "Supervolito",40,100,nil },
	["supervolito2"] = { "Supervolito 2",40,100,nil },
	["swift"] = { "Swift",40,100,nil },
	["swift2"] = { "Swift 2",40,100,nil },
	["valkyrie"] = { "Valkyrie",40,100,nil },
	["valkyrie2"] = { "Valkyrie 2",40,100,nil },
	["volatus"] = { "Volatus",40,100,nil },
	["bulldozer"] = { "Bulldozer",40,100,nil },
	["cutter"] = { "Cutter",40,100,nil },
	["dump"] = { "Dump",40,100,nil },
	["flatbed"] = { "Flatbed",40,100,nil },
	["guardian"] = { "Guardian",100,500000,"cars" },
	["handler"] = { "Handler",40,100,nil },
	["mixer"] = { "Mixer",40,100,nil },
	["mixer2"] = { "Mixer 2",40,100,nil },
	["rubble"] = { "Rubble",40,100,nil },
	["tiptruck"] = { "Tiptruck",40,100,nil },
	["tiptruck2"] = { "Tiptruck 2",40,100,nil },
	["apc"] = { "Apc",40,100,nil },
	["barracks"] = { "Barracks",40,100,nil },
	["barracks2"] = { "Barracks 2",40,100,nil },
	["barracks3"] = { "Barracks 3",40,100,nil },
	["barrage"] = { "Barrage",40,100,nil },
	["chernobog"] = { "Chernobog",40,100,nil },
	["crusader"] = { "Crusader",40,100,nil },
	["halftrack"] = { "Halftrack",40,100,nil },
	["khanjali"] = { "Khanjali",40,100,nil },
	["rhino"] = { "Rhino",40,100,nil },
	["scarab"] = { "Scarab",40,100,nil },
	["scarab2"] = { "Scarab 2",40,100,nil },
	["scarab3"] = { "Scarab 3",40,100,nil },
	["thruster"] = { "Thruster",40,100,nil },
	["trailersmall2"] = { "Trailersmall 2",40,100,nil },
	["akuma"] = { "Akuma",20,260000,"bikes" },
	["avarus"] = { "Avarus",20,160000,"bikes" },
	["bagger"] = { "Bagger",20,140000,"bikes" },
	["bati"] = { "Bati",20,160000,"bikes" },
	["bati2"] = { "Bati 2",20,160000,"bikes" },
	["bf400"] = { "Bf400",20,180000,"bikes" },
	["carbonrs"] = { "Carbon RS",20,150000,"bikes" },
	["chimera"] = { "Chimera",20,140000,"bikes" },
	["cliffhanger"] = { "Cliffhanger",20,125000,"bikes" },
	["daemon"] = { "Daemon",20,140000,"bikes" },
	["daemon2"] = { "Daemon 2",20,140000,"bikes" },
	["defiler"] = { "Defiler",20,180000,"bikes" },
	["deathbike"] = { "Deathbike",40,100,nil },
	["deathbike2"] = { "Deathbike 2",20,60000,nil },
	["deathbike3"] = { "Deathbike 3",20,60000,nil },
	["diablous"] = { "Diablous",20,180000,"bikes" },
	["diablous2"] = { "Diablous 2",20,180000,"bikes" },
	["double"] = { "Double",20,220000,"bikes" },
	["enduro"] = { "Enduro",20,90000,"bikes" },
	["esskey"] = { "Esskey",20,150000,"bikes" },
	["faggio"] = { "Faggio",30,5000,"bikes" },
	["faggio2"] = { "Faggio 2",30,5000,"bikes" },
	["faggio3"] = { "Faggio 3",30,5000,"bikes" },
	["fcr"] = { "Fcr",20,140000,"bikes" },
	["fcr2"] = { "Fcr 2",20,140000,"bikes" },
	["gargoyle"] = { "Gargoyle",20,140000,"bikes" },
	["hakuchou"] = { "Hakuchou",20,200000,"bikes" },
	["hakuchou2"] = { "Hakuchou 2",20,240000,"bikes" },
	["hexer"] = { "Hexer",20,110000,"bikes" },
	["innovation"] = { "Innovation",20,120000,"bikes" },
	["lectro"] = { "Lectro",20,150000,"bikes" },
	["manchez"] = { "Manchez",20,140000,"bikes" },
	["nemesis"] = { "Nemesis",20,140000,"bikes" },
	["nightblade"] = { "Nightblade",20,170000,"bikes" },
	["oppressor"] = { "Oppressor",20,60000,nil },
	["oppressor2"] = { "Oppressor 2",20,60000,nil },
	["pcj"] = { "Pcj",20,90000,"bikes" },
	["ratbike"] = { "Ratbike",20,60000,nil },
	["ruffian"] = { "Ruffian",20,130000,"bikes" },
	["sanchez"] = { "Sanchez",15,80000,"bikes" },
	["sanchez2"] = { "Sanchez 2",15,90000,"bikes" },
	["sanctus"] = { "Sanctus",20,140000,"bikes" },
	["shotaro"] = { "Shotaro",20,60000,nil },
	["sovereign"] = { "Sovereign",20,120000,"bikes" },
	["thrust"] = { "Thrust",20,140000,"bikes" },
	["vader"] = { "Vader",20,120000,"bikes" },
	["vindicator"] = { "Vindicator",20,120000,"bikes" },
	["vortex"] = { "Vortex",20,140000,"bikes" },
	["wolfsbane"] = { "Wolfsbane",20,110000,"bikes" },
	["zombiea"] = { "Zombie A",20,110000,"bikes" },
	["zombieb"] = { "Zombie B",20,110000,"bikes" },
	["blade"] = { "Blade",40,100,nil },
	["buccaneer"] = { "Buccaneer",50,120000,"cars" },
	["buccaneer2"] = { "Buccaneer 2",60,240000,"cars" },
	["chino"] = { "Chino",50,120000,"cars" },
	["chino2"] = { "Chino 2",60,240000,"cars" },
	["clique"] = { "Clique",40,360000,"cars" },
	["coquette3"] = { "Coquette 3",40,170000,"cars" },
	["deviant"] = { "Deviant",50,300000,"cars" },
	["dominator"] = { "Dominator",50,180000,"cars" },
	["dominator2"] = { "Dominator 2",40,100,nil },
	["dominator3"] = { "Dominator 3",30,300000,"cars" },
	["dominator4"] = { "Dominator 4",40,100,nil },
	["dominator5"] = { "Dominator 5",40,100,nil },
	["dominator6"] = { "Dominator 6",40,100,nil },
	["dukes"] = { "Dukes",40,150000,"cars" },
	["dukes2"] = { "Dukes 2",40,100,nil },
	["faction"] = { "Faction",50,150000,"cars" },
	["faction2"] = { "Faction 2",40,200000,"cars" },
	["faction3"] = { "Faction 3",60,350000,"cars" },
	["ellie"] = { "Ellie",50,300000,"cars" },
	["gauntlet"] = { "Gauntlet",40,145000,"cars" },
	["gauntlet2"] = { "Gauntlet 2",40,100,nil },
	["hermes"] = { "Hermes",70,280000,"cars" },
	["hotknife"] = { "Hotknife",30,180000,"cars" },
	["hustler"] = { "Hustler",40,180000,"cars" },
	["impaler"] = { "Impaler",60,300000,"cars" },
	["impaler2"] = { "Impaler 2",40,100,nil },
	["impaler3"] = { "Impaler 3",40,100,nil },
	["impaler4"] = { "Impaler 4",40,100,nil },
	["imperator"] = { "Imperator",40,100,nil },
	["imperator2"] = { "Imperator 2",40,100,nil },
	["imperator3"] = { "Imperator 3",40,100,nil },
	["lurcher"] = { "Lurcher",40,100,nil },
	["moonbeam"] = { "Moonbeam",80,180000,"cars" },
	["moonbeam2"] = { "Moonbeam 2",70,220000,"cars" },
	["nightshade"] = { "Nightshade",30,270000,"cars" },
	["phoenix"] = { "Phoenix",40,100,nil },
	["picador"] = { "Picador",90,150000,"cars" },
	["ratloader"] = { "Ratloader",50,2000,nil },
	["ratloader2"] = { "Ratloader 2",70,180000,"cars" },
	["ruiner"] = { "Ruiner",50,150000,"cars" },
	["ruiner2"] = { "Ruiner 2",40,100,nil },
	["ruiner3"] = { "Ruiner 3",40,100,nil },
	["sabregt"] = { "Sabregt",60,240000,"cars" },
	["sabregt2"] = { "Sabregt 2",60,150000,"cars" },
	["slamvan"] = { "Slamvan",80,150000,"cars" },
	["slamvan2"] = { "Slamvan 2",80,190000,"cars" },
	["slamvan3"] = { "Slamvan 3",80,200000,"cars" },
	["slamvan4"] = { "Slamvan 4",40,100,nil },
	["slamvan5"] = { "Slamvan 5",40,100,nil },
	["slamvan6"] = { "Slamvan 6",40,100,nil },
	["stalion"] = { "Stalion",30,150000,"cars" },
	["stalion2"] = { "Stalion 2",40,100,nil },
	["tampa"] = { "Tampa",40,170000,"cars" },
	["tampa3"] = { "Tampa 3",40,100,nil },
	["tulip"] = { "Tulip",60,300000,"cars" },
	["vamos"] = { "Vamos",60,320000,"cars" },
	["vigero"] = { "Vigero",30,170000,"cars" },
	["virgo"] = { "Virgo",60,150000,"cars" },
	["virgo2"] = { "Virgo 2",50,250000,"cars" },
	["virgo3"] = { "Virgo 3",60,180000,"cars" },
	["voodoo"] = { "Voodoo",60,220000,"cars" },
	["voodoo2"] = { "Voodoo 2",40,100,nil },
	["yosemite"] = { "Yosemite",100,350000,"cars" },
	["bfinjection"] = { "Bfinjection",20,80000,"cars" },
	["bifta"] = { "Bifta",20,190000,"cars" },
	["blazer"] = { "Blazer",10,160000,"cars" },
	["blazer2"] = { "Blazer 2",40,100,nil },
	["blazer3"] = { "Blazer 3",40,100,nil },
	["blazer4"] = { "Blazer 4",10,180000,"cars" },
	["blazer5"] = { "Blazer 5",40,100,nil },
	["bodhi2"] = { "Bodhi 2",90,170000,"cars" },
	["brawler"] = { "Brawler",40,300000,"cars" },
	["bruiser"] = { "Bruiser",40,100,nil },
	["bruiser2"] = { "Bruiser 2",40,100,nil },
	["bruiser3"] = { "Bruiser 3",40,100,nil },
	["brutus"] = { "Brutus",40,100,nil },
	["brutus2"] = { "Brutus 2",40,100,nil },
	["brutus3"] = { "Brutus 3",40,100,nil },
	["caracara"] = { "Caracara",40,100,nil },
	["dloader"] = { "Dloader",40,100,nil },
	["dubsta3"] = { "Dubsta 3",70,240000,"cars" },
	["dune"] = { "Dune",40,100,nil },
	["dune2"] = { "Dune 2",40,100,nil },
	["dune3"] = { "Dune 3",40,100,nil },
	["dune4"] = { "Dune 4",40,100,nil },
	["dune5"] = { "Dune 5",40,100,nil },
	["freecrawler"] = { "Freecrawler",60,350000,"cars" },
	["insurgent"] = { "Insurgent",40,100,nil },
	["insurgent2"] = { "Insurgent 2",40,100,nil },
	["insurgent3"] = { "Insurgent 3",40,100,nil },
	["kalahari"] = { "Kalahari",60,100000,"cars" },
	["kamacho"] = { "Kamacho",80,400000,"cars" },
	["marshall"] = { "Marshall",40,100,nil },
	["mesa3"] = { "Mesa 3",60,160000,"cars" },
	["monster"] = { "Monster",40,100,nil },
	["monster3"] = { "Monster 3",40,100,nil },
	["monster4"] = { "Monster 4",40,100,nil },
	["monster5"] = { "Monster 5",40,100,nil },
	["menacer"] = { "Menacer",40,100,nil },
	["nightshark"] = { "Nightshark",40,100,nil },
	["rancherxl"] = { "Rancherxl",70,200000,"cars" },
	["rancherxl2"] = { "Rancherxl 2",40,100,nil },
	["rebel"] = { "Rebel",100,220000,"cars" },
	["rebel2"] = { "Rebel 2",100,220000,"cars" },
	["rcbandito"] = { "Rcbandito",40,100,nil },
	["riata"] = { "Riata",80,250000,"cars" },
	["sandking"] = { "Sandking",100,350000,"cars" },
	["sandking2"] = { "Sandking 2",40,100,nil },
	["technical"] = { "Technical",40,100,nil },
	["technical2"] = { "Technical 2",40,100,nil },
	["technical3"] = { "Technical 3",40,100,nil },
	["trophytruck"] = { "Trophytruck",45,450000,"cars" },
	["trophytruck2"] = { "Trophytruck 2",40,100,nil },
	["alphaz1"] = { "Alphaz1",40,100,nil },
	["avenger"] = { "Avenger",40,100,nil },
	["avenger2"] = { "Avenger 2",40,100,nil },
	["besra"] = { "Besra",40,100,nil },
	["blimp"] = { "Blimp",40,100,nil },
	["blimp2"] = { "Blimp 2",40,100,nil },
	["blimp3"] = { "Blimp 3",40,100,nil },
	["bombushka"] = { "Bombushka",40,100,nil },
	["cargoplane"] = { "Cargoplane",40,100,nil },
	["cuban800"] = { "Cuban800",40,100,nil },
	["dodo"] = { "Dodo",40,100,nil },
	["duster"] = { "Duster",40,100,nil },
	["howard"] = { "Howard",40,100,nil },
	["hydra"] = { "Hydra",40,100,nil },
	["jet"] = { "Jet",40,100,nil },
	["lazer"] = { "Lazer",40,100,nil },
	["luxor"] = { "Luxor",40,100,nil },
	["luxor2"] = { "Luxor 2",40,100,nil },
	["mammatus"] = { "Mammatus",40,100,nil },
	["microlight"] = { "Microlight",40,100,nil },
	["miljet"] = { "Miljet",40,100,nil },
	["mogul"] = { "Mogul",40,100,nil },
	["molotok"] = { "Molotok",40,100,nil },
	["nimbus"] = { "Nimbus",40,100,nil },
	["nokota"] = { "Nokota",40,100,nil },
	["pyro"] = { "Pyro",40,100,nil },
	["rogue"] = { "Rogue",40,100,nil },
	["seabreeze"] = { "Seabreeze",40,100,nil },
	["shamal"] = { "Shamal",40,100,nil },
	["starling"] = { "Starling",40,100,nil },
	["strikeforce"] = { "Strikeforce",40,100,nil },
	["stunt"] = { "Stunt",40,100,nil },
	["titan"] = { "Titan",40,100,nil },
	["tula"] = { "Tula",40,100,nil },
	["velum"] = { "Velum",40,100,nil },
	["velum2"] = { "Velum 2",40,100,nil },
	["vestra"] = { "Vestra",40,100,nil },
	["volatol"] = { "Volatol",40,100,nil },
	["baller"] = { "Baller",40,100,nil },
	["baller2"] = { "Baller 2",40,100,nil },
	["baller3"] = { "Baller 3",40,100,nil },
	["baller4"] = { "Baller 4",40,100,nil },
	["baller5"] = { "Baller 5",40,100,nil },
	["baller6"] = { "Baller 6",50,310000,"cars" },
	["bjxl"] = { "Bjxl",40,100,nil },
	["cavalcade"] = { "Cavalcade",60,110000,"cars" },
	["cavalcade2"] = { "Cavalcade 2",60,130000,"cars" },
	["contender"] = { "Contender",70,240000,"cars" },
	["dubsta"] = { "Dubsta",40,100,nil },
	["dubsta2"] = { "Dubsta 2",80,180000,"cars" },
	["fq2"] = { "Fq2",40,100,nil },
	["granger"] = { "Granger",100,280000,"cars" },
	["gresley"] = { "Gresley",40,100,nil },
	["habanero"] = { "Habanero",40,100,nil },
	["huntley"] = { "Huntley",60,100000,"cars" },
	["landstalker"] = { "Landstalker",40,100,nil },
	["mesa"] = { "Mesa",50,90000,"cars" },
	["mesa2"] = { "Mesa 2",40,100,nil },
	["patriot"] = { "Patriot",50,220000,"cars" },
	["patriot2"] = { "Patriot 2",40,100,nil },
	["radi"] = { "Radi",40,100,nil },
	["rocoto"] = { "Rocoto",40,100,nil },
	["seminole"] = { "Seminole",40,100,nil },
	["serrano"] = { "Serrano",40,100,nil },
	["toros"] = { "Toros",50,400000,"cars" },
	["xls"] = { "Xls",50,150000,"cars" },
	["xls2"] = { "Xls 2",50,350000,"cars" },
	["asea"] = { "Asea",30,50000,"cars" },
	["asea2"] = { "Asea 2",40,100,nil },
	["asterope"] = { "Asterope",40,100,nil },
	["cog55"] = { "Cog55",50,200000,"cars" },
	["cog552"] = { "Cog55 2",40,100,nil },
	["cognoscenti"] = { "Cognoscenti",50,250000,"cars" },
	["cognoscenti2"] = { "Cognoscenti 2",40,100,nil },
	["emperor"] = { "Emperor",40,100,nil },
	["emperor2"] = { "Emperor 2",40,100,nil },
	["emperor3"] = { "Emperor 3",40,100,nil },
	["fugitive"] = { "Fugitive",30,200000,"cars" },
	["glendale"] = { "Glendale",40,100,nil },
	["ingot"] = { "Ingot",40,100,nil },
	["intruder"] = { "Intruder",40,100,nil },
	["limo2"] = { "Limo 2",40,100,nil },
	["premier"] = { "Premier",40,100,nil },
	["primo"] = { "Primo",50,120000,"cars" },
	["primo2"] = { "Primo 2",40,100,nil },
	["regina"] = { "Regina",60,120000,"cars" },
	["romero"] = { "Romero",30,120000,"cars" },
	["schafter2"] = { "Schafter 2",40,100,nil },
	["schafter5"] = { "Schafter 5",40,100,nil },
	["schafter6"] = { "Schafter 6",40,100,nil },
	["stafford"] = { "Stafford",40,400000,"cars" },
	["stanier"] = { "Stanier",40,100,nil },
	["stratum"] = { "Stratum",40,100,nil },
	["stretch"] = { "Stretch",40,200000,"cars" },
	["superd"] = { "Superd",40,90000,"cars" },
	["surge"] = { "Surge",40,100,nil },
	["tailgater"] = { "Tailgater",40,100,nil },
	["warrener"] = { "Warrener",40,90000,"cars" },
	["washington"] = { "Washington",40,100,nil },
	["airbus"] = { "Airbus",40,100,nil },
	["brickade"] = { "Brickade",40,100,nil },
	["bus"] = { "Bus",40,100,nil },
	["coach"] = { "Coach",40,100,nil },
	["pbus2"] = { "Pbus 2",40,100,nil },
	["rallytruck"] = { "Rallytruck",40,100,nil },
	["rentalbus"] = { "Rentalbus",40,100,nil },
	["taxi"] = { "Taxi",40,2000,nil },
	["tourbus"] = { "Tourbus",40,100,nil },
	["trash"] = { "Trash",40,100,nil },
	["trash2"] = { "Trash 2",40,100,nil },
	["wastelander"] = { "Wastelander",40,100,nil },
	["alpha"] = { "Alpha",40,100,nil },
	["banshee"] = { "Banshee",30,240000,"cars" },
	["bestiagts"] = { "Bestiagts",60,220000,"cars" },
	["blista2"] = { "Blista 2",40,100,nil },
	["blista3"] = { "Blista 3",40,100,nil },
	["buffalo"] = { "Buffalo",40,100,nil },
	["buffalo2"] = { "Buffalo 2",50,240000,"cars" },
	["buffalo3"] = { "Buffalo 3",40,100,nil },
	["carbonizzare"] = { "Carbonizzare",50,250000,"cars" },
	["comet2"] = { "Comet 2",40,200000,"cars" },
	["comet3"] = { "Comet 3",40,230000,"cars" },
	["comet4"] = { "Comet 4",40,230000,"cars" },
	["comet5"] = { "Comet 5",40,300000,"cars" },
	["coquette"] = { "Coquette",40,130000,"cars" },
	["deveste"] = { "Deveste",40,100,nil },
	["elegy"] = { "Elegy",50,260000,"cars" },
	["elegy2"] = { "Elegy 2",30,280000,"cars" },
	["feltzer2"] = { "Feltzer2",50,200000,"cars" },
	["flashgt"] = { "Flashgt",50,320000,"cars" },
	["furoregt"] = { "Furoregt",40,100,nil },
	["fusilade"] = { "Fusilade",40,100,nil },
	["futo"] = { "Futo",40,150000,"cars" },
	["gb200"] = { "Gb200",40,120000,"cars" },
	["hotring"] = { "Hotring",60,300000,"cars" },
	["italigto"] = { "Italigto",30,700000,"cars" },
	["jester"] = { "Jester",30,120000,"cars" },
	["jester2"] = { "Jester 2",40,100,nil },
	["jester3"] = { "Jester 3",30,150000,"cars" },
	["khamelion"] = { "Khamelion",40,100,nil },
	["kuruma"] = { "Kuruma",50,220000,"cars" },
	["kuruma2"] = { "Kuruma 2",40,100,nil },
	["lynx"] = { "Lynx",40,100,nil },
	["massacro"] = { "Massacro",50,290000,"cars" },
	["massacro2"] = { "Massacro 2",40,100,nil },
	["neon"] = { "Neon",30,300000,"cars" },
	["ninef"] = { "Ninef",40,100,nil },
	["ninef2"] = { "Ninef 2",40,250000,"cars" },
	["omnis"] = { "Omnis",40,100,nil },
	["pariah"] = { "Pariah",30,400000,"cars" },
	["penumbra"] = { "Penumbra",40,100,nil },
	["raiden"] = { "Raiden",70,240000,"cars" },
	["rapidgt"] = { "Rapidgt",20,220000,"cars" },
	["rapidgt2"] = { "Rapidgt 2",20,240000,"cars" },
	["raptor"] = { "Raptor",40,100,nil },
	["revolter"] = { "Revolter",40,100,nil },
	["ruston"] = { "Ruston",20,300000,"cars" },
	["schafter3"] = { "Schafter 3",50,180000,"cars" },
	["schafter4"] = { "Schafter 4",50,190000,"cars" },
	["schlagen"] = { "Schlagen",30,600000,"cars" },
	["schwarzer"] = { "Schwarzer",40,100,nil },
	["sentinel3"] = { "Sentinel 3",30,150000,"cars" },
	["seven70"] = { "Seven70",20,300000,"cars" },
	["specter"] = { "Specter",40,100,nil },
	["specter2"] = { "Specter 2",20,310000,"cars" },
	["streiter"] = { "Streiter",40,100,nil },
	["sultan"] = { "Sultan",30,200000,"cars" },
	["surano"] = { "Surano",40,100,nil },
	["tampa2"] = { "Tampa 2",40,100,nil },
	["tropos"] = { "Tropos",40,100,nil },
	["verlierer2"] = { "Verlierer 2",20,330000,"cars" },
	["zr380"] = { "Zr380",40,100,nil },
	["zr3802"] = { "Zr380 2",40,100,nil },
	["zr3803"] = { "Zr380 3",40,100,nil },
	["ardent"] = { "Ardent",40,100,nil },
	["btype"] = { "Btype",50,120000,"cars" },
	["btype2"] = { "Btype 2",50,160000,"cars" },
	["btype3"] = { "Btype 3",50,120000,"cars" },
	["casco"] = { "Casco",50,250000,"cars" },
	["cheetah2"] = { "Cheetah 2",40,100,nil },
	["coquette2"] = { "Coquette 2",40,150000,"cars" },
	["deluxo"] = { "Deluxo",40,100,nil },
	["fagaloa"] = { "Fagaloa",80,300000,"cars" },
	["feltzer3"] = { "Feltzer 3",40,100,nil },
	["gt500"] = { "Gt500",40,250000,"cars" },
	["infernus2"] = { "Infernus 2",20,250000,"cars" },
	["jb700"] = { "Jb700",30,200000,"cars" },
	["mamba"] = { "Mamba",50,240000,"cars" },
	["manana"] = { "Manana",70,120000,"cars" },
	["michelli"] = { "Michelli",40,160000,"cars" },
	["monroe"] = { "Monroe",40,100,nil },
	["peyote"] = { "Peyote",40,100,nil },
	["pigalle"] = { "Pigalle",40,100,nil },
	["rapidgt3"] = { "Rapidgt 3",40,190000,"cars" },
	["retinue"] = { "Retinue",40,100,nil },
	["savestra"] = { "Savestra",40,200000,"cars" },
	["stinger"] = { "Stinger",40,100,nil },
	["stingergt"] = { "Stingergt",40,100,nil },
	["stromberg"] = { "Stromberg",40,100,nil },
	["swinger"] = { "Swinger",40,100,nil },
	["torero"] = { "Torero",40,100,nil },
	["tornado"] = { "Tornado",70,140000,"cars" },
	["tornado2"] = { "Tornado 2",60,160000,"cars" },
	["tornado3"] = { "Tornado 3",40,100,nil },
	["tornado4"] = { "Tornado 4",40,100,nil },
	["tornado5"] = { "Tornado 5",60,250000,"cars" },
	["tornado6"] = { "Tornado 6",40,100,nil },
	["turismo2"] = { "Turismo 2",30,250000,"cars" },
	["viseris"] = { "Viseris",40,100,nil },
	["z190"] = { "Z190",40,100,nil },
	["ztype"] = { "Ztype",40,100,nil },
	["cheburek"] = { "Cheburek",50,150000,"cars" },
	["adder"] = { "Adder",20,500000,"cars" },
	["autarch"] = { "Autarch",40,100,nil },
	["banshee2"] = { "Banshee 2",20,300000,"cars" },
	["bullet"] = { "Bullet",40,100,nil },
	["cheetah"] = { "Cheetah",40,100,nil },
	["cyclone"] = { "Cyclone",20,800000,"cars" },
	["entity2"] = { "Entity 2",40,100,nil },
	["entityxf"] = { "Entity XF",20,400000,"cars" },
	["fmj"] = { "Fmj",40,100,nil },
	["gp1"] = { "Gp1",40,100,nil },
	["infernus"] = { "Infernus",40,100,nil },
	["italigtb"] = { "Italigtb",20,500000,"cars" },
	["italigtb2"] = { "Italigtb 2",20,540000,"cars" },
	["le7b"] = { "Le7b",40,100,nil },
	["nero"] = { "Nero",40,100,nil },
	["nero2"] = { "Nero 2",20,420000,"cars" },
	["osiris"] = { "Osiris",20,400000,"cars" },
	["penetrator"] = { "Penetrator",40,100,nil },
	["pfister811"] = { "Pfister 811",20,460000,"cars" },
	["prototipo"] = { "Prototipo",40,100,nil },
	["reaper"] = { "Reaper",40,100,nil },
	["sc1"] = { "Sc1",40,100,nil },
	["scramjet"] = { "Scramjet",40,100,nil },
	["sheava"] = { "Sheava",20,460000,"cars" },
	["sultanrs"] = { "Sultan RS",30,400000,"cars" },
	["t20"] = { "T20",20,500000,"cars" },
	["taipan"] = { "Taipan",20,500000,"cars" },
	["tempesta"] = { "Tempesta",20,520000,"cars" },
	["tezeract"] = { "Tezeract",20,800000,"cars" },
	["turismor"] = { "Turismo R",40,100,nil },
	["tyrant"] = { "Tyrant",40,100,nil },
	["tyrus"] = { "Tyrus",40,100,nil },
	["vacca"] = { "Vacca",40,100,nil },
	["vagner"] = { "Vagner",20,540000,"cars" },
	["vigilante"] = { "Vigilante",40,100,nil },
	["visione"] = { "Visione",20,600000,"cars" },
	["voltic"] = { "Voltic",40,100,nil },
	["voltic2"] = { "Voltic 2",40,100,nil },
	["xa21"] = { "Xa21",20,550000,"cars" },
	["zentorno"] = { "Zentorno",20,700000,"cars" },
	["armytanker"] = { "Armytanker",40,100,nil },
	["armytrailer"] = { "Armytrailer",40,100,nil },
	["armytrailer2"] = { "Armytrailer 2",40,100,nil },
	["baletrailer"] = { "Baletrailer",40,100,nil },
	["boattrailer"] = { "Boattrailer",40,100,nil },
	["cablecar"] = { "Cablecar",40,100,nil },
	["docktrailer"] = { "Docktrailer",40,100,nil },
	["freighttrailer"] = { "Freighttrailer",40,100,nil },
	["graintrailer"] = { "Graintrailer",40,100,nil },
	["proptrailer"] = { "Proptrailer",40,100,nil },
	["raketrailer"] = { "Raketrailer",40,100,nil },
	["tr2"] = { "Tr2",40,100,nil },
	["tr3"] = { "Tr3",40,100,nil },
	["tr4"] = { "Tr4",40,100,nil },
	["trflat"] = { "Trflat",40,100,nil },
	["tvtrailer"] = { "Tvtrailer",40,100,nil },
	["tanker"] = { "Tanker",40,100,nil },
	["tanker2"] = { "Tanker 2",40,100,nil },
	["trailerlarge"] = { "Trailerlarge",40,100,nil },
	["trailerlogs"] = { "Trailerlogs",40,100,nil },
	["trailersmall"] = { "Trailersmall",40,100,nil },
	["trailers"] = { "Trailers",40,100,nil },
	["trailers2"] = { "Trailers 2",40,100,nil },
	["trailers3"] = { "Trailers 3",40,100,nil },
	["trailers4"] = { "Trailers 4",40,100,nil },
	["freight"] = { "Freight",40,100,nil },
	["freightcar"] = { "Freightcar",40,100,nil },
	["freightcont1"] = { "Freightcont 1",40,100,nil },
	["freightcont2"] = { "Freightcont 2",40,100,nil },
	["freightgrain"] = { "Freightgrain",40,100,nil },
	["metrotrain"] = { "Metrotrain",40,100,nil },
	["tankercar"] = { "Rankercar",40,100,nil },
	["airtug"] = { "Airtug",40,100,nil },
	["caddy"] = { "Caddy",20,50000,"cars" },
	["caddy2"] = { "Caddy 2",20,50000,"cars" },
	["caddy3"] = { "Caddy 3",10,45000,"cars" },
	["docktug"] = { "Docktug",40,100,nil },
	["forklift"] = { "Forklift",40,100,nil },
	["mower"] = { "Mower",40,100,nil },
	["ripley"] = { "Ripley",40,100,nil },
	["sadler"] = { "Sadler",40,100,nil },
	["sadler2"] = { "Sadler 2",40,100,nil },
	["scrap"] = { "Scrap",40,100,nil },
	["towtruck"] = { "Towtruck",40,100,nil },
	["towtruck2"] = { "Towtruck 2",40,100,nil },
	["tractor"] = { "Tractor",40,100,nil },
	["tractor2"] = { "Tractor 2",40,100,nil },
	["tractor3"] = { "Tractor 3",40,100,nil },
	["utillitruck"] = { "Utillitruck",40,100,nil },
	["utillitruck2"] = { "Utillitruck 2",40,100,nil },
	["utillitruck3"] = { "Utillitruck 3",40,100,nil },
	["bison"] = { "Bison",40,100,nil },
	["bison2"] = { "Bison 2",40,100,nil },
	["bison3"] = { "Bison 3",40,100,nil },
	["bobcatxl"] = { "Bobcatxl",40,100,nil },
	["boxville"] = { "Boxville",40,100,nil },
	["boxville2"] = { "Boxville 2",40,100,nil },
	["boxville3"] = { "Boxville 3",40,100,nil },
	["boxville4"] = { "Boxville 4",20,2500,nil },
	["boxville5"] = { "Boxville 5",40,100,nil },
	["burrito"] = { "Burrito",60,140000,"cars" },
	["burrito2"] = { "Burrito 2",60,140000,"cars" },
	["burrito3"] = { "Burrito 3",60,140000,"cars" },
	["burrito4"] = { "Burrito 4",60,140000,"cars" },
	["burrito5"] = { "Burrito 5",40,100,nil },
	["camper"] = { "Camper",60,140000,"cars" },
	["gburrito"] = { "Gburrito",60,140000,"cars" },
	["gburrito2"] = { "Gburrito 2",10,5000,nil },
	["journey"] = { "Journey",40,100,nil },
	["minivan"] = { "Minivan",50,150000,"cars" },
	["minivan2"] = { "Minivan 2",50,175000,"cars" },
	["paradise"] = { "Paradise",50,150000,"cars" },
	["pony"] = { "Pony",50,150000,"cars" },
	["pony2"] = { "Pony 2",50,150000,"cars" },
	["rumpo"] = { "Rumpo",50,150000,"cars" },
	["rumpo2"] = { "Rumpo 2",50,150000,"cars" },
	["rumpo3"] = { "Rumpo 3",100,250000,"cars" },
	["speedo"] = { "Speedo",50,150000,"cars" },
	["speedo2"] = { "Speedo 2",40,100,nil },
	["speedo4"] = { "Speedo 4",40,100,nil },
	["surfer"] = { "Surfer",80,90000,"cars" },
	["surfer2"] = { "Surfer 2",80,90000,"cars" },
	["taco"] = { "Taco",20,2000,nil },
	["youga"] = { "Youga",40,100,nil },
	["youga2"] = { "Youga 2",40,100,nil }
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------

function vRP.itemBodyList(item)
	if itemlist[item] then
		return itemlist[item]
	end
end

function vRP.itemIndexList(item)
	if itemlist[item] then
		return itemlist[item].index
	end
end

function vRP.itemNameList(item)
	if itemlist[item] then
		return itemlist[item].name
	end
	return "Item Inexistente"
end

function vRP.itemTypeList(item)
	if itemlist[item] then
		return itemlist[item].type
	end
end

function vRP.itemAmmoList(item)
	if itemlist[item] then
		return itemlist[item].ammo
	end
end

function vRP.getItemWeight(item)
	if itemlist[item] then
		return itemlist[item].weight
	end
	return 0
end

function vRP.getInventory(user_id)
	local data = vRP.user_tables[user_id]
	if data then
		return data.inventory
	end
	return false
end

function vRP.getInventoryMaxWeight(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data.backpack == nil then
		data.backpack = 5
	end
	return data.backpack
end

function vRP.setBackpack(user_id,amount)
	local data = vRP.getUserDataTable(user_id)
	if data then
		data.backpack = amount
	end
end

function vRP.getInventoryWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k,v in pairs(inventory) do
			if vRP.itemBodyList(v.item) then
				weight = weight + vRP.getItemWeight(v.item) * parseInt(v.amount)
			end
		end
		return weight
	end
	return 0
end

function vRP.computeChestWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		if vRP.itemBodyList(k) then
			weight = weight + vRP.getItemWeight(k) * parseInt(v.amount)
		end
	end
	return weight
end

function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname then
				return parseInt(v.amount)
			end
		end
	end
	return 0
end

function vRP.swapSlot(user_id,slot,target)
	local data = vRP.getInventory(user_id)
	if data then
		local temp = data[tostring(slot)]
		data[tostring(slot)] = data[tostring(target)]
		data[tostring(target)] = temp
	end
end

function vRP.giveInventoryItem(user_id,idname,amount,notify,slot)
	local data = vRP.getInventory(user_id)
	if data and parseInt(amount) > 0 then
		if not slot then
			local initial = 0
			repeat
				initial = initial + 1
			until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
			initial = tostring(initial)
			
			if data[initial] == nil then
				data[initial] = { item = idname, amount = parseInt(amount) }
			elseif data[initial] and data[initial].item == idname then
				data[initial].amount = parseInt(data[initial].amount) + parseInt(amount)
			end

			if vRP.itemBodyList(idname) then
				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
			end
		else
			slot = tostring(slot)

			if data[slot] then
				if data[slot].item == idname then
					local oldAmount = parseInt(data[slot].amount)
					data[slot] = { item = idname, amount = parseInt(oldAmount) + parseInt(amount) }
				end
			else
				data[slot] = { item = idname, amount = parseInt(amount) }
			end

			if notify and vRP.itemBodyList(idname) then
				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
			end
		end
	end
end

function vRP.tryGetInventoryItem(user_id,idname,amount,notify,slot)
	local data = vRP.getInventory(user_id)
	if data then
		if not slot then
			for k,v in pairs(data) do
				if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
					v.amount = parseInt(v.amount) - parseInt(amount)

					if parseInt(v.amount) <= 0 then
						data[k] = nil
					end

					if vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
					end
					return true
				end
			end
		else
			local slot = tostring(slot)

			if data[slot] and data[slot].item == idname and parseInt(data[slot].amount) >= parseInt(amount) then
				data[slot].amount = parseInt(data[slot].amount) - parseInt(amount)

				if parseInt(data[slot].amount) <= 0 then
					data[slot] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
				return true
			end
		end
	end

	return false
end

function vRP.removeInventoryItem(user_id,idname,amount,notify)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
				v.amount = parseInt(v.amount) - parseInt(amount)

				if parseInt(v.amount) <= 0 then
					data[k] = nil
				end

				if vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end

				break
			end
		end
	end
end

local actived = {}
local activedAmount = {}
Citizen.CreateThread(function()
	while true do
		local fwTS = 500
		if actived then
			fwTS = 100 
			for k,v in pairs(actived) do
				if actived[k] > 0 then
					actived[k] = v - 1
					if actived[k] <= 0 then
						actived[k] = nil
					end
				end
			end
		end
		Citizen.Wait(fwTS)
	end
end)

function vRP.tryChestItem(user_id,chestData,itemName,amount,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then
			if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then

				if parseInt(amount) > 0 then
					activedAmount[user_id] = parseInt(amount)
				else
					activedAmount[user_id] = parseInt(items[itemName].amount)
				end

				local new_weight = vRP.getInventoryWeight(user_id) + vRP.getItemWeight(itemName) * parseInt(activedAmount[user_id])
				if new_weight <= vRP.getInventoryMaxWeight(user_id) then
					vRP.giveInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot)

					items[itemName].amount = parseInt(items[itemName].amount) - parseInt(activedAmount[user_id])

					if parseInt(items[itemName].amount) <= 0 then
						items[itemName] = nil
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end

function vRP.storeChestItem(user_id,chestData,itemName,amount,chestWeight,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local slot = tostring(slot)
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then

			if parseInt(amount) > 0 then
				activedAmount[user_id] = parseInt(amount)
			else
				local inv = vRP.getInventory(user_id)
				if inv[slot] then
					activedAmount[user_id] = parseInt(inv[slot].amount)
				end
			end

			local new_weight = vRP.computeChestWeight(items) + vRP.getItemWeight(itemName) * parseInt(activedAmount[user_id])
			if new_weight <= chestWeight then
				if vRP.tryGetInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot) then
					if items[itemName] ~= nil then
						items[itemName].amount = parseInt(items[itemName].amount) + parseInt(activedAmount[user_id])
					else
						items[itemName] = { amount = parseInt(activedAmount[user_id]) }
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end

AddEventHandler("vRP:playerJoin", function(user_id,source,name)
	local data = vRP.getUserDataTable(user_id)
	if not data.inventory then
		data.inventory = {}
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleGlobal()
	return vehglobal
end

function vRP.vehicleName(vname)
	if vehglobal[vname] then
		return vehglobal[vname][1]
	end
end

function vRP.vehicleChest(vname)
	if vehglobal[vname] then
		return vehglobal[vname][2]
	end
end

function vRP.vehiclePrice(vname)
	if vehglobal[vname] then
		return vehglobal[vname][3]
	end
end

function vRP.vehicleType(vname)
	if vehglobal[vname] then
		return vehglobal[vname][4]
	end
end
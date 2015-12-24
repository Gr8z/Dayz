/* GENERAL CONFIG */
	debug_mode = false;
	use_blacklist = false;
	blacklist = [
		[[11088,11932],[11815,10792]],	// Klen
		[[5533,8445],[6911,7063]],		// Stary
		[[3599,12157],[4585,11150]],	// Bash
		[[0,16000,0],[1000,-0,0]],		// Left
		[[0,16000,0],[16000,14580,0]]	// Top
	];
	trader_markers = (switch (dayz_instance) do {
		default {["Tradercity"]};
		case 1: {["Tradercitybor","Tradercitybash","Tradercityklen","Tradercitystary","boatsnwholesale_1","boatsnwholesale_1_1","AirplaneDealer","BoatDealer","HeroVendor","BoatDealer_1"]}; // need to edit
		case 2: {["Tradercitybor","Tradercitybash","Tradercityklen","Tradercitystary","boatsnwholesale_1","boatsnwholesale_1_1","AirplaneDealer","BoatDealer","HeroVendor","BoatDealer_1"]};
		case 3: {["TraderCIty4","FriendlyTraderCity","HeroVendor","WestWholesaler","EastWholesaler","BanditVendor","BlackMarket","NeutralTraderCIty3","NeutralTraderCIty2","NeutralTraderCity"]};
	});
/* END GENERAL CONFIG */

/* AI CONFIG */
	ai_clear_body = false;				// instantly clear bodies
	ai_clean_dead = true;				// clear bodies after certain amount of time
	ai_cleanup_time = 600;				// time to clear bodies in seconds
	ai_clean_roadkill = true; 			// clean bodies that are roadkills
	ai_roadkill_damageweapon = 0;		// percentage of chance a roadkill will destroy weapon AI is carrying
	
	ai_bandit_combatmode = "YELLOW";	// combatmode of bandit AI
	ai_bandit_behaviour = "COMBAT";		// behaviour of bandit AI
	
	ai_hero_combatmode = "YELLOW";		// combatmode of hero AI
	ai_hero_behaviour = "COMBAT";		// behaviour of hero AI
	
	ai_share_info	 = true;			// AI share info on player position
	ai_share_distance = 350;			// Distance from killed AI for AI to share your rough position
	
	ai_kills_gain	 = false;			// add kill to bandit/human kill score
	ai_humanity_gain = true;			// gain humanity for killing AI
	ai_add_humanity	 = 75;				// amount of humanity gained for killing a bandit AI
	ai_remove_humanity = 75;			// amount of humanity lost for killing a hero AI
	ai_special_humanity = 125;			// amount of humanity gain or loss for killing a special AI dependant on player alignment
	
	ai_skill_extreme = [["aimingAccuracy",0.75],["aimingShake",0.60],["aimingSpeed",0.80],["endurance",1.00],["spotDistance",0.80],["spotTime",0.80],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Extreme
	ai_skill_hard	 = [["aimingAccuracy",0.65],["aimingShake",0.60],["aimingSpeed",0.70],["endurance",1.00],["spotDistance",0.75],["spotTime",0.80],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Hard
	ai_skill_medium	 = [["aimingAccuracy",0.60],["aimingShake",0.40],["aimingSpeed",0.60],["endurance",1.00],["spotDistance",0.65],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Medium
	ai_skill_easy	 = [["aimingAccuracy",0.45],["aimingShake",0.30],["aimingSpeed",0.50],["endurance",1.00],["spotDistance",0.55],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Easy
	ai_skill_random	 = [ai_skill_extreme,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_easy];
	
	ai_static_useweapon = false;	// Allows AI on static guns to have a loadout 	
	ai_static_weapons = ["KORD_high_TK_EP1","DSHKM_Ins","M2StaticMG"];	// static guns
	
	ai_static_skills = false;	// Allows you to set custom array for AI on static weapons. (true: On false: Off) 
	ai_static_array	 = [["aimingAccuracy",0.15],["aimingShake",0.70],["aimingSpeed",0.65],["endurance",1.00],["spotDistance",0.70],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];
	
	ai_gear0		 = [["ItemBandage","ItemPainkiller","ItemSodaCoke","FoodCanBakedBeans"],["ItemKnife","ItemFlashlight","ItemMatchbox_DZE"]];
	ai_gear1		 = [["ItemBandage","ItemPainkiller"],["ItemMap","Binocular","ItemHatchet_DZE"]];
	ai_gear2		 = [["ItemBandage","ItemPainkiller","ItemMorphine","HandGrenade_west","ItemBloodbag"],["ItemKnife","ItemFlashlight","ItemMap"]];
	ai_gear3		 = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight","ItemToolbox"]];
	ai_gear4		 = [["ItemBandage","ItemBandage","FoodSteakCooked"],["ItemToolbox","ItemMap"]];
	ai_gear_random	 = [ai_gear0,ai_gear1,ai_gear2,ai_gear3,ai_gear4];	// Allows the possibility of random gear
	
	ai_wep_assault	 = ["M16A4_ACG","Sa58V_RCO_EP1","SCAR_L_STD_Mk4CQT","M8_sharpshooter","M4A1_HWS_GL_camo","SCAR_L_STD_HOLO","M4A3_CCO_EP1","M4A3_CCO_EP1","M4A1_AIM_SD_camo","M16A4","m8_carbine","BAF_L85A2_RIS_Holo","Sa58V_CCO_EP1","bizon","LeeEnfield","Remington870_lamp","Winchester1866","G36C","M4A3_RCO_GL_EP1","BAF_L85A2_RIS_ACOG","G36_C_SD_camo","MP5A5","AK_47_M","FN_FAL","M16A2GL","AKS_74_kobra","AKS_74_U","G36K_camo","RH_hk416","RH_hk416acog","RH_hk416aim","RH_hk416eotech","RH_hk416gl","RH_hk416glacog","RH_hk416glaim","RH_hk416gleotech","RH_hk416s","RH_hk416sacog","RH_hk416saim","RH_hk416sd","RH_hk416sdaim","RH_hk416sdeotech","RH_hk416sdgl","RH_hk416sdglaim","RH_hk416sdgleotech","RH_hk416seotech","RH_hk416sgl","RH_hk416sglacog","RH_hk416sglaim","RH_hk416sgleotech","RH_hk417","RH_hk417acog","RH_hk417aim","RH_hk417eotech","RH_hk417s","RH_hk417sacog","RH_hk417saim","RH_hk417sd","RH_hk417sdacog","RH_hk417sdaim","RH_hk417sdeotech","RH_hk417sdsp","RH_hk417seotech","RH_hk417sgl","RH_hk417sglacog","RH_hk417sglaim","RH_hk417sgleotech","RH_hk417sp","RH_m14","RH_m14acog","RH_m14aim","RH_m14eot"];	// Assault
	ai_wep_machine	 = ["RPK_74","MK_48_DZ","M249_EP1_DZ","Pecheneg_DZ","M240_DZ","MG36"];	// Light machine guns
	ai_wep_sniper	 = ["M14_EP1","SCAR_H_LNG_Sniper_SD","huntingrifle","SVD_CAMO","VSS_Vintorez","DMR_DZ","M40A3","SCAR_H_LNG_Sniper","SVD","vil_M110","vil_M110sd","vil_M110","vil_M110sd"];	// Sniper rifles
	ai_wep_random	 = [ai_wep_assault,ai_wep_assault,ai_wep_assault,ai_wep_sniper,ai_wep_machine];	// random weapon 60% chance assault rifle,20% light machine gun,20% sniper rifle
	ai_wep_launchers_AT = ["MAAWS","RPG18","Vil_RPG16","Vil_RPG29","Vil_RPG7d_PGO","Vil_RPG7V_PGO"];
	ai_wep_launchers_AA = ["Strela","Igla"];
	
	ai_packs		 = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TerminalPack_EP1","DZ_TK_Assault_Pack_EP1"];
	ai_hero_skin	 = ["Soldier_Sniper_PMC_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","Soldier_Bodyguard_AA12_PMC_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","Haris_Press_EP1_DZ"];
	ai_bandit_skin	 = ["Ins_Soldier_GL_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","GUE_Soldier_CO_DZ","BanditW1_DZ","BanditW2_DZ","Bandit1_DZ","Bandit2_DZ"];
	ai_special_skin	 = ["Functionary1_EP1_DZ"];
	ai_all_skin		 = [ai_hero_skin,ai_bandit_skin,ai_special_skin];
	ai_add_skin		 = false;
/* END AI CONFIG */

/* WAI MISSIONS CONFIG */
	wai_mission_markers 	= ["DZMSMajMarker","DZMSMinMarker","DZMSBMajMarker","DZMSBMinMarker"];
	wai_avoid_missions 		= 700;			// avoid spawning missions this close to other missions, these are defined in wai_mission_markers
	wai_avoid_traders 		= 700;			// avoid spawning missions this close to traders
	wai_avoid_town 			= 0;			// avoid spawning missions this close to towns
	wai_avoid_road 			= 0;			// avoid spawning missions this close to roads
	wai_avoid_water 		= 50;			// avoid spawning missions this close to water
	
	wai_mission_timer 		= [60,300];		// time between missions 1-5 minutes
	wai_mission_timeout 	= [600,1200]; 	// time each missions takes to despawn if inactive 10-20 minutes
	wai_timeout_distance 	= 800;			// if a player is this close to a mission then it won't time-out
	
	wai_clean_mission 		= true;			// clean all mission buildings after a certain period
	wai_clean_mission_time 	= 350;			// time after a mission is complete to clean mission buildings
	
	wai_mission_fuel 		= [30,70];		// fuel inside mission spawned vehicles [min%,max%]
	wai_vehicle_damage 		= [0,0];		// damages to spawn vehicles with [min%,max%]
	wai_keep_vehicles 		= true;			// save vehicles to database and keep them after restart
	
	wai_players_online 		= 0;
	wai_server_fps 			= 0;
	
	wai_crates_smoke 		= true;			// pop smoke on crate when mission is finished during daytime
	wai_crates_flares 		= true;			// pop flare on crate when mission is finished during nighttime
	
	wai_kill_percent 		= 0;			// percentage of AI players that must be killed at "crate" missions to be able to trigger completion
	
	wai_high_value 			= true;			// enable the possibility of finding a high value item (defined below crate_items_high_value) inside a crate
	wai_high_value_chance	= 90;			// chance in percent you find above mentioned item
	
	wai_enable_minefield	= false;		// enable minefields to better defend missions
	wai_use_launchers 		= true;			// add a rocket launcher to each spawned AI group
	wai_remove_launcher 	= true;			// remove rocket launcher from AI on death
	
	// Missions
	wai_missions = [				// ["mission filename",% chance of picking this mission],Make sure the chances add up to 100,or it will not be accurate percentages	
		["sniper_extraction",6],
		["medi_camp",7],
		["presidents_mansion",4],
		["weapon_cache",7],
		["ore_miners",5],
		["bandit_patrol",5],
		["terrorben",4],
		["farmer_give",5],
		["bunny_ranch",5]
	];
	
	// Missions
	wai_missions2 = [				// ["mission filename",% chance of picking this mission],Make sure the chances add up to 100,or it will not be accurate percentages	
		["black_hawk_crash",6],
		["armed_vehicle",7],
		["bandit_base",5],
		["captured_mv22",5],
		["ikea_convoy",6],
		["destroyed_ural",6],
		["disabled_milchopper",5],
		["disabled_civchopper",7],
		["mayors_mansion",5]
	];
	
	// Vehicle arrays
	armed_vehicle = [
		"LandRover_Special_CZ_EP1_DZE",
		"LandRover_MG_TK_EP1_DZE",
		"Offroad_DSHKM_Gue_DZE",
		"Pickup_PK_GUE_DZE",
		"Pickup_PK_INS_DZE",
		"Pickup_PK_TK_GUE_EP1_DZE",
		"UAZ_MG_TK_EP1_DZE",
		"GAZ_Vodnik_DZE",
		"HMMWV_M998A2_SOV_DES_EP1_DZE",
		"BTR90_HQ_DZE",
		"LAV25_HQ_DZE",
		"EOffroad_SPG9_TERROR"
	];
	armed_chopper = [
		"CH_47F_EP1_DZE",
		"Mi17_DZE",
		"UH1H_DZE",
		"MH60S_DZE",
		"UH60M_EP1_DZE",
		"AH6J_EP1_DZ",
		"UH1H_TK_EP1",
		"UH1Y_DZE",
		"Mi17_UN_CDF_EP1",
		"Mi171Sh_CZ_EP1"
	];
	civil_chopper = [
		"AH6X_DZ",
		"MH6J_DZ",
		"Mi17_Civilian_DZ",
		"Mi17_medevac_Ins",
		"Mi17_medevac_CDF",
		"AN2_DZ",
		"An2_2_TK_CIV_EP1",
		"An2_1_TK_CIV_EP1",
		"GNT_C185",
		"BAF_Merlin_DZE",
		"pook_H13_civ",
		"pook_H13_civ_yellow"
	];
	military_unarmed = [
		"GAZ_Vodnik_MedEvac",
		"HMMWV_Ambulance",
		"HMMWV_Ambulance_CZ_DES_EP1",
		"HMMWV_DES_EP1",
		"HMMWV_DZ",
		"HMMWV_M1035_DES_EP1",
		"LandRover_CZ_EP1",
		"LandRover_TK_CIV_EP1",
		"UAZ_CDF",
		"UAZ_INS",
		"UAZ_RU",
		"UAZ_Unarmed_TK_CIV_EP1",
		"UAZ_Unarmed_TK_EP1",
		"UAZ_Unarmed_UN_EP1"
	];
	cargo_trucks = [
		"Kamaz",
		"MTVR_DES_EP1",
		"Ural_CDF",
		"Ural_TK_CIV_EP1",
		"Ural_UN_EP1",
		"V3S_Open_TK_CIV_EP1",
		"V3S_Open_TK_EP1",
		"UralCivil2_DZE",
		"MTVR",
		"UralCivil_DZE",
		"KamazOpen_DZE",
		"V3S_Salvage_TK_GUE_EP1"
	];
	refuel_trucks = [
		"KamazRefuel_DZ",
		"MtvrRefuel_DES_EP1_DZ",
		"UralRefuel_TK_EP1_DZ",
		"V3S_Refuel_TK_GUE_EP1_DZ"
	];
	civil_vehicles = [
		"hilux1_civil_1_open_DZE",
		"hilux1_civil_2_covered_DZE",
		"hilux1_civil_3_open_DZE",
		"datsun1_civil_1_open_DZE",
		"datsun1_civil_2_covered_DZE",
		"datsun1_civil_3_open_DZE",
		"VWGolf",
		"SUV_Camo",
		"SUV_TK_CIV_EP1",
		"SUV_Blue",
		"SUV_Charcoal",
		"SUV_Green",
		"SUV_Orange",
		"SUV_Pink",
		"SUV_Red",
		"SUV_Silver",
		"SUV_White",
		"SUV_Yellow",
		"tractor",
		"tractorOld",
		"Ikarus",
		"S1203_TK_CIV_EP1",
		"S1203_ambulance_EP1",
		"policecar",
		"350z",
		"350z_red",
		"350z_kiwi",
		"350z_black",
		"350z_silver",
		"350z_blue",
		"350z_gold",
		"350z_mod"
	];

	// Dynamic box array
	crates_large	 = ["USVehicleBox","RUVehicleBox","TKVehicleBox_EP1"];
	crates_medium	 = ["USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1"];
	crates_small	 = ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"];
	
	crate_weapons_buildables	= ["MeleeSledge"];
	
	crate_tools		 			= ["ItemKeyKit","Binocular","Binocular_Vector","ItemCompass","ItemCrowbar","ItemEtool","ItemFishingPole","ItemFlashlightRed","ItemGPS","ItemHatchet_DZE","ItemKnife","ItemMachete","ItemMatchbox_DZE","ItemToolbox"];
	crate_tools_buildable		= ["ItemToolbox","ItemEtool","ItemCrowbar","ItemKnife"];
	crate_tools_sniper 			= ["ItemCompass","Binocular","Binocular_Vector","ItemGPS"];
	crate_items		 			= ["FoodNutmix","FoodPistachio","FoodMRE","ItemSodaPepsi","ItemBandage","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemGoldBar","ItemCanvas","ItemComboLock","ItemLightBulb","ItemSandbag","ItemTankTrap","ItemWire","PartEngine","PartFueltank","PartGeneric","PartGlass","PartPlankPack","PartVRotor","PartWheel","PartWoodPile","ItemTentOld","ItemSodaSmashT","FoodCanPowell","ItemJerryCan","ItemJerryCanEmpty","SmokeShell","SmokeShellGreen","SmokeShellRed","HandRoadFlare"];
	crate_items_high_value		= ["ItemBriefcase100oz","ItemVault","ItemKeyKit","ItemBriefcase50oz"];
	crate_items_food 			= ["ItemWaterbottle","FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaPepsi","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked","ItemSodaLVG","ItemSodaLemonade","ItemSodaSmashT","ItemSodaRabbit","FoodPumpkin","FoodCanOrlok","FoodCanPowell","FoodCanCurgon"];
	crate_items_buildables		= ["forest_large_net_kit","cinder_garage_kit",["PartPlywoodPack",5],"ItemSandbagExLarge5X","park_bench_kit","ItemComboLock",["CinderBlocks",4],"ItemCanvas",["ItemLightBulb",4],["ItemSandbag",5],["ItemTankTrap",5],["ItemWire",4],["MortarBucket",4],["PartPlankPack",4],"PartWoodPile"];
	crate_items_vehicle_repair	= ["PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel"];
	crate_items_medical 		= ["ItemWaterbottle","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemBandage","FoodCanFrankBeans","FoodCanPasta"];
	crate_items_chainbullets	= ["2000Rnd_762x51_M134","100Rnd_762x51_M240","100Rnd_127x99_M2","50Rnd_127x107_DSHKM","100Rnd_762x54_PK"];
	crate_items_sniper 			= [["ItemPainkiller",5],"Skin_Sniper1_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_GUE_Soldier_Sniper_DZ"];
	crate_items_president		= ["2000Rnd_762x51_M134","100Rnd_762x51_M240","100Rnd_127x99_M2","50Rnd_127x107_DSHKM","100Rnd_762x54_PK","ItemDocument","ItemBriefcase50oz","ItemBriefcase100oz"];
	crate_backpacks_all 		= ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_TerminalPack_EP1","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_CompactPack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
	crate_backpacks_large		= ["DZ_GunBag_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1","DZ_CivilBackpack_EP1"];
	crate_random 				= [crate_items,crate_items_food,crate_items_buildables,crate_items_vehicle_repair,crate_items_medical,crate_items_chainbullets];

	// Number of guns to spawn in ammo boxes 
	wai_mission_numberofguns = 3 + (round((random 3) + (random 4)));
	// classnames of guns to spawn in ammo boxes (only class weapons)
	ammo_crate_guns = [
		"M9SD",
		"M9",
		"Colt1911",
		"revolver_gold_EP1",
		"glock17_EP1",
		"AKS_74_UN_kobra",
		"AK_107_kobra",
		"AKS_GOLD",
		"FN_FAL",
		"M8_SAW",
		"AK_107_pso",
		"M60A4_EP1_DZE",
		"AK_107_GL_pso",
		"AK_107_GL_kobra",
		"AKS_74_kobra",
		"AKS_74_U",
		"Sa61_EP1",
		"M4A3_CCO_EP1",
		"AK_47_M",
		"M4A1_AIM_SD_camo",
		"M4A1_Aim",
		"M4A1",
		"M16A2",
		"M16A2GL",
		"M16A4_ACG",
		"M8_carbineGL",
		"M4A1_HWS_GL_camo",
		"m8_compact",
		"MP5A5",
		"VSS_vintorez",
		"M8_sharpshooter",
		"m8_holo_sd",
		"M40A3",
		"Mk_48_DZ",
		"G36_C_SD_eotech",
		"M16A4_GL",
		"M240_DZ",
		"M4A1_RCO_GL",
		"M249_EP1_DZ",
		"Pecheneg_DZ",
		"PK_DZ",
		"RPK_74",
		"BAF_LRR_scoped",
		"SCAR_L_CQC",
		"SCAR_L_CQC_CCO_SD",
		"SCAR_L_CQC_EGLM_Holo",
		"SCAR_L_CQC_Holo",
		"DMR_DZ",
		"SVD_CAMO",
		"Saiga12K",
		"MG36",
		"SVD",
		"SVD_des_EP1",
		"Sa58V_RCO_EP1",
		"Sa58V_CCO_EP1",
		"Sa58P_EP1",
		"BAF_L86A2_ACOG",
		"M14_EP1",
		"M4SPR",
		"bizon",
		"bizon_silenced",
		"LeeEnfield",
		"UZI_EP1",
		"M40A3",
		"M4A1_HWS_GL_SD_Camo",
		"huntingrifle",
		"MP5SD",
		"SCAR_H_CQC_CCO",
		"SCAR_H_STD_EGLM_Spect",
		"G36C",
		"G36K_camo",
		"G36A_camo",
		"SCAR_H_LNG_Sniper_SD",
		"SCAR_H_LNG_Sniper",
		"SCAR_H_CQC_CCO",
		"BAF_L85A2_RIS_Holo",
		"BAF_L85A2_RIS_SUSAT",
		"BAF_L85A2_RIS_ACOG",
		"BAF_L85A2_UGL_ACOG",
		"M1014",
		"Winchester1866",
		"Remington870_lamp",
		"Remington870",
		"Crossbow_DZ",
		"MR43",
		"Mk13_EP1",
		"KSVK_DZE",
		"FHQ_ACR_BLK_CCO","FHQ_ACR_BLK_CCO_F","FHQ_ACR_BLK_CCO_GL","FHQ_ACR_BLK_CCO_GL_F","FHQ_ACR_BLK_CCO_GL_SD","FHQ_ACR_BLK_CCO_GL_SD_F","FHQ_ACR_BLK_CCO_SD","FHQ_ACR_BLK_CCO_SD_F","FHQ_ACR_BLK_G33","FHQ_ACR_BLK_G33_F","FHQ_ACR_BLK_G33_GL","FHQ_ACR_BLK_G33_GL_F","FHQ_ACR_BLK_G33_GL_SD","FHQ_ACR_BLK_G33_GL_SD_F","FHQ_ACR_BLK_G33_SD","FHQ_ACR_BLK_G33_SD_F","FHQ_ACR_BLK_HAMR","FHQ_ACR_BLK_HAMR_F","FHQ_ACR_BLK_HAMR_GL","FHQ_ACR_BLK_HAMR_GL_F","FHQ_ACR_BLK_HAMR_GL_SD","FHQ_ACR_BLK_HAMR_GL_SD_F","FHQ_ACR_BLK_HAMR_SD","FHQ_ACR_BLK_HAMR_SD_F","FHQ_ACR_BLK_HWS","FHQ_ACR_BLK_HWS_F","FHQ_ACR_BLK_HWS_GL","FHQ_ACR_BLK_HWS_GL_F","FHQ_ACR_BLK_HWS_GL_SD","FHQ_ACR_BLK_HWS_GL_SD_F","FHQ_ACR_BLK_HWS_SD","FHQ_ACR_BLK_HWS_SD_F","FHQ_ACR_BLK_IRN","FHQ_ACR_BLK_IRN_F","FHQ_ACR_BLK_IRN_GL","FHQ_ACR_BLK_IRN_GL_F","FHQ_ACR_BLK_IRN_GL_SD","FHQ_ACR_BLK_IRN_GL_SD_F","FHQ_ACR_BLK_IRN_SD","FHQ_ACR_BLK_IRN_SD_F","FHQ_ACR_BLK_RCO","FHQ_ACR_BLK_RCO_F","FHQ_ACR_BLK_RCO_GL","FHQ_ACR_BLK_RCO_GL_F","FHQ_ACR_BLK_RCO_GL_SD","FHQ_ACR_BLK_RCO_GL_SD_F","FHQ_ACR_BLK_RCO_SD","FHQ_ACR_BLK_RCO_SD_F","FHQ_ACR_GL_BASE_F","FHQ_ACR_GL_BASE_L","FHQ_ACR_GL_SD_BASE_F","FHQ_ACR_GL_SD_BASE_L","FHQ_ACR_SD_BASE_F","FHQ_ACR_SNW_CCO","FHQ_ACR_SNW_CCO_F","FHQ_ACR_SNW_CCO_GL","FHQ_ACR_SNW_CCO_GL_F","FHQ_ACR_SNW_CCO_GL_SD","FHQ_ACR_SNW_CCO_GL_SD_F","FHQ_ACR_SNW_CCO_SD","FHQ_ACR_SNW_CCO_SD_F","FHQ_ACR_SNW_G33","FHQ_ACR_SNW_G33_F","FHQ_ACR_SNW_G33_GL","FHQ_ACR_SNW_G33_GL_F","FHQ_ACR_SNW_G33_GL_SD","FHQ_ACR_SNW_G33_GL_SD_F","FHQ_ACR_SNW_G33_SD","FHQ_ACR_SNW_G33_SD_F","FHQ_ACR_SNW_HAMR","FHQ_ACR_SNW_HAMR_F","FHQ_ACR_SNW_HAMR_GL","FHQ_ACR_SNW_HAMR_GL_F","FHQ_ACR_SNW_HAMR_GL_SD","FHQ_ACR_SNW_HAMR_GL_SD_F","FHQ_ACR_SNW_HAMR_SD","FHQ_ACR_SNW_HAMR_SD_F","FHQ_ACR_SNW_HWS","FHQ_ACR_SNW_HWS_F","FHQ_ACR_SNW_HWS_GL","FHQ_ACR_SNW_HWS_GL_F","FHQ_ACR_SNW_HWS_GL_SD","FHQ_ACR_SNW_HWS_GL_SD_F","FHQ_ACR_SNW_HWS_SD","FHQ_ACR_SNW_HWS_SD_F","FHQ_ACR_SNW_IRN","FHQ_ACR_SNW_IRN_F","FHQ_ACR_SNW_IRN_GL","FHQ_ACR_SNW_IRN_GL_F","FHQ_ACR_SNW_IRN_GL_SD","FHQ_ACR_SNW_IRN_GL_SD_F","FHQ_ACR_SNW_IRN_SD","FHQ_ACR_SNW_IRN_SD_F","FHQ_ACR_SNW_RCO","FHQ_ACR_SNW_RCO_F","FHQ_ACR_SNW_RCO_GL","FHQ_ACR_SNW_RCO_GL_F","FHQ_ACR_SNW_RCO_GL_SD","FHQ_ACR_SNW_RCO_GL_SD_F","FHQ_ACR_SNW_RCO_SD","FHQ_ACR_SNW_RCO_SD_F","FHQ_ACR_TAN_CCO","FHQ_ACR_TAN_CCO_F","FHQ_ACR_TAN_CCO_GL","FHQ_ACR_TAN_CCO_GL_F","FHQ_ACR_TAN_CCO_GL_SD","FHQ_ACR_TAN_CCO_GL_SD_F","FHQ_ACR_TAN_CCO_SD","FHQ_ACR_TAN_CCO_SD_F","FHQ_ACR_TAN_G33","FHQ_ACR_TAN_G33_F","FHQ_ACR_TAN_G33_GL","FHQ_ACR_TAN_G33_GL_F","FHQ_ACR_TAN_G33_GL_SD","FHQ_ACR_TAN_G33_GL_SD_F","FHQ_ACR_TAN_G33_SD","FHQ_ACR_TAN_G33_SD_F","FHQ_ACR_TAN_HAMR","FHQ_ACR_TAN_HAMR_F","FHQ_ACR_TAN_HAMR_GL","FHQ_ACR_TAN_HAMR_GL_F","FHQ_ACR_TAN_HAMR_GL_SD","FHQ_ACR_TAN_HAMR_GL_SD_F","FHQ_ACR_TAN_HAMR_SD","FHQ_ACR_TAN_HAMR_SD_F","FHQ_ACR_TAN_HWS","FHQ_ACR_TAN_HWS_F","FHQ_ACR_TAN_HWS_GL","FHQ_ACR_TAN_HWS_GL_F","FHQ_ACR_TAN_HWS_GL_SD","FHQ_ACR_TAN_HWS_GL_SD_F","FHQ_ACR_TAN_HWS_SD","FHQ_ACR_TAN_HWS_SD_F","FHQ_ACR_TAN_IRN","FHQ_ACR_TAN_IRN_F","FHQ_ACR_TAN_IRN_GL","FHQ_ACR_TAN_IRN_GL_F","FHQ_ACR_TAN_IRN_GL_SD","FHQ_ACR_TAN_IRN_GL_SD_F","FHQ_ACR_TAN_IRN_SD","FHQ_ACR_TAN_IRN_SD_F","FHQ_ACR_TAN_RCO","FHQ_ACR_TAN_RCO_F","FHQ_ACR_TAN_RCO_GL","FHQ_ACR_TAN_RCO_GL_F","FHQ_ACR_TAN_RCO_GL_SD","FHQ_ACR_TAN_RCO_GL_SD_F","FHQ_ACR_TAN_RCO_SD","FHQ_ACR_TAN_RCO_SD_F","FHQ_ACR_WDL_CCO","FHQ_ACR_WDL_CCO_F","FHQ_ACR_WDL_CCO_GL","FHQ_ACR_WDL_CCO_GL_F","FHQ_ACR_WDL_CCO_GL_SD","FHQ_ACR_WDL_CCO_GL_SD_F","FHQ_ACR_WDL_CCO_SD","FHQ_ACR_WDL_CCO_SD_F","FHQ_ACR_WDL_G33","FHQ_ACR_WDL_G33_F","FHQ_ACR_WDL_G33_GL","FHQ_ACR_WDL_G33_GL_F","FHQ_ACR_WDL_G33_GL_SD","FHQ_ACR_WDL_G33_GL_SD_F","FHQ_ACR_WDL_G33_SD","FHQ_ACR_WDL_G33_SD_F","FHQ_ACR_WDL_HAMR","FHQ_ACR_WDL_HAMR_F","FHQ_ACR_WDL_HAMR_GL","FHQ_ACR_WDL_HAMR_GL_F","FHQ_ACR_WDL_HAMR_GL_SD","FHQ_ACR_WDL_HAMR_GL_SD_F","FHQ_ACR_WDL_HAMR_SD","FHQ_ACR_WDL_HAMR_SD_F","FHQ_ACR_WDL_HWS","FHQ_ACR_WDL_HWS_F","FHQ_ACR_WDL_HWS_GL","FHQ_ACR_WDL_HWS_GL_F","FHQ_ACR_WDL_HWS_GL_SD","FHQ_ACR_WDL_HWS_GL_SD_F","FHQ_ACR_WDL_HWS_SD","FHQ_ACR_WDL_HWS_SD_F","FHQ_ACR_WDL_IRN","FHQ_ACR_WDL_IRN_F","FHQ_ACR_WDL_IRN_GL","FHQ_ACR_WDL_IRN_GL_F","FHQ_ACR_WDL_IRN_GL_SD","FHQ_ACR_WDL_IRN_GL_SD_F","FHQ_ACR_WDL_IRN_SD","FHQ_ACR_WDL_IRN_SD_F","FHQ_ACR_WDL_RCO","FHQ_ACR_WDL_RCO_F","FHQ_ACR_WDL_RCO_GL","FHQ_ACR_WDL_RCO_GL_F","FHQ_ACR_WDL_RCO_GL_SD","FHQ_ACR_WDL_RCO_GL_SD_F","FHQ_ACR_WDL_RCO_SD","FHQ_ACR_WDL_RCO_SD_F","FHQ_MSR_DESERT","FHQ_MSR_NV_DESERT","FHQ_MSR_NV_SD_DESERT","FHQ_MSR_SD_DESERT","FHQ_RSASS_SD_TAN","FHQ_RSASS_TAN","FHQ_XM2010_DESERT","FHQ_XM2010_NV_DESERT","FHQ_XM2010_NV_SD_DESERT","FHQ_XM2010_SD_DESERT","RH_browninghp",	"RH_g17","RH_acr","RH_acracog","RH_acraim","RH_acrb","RH_acrbacog","RH_acrbaim","RH_acrbeotech","RH_acrbgl","RH_acrbglacog","RH_acrbglaim","RH_acrbgleotech","RH_acreotech","RH_acrgl","RH_acrglacog","RH_acrglaim","RH_acrgleotech","RH_anac","RH_anacg","RH_bull","RH_ctar21","RH_ctar21glacog","RH_ctar21m","RH_ctar21mgl","RH_deagle","RH_Deagleg","RH_Deaglem","RH_Deaglemz","RH_Deaglemzb","RH_Deagles","RH_g17sd","RH_g18","RH_g19","RH_g19t","RH_hk416","RH_hk416acog","RH_hk416aim","RH_hk416eotech","RH_hk416gl","RH_hk416glacog","RH_hk416glaim","RH_hk416gleotech","RH_hk416s","RH_hk416sacog","RH_hk416saim","RH_hk416sd","RH_hk416sdaim","RH_hk416sdeotech","RH_hk416sdgl","RH_hk416sdglaim","RH_hk416sdgleotech","RH_hk416seotech","RH_hk416sgl","RH_hk416sglacog","RH_hk416sglaim","RH_hk416sgleotech","RH_hk417","RH_hk417acog","RH_hk417aim","RH_hk417eotech","RH_hk417s","RH_hk417sacog","RH_hk417saim","RH_hk417sd","RH_hk417sdacog","RH_hk417sdaim","RH_hk417sdeotech","RH_hk417sdsp","RH_hk417seotech","RH_hk417sgl","RH_hk417sglacog","RH_hk417sglaim","RH_hk417sgleotech","RH_hk417sp","RH_m14","RH_m14acog","RH_m14aim","RH_m14eot","RH_m1911","RH_m1911old","RH_m1911sd","RH_m1s","RH_m1sacog","RH_m1saim","RH_m1seot","RH_m1sshd","RH_m1ssp","RH_m1st","RH_m1stacog","RH_m1staim","RH_m1steot","RH_m1stshd","RH_m1stsp","RH_m21","RH_m9","RH_m93r","RH_m9c","RH_m9csd","RH_m9sd","RH_mas","RH_masacog","RH_masaim","RH_masb","RH_masbacog","RH_masbaim","RH_masbeotech","RH_masbsd","RH_masbsdacog","RH_masbsdaim","RH_masbsdeotech","RH_maseotech","RH_massd","RH_massdacog","RH_massdaim","RH_massdeotech","RH_mk2","RH_mk22","RH_mk22sd","RH_mk22v","RH_mk22vsd","RH_muzi","RH_p226","RH_p226s","RH_p38","RH_ppk","RH_python","RH_sc2","RH_sc2acog","RH_sc2aim","RH_sc2eot","RH_sc2shd","RH_sc2sp","RH_star21","RH_tec9","RH_tt33","RH_usp","RH_uspm","RH_uspsd","RH_vz61","vil_9a91","vil_9a91_c","vil_9a91_csd","vil_Abakan","vil_Abakan_gp","vil_Abakan_P29","vil_AEK1","vil_AEK2","vil_AeK_23","vil_AeK_3","vil_AeK_3_K","vil_AEK_GL","vil_AG3","vil_AG36","vil_AG36A2","vil_AG36KA4","vil_AG36KV","vil_AG3EOT","vil_ak12","vil_ak12_ap","vil_ak12_gp","vil_AKM","vil_AKMS","vil_AKMSB","vil_AKMS_GP25","vil_AKM_GL","vil_AKS_47","vil_AKS_74","vil_AKS_74p","vil_AKS_74p_45","vil_AKS_74p_gp","vil_AKS_74_gp","vil_AKs_74_u","vil_AKs_74_u45","Vil_AKS_74_UB","Vil_AKS_74_UN_kobra","vil_AK_101","vil_AK_103","vil_AK_105","Vil_AK_105_c","vil_AK_107","Vil_AK_107_c","vil_AK_47","vil_AK_47_49","vil_AK_47_m1","vil_AK_74","vil_AK_74m","vil_AK_74m_c","vil_AK_74m_EOT","vil_AK_74m_EOT_Alfa","vil_AK_74m_EOT_FSB","vil_AK_74m_EOT_FSB_45","vil_AK_74m_EOT_FSB_60","vil_AK_74m_gp","vil_AK_74m_gp_29","vil_AK_74m_k","vil_AK_74M_N","vil_AK_74m_p29","vil_AK_74M_PSO","vil_AK_74P","vil_AK_74_gp","vil_AK_74_N","vil_AK_nato_m1","vil_AK_nato_m80","vil_AMD","vil_AMD63","vil_APS","vil_apssd","vil_ASH82","vil_B_HP","vil_Fal","vil_Fal_Para","vil_FnMag","vil_G36a2","vil_G36CC","vil_G36E","vil_G36KA4","vil_G36KES","vil_G36KSK","vil_G36KSKdes","vil_G36KSKdesES","vil_G36KSKES","vil_G36KV3","vil_G36KV3Des","vil_G36KVA4","vil_G36KVZ","vil_G36VA4","vil_G36VA4Eot","vil_G3a2","vil_G3a3","vil_G3a4","vil_G3a4b","vil_G3an","vil_G3anb","vil_G3SG1","vil_G3sg1b","vil_G3TGS","vil_G3TGSb","vil_G3ZF","vil_G3zfb","vil_Galil","vil_Galil_arm","vil_Glock","vil_Glock_o","vil_Groza_GL","vil_Groza_HG","vil_Groza_SC","vil_Groza_SD","vil_HK33","vil_HK416_Aim","VIL_HK416_EDR","vil_HK416_EOT","vil_HK416_GL","vil_HK416_IS","vil_HK417s","vil_Insas","vil_Insas_lmg","vil_M110","vil_M110sd","vil_M14","vil_M14G","vil_M16A1","vil_M21","vil_M21G","vil_M240_B","vil_M249_Para","vil_M24b","VIL_M4","vil_m40a3","VIL_M4_aim","vil_M4_EOT","vil_M64","vil_M70","vil_M70B","vil_M76","vil_M91","vil_Mg3","vil_MG4","vil_MG4E","vil_Minimi","vil_MP5SD_EOTech","vil_MP5_EOTech","vil_MPi","vil_Panzerfaust3","vil_PK","vil_PKM","vil_PKM_N","vil_PKP","vil_PKP_EOT","vil_PMI","vil_PMI74S","vil_PMIS","vil_PSL1","Vil_PYA","vil_Rak74sgl","vil_RPD","Vil_RPG16","Vil_RPG29","Vil_RPG7d_PGO","Vil_RPG7V_PGO","vil_CG84T","vil_RPK","vil_RPK74","vil_RPK74M","vil_RPK74M_N","vil_RPK74M_P29","vil_RPK75","vil_RPK75_M72","vil_RPK75_Romania","Vil_RPO_A","vil_sg540","vil_sg542","vil_sg542f","vil_SKS","vil_SR25","vil_SR25SD","vil_SVDK","vil_SVD_63","vil_SVD_M","vil_SVD_N","vil_SVD_P21","vil_SVD_S","vil_SVU","vil_SVU_A","vil_SV_98","vil_SV_98_69","vil_SV_98_SD","vil_Tt33","vil_type88_1","vil_USP","vil_USP45","vil_USP45SD","vil_USPSD","vil_uzi","vil_uzimini","vil_uzimini_SD","vil_uzi_c","vil_uzi_SD","vil_VAL","vil_VAL_C","vil_VAL_N","vil_Vikhr","vil_vsk94","vil_VSS_N","vil_VSS_PSO","vil_zastava_m84","gms_k98","gms_k98zf39","gms_k98_knife","gms_k98_rg"
	];

	// Number of tools to spawn in ammo boxes 
	wai_mission_numberoftools = 1 + ceil(random 2);
	// classnames of tools to spawn in ammo boxes (only toolbelt items || weapon class Eg. "Chainsaw" || "ItemToolbox")
	ammo_crate_tools =[
		"ItemToolbox",
		"ItemKnife",
		"ItemCrowbar",
		"ItemEtool",
		"Binocular",
		"Binocular_Vector",
		"ItemCompass",
		"ItemFishingPole",
		"ItemFlashlightRed",
		"ItemGPS",
		"ItemMap",
		"ItemHatchet_DZE",
		"ItemMachete",
		"ItemMatchbox_DZE",
		"NVGoggles"
	];

	// Number of items to spawn in ammo boxes 
	wai_mission_numberofitems = ceil(random 8) + ceil(random 6);

	// classnames of items to spawn in ammo boxes (only type magazine will work here)
	ammo_crate_items =[
		"FoodNutmix",
		"FoodPistachio",
		"FoodMRE",
		"ItemSodaPepsi",
		"ItemBandage",
		"ItemSodaCoke",
		"FoodbaconCooked",
		"FoodCanBakedBeans",
		"FoodCanFrankBeans",
		"FoodCanPasta",
		"FoodCanSardines",
		"FoodchickenCooked",
		"FoodmuttonCooked",
		"FoodrabbitCooked",
		"ItemTroutCooked",
		"ItemTunaCooked",
		"ItemSeaBassCooked",
		"ItemAntibiotic",
		"ItemBloodbag",
		"ItemEpinephrine",
		"ItemHeatPack",
		"ItemMorphine",
		"ItemGoldBar",
		"ItemCanvas",
		"ItemLightBulb",
		"ItemSandbag",
		"ItemTankTrap",
		"ItemWire",
		"PartEngine",
		"PartFueltank",
		"PartGeneric",
		"PartGlass",
		"PartPlankPack",
		"PartVRotor",
		"PartWheel",
		"PartWoodPile",
		"ItemSodaLVG",
		"ItemSodaRabbit",
		"FoodCanFraggleos",
		"FoodCanPowell",
		"FoodCanCurgon",
		"ItemDocument",
		"ItemGoldBar",
		"ItemTentOld",
		"ItemTentDomed",
		"ItemJerryCan",
		"ItemJerryCanEmpty",
		"SmokeShell",
		"SmokeShellGreen",
		"SmokeShellRed",
		"HandRoadFlare"
	];
if(isServer) then {
		debug_mode		            = false;
		ai_clear_body 		        = false;
		ai_clean_dead 		        = true;
		ai_cleanup_time 		    = 600;
		ai_clean_roadkill		    = true;
		ai_roadkill_damageweapon	= 0;
		ai_bandit_combatmode		= "YELLOW";
		ai_bandit_behaviour		    = "COMBAT";
		ai_hero_combatmode		    = "YELLOW";
		ai_hero_behaviour		    = "COMBAT";
		ai_friendly_behaviour		= false;
		player_bandit		        = -5000;
		player_hero		            = 5000;
		ai_share_info		        = true;
		ai_share_distance		    = 300;
		ai_kills_gain		        = true;
		ai_humanity_gain		    = true;
		ai_add_humanity		        = 150;
		ai_remove_humanity		    = 150;
		ai_special_humanity		    = 300;
		ai_coin_award 		        = true;
		possible_cash_amounts 		= [342,165,422,211,234,209,200,83,321,252,254,41,489,341,74,69,174,221,82,206,484,177,76,229,136,116,34,182,436,459,30,392,151,48,367,269,411,499,42,50,126,444,430,389,385,313,447,197,458,339,75,87,161,218,471,380,435,213,309,260,440,89,237,365,163,195,485,401,105,483,406,496,360,420,348,317,224,301,112,207,312,453,457,332,364,150,139,261,363,362,338,417,119,137,280,371,393,275,427,71,410,16,103,11,450,94,396,14,333,263,498,279,322,140,355,319,256,258,52,2,85,101,45,462,493,171,29,193,219,329,138,327,78,18,361,404,157,488,429,267,461,340,419,481,383,73,93,142,196,244,243,374,25,376,476,202,325,164,386,108,283,68,494,388,57,296,336,115,428,235,255,159,310,451,390,328,307,190,175,247,395,287,377,241,214,106,21,349,246,81,28,154,495,245,239,356,320,467,90,43,253,438,31,478,324,22,215,210,344,437,442,490,350,352,23,405,205,65,122,343,337,353,145,114,97,59,351,61,141,268,53,266,487,460,370,128,60,5,379,46,366,77,281,425,323,298,118,482,38,162,472,413,271,166,4,473,289,227,466,20,95,291,220,99,477,306,486,125,201,36,176,32,468,465,192,300,251,233,98,455,335,357,293,15,331,443,13,290,416,187,409,189,326,124,308,294,181,421,441,382,173,272,216,17,424,144,149,240,346,49,408,407,62,64,70,345,33,284,107,445,378,412,152,400,497,185,238,242,303,91,179,188,373,315,96,203,86,470,148,277,100,439,398,414,232,26,491,286,273,479,292,500,330,120,168,146,311,58,178,225,262,12,434,259,228,433,79,316,6,44,264,274,133,248,304,257,121,475,169,172,198,40,183,278,384,397,423,160,134,391,399,170,212,72,469,217,110,132,208,127,372,223,84,456,55,285,56,194,135,415,249,231,375,54,184,111,236,431,250,270,167,51,1,314,27,8,448,158,7,359,88,230,39,358,155,129,449,305,67,186,480,104,102,299,10,204,297,147,381,180,368,302,318,463,334,347,492,369,113,24,47,276,295,191,156,37,117,394,418,464,282,199,123,80,226,403,9,387,265,143,35,354,63,454,109,402,446,130,153,131,452,288,222,474,92,432,3,19,426,66];
		ai_skill_extreme		    = [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["endurance",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Extreme
		ai_skill_hard		        = [["aimingAccuracy",0.80],["aimingShake",0.80],["aimingSpeed",0.80],["endurance",1.00],["spotDistance",0.80],["spotTime",0.80],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Hard
		ai_skill_medium		        = [["aimingAccuracy",0.60],["aimingShake",0.60],["aimingSpeed",0.60],["endurance",1.00],["spotDistance",0.60],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Medium
		ai_skill_easy		        = [["aimingAccuracy",0.40],["aimingShake",0.50],["aimingSpeed",0.50],["endurance",1.00],["spotDistance",0.50],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Easy
		ai_skill_random		        = [ai_skill_extreme,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_easy];
		ai_static_useweapon		    = true;
		ai_static_weapons		    = ["M2StaticMG"];
		ai_static_skills		    = false;
		ai_static_array		        = [["aimingAccuracy",0.20],["aimingShake",0.70],["aimingSpeed",0.75],["endurance",1.00],["spotDistance",0.70],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];
		ai_gear0		            = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight"]];
		ai_gear1		            = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight"]];
		ai_gear_random		        = [ai_gear0,ai_gear1];
		ai_wep_assault		        = ["M16A4_ACG","Sa58V_RCO_EP1","SCAR_L_STD_Mk4CQT","M8_sharpshooter","M4A1_HWS_GL_camo","SCAR_L_STD_HOLO","M4A3_CCO_EP1","M4A3_CCO_EP1","M4A1_AIM_SD_camo","M16A4","m8_carbine","BAF_L85A2_RIS_Holo","Sa58V_CCO_EP1"];	// Assault
		ai_wep_machine		        = ["RPK_74","MK_48_DZ","M249_EP1_DZ","Pecheneg_DZ","M240_DZ"];
		ai_wep_sniper		        = ["M14_EP1","SCAR_H_LNG_Sniper_SD","M110_NVG_EP1","SVD_CAMO","VSS_Vintorez","DMR_DZ","M40A3"];
		ai_wep_random		        = [ai_wep_assault,ai_wep_assault,ai_wep_assault,ai_wep_sniper,ai_wep_machine];
		ai_wep_launchers_AT		    = ["M136","RPG18","JAVELIN"];
		ai_wep_launchers_AA		    = ["Strela","Igla","STINGER"];
		ai_packs		            = ["DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		ai_hero_skin		        = ["FR_AC","FR_AR","FR_Corpsman","FR_GL","FR_Marksman","FR_R","FR_Sapper","FR_TL"];
		ai_bandit_skin		        = ["Ins_Soldier_GL_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","GUE_Soldier_CO_DZ","BanditW1_DZ","BanditW2_DZ","Bandit1_DZ","Bandit2_DZ"];
		ai_special_skin		        = ["Functionary1_EP1_DZ"];
		ai_all_skin		            = [ai_hero_skin,ai_bandit_skin,ai_special_skin];
		ai_add_skin		            = true;
		wai_mission_system		    = true;
		wai_mission_markers		    = ["DZMSMajMarker","DZMSMinMarker","DZMSBMajMarker","DZMSBMinMarker"];
		wai_avoid_missions		    = 1000;
		wai_avoid_traders		    = 1000;
		wai_avoid_town		        = 0;
		wai_avoid_road		        = 0;
		wai_avoid_water		        = 50;
		wai_mission_timer		    = [300,420];
		wai_mission_timeout		    = [600,900];
		wai_timeout_distance		= 1000;
		wai_clean_mission		    = true;
		wai_clean_mission_time		= 1800;
		wai_mission_fuel		    = [45,99];
		wai_vehicle_damage		    = [50,70];
		wai_keep_vehicles		    = true;
		wai_lock_vehicles		    = true;
		wai_crates_smoke		    = true;
		wai_crates_flares		    = true;
		wai_players_online		    = 5;
		wai_server_fps			    = 5;
		wai_kill_percent		    = 80;
		wai_high_value			    = true;
		wai_high_value2			    = true;
		wai_high_value_chance		= 100;
		wai_high_value_chance2		= 50;
		high_value_amounts 			= [1,2,3];
		high_value_amounts2 		= [1];
		wai_enable_minefield		= false;
		wai_use_launchers		    = false;
		wai_remove_launcher		    = true;
		wai_radio_announce		    = false;
		wai_hero_limit		        = 1;
		wai_bandit_limit		    = 1;
		
		wai_hero_missions = [
		//Green
		["Medi_Camp",10],
		["Ural",10],
		["Camel",10],
		["Bandit_Patrol",10],
		//Yellow
		["Armed_Vehicle",10],
		["Blackhawk_Crash",5],
		["Weapon_Cache",5],
		//Red
		["Bandit_Base",5],
		["Disabled_Milchopper",5],
		["Ikea_Convoy",5],
		["Merlin",5],
		["MV22",5],
		//Black
		["Jackal",5],
		["Little_Bird",5],
		["Pook_Gunship",5]
		];
		wai_bandit_missions	= [
		//Green
		["Camel",10],
		["Medical_Camp",10],
		["Ural",10],
		//Yellow
		["Armed_Vehicle",10],
		["Blackhawk_Crash",10],
		["Weapon_Cache",10],
		//Red
		["Hero_Base",5],
		["Ikea_Convoy",5],
		["Merlin",5],
		["MV22",5],
		["Sniper_Extraction",5],
		//Black
		["Jackal",5],
		["LittleBird",5],
		["Pook_Gunship",5]
		];
		
		armed_vehicle 		        = ["ArmoredSUV_PMC_DZE","GAZ_Vodnik_DZE","HMMWV_M1151_M2_CZ_DES_EP1_DZE","HMMWV_M998A2_SOV_DES_EP1_DZE","LandRover_MG_TK_EP1_DZE","LandRover_Special_CZ_EP1_DZE","Offroad_DSHKM_Gue_DZE","Pickup_PK_GUE_DZE","Pickup_PK_INS_DZE","Pickup_PK_TK_GUE_EP1_DZE","UAZ_MG_TK_EP1_DZE"];
		armed_chopper 		        = ["CH_47F_EP1_DZE","UH1H_DZE","Mi17_DZE","UH60M_EP1_DZE","UH1Y_DZE","MH60S_DZE"];
		civil_chopper 		        = ["AH6X_DZ","BAF_Merlin_DZE","MH6J_DZ","Mi17_Civilian_DZ"];
		military_unarmed 		    = ["GAZ_Vodnik_MedEvac","HMMWV_Ambulance","HMMWV_Ambulance_CZ_DES_EP1","HMMWV_DES_EP1","HMMWV_DZ","HMMWV_M1035_DES_EP1","LandRover_CZ_EP1","LandRover_TK_CIV_EP1","UAZ_CDF","UAZ_INS","UAZ_RU","UAZ_Unarmed_TK_CIV_EP1","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_UN_EP1"];
		cargo_trucks 		        = ["Kamaz","MTVR_DES_EP1","Ural_CDF","Ural_TK_CIV_EP1","Ural_UN_EP1","V3S_Open_TK_CIV_EP1","V3S_Open_TK_EP1"];
		refuel_trucks		        = ["KamazRefuel_DZ","MtvrRefuel_DES_EP1_DZ","UralRefuel_TK_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ"];
		civil_vehicles 		        = ["hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open_EP1","SUV_Blue","SUV_Camo","SUV_Charcoal","SUV_Green","SUV_Orange","SUV_Pink","SUV_Red","SUV_Silver","SUV_TK_CIV_EP1","SUV_White","SUV_Yellow"];
		crates_large		        = ["USVehicleBox"];
		crates_medium		        = ["USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1"];
		crates_small		        = ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"];
		crate_weapons_buildables	= ["ChainSaw"];
		crate_tools		            = ["ItemKeyKit","Binocular","Binocular_Vector","ItemCompass","ItemCrowbar","ItemEtool","ItemFishingPole","ItemFlashlightRed","ItemGPS","ItemHatchet_DZE","ItemKnife","ItemMachete","ItemMatchbox_DZE","ItemToolbox","NVGoggles"];
		crate_tools_buildable		= ["ItemToolbox","ItemEtool","ItemCrowbar","ItemKnife"];
		crate_tools_sniper		    = ["ItemCompass","Binocular","Binocular_Vector","NVGoggles","ItemGPS"];
		crate_items		            = ["FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemBandage","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","CinderBlocks","ItemCanvas","ItemComboLock","ItemLightBulb","ItemLockbox","ItemSandbag","ItemTankTrap","ItemWire","MortarBucket","PartEngine","PartFueltank","PartGeneric","PartGlass","PartPlankPack","PartVRotor","PartWheel","PartWoodPile"];
		crate_items_high_value		= ["ItemBriefcase100oz"];
		crate_high_value			= ["ItemVault"];
		crate_items_food		    = ["ItemWaterbottle","FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked"];
		crate_items_buildables		= ["forest_large_net_kit","cinder_garage_kit",["PartPlywoodPack",5],"ItemSandbagExLarge5X","park_bench_kit","ItemComboLock",["CinderBlocks",10],"ItemCanvas","ItemComboLock",["ItemLightBulb",5],"ItemLockbox",["ItemSandbag",10],["ItemTankTrap",10],["ItemWire",10],["MortarBucket",10],["PartPlankPack",5],"PartWoodPile"];
		crate_items_vehicle_repair	= ["PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel"];
		crate_items_medical		    = ["ItemWaterbottle","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemBandage","FoodCanFrankBeans","FoodCanPasta"];
		crate_items_chainbullets	= ["2000Rnd_762x51_M134","200Rnd_762x51_M240","100Rnd_127x99_M2","150Rnd_127x107_DSHKM"];
		crate_items_sniper		    = [["ItemPainkiller",5],"Skin_Sniper1_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_GUE_Soldier_Sniper_DZ"];
		crate_backpacks_all		    = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_TerminalPack_EP1","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_CompactPack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		crate_backpacks_large		= ["DZ_GunBag_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1","DZ_CivilBackpack_EP1"];
		crate_random		        = [crate_items,crate_items_food,crate_items_buildables,crate_items_vehicle_repair,crate_items_medical,crate_items_chainbullets];
		
		wai_static_mission_locs     = true;
		
		//Chernarus
		if (dayZ_instance == 2) then {
		wai_mission_locations = [
		[5064.08,3727.29,0],
		[4819.39,4722.03,0],
		[4288.51,3688.88,0],
		[3313.36,3392.4,0],
		[3872.91,2935.39,0],
		[3355.03,4164.66,0],
		[3899.8,5080.12,0],
		[3115.54,4839.46,0],
		[2028.78,5189.27,0],
		[2134.16,4159.47,0],
		[2683.34,3205.14,0],
		[3907.25,6500.18,0],
		[3581.97,7398.52,0],
		[2218.54,8096.69,0],
		[2883.68,8867.95,0],
		[3497.14,8844.18,0],
		[4249.84,8530.76,0],
		[4151.01,7919.15,0],
		[4183.22,9666.54,0],
		[3479.39,10768.8,0],
		[4770.73,11932,0],
		[5598.64,11152.8,0],
		[6607.1,10069.4,0],
		[5573.93,9350.05,0],
		[7166.96,9547.29,0],
		[6129.23,8784.35,0],
		[7188.7,8494.41,0],
		[7395.01,10651.6,0],
		[8022.4,12063.4,0],
		[8701.17,11311.8,0],
		[9636.38,12606.6,0],
		[9673.15,11622.1,0],
		[8448.21,10200.8,0],
		[5154.67,9262.37,0],
		[6225.02,8798.04,0],
		[5134.48,7897.92,0],
		[5822.12,7089.07,0],
		[7951.94,8205.82,0],
		[7682.79,7238.99,0],
		[6322.9,6690.02,0],
		[6028.26,5232.27,0],
		[5005.91,5264.97,0],
		[7072.33,5358.28,0],
		[8024.24,5131.75,0],
		[6710.3,3645.9,0],
		[5511.76,2642.89,0],
		[5379.05,3978.64,0],
		[9221.6,4071.89,0],
		[11667.1,5610.36,0],
		[10162.5,5900.15,0],
		[8433.23,6398.15,0],
		[12673.6,5809.96,0],
		[11147.4,4818.11,0],
		[12309.5,6854.2,0],
		[11133.7,7918.26,0],
		[11559.1,6558.09,0],
		[10068.9,7178.21,0],
		[10736.6,8601.22,0],
		[10359.6,8586.44,0],
		[9599.64,8542.95,0],
		[9088.71,9217.57,0],
		[11617.1,9588.16,0],
		[11995.4,10151.5,0],
		[10334.6,10855.1,0],
		[10761.6,9797.54,0],
		[13622.3,11182.2,0],
		[12890.3,11223.4,0],
		[12635.7,10819.6,0]
		];
		};
		//Taviana
		if (dayZ_instance == 1) then {
		wai_mission_locations = [
		[1603.06,7549.95,0],
		[5561.8,5936.16,0],
		[5210.23,6071.18,0],
		[4765.34,6256.14,0],
		[4440.3,6417.96,0],
		[5850.93,15860.5,0],
		[10862.8,18492.2,0],
		[14875,18136.5,0],
		[15376.6,14259.1,0],
		[16366.4,14829.4,0],
		[15772.1,8164.11,0],
		[15419.8,8656.33,0],
		[9227.02,2243.69,0],
		[22494.9,19811.1,0]
		];
		};
		//Napf
		if (dayZ_instance == 3) then {
		wai_mission_locations = [
		[14161,14136,0],
		[14184.3,14073.3,0],
		[14557.5,13822.9,0],
		[14504.7,13739.8,0],
		[8690.22,16362,0],
		[8702.41,16280.8,0],
		[6458.12,9776.98,0],
		[6553.54,9782.47,0],
		[2479.36,8318.09,0],
		[2468.32,8401.96,0],
		[12837.9,9748.02,0],
		[12799.1,9886.52,0],
		[14056.3,13973.6,0],
		[14137.6,14031.9,0],
		[14873.2,16211.3,0],
		[14909.5,16340.5,0],
		[8594.03,16124.6,0],
		[8540.55,16189.2,0],
		[6449.93,9732.47,0],
		[6381.16,9798.82,0],
		[2104.66,7567.42,0],
		[2117.45,7482.09,0],
		[14851,13835.7,0],
		[14785.4,13882.4,0],
		[9147.45,17294.9,0],
		[9159.25,17243.2,0],
		[14305.3,17067.4,0],
		[14380.3,17100,0],
		[18138.8,2097.05,0],
		[18380.5,2026.29,0],
		[4020.24,4389.06,0],
		[3861.86,4389.02,0],
		[1119.07,3435.97,0],
		[1521.79,2449.31,0],
		[1156.05,5038.85,0],
		[911.698,6210.19,0],
		[700.229,7198.09,0],
		[1332.85,12107.9,0],
		[4640.84,16650.9,0],
		[13097.9,19462.8,0],
		[16568.6,18244.4,0],
		[15825.5,13272.9,0],
		[15723.1,12954.3,0],
		[14699.2,14443.5,0],
		[14434.7,14329.6,0],
		[12313,15558,0],
		[9174.81,17664.6,0],
		[9043.79,17404.2,0],
		[8372.58,16237.7,0],
		[5297.4,16009,0],
		[2144.73,7840.98,0],
		[14566.6,2811.04,0],
		[14301.4,2801.55,0],
		[2782.51,7929.54,0],
		[3147.03,12202.7,0],
		[3291.35,12173.1,0],
		[10108.6,16515.4,0],
		[8412.35,17493.8,0],
		[5760.94,15248.3,0],
		[5747.7,15198.8,0],
		[10787.8,15851.3,0],
		[10829.8,15784.1,0],
		[9308.78,5384.54,0],
		[17218.2,5177.1,0],
		[14430.9,3195.92,0],
		[14334.8,3134.73,0],
		[14575.4,14234.6,0],
		[14487.5,13927.2,0],
		[14097.6,13913.8,0],
		[14937.1,16192.1,0],
		[8830.34,16231.3,0],
		[6097.9,10306,0],
		[6461.96,9694.94,0],
		[6215.82,9522.63,0],
		[7673.72,9290.59,0],
		[6521.78,9564.19,0],
		[3698.81,7876.06,0],
		[12979.3,9993.49,0],
		[14310,12564.3,0],
		[13918.8,14139.8,0],
		[14316.5,13207.3,0],
		[14023.1,14354.4,0],
		[9267.9,15809.4,0],
		[9167.82,15652.7,0],
		[7288.33,14788.5,0],
		[7515.69,14743.1,0],
		[6281.15,9884.48,0],
		[3250.78,7411.73,0],
		[10305.7,4871.25,0],
		[10614,4945.51,0],
		[12189.9,9346.08,0],
		[9655.02,2955.95,0],
		[5279.94,4493.4,0],
		[10962.1,9464.29,0],
		[16303,18452.1,0],
		[3547.8,11206.7,0],
		[4209.86,11476.9,0],
		[3989.43,11156.9,0],
		[4133.4,12496.4,0],
		[4649.34,12505,0],
		[8016.52,15985.9,0],
		[10721.6,16674.5,0],
		[14725.7,4939.47,0],
		[15903.1,2812.89,0],
		[10600.7,12059.9,0],
		[1199.65,12497.1,0],
		[8143.82,5099.84,0],
		[16642.6,5542.42,0],
		[12036,15230.7,0],
		[12102.9,15107.4,0],
		[9939.86,16439.7,0],
		[4310.93,14601.2,0],
		[6359.46,10234.9,0],
		[9065.52,1232.42,0],
		[10197,1611.54,0],
		[9454.52,1268.24,0],
		[11539.2,2740.35,0],
		[13869.4,3239.35,0],
		[14492.5,2878.56,0],
		[15727.9,2935.47,0],
		[16154.4,2994.39,0],
		[17676.5,2141.91,0],
		[18588.9,2496.84,0],
		[18013,2865.61,0],
		[17715.6,3550.39,0],
		[18189.8,3928.65,0],
		[17967.9,4324.23,0],
		[19112.1,4655.74,0],
		[19267.4,6089.08,0],
		[18567.2,6135.06,0],
		[18462.9,5819.08,0],
		[17561.8,5870.54,0],
		[17562.7,5406.63,0],
		[17562.7,5406.63,0],
		[17367.3,5153.35,0],
		[16530,4341.71,0],
		[16012.4,3126.39,0],
		[12987.9,4796.02,0],
		[13358.9,5032.63,0],
		[10176,5399.18,0],
		[10361.7,7133.9,0],
		[9766.26,8251.79,0],
		[11237.2,8531.68,0],
		[10979.2,9298.72,0],
		[9952.19,10189.9,0],
		[10484.3,10425.3,0],
		[10141,11855.4,0],
		[10591.6,12772.2,0],
		[10547.8,13663.2,0],
		[11278.9,14751.2,0],
		[12802.1,14745.3,0],
		[16246.3,18531.3,0],
		[14603.7,16732.9,0],
		[6412.8,14855.7,0],
		[7608.7,15094.7,0],
		[9498.9,15812.1,0],
		[14402.9,11429.6,0],
		[12967.7,11785.4,0],
		[17603.7,11890.1,0],
		[16562.4,12111.7,0],
		[15389.2,12320.6,0],
		[12972.2,7478.5,0],
		[5559.74,2240.5,9.0],
		[4485.45,3416.86,0],
		[4843.5,3442.89,0],
		[3476.45,5608.9,0],
		[4173.98,5977.31,0],
		[4479.52,6569.57,0],
		[8980.72,5770.86,0],
		[9200.41,5507.75,0],
		[10203.4,6946.39,0],
		[12578.3,8318.45,0],
		[15203.6,12610.6,0],
		[16475.2,15206.2,0],
		[11751.4,16152.9,0],
		[10732.3,15667.2,0],
		[13174.6,14472.2,0],
		[8212.34,14633.3,0],
		[6513.71,11200.7,0]
		];
		};
		static_missions	 = false;
		custom_per_world = false;
		WAIconfigloaded  = true;
};

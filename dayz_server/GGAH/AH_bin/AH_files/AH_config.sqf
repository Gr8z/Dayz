/**** Be sure not to have , after [ or before ]! Each PUID should be in quotes, and seperated by ,****/
	levelthree 	= //Add level 1 admins here (highest level).
	["0","0","0"];
	leveltwo 	= //Add level 2 admins here.
	["0","0","0"];
	levelone 	= //Add level 1 admins here (lowest level).
	["0","0","0"];
	_AH_scrhndlr 	= [];//leave blank
/**MISC SETTINGS**/
	_AH_CHAT 	=			//systemChat prefix.
	"[GG]";
	_AH_A2B 	= 125548;	//Required ArmA 2 OA Beta version
	_AH_DZE 	= true;		//Running DayZEpoch?
	_AH_SCRH 	= true; 	//Using script handler? REQ:AHSH_fnc.sqf
	_AH_ATP 	= true;		//Use anti-teleport? Prevents users from teleporting, admin TPS do not log.
	_AH_OPUID 	= false; 	//Use old ID system instead of steamID system?
	_AH_CUD 	= true; 	//Prevent createUnit group RE by moving server owned groups to players
	_AH_CUDHC 	= true; 	//Prevent createUnit group RE by moving server owned groups to headless client
	_AH_TERCHK 	= true;		//Use termination check for AH threads? (May prevent anti-anti-hack memory hacks).
/**MENU LOGGING**/
	_LG_ENBL 	= true;		//Log things into the menu? (adminlogs/hacklogs/keylogs/hit&kill logs)
	_LG_PVC 	= true;		//Use PVC to load logs? (Logs are only requested from server when the admin attemps to view them)
/**Commanding menus**/
	_CMD_DIS 	= false;		//Disable protection against commanding menus?
	_CMD_WLS 	= 			//Add CMD menus to this array, for scripts that use showCommandingMenu
	[
		"","RscMainMenu","RscMoveHigh","#WATCH","#WATCH0",
		"DoorManagement","Entercode","#USER:_keyMenu","#USER:DamiSpawn",
		"RscWatchDir","RscDisplayClassSelecter","RscDisplayGenderSelect",
		"RscDisplaySpawnSelecter","RscWatchMoreDir","#GETIN","RscStatus",
		"RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply",
		"RscCallSupport","#ACTION","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu",
		"BTC_Hud","PlotManagement","#USER:wardrobe","#USER:WardrobeDayZ","#USER:WardrobeCustom","#USER:WardrobeOverwatch","#USER:_keyMenu","#USER:_keyColorMenu","#USER:GGSpawn","#USER:VoteMenu",
		"#USER:ActionMenu","#USER:ActionMenua","#USER:SkyMenu","#USER:FogMenu","#USER:SkyMenu2","#USER:FogMenu2","#USER:_DeployMenu","#USER:MovementMenu","#USER:environment","#USER:DeployMenu","#USER:grass",
		"BTC_Hud","PlotManagement","#USER:EarMenu","#USER:GGgarageMenu","#USER:_GG_GMGDFP","#USER:AH_FL_menu"
	];
/**Whitelisted Displays**/
	/*	
		420420 	= Trader menu|
		420003 	= Refuel dialog
		420001 	= Give money dialog
		420000 	= Bank dialog
		118339 	= Combo change display
		118338 	= Safe change display
		50004	= Virtual garage friend menu
		50003 	= Virtual Garage
		41144 	= Combo lock
		20001 	= Skin trader
		6903 	= Spawn select
		6902 	= Gender select
		7331 	= Plot menu
		129 	= Diary
		106 	= Inventory menu
		64 		= Password menu
		-1 		= ArmAGUIs
	*/
	_WL_DIS = [			//Whitelist displays here!
		710420,
		420420,
		420003,
		420001,
		420000,
		118339,
		118338,
		71069,
		50004,
		50003,
		41144,
		38500,
		20001,
		6903,
		6902,
		7331,
		129,
		106,
		64,
		-1,106,2200,6900,6901,6902,6903,711194,666,667,65431,65432,65433,65434,65440,65441,65442,2800,3800,
		81000,88890,20002,20003,20004,20005,20006,55510,55511,55514,55515,55516,55517,55518,55519,555120,711197,711195
	];
/**Action menus**/
	_AM_DIS 	= true;		//Disable protection against actions menus? 
	_AM_WLS 	= 			//If it uses addAction here, it must go in this array! Single quotes required.
	[
		/*Custom actions - Remove if desired*/
		"ActionMenu","BIS_fnc_halo_action","churchie_check","churchie_defuse","churchie_rig_veh","horror_traders","manatee_craft_menu",
		"manatee_craft_menu_ind","manatee_craft_menu_sur","manatee_craft_menu_wea","nul","null","player_Cannibalism","silver_myCursorTarget",
		"stow_vehicle","s_clothes","s_player_codeObject","s_player_codeRemove","s_player_codeRemoveNet","s_player_craftZombieBaitBomb",
		"s_player_dance","s_player_debug","s_player_deleteCamoNet","s_player_deploybike","s_player_disarmBomb","s_player_elevator_call",
		"s_player_elevator_id","s_player_elevator_next","s_player_elevator_previous","s_player_elevator_select","s_player_elevator_upgrade",
		"s_player_elevator_upgrade_stop","s_player_enterCode","s_player_fillfuel210","s_player_hookahhit","s_player_knockout","s_player_netCodeObject",
		"s_player_packbike","s_player_packobj","s_player_recipeMenu","s_player_refuel","s_player_rest","s_player_smeltRecipes",
		"s_player_smelt_engineparts","s_player_smelt_fueltank","s_player_smelt_jerrycan","s_player_smelt_mainrotoraryparts",
		"s_player_smelt_scrapmetal","s_player_smelt_wheel","s_player_smelt_windscreenglass","s_player_suicide","s_player_takeOwnership",
		"s_player_teabag","s_player_upgradegyro","s_siphon","s_vehicle_refuelID",
		/*DayZ actions*/
		"dayz_myCursorTarget","NORRN_dropAction","r_player_actions","r_player_actions2","s_build_Hedgehog_DZ","s_build_Sandbag1_DZ","s_build_Wire_cat1",
		"s_player_boil","s_player_butcher","s_player_cook","s_player_deleteBuild","s_player_dragbody","s_player_dropflare","s_player_equip_carry",
		"s_player_fillfuel","s_player_fillfuel20","s_player_fillfuel5","s_player_fillwater","s_player_fillwater2","s_player_fire","s_player_fireout",
		"s_player_fishing","s_player_fishing_veh","s_player_flipveh","s_player_forceSave","s_player_gather","s_player_grabflare","s_player_holderPickup",
		"s_player_packtent","s_player_painkiller","s_player_removeActions","s_player_removeflare","s_player_repairActions","s_player_repair_crtl",
		"s_player_siphonfuel","s_player_sleep","s_player_stats","s_player_studybody",
		/*DayZ Epoch actions*/
		"s_halo_action","s_player_barkdog","s_player_calldog","s_player_callzombies","s_player_checkGear","s_player_combi","s_player_debuglootpos",
		"s_player_downgrade_build","s_player_feeddog","s_player_fillgen","s_player_followdog","s_player_fuelauto","s_player_fuelauto2",
		"s_player_heli_detach","s_player_heli_lift","s_player_information","s_player_lockUnlock_crtl","s_player_lockvault","s_player_madsci_crtl",
		"s_player_maintain_area","s_player_maintain_area_preview","s_player_maint_build","s_player_movedog","s_player_packvault","s_player_parts",
		"s_player_parts_crtl","s_player_pzombiesattack","s_player_pzombiesfeed","s_player_pzombiesvision","s_player_remove_build",
		"s_player_showname","s_player_showname1","s_player_speeddog","s_player_staydog","s_player_SurrenderedGear","s_player_tamedog",
		"s_player_towing","s_player_trackdog","s_player_unlockvault","s_player_upgrade_build","s_player_warndog","s_player_waterdog",
		/*DayZ Origins*/
		"s_player_flipvehiclelight","s_player_flipvehicleheavy","s_player_isCruse","s_player_otkdv",
		"s_player_cnbb","s_player_1bupd","s_player_packFdp",
		/*DayZ Overwatch*/
		"batteryLevelCheckRavenAct","batteryRechargeRavenAct","disassembleRavenAct","launchRavenAct","mavBaseStationActionName_00",
		"mavBaseStationActionName_001","mavBaseStationActionName_01","mavBaseStationActionName_02","mavBaseStationActionName_03",
		"mavBaseStationActionName_04","strobeRavenResetAct","strobeRavenTestAct","s_player_igniteTent","s_player_selfBloodbag","unpackRavenAct"
	];
/**Banned vehicles**/
	_BAD_VEHS 	= 			//Add vehicles you want to blacklist.
	[
		"AH1Z","AH64D","T90","AV8B2","UH1Y","Mi24_V","AAV","LAV25_DZ","Mi24_P","Mi24_D","KA52Black",
		"Su25_CDF","SU25_Ins","AH64D_EP1","M1A1","M1A1_TUSK_MG","T72","T72_INS","T72_RU","T72_CDF",
		"T72_Gue","BMP3","MLRS","T34","2S6M_Tunguska", "Su25_TK_EP1","BAF_Apache_AH1_D",
		"Mi17_rockets_RU","Mi171Sh_rockets_CZ_EP1","Mi24_D_TK_EP1","L39_TK_EP1","M1A1_US_DES_EP1","M1A2_US_TUSK_MG_EP1",
		"T72_TK_EP1","BMP2_TK_EP1","BMP2_UN_EP1","BMP2_HQ_TK_EP1","ZSU_TK_EP1",
		"AV8B","Su39","Ka52","AW159_Lynx_BAF",
		"M1128_MGS_EP1","M119_US_EP1","AH6J_EP1","Ka60_PMC","ZSU_INS",
		"M1A2_TUSK_MG","Ural_ZU23_CDF","GNT_C18F","GNT_C18E","GNT_C18T","BTR90_DZE","BTR90","LAV25_DZE",
		"LAV25","M1126_ICV_mk19_EP1","M1126_ICV_M2_EP1","M1130_CV_EP1","M1129_MC_EP1","M1133_MEV_EP1","M1135_ATGMV_EP1",
		"HMMWV_Avenger_DES_EP1","HMMWV_Avenger","Ural_ZU23_TK_EP1","Ural_ZU23_TK_GUE_EP1","Ural_ZU23_INS","Ural_ZU23_Gue",
		"GRAD_INS","GRAD_RU","GRAD_TK_EP1","BMP2_INS","BMP2_CDF","BRDM2_ATGM_CDF","BRDM2_ATGM_INS",
		"BMP2_Gue","BRDM2_ATGM_TK_EP1","ZSU_CDF","GAZ_Vodnik_HMG","MAZ_543_SCUD_TK_EP1","Offroad_SPG9_TK_GUE_EP1",
		"LandRover_SPG9_TK_EP1","LandRover_SPG9_TK_INS_EP1","D30_TK_GUE_EP1","D30_TK_INS_EP1","D30_TK_EP1","D30_CDF","D30_Ins",
		"D30_RU","Zu23_TK_INS_EP1","ZU23_Ins","Zu23_TK_EP1","ZU23_CDF","ZU23_Gue","ZU23_TK_GUE_EP1","Igla_AA_pod_TK_EP1",
		"Igla_AA_pod_East","Stinger_pod_US_EP1","TOW_TriPod_US_EP1","TOW_TriPod","Metis_TK_EP1","Metis",
		"SPG9_TK_GUE_EP1","Stinger_Pod","SPG9_CDF","SPG9_Ins","SPG9_Gue","SPG9_TK_INS_EP1","AGS_TK_INS_EP1","AGS_CZ_EP1",
		"MK19_TriPod_US_EP1","AGS_UN_EP1","2b14_82mm_CZ_EP1","2b14_82mm_GUE","2b14_82mm","M252","2b14_82mm_INS","2b14_82mm_CDF",
		"2b14_82mm_TK_GUE_EP","2b14_82mm_TK_EP1","M252_US_EP1","M252_US_EP1","BRDM2_Gue","BRDM2_CDF","BRDM2_INS",
		"HMMWV_M998_crows_MK19_DES_EP1","Chukar","Chukar_EP1","MQ0PredatorB","MQ0PredatorB_US_EP1",
		"Pchela1T","Ka137_PMC","Ka137_MG_PMC","Su34","Ka60_GL_PMC",
		"MLRS_DES_EP1","T34_TK_EP1","T34_TK_GUE_EP1","T55_TK_EP1","T55_TK_GUE_EP1",
		"M113Ambul_TK_EP1","M113Ambul_UN_EP1","M2A2_EP1",
		"M2A3_EP1","M6_EP1","BAF_FV510_D","BAF_FV510_W","A10","MQ9PredatorB_US_EP1","A10_US_EP1",
		"CYBP_Camel_rus","Civcar","Civcarbu","civcarbl","Civcarre","Civcarge","Civcarwh","Civcarsl",
		"CVPI_Patrol","CVPI_Trooper_Patrol","CVPI_TrooperSL_Patrol","CVPI_NYPD_Patrol","CVPI_HighwaySL_Patrol","CVPI_UnmarkedB_Patrol",
		"CVPI_UnmarkedG_Patrol","CVPI_LAPD_Patrol","CVPI_UnmarkedW_Patrol","CVPI_LAPDSL_Patrol","CVPI_NYPDSL_Patrol","Copcar","Copcarhw","Copcarswat",
		"M2StaticMG_US_EP1","DSHkM_Mini_TriPod","KORD_high","KORD","AGS_RU","MK19_TriPod","BAF_GMG_Tripod_D"
	];
/**Banned weapons**/
	_BAD_WEPS 	= 			//Add weapons you want to blacklist.
	[
		/*_DZ or commonly used on some servers*/
		"m107_TWS_EP1_DZ","M107_TWS_EP1_DZ",
		/*Overpoch TWS*/
		"PMC_AS50_TWS","M249_TWS_EP1_Small","m107_TWS_EP1_Small","m107_TWS_EP1","FHQ_XM2010_TWS_SD_DESERT",
		/*Other*/
		"1200Rnd_30x113mm_M789_HEDP","1350Rnd_30mmAP_A10","2000Rnd_23mm_AZP85","20Rnd_120mmHE_M1A2","22Rnd_125mmHE_T72",
		"2A14","2A38M","2A42","2A42_AI","2A46M","2A46MRocket","2A46M_AI","2A70","2A70Rocket","2A72","2B14",
		"30Rnd_122mmHE_D30","33Rnd_85mmHE","57mmLauncher","57mmLauncher_128","57mmLauncher_64","750Rnd_M197_AH1","80mmLauncher",
		"9M311Launcher","AA12_PMC","AALauncher_twice","AGS17","AGS30","AGS30_heli","AirBombLauncher","AKS_74_GOSHAWK","AKS_BASE",
		"AK_107_BASE","AK_BASE","AngelCookies","ARTY_8rnd_81mmHE_M252","AT10LauncherSingle","AT11LauncherSingle","AT13LauncherSingle",
		"AT2Launcher","AT5Launcher","AT5LauncherSingle","AT6Launcher","AT9Launcher","ATKMK44_ACR","ATKMK44_ACR_AI","AZP85",
		"BAF_AS50_scoped_Large","BAF_AS50_TWS","BAF_AS50_TWS_Large","BAF_GMG","BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4",
		"BAF_L17_40mm","BAF_L2A1","BAF_L7A2","BAF_L94A1","BAF_M240_veh","BAF_static_GMG","bat_swing","BikeHorn","BombLauncher","BombLauncherA10",
		"BombLauncherF35","bulk","CamelGrenades","CannonCore","CarHorn","Ch29Launcher","Ch29Launcher_Su34","CMFlareLauncher","Cobalt_File",
		"CRV7_FAT","CRV7_HEPD","CRV7_PG","CTWS","CTWS_AI","CZ805_A1_ACR","CZ805_A1_GL_ACR","CZ805_B_GL_ACR","D10","D10_AI","D30","D81","D81CZ",
		"D81CZ_AI","D81_AI","DSHKM","DT_veh","EvDogTags","EvKobalt","EvMap","EvMoney","EvMoscow","EvPhoto","FakeWeapon","FFARLauncher",
		"FFARLauncher_12","FFARLauncher_14","FlareLauncher","GAU12","300Rnd_25mm_GAU12","GAU8","GRAD","GrenadeCore","GrenadeLauncher","GrenadeLauncher_EP1","GSh23L",
		"GSh23L_L39","GSh301","GSh302","GyroGrenadeLauncher","HandGunBase","HeliBombLauncher","HellfireLauncher","HellfireLauncher_AH6","Igla_twice",
		"ItemBriefcase_base","ItemCore","ItemMap_Debug","KORD","Kostey_map_case","Kostey_notebook","Kostey_photos","KPVT","L85A2_base_BAF",
		"Laserdesignator_mounted","Launcher","LauncherCore","loot","m107","M107_TWS_EP1","M110_TWS_EP1","M119","M120","M134","M134_2","M168",
		"M16_base","M197","M2","M230","M240BC_veh","M240_veh","M240_veh_2","M240_veh_MG_Nest","M242","M242BC","M242BC_AI","M242_AI","M249_TWS_EP1",
		"M252","M256","M256_AI","M2BC","M32_heli","M3P","M621","M68","M68_AI","m8_base","m8_tws","m8_tws_sd","MaverickLauncher",
		"MeleeBaseBallBat","MeleeWeapon","MGun","MGunCore","MineE","MiniCarHorn","MissileLauncher","MK19","MK19BC","Mk82BombLauncher",
		"Mk82BombLauncher_6","MLRS","Moscow_Bombing_File","Pistol","PistolBase","PistolCore","PKT","PKTBC","PKTBC_veh","PKT_2","PKT_3",
		"PKT_high_AI_dispersion","PKT_high_AI_dispersion_tank","PKT_MG_Nest","PKT_veh","PMC_AS50_TWS_Large","PMC_documents","Put","R73Launcher",
		"R73Launcher_2","Rifle","RifleCore","RocketPods","S8Launcher","SCAR_Base","SCAR_H_Base","SCAR_H_STD_TWS_SD","SCAR_L_Base","SCAR_L_STD_EGLM_TWS",
		"SEARCHLIGHT","SGMT","SidewinderLauncher","SidewinderLauncher_AH1Z","SidewinderLauncher_AH64","SidewinderLauncher_F35","SmokeLauncher","SPG9",
		"SportCarHorn","StingerLauncher","StingerLauncher_4x","StingerLauncher_twice","TimeBomb","TOWLauncher","TOWLauncherSingle",
		"TruckHorn","TruckHorn2","TwinM134","TwinVickers","VikhrLauncher","WeaponExplosive","YakB","ZiS_S_53","ZiS_S_53_AI"
	];
/**Forbidden variables**/
	_BAD_VAR_DIS = false; //Disalbe bad variable scans?
	_BAD_VAR 	=
	[
		"ANTIHACKKICK","lel","fnx3","vars","PSwap","toLower_new","BCast","thfile","tlmadminrq","DeadCell_AHBLACK","name","carepkg","scrollAim","BlurExec",
		"sbpc","CALLRE","quake","menu_run","ZedProtect","actid1","vehicles1","MapClicked","MapClickedPosX","MouseUpEvent","scrollPlayerlist","keypress_xxx","D_AMEZ_COA",
		"envi","G_A_N_G_S_T_A","ZoombiesCar","timebypass","returnString_z","isori","tangrowth27","PVAH_AdminRequest","AH_OFF_LOL","b","DeadCell_AH_fillRE","qwak","infoe",
		"font","title_dialog","sexymenu_adds_Star","boolean_1","initre337","skype_option","bleh","magnetomortal","fnc_allunits","sbp","PV_IAdminMenuCode","PVAH_WriteLogRequest",
		"skype_img","Lhacks","Lpic","LtToTheRacker","Lexstr","take1","Called","epochExec","sdgff4535hfgvcxghn","adadawer24_1337","fsdddInfectLOL","W_O_O_K_I_E_ANTI_ANTI_HAX",
		"W_O_O_K_I_E_Car_RE","kW_O_O_K_I_E_Go_Fast","epchDeleted","lystobindkeys","lystoKeypress","toggle_1","shiftMenu","dbClicked","b_loop","re_loop","v_bowen","bowen",
		"melee_startAttack","asdasdasd","antihax2","PV_AdminMenuCode","AdminLoadOK","AdminLoadOKAY","PV_TMPBAN","T_o_g_g_l_e_BB","fixMenu","PV_AdminMenuCodee",
		"AdminPlayer","PVAH_AdminRequestVariable","epochBackpack","JME_Red","JME_MENU_Sub","JME_menu_title","JME_Sub","JME_OPTIONS","god","heal","grass",
		"fatguybeingchasedbyalion","night","day","infammo","nvg","thermal","Keybinds","fredtargetkill","loopfredtpyoutome","epochTp","AdminLst","BB_Pr0_Esp",
		"BBProEsp","epochMapMP","CALLRESVR","lazy_ILHA_is_lazy","trap","boomgoats","morphme","morph","blfor","blfor2","blfor3","rdfor","rdfor2","rdfor3",
		"napa","civ","runonce","keybindz","BB_Menu_Fnc","mod_select","scrollmenu","ly5t1c","JJMMEE_Swagger","Bobsp","Speed_Hack_cus","pList_star_peter_cus",
		"RGB","onKeyPress","neo_throwing","Menu_I_Run_Color_LP","Blue_I_Color_LP","Orange_I_Color_LP","Menu_I_On_Color_LP","Menu_I_Off_Color_LP","Speed_Hack_cus",
		"cus_SPEED_DOWN","pnc","SpyglassFakeTrigger","infammook","Tit_Choppertimer","Mystic_ESP","biggies_menu_open","MM_150","FND_fnc_select","hoenUSABLE",
		"changestats","FND_fnc_subs","FND_fnc_spawn_veh","bombs","GLASS911_Run","key_combos_ftw","MainScripts","AimAssistUC","arr1","init_main","ESP_Count",
		"eroticTxt","nec2","GetinPassenger","iaimon","ygurv1f2","BIGM","E3p","T3le","box","gmadmin","gmdadmin","ph4nt0mzEclick","ph4nt0mzParau",
		"ph4nt0mzParae","ph4nt0mzClick","ph4nt0b0mb","ph4nt0_j3susm0d3","ph4nt0_j3susm0d3D","fddsjfakioiweurlkjs","Ph4nt0mzBtbuildings","Ph4nt0mzBtmsg",
		"Ph4nt0mzBtunits","ph4nt0mzWait","ph4nt0mzMsg","ph4nt0mzMsgHandle","Ph4nt0n4t0r_Ph4nt0","Ph4nt0n4t0r_ph4_t3hm4n","Ph4nt0n4t0r_Ph4nt0mz","Ph4nt0mz",
		"ZeenatorrrEclick","ZeenatorrrClick","Ph4nt0_jessus","trentesp","tr3ntHudSize","tr3nHudDist","tr3nHudCp","tr3nHudCv","t123nt3SP","trentview","inflan",
		"ph4nt0Dayz","ph4nt0Epoch","Zen4ddammo","Zenbandit","Zenhero","ZendoRepair","Zenheal","v3hAh1z","v3hAmbuBMP","v3hBRDM","v3hARMEDSUV","v3hZU23","v3hMLRS",
		"v3hGRAD","v3hGMGJACKAL","v3hAH64D","v3hATV","v3hF35B","v3hA10","v3hChinook","v3hWildcat","v3hAV8B2","v3hBlackhawk","v3hT34","v3hT55","v3hT72",
		"v3hArmedLittleBird","v3hSUV","v3hHuey","v3hVenom","v3hLAV25","v3hStryker","v3hka52","v3hT90","v3hCamel","v3hKA60","v3hcrows","v3hGPK","v3hM1A1",
		"v3hBTR60","wormBomb","wormBomb2","wormPos","wormRound","haxx0rlek","MP_ESP_Var1esp","MP_ESP_Var1HudSize","MP_ESP_Var2HudDist","MP_ESP_Var2HudCp",
		"MP_ESP_Var2HudCv","BTC_liftHudId","tr3ntitudsize","l33thtmlv1","l33tJumenu","l33tv4html","l33tMain","l33thumanity","l33tCoin","l33tBoxes","l33tdistance",
		"l33tSecurity","l33tDN","l33tAllP","l33tv4html","iRapeKiduKnow","iRaPeclick","iRaPezClick","iRape_iRap3u","func_execOnServer","jayRE","Fanatic_InfiPass",
		"keybindings_xxx","zeus_star","B1g_B3n_target","viname","BB_nofatigue","First_PAGE","Get_in_D","i_t_s__m_e_o","smissles","whippyhtmlz","htmlz","htmlzV4",
		"whippyhtmlzV4","VehicleMarkers","WhippyV4MAPESP_MA","alsonotakeybind","Jay_g0d_M0de","MCheats_Clip_F","I_love_rustler_and_jet","inf3MMO","JayT3L3Eclick",
		"JayT3L3Click","espOn3","togESP4","NienUntoten","WhippyV4_PPAdd","shazbot","l33tMapESPLunsear","selectedPlayer","Lmenu1","manatee_craft_menu",
		"sosjfosjdfojsdfijojx","adminlite","adminlitez","antihacklite","inSub","scroll_m_init_star","markerCount","zombies","startmenu_star","LystoDone","MOD_EPOCH",
		"Admin_Lite_Menu","admingod","adminESPicons","fnc_MapIcons_infiSTAR","BIS_MPF_remoteExecutionServer4","adminadd","shnext","infiSTAR_fill_Weapons",
		"adminZedshld","adminAntiAggro","admin_vehicleboost","admin_low_terrain","admin_debug","admincrate","exstr","nlist","TPCOUNTER",
		"PVDZ_Hangender","fn_filter","vehiList","Remexec_Bitch","zeus_star","igodokxtt","tmmenu","AntihackScrollwheel","survcam","infiniteammo","PVAH_AHTEMPBAN",
		"lalf","toggle","iammox","telep","dayzlogin3","dayzlogin4","changeBITCHinstantly","antiAggro_zeds","BigFuckinBullets","abcdefGEH","adminicons",
		"fn_esp","aW5maVNUQVI_re_1","passcheck","isinsub","qodmotmizngoasdommy","ozpswhyx","xdistance","wiglegsuckscock","diz_is_real__i_n_f_i_S_T_A_R",
		"veh","unitList","list_wrecked","addgun","ESP","BIS_fnc_3dCredits_n","dayzforce_save","ViLayer","blackhawk_sex","activeITEMlist","items1",
		"adgnafgnasfnadfgnafgn","Metallica_infiSTAR_hax_toggled","activeITEMlistanzahl","xyzaa","iBeFlying","rem","DAYZ_CA1_Lollipops","HMDIR","vehC",
		"HDIR","carg0d","init_Fncvwr_menu_star","altstate","black1ist","ARGT_JUMP","ARGT_KEYDOWN","ARGT_JUMP_w","ARGT_JUMP_a","bpmenu","color_black",
		"p","fffffffffff","markPos","pos","TentS","VL","MV","monky","qopfkqpofqk","monkytp","pbx","nametagThread","spawnmenu","sceptile15","sandshrew",
		"mk2","i","j","v","fuckmegrandma","mehatingjews","TTT5OptionNR","zombieDistanceScreen","cargodz","R3m0te_RATSifni","wepmenu","admin_d0","RAINBOWREMEXECVEH",
		"omgwtfbbq","namePlayer","thingtoattachto","HaxSmokeOn","testIndex","g0d","spawnvehicles_star","kill_all_star","sCode","dklilawedve","peter_so_fly_CUS",
		"selecteditem","moptions","delaymenu","gluemenu","g0dmode","zeus","zeusmode","cargod","infiSTAR_fillHax","itemmenu","gmadmin","fapEsp","mapclick",
		"spawnweapons1","abcd","skinmenu","playericons","changebackpack","keymenu","godall","theKeyControl","infiSTAR_FILLPLAYER","whitelist","pfEpochTele",
		"custom_clothing","img","surrmenu","footSpeedIndex","ctrl_onKeyDown","plrshldblcklst","DEV_ConsoleOpen","executeglobal","cursoresp","Asdf","planeGroup",
		"teepee","spwnwpn","musekeys","dontAddToTheArray","morphtoanimals","aesp","LOKI_GUI_Key_Color","Monky_initMenu","tMenu","recon","curPos","pilot",
		"playerDistanceScreen","ihatelife","debugConsoleIndex","MY_KEYDOWN_FNC","pathtoscrdir","Bowen_RANDSTR","ProDayz","idonteven","walrein820","RandomEx",
		"TAG_onKeyDown","derp123","heel","rangelol","unitsmenu","xZombieBait","plrshldblckls","ARGT_JUMP_s","ARGT_JUMP_d","globalplaya","ALL_MAGS_TO_SEARCH",
		"shnmenu","xtags","pm","lmzsjgnas","vm","bowonkys","glueallnigga","hotkeymenu","Monky_hax_toggled","espfnc","playeresp","zany","dfgjafafsafccccasd",
		"atext","boost","nd","vspeed","Ug8YtyGyvguGF","inv","rspwn","pList","lolGG","T","bowonky","aimbott","Admin_Layout","markeresp","allMrk","MakeRandomSpace",
		"helpmenu","godlol","rustlinginit","qofjqpofq","invall","initarr","reinit","byebyezombies","admin_toggled","fn_ProcessDiaryLink","ALexc","DAYZ_CREATEVEHICLE",
		"Monky_funcs_inited","FUK_da_target","GGhakeplz","GGkeyz_veryhawt","mapopt","hangender","slag","jizz","kkk","ebay_har","sceptile279","TargetPlayer",
		"tell_me_more_infiSTAR","airborne_spawn_vehicle_infiSTAR","sxy_list_stored","advert_SSH","antiantiantiantih4x","Flare8","Flare7","SuperAdmin_MENU",
		"bl4ck1ist","keybinds","actualunit","mark_player","unitList_vec","yo2","actualunit_vec","typeVec","mark","r_menu","hfghfg","vhnlist","work","Intro",
		"yo3","q","yo4","k","cTargetPos","cpbLoops","cpLoopsDelay","Flare","Flare1","Flare2","Flare3","Flare4","Flare5","Flare6","kanghaskhan","palkia",
		"eExec_commmand","cockasdashdioh","fsdandposanpsdaon","antiloop","anti","spawn_explosion_target_ebay","whatisthis4","ratingloop_star","epochRemoteNukeAll",
		"PVAH_admin_rq","PVAH_writelog_rq","sandslash","muk","pidgeotto","charmeleon","pidgey","lapras","LYST1C_UB3R_L33T_Item","MathItem","fapLayer","cooldown",
		"raichu","infiSTAR_chewSTAR_dayz_1","infi_STAR_output","infi_STAR_code_stored","keybindings","keypress","menu_toggle_on","dayz_godmode","aiUnit",
		"MENUTITLE","wierdo","runHack","Dwarden","poalmgoasmzxuhnotx","ealxogmniaxhj","firstrun","ohhpz","fn_genStrFront","shazbot1","cip","Armor1","GMod",
		"kickable","stop","possible","friendlies","hacks","main","mapscanrad","maphalf","DelaySelected","SelectDelay","GlobalSleep","isAdmin","vehD","ALL_WEPS_TO_SEARCH",
		"jopamenu","ggggg","tlm","Listw","toggle_keyEH","infammoON","pu","chute","dayzforce_savex","PVDZ_AdminMenuCode","PVDZ_SUPER_AdminList","DarkwrathBackpack",
		"PVDZ_hackerLog","BP_OnPlayerLogin","material","mapEnabled","markerThread","addedPlayers","playershield","spawnitems1","sceptile27","Proceed_BB",
		"ESPEnabled","wpnbox","MMYmenu_stored","VMmenu_stored","LVMmenu_stored","BIS_MPF_ServerPersistentCallsArray","PV_CHECK","admin_animate1",
		"patharray","time","ZobieDistanceStat","infiSTARBOTxxx","keyspressed","fT","tpTarget","HumanityVal","yanma","absol","SimpleMapHackCount","keyp",
		"aggron","magazines_spawn","weapons_spawn","backpack_spawn","backpackitem_spawn","keybindings_exec","keypress_exec","MajorHageAssFuckinfBulletsDude",
		"Wannahaveexplosivesforbullets","TheTargetedFuckingPlayerDude","haHaFuckAntiHakcsManIbypasDatShit","aintNoAntiHackCatchMyVars","objMYPlayer",
		"Awwwinvisibilty","vehiclebro","wtfyisthisshithere","terrainchangintime","Stats","menu","ssdfsdhsdfh","onisinfiniteammobra","youwantgodmodebro",
		"yothefuckingplayerishere","Namey","sendmsg12","jkh","DELETE_THIS","move_forward","leftAndRight","forwardAndBackward","upAndDown","distanceFromGround",
		"hoverPos","hovering","bulletcamon","cheatlist","espOn","removegrass","timeday","infammo","norekoil","nocollide","esp2ez","fastwalk","entupautowalk",
		"BensWalker","dropnear","executer","killme","magnetmenu","loadmain","magnet","A11","loadMenu","refreshPlayers","ALREADYRAN","players","BigBenBackpack",
		"sendMessage","newMessage","W34p0ns","amm0","Att4chm3nt","F0od_Dr1nk","M3d1c4l","T0ol_it3ms","B4ckp4cks","It3m5","Cl0th1ng","walkloc","nwaf","cherno",
		"cherno_resident","cherno_resident_2","dubky","oaks","swaf","swmb","getX","PlayerShowDistance","M_e_n_u_2","colorme","keybindloop","Tractor_Time",
		"murkrow","noctowl","isExecuted","piloswine","AddPlayersToMap","markers","miltank","GearAdd","GearRemove","Malvsm","Malcars","malfly","keyForward",
		"PermDialogSelected","TempDialogSelected","AdminDialogList","pfKeygen","pfScanUnits","pfPickPlayer","pfshnext","pfnlist","pfselecteditem","pfshnmenu",
		"pfPlayerMonitor","pfPlayersToMonitor","pfShowPlayerMonitor","pfPlayerMonitorMutex","marker","JJJJ_MMMM___EEEEEEE_INIT_MENU","E_X_T_A_S_Y_Init_Menu",
		"monkaiinsalt","monkaiin","part88","adminKeybinds","PV_DevUlDs","fapEspGroup","Repair","RepairIT","rainbowTarget","rainbowTarget1","rainbowTarget2",
		"rainbowTarget3","letmeknow","VehicleMenue","Menue_Vehicle","my_anus_hurtz","life_no_injection","Tonic_has_a_gaping_vagina","teletoplr","telet",
		"ygurv1f2","BIGM","E3p","T3le","box","gmadmin","gmdadmin","ph4nt0mzEclick","ph4nt0mzParau","ph4nt0mzParae","ph4nt0mzClick","ph4nt0b0mb",
		"ph4nt0_j3susm0d3","ph4nt0_j3susm0d3D","fddsjfakioiweurlkjs","Ph4nt0mzBtbuildings","Ph4nt0mzBtmsg","Ph4nt0mzBtunits","ph4nt0mzWait","ph4nt0mzMsg",
		"ph4nt0mzMsgHandle","Ph4nt0n4t0r_Ph4nt0","Ph4nt0n4t0r_ph4_t3hm4n","Ph4nt0n4t0r_Ph4nt0mz","Ph4nt0mz","ZeenatorrrEclick","ZeenatorrrClick","Ph4nt0_jessus",
		"trentesp","tr3ntHudSize","tr3nHudDist","tr3nHudCp","tr3nHudCv","t123nt3SP","trentview","inflan","ph4nt0Dayz","ph4nt0Epoch","Zen4ddammo","Zenbandit",
		"Zenhero","ZendoRepair","Zenheal","v3hAh1z","v3hAmbuBMP","v3hBRDM","v3hARMEDSUV","v3hZU23","v3hMLRS","v3hGRAD","v3hGMGJACKAL","v3hAH64D","v3hATV","v3hF35B",
		"v3hA10","v3hChinook","v3hWildcat","v3hAV8B2","v3hBlackhawk","v3hT34","v3hT55","v3hT72","v3hArmedLittleBird","v3hSUV","v3hHuey","v3hVenom","v3hLAV25",
		"v3hStryker","v3hka52","v3hT90","v3hCamel","v3hKA60","v3hcrows","v3hGPK","v3hM1A1","v3hBTR60","wormBomb","wormBomb2","wormPos","wormRound","haxx0rlek",
		"MP_ESP_Var1esp","MP_ESP_Var1HudSize","MP_ESP_Var2HudDist","MP_ESP_Var2HudCp","MP_ESP_Var2HudCv","BTC_liftHudId","tr3ntitudsize","l33thtmlv1","l33tJumenu",
		"l33tv4html","l33tMain","l33thumanity","l33tCoin","l33tBoxes","l33tdistance","l33tSecurity","l33tDN","l33tAllP","l33tv4html","iRapeKiduKnow","iRaPeclick",
		"iRaPezClick","iRape_iRap3u","MoviNametmr2","input_text","zeloBomb","zeloFpos","manatee_craft_menu","Gashhey_ESP","_Gashhey114","P4nt0n4t0r_Ph4nt0",
		"Ph4nt0mzBomb","BTC_SganciaActionId","godall","BTC_liftHudId","fnc_temp","MainMenu","weaponBoxeriino","LuL1ee7FF1"
	];
/**Forbidden files**/
	_BAD_FILE_DIS = false; //Disable forbidden file scans? (May eliminate FPS drops/lag spikes).
	_BAD_FILE 	=
	[
		"anti-hack loaded! Errors","xoia24rfadfhw2\alishcahc.sqf","001.sqf","FinisTxTMenu\MainFile.sqf","FinisTxTMenu\cumpile\dahR_E.sqf",
        "WhippyV4\execv4.sqf","WhippyV4\Keybindiezz.sqf","V3\B1ND.sqf","l33tH4x0or\L33TMenu.sqf","run.sqf",
        "JHAction.sqf","V4Run.sqf","Whippymenu\activate.sqf","Whippymenu\keybindfz.sqf","WhippyV4\WHRSupplies.sqf",
        "oefexec.dll","stdafx.h","whippy\execute.sqf","MSSM\main.sqf","ScriptName.sqf","RommelV1\Rexecv1.sqf",
        "whippymenu\execute.sqf","ArmA2OAHackUCReleasebyCriibyy_[www.unknowncheats.me]_.dll","ArmA2OAHackUCReleasebyCriibyy.dll",
        "Mystic.sqf","debug_console","Xenos.exe","Xenos64.exe","hoen\sttart.sqf","hoen\compile\re.sqf",
        "freddiesexternalmenu\freddies_active.sqf","freddiesexternalmenuv8\freddies_active.sqf","Menu_Scripts\menu\menu_generate.sqf",
        "infiSTAR_[www.unknowncheats.me]_.dll","Missions\infiSTAR_[www.unknowncheats.me]_.dll","Deluxe_97\Deluxe.sqf",
        "Expansion\infiSTAR_[www.unknowncheats.me]_.dll","dll\infiSTAR_[www.unknowncheats.me]_.dll",
        "infiSTAR.dll","Missions\infiSTAR.dll","Expansion\infiSTAR.dll","dll\infiSTAR.dll",
        "VGLoader.exe","Missions\VGLoader.exe","Expansion\VGLoader.exe","dll\VGLoader.exe",
        "vgupdater.exe","Missions\vgupdater.exe","Expansion\vgupdater.exe","dll\vgupdater.exe",
        "0100100110\start.sqf","Missions\0100100110\start.sqf","Expansion\0100100110\start.sqf","dll\0100100110\start.sqf",
        "0100100110\Starts.sqf","Missions\0100100110\Starts.sqf","Expansion\0100100110\Starts.sqf","dll\0100100110\Starts.sqf",
        "epoch\epochMain.sqf","Missions\epochMain.sqf","Expansion\epochMain.sqf","dll\epochMain.sqf",
        "Hack-Dayz.exe","Missions\Hack-Dayz.exe","Expansion\Hack-Dayz.exe","dll\Hack-Dayz.exe","TM\keymenu.sqf",
        "DayZZ.exe","Missions\DayZZ.exe","Expansion\DayZZ.exe","dll\DayZZ.exe","OTHER\scripts\fly.sqf","TM\clearvar.sqf",
        "scrFuckOffInfistar1\start.sqf","epoch\targetall\fuckserver.sqf","boooooooobies.sqf","infiSTAR_GOLD\Startup.sqf",
        "settings26\init.sqf","settings26\start.sqf","settings26\load.sqf","settings26\go.sqf","Arma 2 OA Battleye Bypass.exe",
        "scroll\startmain.sqf","Exta_files\scrollMain.sqf","players\egeg.sqf","DCv3\dc.sqf","Supplys\giveloadout.sqf",
        "runme.dll","Missions\runme.dll","Expansion\runme.dll","dll\runme.dll","Scripts\runme.dll",
        "NR.exe","Missions\NR.exe","Expansion\NR.exe","dll\NR.exe","Scripts\NR.exe","wuat\start3.sqf",
        "activator_NR.exe","Missions\activator_NR.exe","Expansion\activator_NR.exe","dll\activator_NR.exe","Scripts\activator_NR.exe",
        "MedMen.exe","Missions\MedMen.exe","Expansion\MedMen.exe","dll\MedMen.exe","Scripts\MedMen.exe",
        "SpawnTool.exe","Missions\SpawnTool.exe","Expansion\SpawnTool.exe","dll\SpawnTool.exe","Scripts\SpawnTool.exe",
        "HVMRuntm.dll","Missions\HVMRuntm.dll","Expansion\HVMRuntm.dll","dll\HVMRuntm.dll","Scripts\HVMRuntm.dll",
        "D-DayZ.dll","Missions\D-DayZ.dll","Expansion\D-DayZ.dll","dll\D-DayZ.dll","Scripts\D-DayZ.dll",
        "ss3.dll","Missions\ss3.dll","Expansion\ss3.dll","dll\ss3.dll","Scripts\ss3.dll","epoch.sqf","epoch2.sqf","fixed.exe",
        "Scripts\darky.sqf","Scripts\explo.sqf","Scripts\explode_all.sqf","Scripts\explode.sqf","@Dayz_Namalsk\menu.sqf","@Dayz_Namalsk\HP.sqf",
        "Dayz_Namalsk\menu.sqf","Dayz_Namalsk\HP.sqf","youtube.dll","vg\Run.sqf","rus\mission_settings\create.sqf",
        "vg\Custommenu.sqf","vg\RunAH.sqf","vg\Startup.sqf","vg\exec.sqf","scr\Run.sqf","scr\Custommenu.sqf","scr\RunAH.sqf",
        "uhx_menu_first_ed\menu\logoblue.paa","Expansion\beta\dll\RayHook.dll","RayHook.dll","scr\Startup.sqf","scr\ahbypass.sqf",
        "cset.sqf","crawdaunt\crawdaunt.sqf","hangender\start.sqf","Scripts\ajmenu.sqf","wuat\screen.sqf","TM\menu.sqf","TM\screen.sqf",
        "Scripts\menu.sqf","crinkly\keymenu.sqf","ASM\startup.sqf","RSTMU\scr\startMenu.sqf","scr\startMenu.sqf","scr\STrial.sqf",
        "wuat\vet@start.sqf","TM\keybind.sqf","startup.sqf","start.sqf","startupMenu.sqf","xTwisteDx\menu.sqf","wuat\start.sqf","TM\startmenu.sqf",
        "infiSTAR_Menu\setup\startup.sqf","startMenu.sqf","custom.sqf","WiglegHacks\mainmenu.sqf","bowenisthebest.sqf",
        "Scripts\Menu_Scripts\empty.sqf","@mymod\Scripts\ajmenu.sqf","i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf",
        "yolo\w4ssup YoloMenu v2.sqf","Menus\infiSTAR_SEVEN\startup.sqf","Menus\battleHIGH_Menu\startup.sqf",
        "Missions\Menus\battleHIGH_Menu\startup.sqf","infiSTAR_EIGHT\startup.sqf","infiSTAR_SSH\startup.sqf",
        "TM\start.sqf","TM\DemonicMenu.sqf","Scripts\screen.sqf","Scripts\start.sqf","i_n_f_i_S_T_A_R___Menu\list.sqf",
        "battleHIGH_Menu\startup.sqf","infiSTAR_SEVEN\startup.sqf","Scripts\list.sqf","Scripts\mah.sqf","Menu\start.sqf",
        "Menu\startup.sqf","i_n_f_i_S_T_A_R.sqf","infiSTAR_Confin3d_edit\infiSTAR.sqf","infiSTAR_Confin3d_edit\startup.sqf",
        "YoloMenu Updated v6.sqf","Scripts\YoloMenu Updated v6.sqf","Scripts\startmenu.sqf","run.sqf","tm\starthack.sqf",
        "ASM\_for_keybinds\mystuff.sqf","wookie_wuat\startup.sqf","gc_menu\starten.sqf","sigdumper.dll","sigdumper.exe",
        "yolo\YoloMenu Updated v6.sqf","dll\Project1_[www.unknowncheats.me]_.exe","Scripts\Project1_[www.unknowncheats.me]_.exe",
        "gc_menu\uitvoeren.sqf","scr_wasteland\menu\initmenu.sqf","exec.sqf","infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf",
        "infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf","Demonic Menu\scr\startMenu.sqf","Demonic Menu\TM\STARTMENU.sqf",
        "scr\scr\keybinds.sqf","DayZLegendZ Scripts\mah.sqf","Pickled Menu 3.0\Scripts\ajmenu.sqf","invisible.sqf",
        "@mHlopchik\Menu_Scripts\menu\keybind\funmenu","RustleSTAR_Menu\menu\initmenu.sqf","RustleSTAR_Menu\setup\startup.sqf",
        "Scripts\mpghmenu.sqf","DevCon.pbo","DayZLegendZ Scripts\startMenu.sqf","DayZLegendZ Scripts\mah.sqf","EASYTM\start.sqf",
        "TotalInjector.exe","Rusterl.exe","drhack.dll","drhack.exe","DayZ-Injector cracked by vovanre.exe","dayz-injector.sqf",
        "DayZ-Injector.dll","HackMenu.exe","d3d199.dll","Scintilla.dll","DayZ-Injector.dll","DayZ-Injector v0.4.exe","CFF-Hook.sqf",
        "CFF-Hook.dll","skriptexecuter2.exe","PEWPEWPEWPEW.dll","Injector.exe","@SPX\Spawn Weapon.sqf","@SPX\3b.sqf","MK\Scripts\startup.sqf",
        "Obama Drone 0.5.2.1.exe","NewDayZ.dll","dll\MyHack.dll","Radar_NewR.exe","YoloHack.dll","BESecureJect.exe","YoloMenu.sqf",
        "hidden.exe","ssl3.dll","DayZNavigator.exe","Spawner.exe","EmptyDll.dll","yolo\startup.sqf","script loader Warrock.exe","infiSTAR.sqf",
        "VX DAYZ.exe","CE_Engine-v5.exe","kenhack\alltome.sqf","kenhack\SM\AH6X_DZ.sqf","kenhack\veshi.sqf","skriptexecuter2.ini","lcc.exe",
        "scripts\new.sqf","new.sqf","Dayz Hack v 1.0.exe","dayz cheat\lcc.exe","Scripts\@Hak_script\1.GLAVNOYE\000.sqf","cheater.sqf",
        "@Hak_script\1.GLAVNOYE\000.sqf","scripts\2dmap.sqf","2dmap.sqf","scripts\addweapon.sqf","addweapon.sqf","scripts\ammo 2.sqf",
        "ammo 2.sqf","DayZ-Injector v.0.2.2.exe","DayZ AimJunkies.exe","CheatDayZUniversal.exe","DayZ Private AIM,MAP,WH v1.2.exe",
        "AimJunkies.exe","FABISDayZLauncher.exe","gluemenu.sqf","DayZ Item spawner.exe","Dayz AIM ESP Shield.exe","ChernoNuke.sqf",
        "Scripts\Menu_Scripts\ChernoNuke.sqf","Menu_Scripts\ChernoNuke.sqf","Nuke.sqf","Scripts\Menu_Scripts\NWAFNuke.sqf",
        "NWAFNuke.sqf","Scripts\Menu_Scripts\newsbanner.sqf","newsbanner.sqf","Scripts\Menu_Scripts\ElektroNuke.sqf",
        "ElektroNuke.sqf","Scripts\Nuke.sqf","Scripts\different_AK\AKS-74 Kobra.sqf","Scripts\ESP\esp_TEST.sqf",
        "ESP\esp_TEST.sqf","esp_TEST.sqf","esp.sqf","Scripts\GodMode.sqf","GodMode.sqf","Scripts\God mode 1.sqf",
        "God mode 1.sqf","MapHack.sqf","infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf","@Hak_script\1.Teleport.sqf",
        "TheBatmanHack v2.6.exe","X-ray.exe","Project1.exe","Dayz injector-by vovan.exe","explode_all.sqf","explode.sqf",
        "Ubu5Ukg3.sqf","customizethis.sqf","Z__i_n_f_i_S_T_A_R__Z\Run.sqf","Missions\infiSTAR_SEVEN\startup.sqf",
        "Missions\infiSTAR_SSH\startup.sqf","renamethis.sqf","round2\runthis.sqf","safe scripts\gm.sqf","scr\exec.sqf",
        "Scripts\exec.sqf","scrollz\tp.sqf","ShadowyFaze\exec.sqf","infiSTAR_BLACK\Startup.sqf","lol.sqf","teststartup.sqf",
        "infiSTAR_NEW\Startup.sqf","DayZ_Settings.txt","Optix_DayZ_Auto.txt","ldr.cnf","Custom_folder\scrollmenu\Click to Tp.sqf",
        "Aspire Menu v.0.5\ALL TEH SCRIPTS!\esp.sqf","Aspire Menu v.0.5\ALL TEH SCRIPTS!\heal.sqf","SpawnTool.exe","LoganNZL\LoganNZL@execute.sqf",
        "LoganNZL\LoganNZL@start.sqf","LoganNZL@start.sqf","nightsuck.sqf","Project1_[www.unknowncheats.me]_.exe","wuat\RUN.sqf",
        "Missions\Project1_[www.unknowncheats.me]_.exe","Expansion\Project1_[www.unknowncheats.me]_.exe","wuat\Scripts.txt","wuat\start1.sqf",
        "GiveItTheDLL.exe","Missions\GiveItTheDLL.exe","Expansion\GiveItTheDLL.exe","dll\GiveItTheDLL.exe","Scripts\GiveItTheDLL.exe",
        "spawner.dll","Missions\spawner.dll","Expansion\spawner.dll","dll\spawner.dll","Scripts\spawner.dll","wuat\scripts\runMagicaly.sqf",
        "inject.bat","Missions\inject.bat","Expansion\inject.bat","dll\inject.bat","Scripts\inject.bat","wuat\screen2.sqf","wuat\standalonemenu.sqf",
        "spawner\GiveItTheDLL.exe","spawner\Missions\GiveItTheDLL.exe","spawner\Expansion\GiveItTheDLL.exe","spawner\dll\GiveItTheDLL.exe","spawner\Scripts\GiveItTheDLL.exe",
        "spawner\spawner.dll","spawner\Missions\spawner.dll","spawner\Expansion\spawner.dll","spawner\dll\spawner.dll","spawner\Scripts\spawner.dll",
        "spawner\inject.bat","spawner\Missions\inject.bat","spawner\Expansion\inject.bat","spawner\dll\inject.bat","spawner\Scripts\inject.bat",
        "infiSTAR_SSH\setup\startup.sqf","Supplys\BBstart.sqf","TM\666.sqf","vscripts\Startup.sqf","Ronnie\Startup.sqf","MyScripts\cargo.sqf",
        "BE\update.sqf","ScriptBasic.sqf","ScriptTelePlayer.sqf","Deluxe.sqf","Moving_Gun_Menu\start.sqf",
        "WRMoney.sqf","allover_[www.unknowncheats.me]_.dll","allover.dll","WhippyMenu\keybindfz.sqf","WhippyMenu\SqfFiles\esp.sqf",
        "WhippyMenu\SqfFiles\destroyb.sqf","WhippyMenu\SqfFiles\setviewdistance500m.sqf","WhippyMenu\SqfFiles\night.sqf","WhippyMenu\SqfFiles\unlock.sqf",
        "initFunctions.sqf","tbb4malloc_bi.dll","PRaZ\start.sqf","jh\Action.sqf","ArmA2OA_Extars\BB_menu_BB.sqf",
        "ArmA2OA_Extras\ben_ex.sqf","Ph4nt0\St3rt.sqf","Ph4nt0\ph4nt0b0mb.sqf","Ph4nt0\ph4nt0m3ss4g3.sqf","Ph4nt0\ph4nt0n00k3.sqf","Ph4nt0\ph4nt0teleall.sqf",
        "Ph4nt0\ph4nt03xpl0de.sqf","Ph4nt0\rrr333.sqf","Ph4nt0\ph4nt0g0d.sqf","Ph4nt0\ph4nt0m4p.sqf","Ph4nt0\ph4nt0sh13ld.sqf","Ph4nt0\ph4nt0t3p3.sqf",
        "Ph4nt0\ph4nt0v3hg0d.sqf","Ph4nt0\ph4nt03ssp.sqf","Ph4nt0\ph4nt04mm0.sqf","Ph4nt0\ph4nt0911.sqf","St3rt.sqf","ph4nt0b0mb.sqf","ph4nt0m3ss4g3.sqf",
        "ph4nt0n00k3.sqf","ph4nt0teleall.sqf","ph4nt03xpl0de.sqf","rrr333.sqf","ph4nt0g0d.sqf","ph4nt0m4p.sqf","ph4nt0sh13ld.sqf","ph4nt0t3p3.sqf",
        "ph4nt0v3hg0d.sqf","ph4nt03ssp.sqf","ph4nt04mm0.sqf","ph4nt0911.sqf","MP_Start.sqf","Movinggun_Public\MP_Start.sqf","public.sqf",
        "l33tH4x0or\Run.sqf","ArtyomV1\AtomicMenu.sqf","screen.sqf","TPH\menu.sqf","l33tH4x0or\execl33t.sqf","l33tH4x0or\l33tKey.sqf","iRape\iRap3.sqf",
        "iRap3.sqf","iRaPe\iRaP321.sqf","FinisTxTMenu\MainFile.sqf","MainFile.sqf","FinisTxTMenu\cumpile\dahR_E.sqf","dahR_E.sqf",
        "1Brief.sqf","50Brief.sqf","BuildingSupply.sqf","CheyTac.sqf","Custom.sqf","DMR.sqf","M107.sqf","esp.sqf","getfile.sqf","mapesp.sqf","ExecMe.sqf",
        "Movinggun_Origin_Pornhub\PornHub.sqf","jestersMENU\jester@start.sqf","1.sqf","Dta\nom.sqf","Movinggun_GunMenu2\GM_Start.sqf","GM_Start.sqf",
        "TBM\Run.sqf","Wedor.sqf","Newscroll.sqf",'ArmA2OA_Extras\ben_ex.sqf','God.sqf','Heal.sqf','HideFromAdmins.sqf','IAmmo.sqf','KillDestroy.sqf','ManN00k3ByD4M4st3rFini.sqf','ManN0Cl1pFini.sqf',
		'Teleport.sqf','Text3d.sqf','TimeDay.sqf','UnlockCarDoor.sqf','VehDelivery.sqf','WipeS.sqf','2.pbo','mahmenuv2\compile\n00k3.sqf','Ph4nt0\rrr333.sqf',
		'Gr8iSgAy\Grt333.sqf','rrr333.sqf','Grt333.sqf','rr333.sqf','rr33.sqf','TPH\menu.sqf','gp.sqf','TPH\start.sqf','myscript.sqf','l33tH4x0or\Run.sqf','execl33t.sqf','l33tKey.sqf',
		'briefcases.sqf','whippyv4\executev4.sqf','lando3sp.sqf','Z1\Run.sqf','l33tMoney.sqf','ArtyomV1\AtomicMenu.sqf','screen.sqf','ajmenu.sqf','wuat.sqf','TM\scripts\giveesp.sqf','esp.sqf',
		'giveesp.sqf','Movinggun_Public\MP_Start.sqf','public.sqf','MP_Start.sqf','dgasadsg_dasgadsg\hint.sqf','NUG.sqf','MAIN.sqf','C+N.sqf','Ph4nt0\St3rt.sqf','MahMenuV3\run.sqf','MahMenuV4\run.sqf',
		'DMR.sqf','MahMenuV2\compile\ESP.sqf','DarkLight\Stt3rtt.sqf','DarkLight\rrr333.sqf','TBM\Run.sqf','TBM\compile\re.sqf','C1\compile\re.sqf','MSSM\seinahax.sqf','hello.sqf',
		'Ph4nt0\ph4nt0sh131d.sqf','Templates_Settings.ini','Movinggun_GunMenu2\GM_Start.sqf','DZ\functions\initFunctions.sqf','\dz\modulesDayZ\scripts\player_queued.sqf','new\spawnme\items\1oz.sqf',
		'Mizzle\startup.sqf','Mizzle\exec.sqf'
	];
/**Disabled game functions**/
	_UN_FNC 	= 			//If a mod uses any of these functions, replace the function in the "s with DO_NOT_DISABLE.
	[
		"DoNotDisable_vehicles","DoNotDisable_playableUnits","DoNotDisable_group","DoNotDisable_allMissionObjects",
		"DoNotDisable_entities","DoNotDisable_screenToWorld","DoNotDisable_openMap",
		
		/*Unused malicious functions*/
		"createDiaryRecord","createTask","createSimpleTask","createDiaryLink","createTeam",
		"processDiaryLink","allUnits","buttonSetAction",
		"saveStatus","loadStatus","saveVar","rcallVarcode","addWeaponCargo","addMagazineCargo",
		"setVehicleAmmo","setVehicleAmmoDef","setWeaponReloadingTime","processInitCommands",
		"addMPEventHandler","addWaypoint","setWaypointStatements","BattleFieldClearance",
		"onMapSingleClick","inputAction",
		
		/*Unused BIS functions*/
		"BIS_fnc_spawnCrew","BIS_fnc_spawnGroup","BIS_fnc_help","BIS_fnc_3Dcredits",
		"BIS_fnc_crows","BIS_fnc_destroyCity","BIS_fnc_playVideo","BIS_fnc_spawnEnemy",
		"BIS_fnc_AAN","BIS_fnc_taskPatrol","BIS_fnc_taskDefend","BIS_fnc_taskAttack","BIS_fnc_supplydrop",
		"BIS_fnc_spotter","BIS_fnc_listPlayers","BIS_fnc_spawnvehicle","BIS_fnc_dirIndicator"
	];
/**Chat Commands**/
	_CC_CHTCMD 	= true;		//Use chat commands?
	/**VIEW DISTANCE**/
	_CC_VDIS 	= true;		//Use !viewdistance command? (Allows players to set a local view distance)
	_CC_MINVD 	= 100;		//Minimum view distance players can set.
	_CC_MAXVD 	= 10000;		//Maximum view distances players can set.
	/**INTRO MUSIC**/
	_CC_MUSIC 	= true; 	//Use !music command? (To allow disabling/enabling of intro music)
	/**BAD CHAT**/
	_CC_badChat = [
		"/item","/gunbox","/run","/backpack","/morph","/start","/exec","/menu","/skin","/ban","adminstart","admin_start",".ban",
		".sqf","bbhelp","bbammo","bbbox","bbdel","bbesp","bbgod","bbtp","bbunlock","/pesp","/pmarkers","/ptp","/pdel","/pammo",
		"/pnuke","/pgunbox","/pepochbox","/pteleportall","/pgod","t3l3all","n00k3","t3p3","4mm0","3sp","j3sus","v3hj3sus","m4rk3rs",
		"z3dz","inf4mm0","b0mb4ll","bombtrgt","/troll","/troll funces","/trollf","/trollfu","/trollfun","/trollfunk","/trollfunks",
		"/troll funks","/trollf","/trollfuc","/trollfuck","/trollfucku","/trollfuckup","/spawn100","iRap3","iRap3bt","iRap3eX","iRap3mrK",
		"iRap35P","iRap37A","iRap3d3l","/bot","/tp","/2ndtp","/playermarker","/safemarkers","/fini","/finikillall","/banall","/givecoins",
		"/itemspawn","/itemmassspawn","/vehspawn","/finitpall","/finiinfistar","/finiactivatere","/kickall","/finialldance",
		'/item','/gunbox','/run','/backpack','/morph','/start','/exec','/menu','/skin','adminstart','admin_start','.ban','.sqf','bbhelp','bbammo','bbbox','bbdel','bbesp','bbgod','bbtp','bbunlock',
		'/pesp','/pmarkers','/ptp','/pdel','/pammo','/pnuke','/pgunbox','/pepochbox','/pteleportall','/pgod','t3l3all','n00k3','t3p3','4mm0','3sp','j3sus','v3hj3sus','m4rk3rs','z3dz','inf4mm0','b0mb4ll','bombtrgt',
		'/troll','/troll funces','/trollf','/trollfu','/trollfun','/trollfunk','/trollfunks','/troll funks','/trollf','/trollfuc','/trollfuck','/trollfucku','/trollfuckup','/spawn100','irap3','irap3bt','irap3ex','irap3mrk',
		'irap35p','irap37a','irap3d3l','/bot','/2ndtp','/playermarker','/safemarkers','/fini','/finikillall','/banall','/givecoins','/itemspawn','/itemmassspawn','/vehspawn','/finitpall','/finiinfistar',
		'/finiactivatere','/kickall','/finialldance','/god','/fixvehicle','/time','/keybind','/esp','/backpack','/morph','/start','/exec','/menu','/skin','execu',
		'adminstart','admin_start','.ban','.sqf','bbhelp','bbammo','bbbox','bbdel','bbesp','bbgod','bbtp','bbunlock','/pesp','/pmarkers','/ptp','/pdel','/pammo','/pgunbox','/pepochbox',
		'/pteleportall','/pgod','t3l3all','n00k3','t3p3','4mm0','3sp','j3sus','v3hj3sus','m4rk3rs','z3dz','inf4mm0','b0mb4ll','bombtrgt','/god','pewpew','/teleport',
		'/pnuke','/nuke','/gunbox','/run','/esp','/getvehkey','/humanityplus','/humanityminus','/god','/delete','/botdmr','/botm107','/botcheytac',
		'/bot1brief','/bot50brief','/botbuilding','/botcustom','/2ndtp','/playermarker','/safeespmap','/infniteammo',
		'/heal','/time','/zshield','/code','/ccgcode','/destroy','/fixvehicle','/vehdelivery','/bigbullets','/humanityminuscurs',
		'/humanitypluscurs','/selfkill010','/keybind','/itemmassspawn','/giveammo','/getfile'
	];
	/**HELP CMD**/
	_CC_HTXT 	=			//Dynamic text that will be sent when a player types !HELP
	[
		"<t color='#f00000'size='1.5'>Help menu</t><br/>",
		"Type <t color='#D42436'>!help</t> to see this list.<br/>",
		"Type <t color='#D42436'>!nohud</t> to toggle the HUD.<br/>",
		"Type <t color='#D42436'>!pm</t> to send a private message to a player.<br/>",
		"Type <t color='#D42436'>!re</t> to send a private message to the last person to PM you or that you PMed.<br/>",
		"Type <t color='#D42436'>!ts3</t> to get our teamspeak IP.<br/>",
		"Type <t color='#D42436'>!rules</t> to see the server rules.<br/>",
		"Type <t color='#D42436'>!intro</t> to view the server intro.<br/>",
		"Type <t color='#D42436'>!online</t> to see all online players.<br/>",
		"Type <t color='#D42436'>!kill</t> to suicide.<br/>",
		"Type <t color='#D42436'>Press Y</t> to toggle earplugs.<br/>",
		"Type <t color='#D42436'>!viewdistance</t> to set your view distance (between <t color='#D42436'>"+str _CC_MINVD+"</t> and <t color='#D42436'>"+str _CC_MAXVD+"</t>).<br/>",
		"Type <t color='#D42436'>!nograss</t> to toggle grass on/off.<br/>",
		"Type <t color='#D42436'>!airdrop</t> to call an airdrop.<br/>",
		"Type <t color='#D42436'>!scan</t> to scan nearby players.<br/>",
		"Type <t color='#D42436'>!stop</t> to stop all animations.<br/>",
		"Type <t color='#D42436'>Right Alt Key</t> to open action Menu.<br/>",
		"Type <t color='#D42436'>Right Shift Key</t> to open group manager.<br/>",
		"Type <t color='#D42436'>Windows Key</t> to toggle group tags for your group.<br/>",
		"ANIMATIONS:<br/>",
		"<t color='#D42436'>!dance1</t>, <t color='#D42436'>!dance2</t>, <t color='#D42436'>!dance3</t>, <t color='#D42436'>!boxing</t>, <t color='#D42436'>!handstand</t>, <t color='#D42436'>!laydown</t>, <t color='#D42436'>!situps</t>, <t color='#D42436'>!pushups</t><br/>",
		"<t size='1'>Type <t color='#f00000'>!help</t> to hide this menu.</t><br/>"
	];
	/**Friend system**/
	_CC_uAHfls 	= false;
	_CC_fcmds 	= 
	'(_FL_onfriends+_FL_addfriend+_FL_delfriend+_FL_groupTags)';
	/**ANIMATIONS**/
	_CC_uanim 	= true;		//Allow use of animation chat commands?
	_CC_anims 	=			//Remove any animations you don''t want from here (Set to '[]' to disable).
	'(_dance1+_dance2+_dance3+_boxing+_hanstn+_laydwn+_situps+_pushup+_noanim)';
	/**RULES**/
	_CC_RULES 	= true;		//Use !rules command?
	_CC_RTXT 	=			//Message(s) that will be sent when a player types !RULES
	[
		"<t color='#f00000'size='1.5'>Server rules</t><br/>",
		"<t color='#D42436'>1</t>. No building near blacklisted buildings!<br/>",
		"<t color='#D42436'>2</t>. You may not build anywhere within 1000m of trader or trader cities<br/>",
		"<t color='#D42436'>3</t>. You may not build within 500m of any airfields or military bases. <br/>",
		"<t color='#D42436'>4</t>. No ramming in safe zone.<br/>",
		"<t color='#D42436'>5</t>. Exploiting the safe zone/God mode is not allowed.<br/>",
		"<t color='#D42436'>6</t>. NO EXPLOITING (This includes duping, exploiting bugs, exploiting trader mistakes, combat logging, etc)!<br/>",
		"<t color='#D42436'>7</t>. No voice on sidechat!<br/>",
		"<t color='#D42436'>8</t>. No harassing players!<br/>",
		"<t color='#D42436'>9</t>. No insulting admins or the server! Treat us how you want to be treated!<br/>",
		"<t color='#D42436'>10</t>. No advertising!<br/>",
		"<t color='#D42436'>11</t>. Use common sense!<br/>",
		"<t color='#D42436'>12</t>. Last, but not least, HAVE FUN!<br/>",
		"<t size='1'>Type <t color='#f00000'>!rules</t> to hide this menu.</t><br/>"
	];
	/**TEAMSPEAK IP**/
	_CC_TS3 	= true;		//Use !TS3 command?
	_CC_TSTXT 	=			//Message(s) that will be sent when a player types !TS3
	[
		"Our Teamspeak 3 Address is: TS.GhostzGamerz.com"
	];
/**Escape menu**/
	_ESC_MENU	= true;		//Modify ESC menu?
	_escTOP		=			//Text for esc header.
	"[GG] Ghostz Gamerz";
	_escTC		=			//Color in R,G,B,A format.
	[0.6,0.05,0.05,1];
	_escTS		= 0.035;	//esc top text size
	_escLOW		= 			//Text for esc lower top.
	"GhostzGamerz.com";
	_escLC		=			//Color in R,G,B,A format.
	[0.8,0.1,0.2,1];
	_escLS		= 0.035;	//esc lower text size
	_escBTM		= 			//Text for esc lower bottom.
	"TS.GhostzGamerz.com";
	_escBC		= 			//Color in R,G,B,A format.
	[0.1,0.7,0.75,1];
	_escBS		= 0.031;	//esc lower text size
/**Debug**/
	_AH_DEBUG 	= false;	//Add debug monitor to server?
	_DB_TOP		=			//Top of debug. OPTIONAL For pictures use <img image=""GG\Loading\debug.paa""/>
	""; 
	_DB_TOPSIZE = 3.25;		//TXT/IMG size
	_DB_BOT 	=			//Text at the bottom of debug. 	OPTIONAL (leave "" if you don't want to add text)!
	"GhostzGamerz.net";
	_DB_BOTSZ 	= 0.85;		//TXT/IMG size
	_DB_BOT_2 	=			//Text below the above text. 	OPTIONAL (leave "" if you don't want to add text)!
	"TS.GhostzGamerz.net";
	_DB_BOT2SZ 	= 0.65;		//TXT/IMG size
	_DB_CLR 	=			//Hex color for text on the left of debug. 	Default: RED 		//FF0000
	"FF0000";
	_DB_CLR2 	=			//Hex color for text on the right of debug. Default: WHITE 	//D4D4D4
	"D4D4D4";
	_DG_SVRT	= true;		//Place server time in debug? */
	_DG_PIC		= true;	//Show image of gun/vehicle? false = text instead (EX: Survivor/MH6J)
	_DG_PICSZ 	= 4;		//IMG size if true Default: 3
/**Weather**/
	_SVR_FW 	= true;		//Force weather?
	_SVR_FOG 	= 0;		//0 = clear 1 = low visibility
	_SVR_VDIS 	= 1500;	    //View distance. DayZ default = 1000-1500
	_SVR_OVC 	= 0;		//0 = clear skys 	1 = stormy clouds
	_SVR_RAIN 	= 0;		//0 = no rain 		1 = thunder storm
/**Object deploy**/
	_OD_DPLY 	= true;		//For use with my object deploy script, or your own deploy script. Advanced users use: PVOZ_OBJ_DEPLOY = [_pos,player,"CLASS_NAME_DZ"];publicVariableServer "PVOZ_OBJ_DEPLOY"
	_OD_AOBJ 	= 			//Add objectsto the array if you will be using the OD_DPLY.
	[
		"MMT_Civ","ATV_CZ_EP1","CSJ_GyroC"
	];
/**File paths**/
	lvl3_path = preProcessFileLineNumbers "\z\addons\dayz_server\GGAH\AH_bin\AH_admins\Admins_high.sqf";
	lvl2_path = preProcessFileLineNumbers "\z\addons\dayz_server\GGAH\AH_bin\AH_admins\Admins_medium.sqf";
	lvl1_path = preProcessFileLineNumbers "\z\addons\dayz_server\GGAH\AH_bin\AH_admins\Admins_low.sqf";
	donr_path = preProcessFileLineNumbers "\z\addons\dayz_server\GGAH\AH_bin\AH_admins\Donators.sqf";
	ahbl_path = preProcessFileLineNumbers "\z\addons\dayz_server\GGAH\AH_bin\AH_admins\banned_puids.sqf";
	ahnl_path = preProcessFileLineNumbers "\z\addons\dayz_server\GGAH\AH_bin\AH_admins\banned_names.sqf";
/**Load admins**/
	_AHBLN 	= ["machewy","beatz","greenperson","mor modules","jasper jake fishcock","shazbot","maby","moby","hihi","infistar","infishit","rustler"];
	_AHBL 	= ["76561198134335098","76561198068780534","76561198015462133","76561198079253746","76561198023739857","76561198226173876","76561198028050332","76561198153176100","76561198088972090","76561198019293015","76561198160464763","76561198085809264","76561198045026228","76561198079253746","76561198125153966","76561198135960185","76561198156067824","76561198006706104","76561198149535568","76561198074737706","76561198154399410"];
	
	diag_log ("(GG-AntiHack): Loading admins...");
	_playerID = if (_AH_OPUID) then [{"get"+"Player"+"UID"+"old"},{"get"+"Player"+"UID"}];
	if (lvl1_path != "") then {levelone 	= levelone 	+ (call compile lvl1_path)};
	if (lvl2_path != "") then {leveltwo 	= leveltwo 	+ (call compile lvl2_path)};
	if (lvl3_path != "") then {levelthree 	= levelthree + (call compile lvl3_path)};
	if (ahbl_path != "") then {_AHBL 		= _AHBL 	+ (call compile ahbl_path)};
	if (ahnl_path != "") then {_AHBLN 		= _AHBLN 	+ (call compile ahnl_path)};
	publicVariable "levelone";
	publicVariable "leveltwo";
	publicVariable "levelthree";

	_AdminArray = (levelone+leveltwo+levelthree);
	diag_log ("(GG-AntiHack): Admins loaded!");
/**ANTI-HACK FILES**/
	#include "AHT_fnc.sqf";
	#include "AHTC_fnc.sqf";
	#include "AHSH_fnc.sqf";
//----------------------------------//
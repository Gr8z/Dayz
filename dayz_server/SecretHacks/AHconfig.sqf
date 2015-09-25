
/*  MODERATORS	            */ 
_LAdmins = [
	"76561198122210030", // Pirate								
	"76561198080045762", // Deadskin	(Mod)								 
	"76561198162046909", // Shahzad
	"76561197970044945", // MrCheeseyman
	"76561198073669230", // Jack Black
	"76561198110162434", // Chemical Burn
	"76561198128804731", // xtsis
	"76561198166231771", // Wombat
	"76561198001066546", // MeowMix
	"76561198144994529", // BountyCraft
	"76561198037365948", // Devvo
	"76561198126348047", // Mr. Bandit
	"76561198129049369", // Zatley
	"76561198227881216", // Local User
"0"
]; 

/*  ADMINISTRATORS         */ 
_NAdmins = [
	"76561198182408150",  // Pirate Admin
	"76561198195305425",  // Shahzad
	"76561198240385148",  // Jack Black
	"76561198183434467",  // MeowMix Admin
	"76561198203698253",  // xtsis
	"76561198242337504",  // MrCheeseyman
	"76561198244936152",  // BountyCraft
"0"
]; 

/* HEAD ADMINS / OWNERS     */ 
_SAdmins = [
	"76561198078201908", // Gr8 
	"76561198153784743", // Ghost
	"76561198002511087", // TempSniper
	"76561198137100220",  // Deadskin
	"76561198021389971", // Thirdhero
	"76561197973172761",  // Milton
	"76561198115492831",  //BigEgg
"0"
];

/*  BANNED UIDs HERE      */ _BLOCKED = ["76561198238192548","76561198131504087","76561198097713170","76561198078593363","76561198124879011","76561198170547145","76561198067166357","76561198130911159","7656119817330326","0","76561198181853602","76561198119127262","76561198068094642",
										 "76561198204818956","76561198165211039","76561198074110583","76561198098254345","76561198054619746","76561198061552644","76561198068243806","76561198164444108","76561198165496777",
										 "76561198160602020","76561198018065224","76561198202739900","76561198005408564","76561198149036987"]; //do not have a , at the end./*  HEADLESS ClIENT UIDs  */ _HEADLESS_CLIENT_UIDs = ["0","0","0"]; //do not have a , at the end.

/*  Use Player White-list */ _UPW = false;	/* true or false */
/*  WHITELIST UIDs HERE   */ _WHITELIST = ["0","0","0"]; //do not have a , at the end.
/* ********************************************************************************* */
/*  Top esc menu TXT      */ _TopOfESC = "GHOSTZ GAMERZ"; //do not use " in this text.
/*  Bottom esc menu TXT   */ _LowerTop = "GHOSTZGAMERZ.COM"; //do not use " in this text.
/*  Bottom esc menu TXT2  */ _LowerBottom = "2 Hour Restarts"; //do not use " in this text.
/*  Color esc menu TXT    */ _EscColor = [0.6,0,0,1];
/*  DebugMonitor TXT      */ _BottomDebug = "GHOSTZGAMERZ.COM"; //do not use " in this text.
/*  DebugMonitor Key      */ _ODK =  0xCF;	/* google DIK_KeyCodes (0xCF is END) */
/*  Use DebugMonitor      */ _DMS =  false;	/* true or false */	/* starts up with debugmonitor ON if true */
/*  DebugMonitor Action   */ _DMW = false;	/* true or false */	/* "Debug" option on mousewheel */
/*  Mod EPOCH ?           */ _MEH =  true;	/* true or false */
/* ********************************************************************************* */
/*  EXPERIMENTAL CU FIX   */					_CUF = false;	/* true or false */	/* will transfer serverside units (including mission AI) to clientside */
/*  Humanity Value added  */					_CUF_HUMANITY_REWARD = 250;	/* Amount of Humanity added when Killing A.I. */
/* CLEAR ALL ITEMS ON AI DEATH */			_CUF_REMOVE_ALL_ITEMS_ON_DEATH = true;
/* _CUF_REMOVE_THESE_ITEMS_ON_DEATH -> CLEAR JUST THESE ITEMS ON AI DEATH */ 
_CUF_REMOVE_THESE_ITEMS_ON_DEATH =
[
	'Stinger','NVGoggles',
	''
];

/*
	Your server is getting attacked by local explosions? well on scriptbase we can not do much against that besides blocking the damage from it.
	below you will find an array of damage sources from what the damage will be blocked
*/
_blockDamageFrom = [
	'M_Hellfire_AT'
];


/*  Use Loaded Check(s)   */ _AHL = false;	/* true or false */	/* "AH NOT LOADED ON PLAYER" */
/*  _timedif for _AHL     */ _TDI =    130;	/*   45 - 300   */	/* only used if "_AHL = true;" -> takes longer to detect if the AH is loaded on a player or not. */

/*  revert onEachFrame    */ _REF =  true;	/* true or false */
/*  titleText & cutText   */ _TCT =  false;	/* true or false */	/* block titleText & cutText - some A.I. Missions and other mass message scripts needs this set to false */
/*  unitRecoil checks     */ _URC =  true;	/* true or false */	/* checks unitRecoilCoefficient and resets default unitRecoilCoefficient */
/*  Log Bad Keys pressed  */ _LBK = false;	/* true or false */	/* will be logged to surveillancelog.. can become huge spam I would have it disabled */
/*  Punish Forbidden Keys */ _PBK =  false;	/* true or false */	/* will freeze the user on BadKey click for ~3 seconds! */
/*  Forbid VON Sidechat   */ _VON =  true;	/* true or false */	/* talking on sidechat will put out a warning and kick if continue */
/*  Use Chat Functions    */ _UCF =  true;	/* true or false */	/* Enables Chatfunctions like /dance */

/*  Break Functions ?     */ _BHF = false;	/* true or false */	/* break some known functions used by hacks! */
/*  Use vehicle check?    */ _UVC = true;	/* true or false */	/* using _ALLOWED_Vehicles and _FORBIDDEN_Vehicles lists */
/*  Use zombie check?     */ _UZC = false;	/* true or false */	/* "Walk Amongst The Dead" or "ESS" needs this set to false */
/*  Vehicle WHITELIST     */ _UVW = false;	/* true or false */	/* if false - _ALLOWED_Vehicles won't not be used */
/*  Vehicle Tradercheck   */ _VTC =  true;	/* true or false */	/* checks if a player is near a trader when 'purchasing' a vehicle */

/*  Cheatengine Checks ?  */ _UCC =  true;	/* true or false */	/* certain strings have been changed */
/*  Use FileScan ?        */ _UFS =  true;	/* true or false */	/* spams the rpt but often finds hackers */
/*  Use Anti Teleport?    */ _UAT =  true;	/* true or false */
/*  Use cut-scene ?       */ _UCS =  true;	/* true or false */	/* dynamicText ~ often colored, animated or used in credits */
/*  Use Damage Check ?    */ _UDC =  false;	/* true or false */	/* try to catch Hacks that change the damage value of weapons */

/*  Remove "itemsAdded"   */ _RAI =  false;	/* true or false */	/* might remove items from a custom crafting system.. */
/*  HACKED BOX Check ?    */ _CHB =  false;	/* true or false */	/* custom crates might be deleted if "Max Cargo Count" is to low */
/*  Max Cargo Count ?     */ _MCC =  3000;

/*  MouseMoving EH check  */ _MOH =  false;	/* true or false */	/* will say: "MouseMoving EventHandler added" - needs to be disabled for UAV scripts and such.. */
/*  Close Dialogs ?       */ _CUD =  true;	/* true or false */	/* Closes custom Dialogs (Menus) that are not in _ALLOWED_Dialogs */
/*  check MapSingleClick  */ _OMC =  true;	/* true or false */	/* announces: "MapSingleClick modified", if modification is found - NEEDS _MBC to be true! */
/*  Remove Keybinds ?     */ _RCK =  false;	/* true or false */	/* Removes custom Keybinds and sets back the default ones */
/*  Check Keybinds ?      */ _CKD =  false;	/* true or false */	/* checks for additional keybinds.. */
/*  Check CMDMenus ?      */ _CCM =  true;	/* true or false */	/* only disable this if you know what you are doing. I strongly recommend to use this! */
/*  BLOCK ALL CMDMenus    */ _BCM =  false;	/* true or false */	/* we don't need commandingMenus. so have this true as well. */
/*  Check Actions ?       */ _CSA = false;	/* true or false */	/* this checks mousewheel actions */
/*  Force Terrain Grid ?  */ _FTG =    25;	/* 50, 25, 12.5  */	/* if set to 50 grass will be very low for better client FPS.. default is 25 */
/*  Use Clutter check ?   */ _UBC =  false;	/* true or false */	/* BadSize: %1 - Plants and/or Clutter pbo(s) removed..! */
/*  Log Epoch Maintain    */ _LEM =  true;	/* true or false */
/* ********************************************************************************* */
/*  ALLOWED Custom Dialogs "_ALLOWED_Dialogs" are only used if you have "_CUD =  true;"  */
_ALLOWED_Dialogs = [-1,106,2200,6900,6901,6902,6903,420420,41144,711194,666,667,65431,65432,65433,65434,65440,65441,65442,2800,3800,420000,420001];
_ALLOWED_Dialogs = _ALLOWED_Dialogs + [81000,88890,20001,20002,20003,20004,20005,20006,55510,55511,55514,55515,55516,55517,55518,55519,555120,118338,118339,711197,711195]; // adding som
/*  Player that have one of these items in their inventory will get punished!  */
_ForbiddenItems =
[
	"ItemMap_Debug","5Rnd_127x99_AS50","ItemCore","BAF_AS50_TWS","PMC_AS50_TWS_Large","PMC_AS50_scoped_Large"
];

/*  If "_UVC =  true;" and "_UVW =  true;" this will delete all vehicles that are not in "_ALLOWED_Vehicles"  */
_ALLOWED_Vehicles = ["ALL IF _UVW = false","Tractor","Policecar"];

/*  If "_UVC =  true;" this will delete all vehicles that are in "_FORBIDDEN_Vehicles"  */
_FORBIDDEN_Vehicles =
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
	"BMP2_Gue","BRDM2_ATGM_TK_EP1","ZSU_CDF","GAZ_Vodnik_HMG","MAZ_543_SCUD_TK_EP1","UAZ_SPG9_INS","Offroad_SPG9_TK_GUE_EP1",
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

/*  ALLOWED CMDMenus "_cMenu" are only used if you have "_BCM = false;" which I would not recommend.  */
_cMenu =
[
	"","RscMainMenu","RscMoveHigh","#WATCH","#WATCH0",
	"DoorManagement","Entercode",
	"RscWatchDir","RscDisplayClassSelecter","RscDisplayGenderSelect",
	"RscDisplaySpawnSelecter","RscWatchMoreDir","#GETIN","RscStatus",
	"RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply",
	"RscCallSupport","#ACTION","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu",
	"BTC_Hud","PlotManagement","#USER:wardrobe","#USER:WardrobeDayZ","#USER:WardrobeCustom","#USER:WardrobeOverwatch","#USER:_keyMenu","#USER:_keyColorMenu","#USER:DamiSpawn","#USER:VoteMenu",
	"#USER:ActionMenu","#USER:ActionMenua","#USER:SkyMenu","#USER:FogMenu","#USER:SkyMenu2","#USER:FogMenu2","#USER:_DeployMenu","#USER:MovementMenu","#USER:environment","#USER:DeployMenu","#USER:grass",
	"BTC_Hud","PlotManagement","#USER:EarMenu","#USER:GGgarageMenu"
];

/*  ALLOWED Actions "_dayzActions" are only used if you have "_CSA =  true;"  */
_dayzActions =
[
	"DonorSkins","wardrobe","s_player_maintain_area","s_player_maintain_area_preview","BTC_SganciaActionId","BTC_liftActionId","BTC_liftHudId","dayz_myLiftVehicle","s_player_heli_detach",
	"dayz_myCursorTarget","s_player_craftZombieBait","s_player_butcher_human","s_player_makeBomb","s_player_zombieShield","s_player_upgrademoto",
	"s_player_smeltRecipes","null","churchie_check","churchie_defuse","churchie_rig_veh","player_Cannibalism","s_player_fillfuel210","s_player_knockout","s_player_upgradegyro","ActionMenu",
	"manatee_craft_menu","manatee_craft_menu_wea","manatee_craft_menu_sur","manatee_craft_menu_ind","s_player_craftZombieBaitBomb","horror_traders","s_player_takeOwnership","s_siphon","s_player_suicide",
	"silver_myCursorTarget","stow_vehicle","menu_Worker2","neutral","menu_RU_Citizen1","menu_RU_Citizen4","menu_TK_CIV_Takistani04_EP1","menu_RU_Villager3","menu_RU_Functionary1","menu_Doctor",
	"menu_Dr_Hladik_EP1","menu_Profiteer4","menu_Worker3","menu_Pilot_EP1","menu_RU_Citizen3","menu_CIV_EuroMan02_EP1","menu_Rita_Ensler_EP1","menu_RU_WorkWoman5","menu_RU_WorkWoman1",
	"menu_Woodlander1","menu_Woodlander3","menu_Rocker4","menu_CIV_EuroMan01_EP1","Tow_settings_action_heliporter","Tow_settings_action_heliport_larguer",
	"Tow_settings_action_deplacer_objet","Tow_settings_action_relacher_objet","Tow_settings_action_selectionner_objet_charge","Tow_settings_action_charger_selection",
	"Tow_settings_action_charger_deplace","Tow_settings_action_selectionner_objet_remorque","Tow_settings_action_remorquer_selection","Tow_settings_action_remorquer_deplace",
	"Tow_settings_action_detacher","Tow_settings_action_contenu_vehicule","Tow_settings_dlg_CV_titre","Tow_settings_dlg_CV_btn_decharger","Tow_settings_dlg_CV_btn_fermer",
	"s_player_makePLBomb","s_player_stats","s_player_deploybike","s_player_packbike","s_player_deploygyro","s_player_upgradebike","nul",
	"s_player_equip_carry","s_player_showname","s_player_showname1","s_player_smeltItems","s_building_snapping","s_player_downgrade_build",
	"s_player_debug","s_player_calldog","s_player_speeddog","s_player_movedog","s_player_followdog","s_player_warndog","s_player_barkdog","s_player_trackdog",
	"s_player_staydog","s_player_waterdog","s_player_feeddog","s_player_tamedog","s_player_repair_crtl","s_player_towing",
	"s_player_fillgen","s_player_maint_build","s_player_fuelauto2","s_player_fuelauto","s_player_information",
	"s_player_upgrade_build","s_player_packvault","s_player_unlockvault","s_player_checkGear",
	"s_player_lockUnlock_crtl","s_player_deleteBuild","s_player_pzombiesfeed","s_player_pzombiesattack",
	"s_player_pzombiesvision","s_player_callzombies","s_player_removeflare","s_player_fishing_veh",
	"s_player_forceSave","s_player_fillfuel20","s_player_fillfuel5","s_player_lockvault","s_player_dragbody",
	"s_player_packFdp","s_player_otkdv","s_player_isCruse","s_player_cnbb","bis_fnc_halo_action",
	"s_player_rest","s_player_flipvehiclelight","s_player_flipvehicleheavy","s_player_1bupd",
	"s_halo_action","s_player_smelt_scrapmetal","s_player_grabflare","s_player_fishing",
	"s_player_smelt_engineparts","s_player_smelt_fueltank","s_player_smelt_windscreenglass",
	"s_player_smelt_mainrotoraryparts","s_player_smelt_wheel","s_player_smelt_jerrycan","s_player_siphonfuel",
	"s_player_flipveh","s_player_fillfuel","s_player_dropflare","s_player_butcher","s_player_cook",
	"s_player_boil","s_player_fireout","s_player_packtent","s_player_sleep","s_player_studybody",
	"NORRN_dropAction","s_player_selfBloodbag","s_clothes","s_player_holderPickup","s_player_gather",
	"s_player_recipeMenu","s_player_deleteCamoNet","s_player_netCodeObject","s_player_codeRemoveNet",
	"s_player_enterCode","s_player_codeObject","s_player_codeRemove","s_player_disarmBomb",
	"unpackRavenAct","disassembleRavenAct","launchRavenAct","strobeRavenResetAct","strobeRavenTestAct",
	"batteryLevelCheckRavenAct","batteryRechargeRavenAct","mavBaseStationActionName_00","mavBaseStationActionName_001",
	"mavBaseStationActionName_01","mavBaseStationActionName_02","mavBaseStationActionName_03","mavBaseStationActionName_04",
	"s_player_dance","s_player_igniteTent","s_player_clothes","s_player_scrollBandage",
	"STR_R3F_LOG_action_heliporter","STR_R3F_LOG_action_heliport_larguer","s_vehicle_lockUnlock_crtl",
	"STR_R3F_LOG_action_relacher_objet","STR_R3F_LOG_action_deplacer_objet","STR_R3F_LOG_action_remorquer_deplace",
	"STR_R3F_LOG_action_selectionner_objet_remorque","STR_R3F_LOG_action_detacher","STR_R3F_LOG_action_charger_deplace",
	"STR_R3F_LOG_action_selectionner_objet_charge","STR_R3F_LOG_action_remorquer_selection","STR_R3F_LOG_action_charger_selection",
	"STR_R3F_LOG_action_contenu_vehicule","STR_R3F_ARTY_action_ouvrir_dlg_SM",
	"s_player_removeActions","s_player_repairActions","r_player_actions","r_player_actions2","s_player_parts","s_player_combi","s_player_parts",
	"s_player_lockunlock","s_vehicle_lockunlock","s_player_toggleSnap","s_player_toggleSnapSelect","s_player_toggleSnapSelectPoint",
	"s_player_evacCall","s_player_makeEvacChopper","s_player_clearEvacChopper",
	"s_player_deploybike2","s_player_deploymoped","s_player_deploymoped2","s_player_deploymozzie","s_player_deploymozzie2",
	"s_player2803_copyToKey","SP_refuel_action","SP_repair_action","SP_rearm_actions","s_player_setVectorsReset","s_player_setVectorsForward",
	"s_player_setVectorsBack","s_player_setVectorsLeft","s_player_setVectorsRight","s_player_setVectors1","s_player_setVectors5","s_player_setVectors45",
	"s_player_setVectors90","s_player_paint","DoorManagement","Entercode","s_player_packtentinfected","s_player_debugCheck","s_player_destorytent",
	"s_player_attach_bomb","s_player_upgradestroage","s_player_Drinkfromhands","s_player_lockhouse","s_player_unlockhouse","s_player_openGate",
	"s_player_CloseGate","s_player_breakinhouse","s_player_setCode"
];
/* ********************************************************************************* */
	//	NEW (EXPERIMENTAL):
	_UDP = false;	// Use Dupe Protection			/* true or false */
	_URG = false;	// Antirefuel & AntiCargod		/* true or false */
	_UIC = false;	//	Vehicle ID Check	/* true or false */
	_UCL =  true;	// Use Anti Combat Log	/* true or false */
	
	
	/*
		"_UIM": Use Incognito Mode, makes it for the most part look like you don't run infiSTAR to the normal player.
		But for that it disables for example:
		Script Scan, reworked unconscious, Bad Keybinds, The debugmonitor,
		Escape Menu will be default again, Chatfunctions and more
		So it will make the server more unsecure! but look like it's a default one.
	*/
	_UIM = false;	/* true or false */
	
	
	/*
		"_sUptime": Server Uptime in seconds!
		Using this will show "Restart in: xh xxmin"
		If you don't want to use it - just do:
		_sUptime = 0;
	*/
	_sUptime = 7201;
	
	
	/*
		"_UDN": Players can Vote if they want Day- or NighTime
		!vote day,/vote day, vote day,
		!vote night,/vote night, vote night
	*/
	_UDN =  true;	/* true or false */
	
	
	/*
		"_FRC": FNCRestored Check.
		When "_BHF =  true;" which it always should be in my opinion, then this will check if "_BHF" is persistent.
	*/
	_FRC =  true;	/* true or false */
	
/*
	custom Box content:
	just an item like it is in the example with   'ItemMap'   will put the item once in the box.
	if an array is used like the   ['ItemGPS',5]   example, well I assume you could guess what it will do.
*/
_SupportBox1Content =
[
	'ItemMap',['ItemGPS',3],'ItemWatch'
];

_SupportBox2Content =
[
	'ItemMap',['ItemGPS',2],'ItemWatch'
];

_SupportBox3Content =
[
	'ItemMap',['ItemGPS',7],'ItemWatch'
];



/*
	custom Vault content (EPOCH ONLY), make sure to insert the Items in the right places :)
*/
//	Support-Vault1
_weapons1 = [
	['ItemToolbox','ItemEtool','ItemEtool'],
	[1,					1,			1]
];
_magazines1 = [
	['ItemWoodWallLg','ItemWoodFloorQuarter','ItemWoodStairs','ItemWoodWallWithDoorLgLocked','ItemWoodWallGarageDoorLocked','ItemLockBox','ItemVault','ItemSledgeHead','ItemSledgeHandle','30m_plot_kit','workbench_kit'],
	[1,					1,						1,				1,								1,								1,			1,			1,					1,				1,				1]
];
_backpack1 = [
	[],
	[]
];


//	Support-Vault2
_weapons2 = [
	['ItemToolbox','ItemCrowbar','ItemEtool'],
	[1,				1,				1]
];
_magazines2 = [
	['ItemVault','ItemSledgeHead','ItemSledgeHandle','storage_shed_kit','30m_plot_kit','workbench_kit','cinder_wall_kit','MortarBucket','CinderBlocks','cinder_garage_kit','ItemTankTrap','ItemPole','ItemComboLock','ItemWoodLadder','ItemWoodStairs','metal_floor_kit'],
	[1,				1,				1,					1,					1,			1,				15,					10,				30,			2,					6,				6,			2,				2,				3,				8]
];
_backpack2 = [
	['DZ_LargeGunBag_EP1'],
	[1]
];


//	Support-Vault3
_weapons3 = [
	['ItemToolbox','ItemCrowbar','ItemEtool'],
	[2,				2,				2]
];
_magazines3 = [
	['30m_plot_kit','workbench_kit','cinder_wall_kit','MortarBucket','CinderBlocks','cinder_garage_kit','ItemComboLock','ItemWoodLadder','ItemPole','ItemTankTrap','ItemWoodStairs','metal_floor_kit','ItemVault','ItemSledgeHead','ItemSledgeHandle','storage_shed_kit'],
	[1,					1,				25,					15,			50,				4,					4,				4,				12,			12,				6,				15,				2,			2,					2,				2]
];
_backpack3 = [
	['DZ_LargeGunBag_EP1'],
	[1]
];
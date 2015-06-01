#define VIP_ITEMS "ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemMorphine","FoodbeefCooked","ItemSodaPepsi" 
#define VIP_TOOLS "Binocular_Vector","NVGoggles","ItemCompass","ItemHatchet","ItemKnife","Itemmatchbox","Itemetool","ItemWatch","ItemGPS","ItemCrowbar","ItemToolbox"

_startBag = "DZ_ALICE_Pack_EP1";
_startMags = ["ItemBandage",3,"ItemPainkiller","ItemWaterbottle","FoodPistachio","RH_12Rnd_45cal_usp",3];
_startWeps = ["ItemMap","ItemFlashlight","ItemToolbox","RH_uspm"];
_customLoadout = [
	"76561198078201908", //Gr8
	"76561198153784743", //Ghost
"0"
];
_customLoadouts = [
	["Head Admin Loadouts","GUE_Soldier_2_DZ","BanditW2_DZ",["100Rnd_762x51_M240",2,"30Rnd_9x19_UZI_SD",3,"Skin_GUE_Soldier_Sniper_DZ",VIP_ITEMS],["Mk_48_DZ","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",["5Rnd_86x70_L115A1",3],["BAF_LRR_scoped_W"]],
	["ebay's Loadout","GUE_Soldier_2_DZ","BanditW2_DZ",["100Rnd_762x51_M240",2,"30Rnd_9x19_UZI_SD",3,"Skin_GUE_Soldier_Sniper_DZ",VIP_ITEMS],["Mk_48_DZ","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",["5Rnd_86x70_L115A1",3],["BAF_LRR_scoped_W"]],
	[]
];

_presetClasses = [
	[
		"Random",
		[["Survivor2_DZ","Haris_Press_EP1_DZ","Rocker1_DZ","Soldier1_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","RU_Policeman_DZ","TK_INS_Soldier_EP1_DZ"],["SurvivorW2_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ"]],
		[],2,
		["ItemCompass","ItemHatchet","ItemCrowbar"],2,
		[],2,
		[],3,
		[""],
		[],4,
		[],2,
		[],2,
		[],3,
		0,0
	],
	["Bandit","Bandit2_DZ","BanditW1_DZ",["10x_303",2,"ItemSodaRabbit"],["LeeEnfield"],"",[],[],0,-5000],
	["Hero","Soldier_Sniper_PMC_DZ","SurvivorWpink_DZ",["30Rnd_556x45_Stanag",4],["M4A1","ItemEtool","ItemGPS"],"",[],[],0,5000],
	["Survivor","Survivor2_DZ","SurvivorW2_DZ",[],[],"",[],[],0,0],
	["British Soldier","Soldier1_DZ","SurvivorWcombat_DZ",[],[],"",[],[],0,0],
	["Business Person","Functionary1_EP1_DZ","SurvivorWurban_DZ",["ItemBriefcaseS20oz"],[],"",[],[],0,0],
	["Civilian","Haris_Press_EP1_DZ","SurvivorW3_DZ",[],[],"",[],[],0,0],
	["Czech Soldier","CZ_Special_Forces_GL_DES_EP1_DZ","SurvivorWcombat_DZ",[],[],"",[],[],0,0],
	["Police Officer","RU_Policeman_DZ","SurvivorWdesert_DZ",[],[],"",[],[],0,0],
	["Rocker","Rocker1_DZ","SurvivorWurban_DZ",[],[],"",[],[],0,0],
	["Terrorist","TK_INS_Soldier_EP1_DZ","BanditW2_DZ",[],[],"",[],[],0,0],
	["US Soldier","Graves_Light_DZ","SurvivorWcombat_DZ",[],[],"",[],[],0,0],
	["Engineer Level 1","SFSG_wdl_op","SurvivorWurban_DZ",["200Rnd_556x45_M249",4,"RH_6Rnd_44_Mag",4,"HandGrenade_West",VIP_ITEMS],["M249_EP1_DZ","RH_anacg",VIP_TOOLS],"DZ_ALICE_Pack_EP1",["PartEngine","PartGeneric","PartFueltank","PartGeneric","PartWheel","PartWheel","HandGrenade_West"],[],1,0],
	["Engineer Level 2","TK_Soldier_Engineer_EP1","SurvivorWurban_DZ",["100Rnd_762x51_M240",4,"RH_7Rnd_50_AE",4,"HandGrenade_West",VIP_ITEMS],["M240_DZ","RH_deagle",VIP_TOOLS],"DZ_CivilBackpack_EP1",["PartEngine","PartFueltank","PartGeneric","PartGeneric","PartWheel","PartWheel","HandGrenade_West","HandGrenade_West"],[],2,0],
	["Engineer Level 3","UKSF_wdl_mrk","SurvivorWurban_DZ",["100Rnd_762x51_M240",4,"RH_7Rnd_50_AE",4,"HandGrenade_West",VIP_ITEMS],["Mk_48_DZ","RH_deaglemzb",VIP_TOOLS],"DZ_Backpack_EP1",["PartVRotor","PartWheel","PartWheel","PartFueltank","PartWheel","PartEngine","PartGeneric","PartGeneric","HandGrenade_West","HandGrenade_West","HandGrenade_West"],[],3,0],
	["VIP Marksmen 1","FR_GL","SurvivorW3_DZ",["20Rnd_762x51_B_SCAR",4,"RH_8Rnd_9x19_Mk",4,VIP_ITEMS],["SCAR_H_LNG_Sniper","RH_mk22vsd",VIP_TOOLS],"DZ_ALICE_Pack_EP1",[],[],4,0],
	["VIP Marksmen 2","US_Soldier_SL_EP1","SurvivorW3_DZ",["RH_8Rnd_9x19_Mk",4,"5Rnd_762x51_M24",4,VIP_ITEMS],["M40A3","RH_mk22vsd",VIP_TOOLS],"DZ_CivilBackpack_EP1",["20Rnd_762x51_DMR","20Rnd_762x51_DMR"],[],5,0],
	["VIP Marksmen 3","GUE_Soldier_Sniper_DZ","SurvivorW3_DZ",["20Rnd_762x51_DMR",4,"RH_8Rnd_45cal_m1911",4,VIP_ITEMS],["vil_M110sd","RH_m1911sd",VIP_TOOLS],"DZ_Backpack_EP1",[],[],6,0],
	["VIP Medic 1","Soldier_Sniper_PMC_DZ","SurvivorW3_DZ",["30Rnd_556x45_Stanag",4,"RH_8Rnd_45cal_m1911",4,VIP_ITEMS],["M4A1_Aim_camo","RH_m1911sd",VIP_TOOLS],"DZ_ALICE_Pack_EP1",["ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemMorphine","ItemPainkiller"],[],7,0],
	["VIP Medic 2","Soldier_Sniper_PMC_DZ","SurvivorW3_DZ",["30Rnd_556x45_StanagSD",4,"RH_8Rnd_45cal_m1911",4,VIP_ITEMS],["RH_massdacog","RH_m1911sd",VIP_TOOLS],"DZ_CivilBackpack_EP1",["ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemEpinephrine","ItemMorphine","ItemPainkiller"],[],8,0],
	["VIP Medic 3","TK_INS_Soldier_EP1_DZ","SurvivorW3_DZ",["30Rnd_762x39_AK47",4,"RH_8Rnd_45cal_m1911",4,VIP_ITEMS],["AKS_GOLD","RH_m1911sd",VIP_TOOLS],"DZ_LargeGunBag_EP1",["ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemEpinephrine","ItemEpinephrine","ItemMorphine","ItemMorphine","ItemMorphine","ItemPainkiller","ItemPainkiller","ItemPainkiller","PartEngine","PartGeneric","PartGeneric","PartWheel","PartWheel"],[],9,0],
	["VIP Scout 1","Desert_SOF_MG","SurvivorW3_DZ",["RH_8Rnd_45cal_m1911",4,"FHQ_rem_20Rnd_762x51_PMAG_NT_SD",4,VIP_ITEMS],["FHQ_RSASS_SD_TAN","RH_m1911sd",VIP_TOOLS],"DZ_ALICE_Pack_EP1",[],[],10,0],
	["VIP Scout 2","Desert_SOF_MG","SurvivorW3_DZ",["RH_8Rnd_45cal_m1911",4,"RH_20Rnd_762x51_SD_hk417",4,VIP_ITEMS],["RH_hk417sdsp","RH_m1911sd",VIP_TOOLS],"DZ_CivilBackpack_EP1",[],[],11,0],
	["VIP Scout 3","Sniper1_DZ","SurvivorW3_DZ",["RH_8Rnd_45cal_m1911",4,"20Rnd_762x51_DMR",4,VIP_ITEMS],["DMR_DZ","RH_m1911sd",VIP_TOOLS],"DZ_Backpack_EP1",[],[],12,0],
	["Soldier Level 1","Rocket_DZ","SurvivorWurban_DZ",["30Rnd_556x45_Stanag",4,"vil_usp45sd_mag",4,VIP_ITEMS],["RH_hk416glacog","vil_USP45SD",VIP_TOOLS],"DZ_ALICE_Pack_EP1",[],[],13,0],
	["Soldier Level 2","frb_tl_mask","SurvivorWurban_DZ",["30Rnd_556x45_Stanag",4,"RH_7Rnd_50_AE",4,VIP_ITEMS],["RH_hk416aim","RH_Deaglemzb",VIP_TOOLS],"DZ_CivilBackpack_EP1",[],[],14,0],
	["Soldier Level 3","SFSG_wdl_demo","SurvivorWurban_DZ",["20Rnd_762x51_B_SCAR",4,"RH_7Rnd_50_AE",4,"1Rnd_HE_M203",4,VIP_ITEMS],["SCAR_H_STD_EGLM_Spect","RH_Deaglemzb",VIP_TOOLS],"DZ_Backpack_EP1",[],[],15,0]
];
#include "CfgLootSmall.hpp"

class CfgLoot {
/*		
WEAPON CLASSES

ACRLowWeaps
ACRHighWeaps
ScarLowWeaps
ScarHighWeaps
SniperMedWeaps
RiflesMedWeaps
HK416Weaps
HK417Weaps
MasWeaps
G36Weaps
PistolTopWeaps
SVDWeaps
PistolMilWeaps
PistolsLow
SubWeaps
RiflesLowWeaps
SniperLowWeaps
AKLowWeaps
AKHighWeaps
LMGWeaps
L85Weaps
M4Weaps
M8Weaps
HMGWeaps
NVweaps
UltraWeaps
ShotgunWeaps
MeleeWeaps
SniperTopWeaps
RocketWeaps
TWSWeaps
LauncherWeaps
*/

ACRLowWeaps[] = {
{"RH_acraim",0.50}, 
{"RH_acreotech",0.50}, 
{"RH_acrbeotech",0.50}, 
{"RH_acrbglaim",0.50}, 
{"RH_acr",0.50}, 
{"RH_acrgl",0.50}, 
{"RH_acrglaim",0.50}, 
{"RH_acrgleotech",0.50}, 
{"RH_acrb",0.50}, 
{"RH_acrbgl",0.50}, 
{"RH_acrbgleotech",0.50}, 
{"FHQ_ACR_WDL_CCO",0.50}, 
{"FHQ_ACR_WDL_CCO_SD",0.50}, 
{"FHQ_ACR_WDL_HWS",0.50}, 
{"FHQ_ACR_WDL_HWS_SD",0.50}, 
{"FHQ_ACR_BLK_IRN",0.50}, 
{"FHQ_ACR_BLK_IRN_SD",0.50}, 
{"FHQ_ACR_BLK_CCO",0.50}, 
{"FHQ_ACR_BLK_CCO_SD",0.50}, 
{"FHQ_ACR_BLK_HWS",0.50}, 
{"FHQ_ACR_BLK_HWS_SD",0.50}, 
{"FHQ_ACR_TAN_IRN_GL",0.50}, 
{"FHQ_ACR_TAN_IRN_GL_SD",0.50}, 
{"FHQ_ACR_TAN_CCO_GL",0.50}, 
{"FHQ_ACR_TAN_CCO_GL_SD",0.50}, 
{"FHQ_ACR_TAN_HWS_GL",0.50}, 
{"FHQ_ACR_TAN_HWS_GL_SD",0.50}, 
{"FHQ_ACR_SNW_IRN",0.50}, 
{"FHQ_ACR_SNW_IRN_SD",0.50} 
};

ACRHighWeaps[] = {
{"RH_acracog",0.50}, 
{"RH_acrbaim",0.50}, 
{"RH_acrbacog",0.50}, 
{"FHQ_ACR_BLK_RCO_SD",0.50}, 
{"RH_acrglacog",0.50}, 
{"RH_acrbglacog",0.50}, 
{"FHQ_ACR_WDL_RCO",0.50}, 
{"FHQ_ACR_WDL_RCO_SD",0.50}, 
{"FHQ_ACR_WDL_G33",0.50}, 
{"FHQ_ACR_WDL_G33_SD",0.50}, 
{"FHQ_ACR_WDL_HAMR_SD",0.50}, 
{"FHQ_ACR_BLK_RCO",0.50}, 
{"FHQ_ACR_BLK_G33",0.50}, 
{"FHQ_ACR_BLK_G33_SD",0.50}, 
{"FHQ_ACR_BLK_HAMR",0.50}, 
{"FHQ_ACR_BLK_HAMR_SD",0.50}, 
{"FHQ_ACR_TAN_RCO",0.50}, 
{"FHQ_ACR_TAN_RCO_SD",0.50},
{"FHQ_ACR_TAN_G33",0.50},
{"FHQ_ACR_TAN_G33_SD",0.50},
{"FHQ_ACR_TAN_HAMR",0.50},
{"FHQ_ACR_TAN_HAMR_SD",0.50}, 
{"FHQ_ACR_SNW_RCO",0.50}, 
{"FHQ_ACR_SNW_RCO_SD",0.50}, 
{"FHQ_ACR_SNW_G33",0.50}, 
{"FHQ_ACR_SNW_G33_SD",0.50}, 
{"FHQ_ACR_SNW_HAMR",0.50}
};



ScarLowWeaps[] = {
	{"SCAR_L_CQC",0.3},             
	{"SCAR_H_CQC_CCO",0.13},       
	{"SCAR_L_CQC_Holo",0.13},      
	{"SCAR_L_STD_HOLO",0.13},
	{"SCAR_L_STD_Mk4CQT",0.11},      
	{"SCAR_L_CQC_EGLM_Holo",0.03}, 
	{"SCAR_L_CQC_CCO_SD",0.02}
};



ScarHighWeaps[] = {
	{"SCAR_H_CQC_CCO_SD",0.55}, 
	{"SCAR_L_STD_EGLM_RCO",0.13}, 
	{"SCAR_H_LNG_Sniper",0.13},
	{"SCAR_H_STD_EGLM_Spect",0.12},  
	{"SCAR_H_LNG_Sniper_SD",0.07} 
};



SniperMedWeaps[] = {
	{"vil_DRM_BASE",0.1},  
	{"RH_sc2acog",0.15}, 
	{"RH_sc2sp",0.15}, 
	{"FHQ_RSASS_TAN",0.1}, 
	{"FHQ_RSASS_SD_TAN",0.08}, 
	{"vil_M110",0.03}, 
	{"vil_SR25",0.03}, 
	{"RH_hk417sp",0.03}, 
	{"vil_M110sd",0.01},
	{"vil_SR25SD",0.01}, 
	{"RH_hk417sdsp",0.01}
};



RiflesMedWeaps[] = {
{"RH_sc2aim",0.50}, 
{"RH_sc2eot",0.50}, 
{"RH_sc2shd",0.50}, 
{"M14_EP1",0.50}, 
{"vil_M14",0.50}, 
{"vil_M14G",0.50}, 
{"RH_m14acog",0.50}, 
{"RH_m14aim",0.50}, 
{"RH_m14eot",0.50}, 
{"vil_G3a3",0.50}, 
{"vil_G3a2",0.50}, 
{"vil_G3ZF",0.50}, 
{"vil_G3zfb",0.50}, 
{"vil_G3SG1",0.50}, 
{"vil_G3sg1b",0.50}, 
{"vil_AG3EOT",0.50}, 
{"vil_Groza_HG",0.50}, 
{"vil_Groza_SD",0.50}, 
{"RH_m1sacog",0.50}, 
{"RH_m1sshd",0.50}, 
{"RH_m1ssp",0.50}, 
{"RH_m1st",0.50}, 
{"RH_m1stacog",0.50}, 
{"RH_m1stshd",0.50}, 
{"RH_m1stsp",0.50}, 
{"FN_FAL",0.50}, 
{"vil_Fal",0.50}, 
{"RH_m1staim",0.50}, 
{"RH_m1steot",0.50}, 
{"vil_G3TGS",0.50}, 
{"vil_G3TGSb",0.50}, 
{"vil_Fal_Para",0.50} 
};



HK416Weaps[] = {
{"vil_HK416_Aim",0.50}, 
{"vil_HK416_EOT",0.50}, 
{"vil_HK416_GL",0.50}, 
{"VIL_HK416_EDR",0.50}, 
{"RH_hk416s",0.50}, 
{"RH_hk416saim",0.50}, 
{"RH_hk416seotech",0.50}, 
{"RH_hk416sacog",0.50}, 
{"RH_hk416sd",0.50}, 
{"RH_hk416sdaim",0.50}, 
{"RH_hk416sdeotech",0.50}, 
{"RH_hk416aim",0.50}, 
{"RH_hk416acog",0.50}, 
{"RH_hk416eotech",0.50}, 
{"RH_hk416gl",0.50}, 
{"RH_hk416glaim",0.50}, 
{"RH_hk416gleotech",0.50}, 
{"RH_hk416glacog",0.50}, 
{"RH_hk416sgl",0.50}, 
{"RH_hk416sglaim",0.50}, 
{"RH_hk416sgleotech",0.50}, 
{"RH_hk416sglacog",0.50}, 
{"RH_hk416sdgl",0.50}, 
{"RH_hk416sdglaim",0.50}, 
{"RH_hk416",0.50}, 
{"RH_hk416sdgleotech",0.50} 
};


	
	HK417Weaps[] = {
		{"RH_hk417",0.19}, 
		{"vil_HK417s",0.16},
		{"RH_hk417s",0.16},
		{"RH_hk417sd",0.06}, 
		{"RH_hk417eotech",0.05}, 
		{"RH_hk417sgl",0.05},
		{"RH_hk417seotech",0.04}, 
		{"RH_hk417aim",0.04},
		{"RH_hk417saim",0.04},
		{"RH_hk417sglaim",0.04},  
		{"RH_hk417sgleotech",0.04},       
		{"RH_hk417sdaim",0.03}, 
		{"RH_hk417sdeotech",0.03},
		{"RH_hk417acog",0.02}, 
		{"RH_hk417sacog",0.02},
		{"RH_hk417sglacog",0.02},  
		{"RH_hk417sdacog",0.01}
	};



MasWeaps[] = {
{"RH_massd",0.50}, 
{"RH_massdaim",0.50}, 
{"RH_massdeotech",0.50}, 
{"RH_massdacog",0.50}, 
{"RH_masbsd",0.50}, 
{"RH_masbsdaim",0.50}, 
{"RH_masbsdeotech",0.50}, 
{"RH_masbsdacog",0.50}, 
{"RH_masbaim",0.50}, 
{"RH_masbeotech",0.50}, 
{"RH_masbacog",0.50}, 
{"RH_maseotech",0.50}, 
{"RH_masacog",0.50}, 
{"RH_star21",0.50}, 
{"RH_masaim",0.50}, 
{"RH_m1saim",0.50}, 
{"RH_m1seot",0.50}, 
{"RH_ctar21",0.50}, 
{"RH_ctar21glacog",0.50}, 
{"RH_ctar21m",0.50}, 
{"RH_ctar21mgl",0.50}, 
{"RH_mas",0.50}, 
{"RH_masb",0.50} 
};



G36Weaps[] = {
{"vil_G36KSKES",0.50}, 
{"vil_G36VA4Eot",0.50}, 
{"vil_G36KSKdes",0.50}, 
{"vil_G36KSKdesES",0.50}, 
{"vil_G36KES",0.50}, 
{"vil_G36KV3",0.50}, 
{"vil_G36KV3Des",0.50}, 
{"vil_G36KVA4",0.50}, 
{"vil_G36a2",0.50}, 
{"G36_C_SD_camo",0.50}, 
{"G36A_camo",0.50}, 
{"G36C",0.50}, 
{"G36C_camo",0.50}, 
{"G36K_camo",0.50}, 
{"vil_AG36",0.50}, 
{"vil_AG36A2",0.50}, 
{"vil_AG36KV",0.50}, 
{"vil_AG36KA4",0.50}, 
{"G36_C_SD_eotech",0.50}, 
{"G36a",0.50}, 
{"G36K",0.50}, 
{"vil_G36KA4",0.50}, 
{"vil_G36E",0.50}, 
{"vil_G36VA4",0.50}, 
{"vil_G36KVZ",0.50}, 
{"vil_G36KSK",0.50}, 
{"vil_G36CC",0.50}, 
{"vil_HK416_IS",0.50} 
};

	
	PistolTopWeaps[] = {
		{"RH_deagle",	0.05}, 
		{"RH_Deaglem",	0.04}, 
		{"RH_Deaglemz",	0.03}, 
		{"RH_Deaglemzb",0.02}, 
		{"RH_Deagles",	0.01},
		{"UZI_SD_EP1",	0.20},
		{"RH_uspm",		0.20},
		{"RH_bull",		0.10},
		{"vil_apssd",	0.15}, 
		{"vil_APS",		0.20}  
	};


	
	SVDWeaps[] = {
		{"vil_SV_98",0.14},  
		{"vil_SV_98_69",0.07}, 
		{"vil_SV_98_SD",0.02}, 
		{"SVD_des_EP1",0.05}, 
		{"SVD_CAMO",0.05}, 
		{"vil_SVD_63",0.11}, 
		{"vil_SVD_S",0.10}, 
		{"vil_SVD_M",0.10}, 
		{"vil_SVD_P21",0.09}, 
		{"vil_SVDK",0.10}, 
		{"SVD",0.15}, 
		{"vil_SVU",0.02} 
	};

	
	PistolMilWeaps[] = {
		{"glock17_EP1",	0.07}, 
		{"RH_g18",		0.05}, 
		{"RH_g17",		0.04}, 
		{"RH_g17sd",	0.03}, 
		{"RH_g19",		0.03}, 
		{"RH_g19t",		0.02}, 
		{"vil_Glock",	0.03}, 
		{"vil_Glock_o",	0.03}, 
		{"vil_USP",		0.05}, 
		{"vil_USPSD",	0.04}, 
		{"vil_USP45",	0.05}, 
		{"vil_USP45SD",	0.01}, 
		{"RH_usp",		0.05}, 
		{"RH_uspsd",	0.05}, 
		{"UZI_EP1",		0.05}, 
		{"Sa61_EP1",	0.05}, 
		{"RH_vz61",		0.05}, 
		{"RH_tec9",		0.04}, 
		{"M9",			0.07}, 
		{"M9SD",		0.06}, 
		{"RH_m9",		0.05}, 
		{"RH_m9c",		0.02},
		{"RH_m9sd",		0.04}, 
		{"RH_m9csd",	0.01}, 
		{"RH_anac",		0.01}  
	};



PistolsLow[] = {

{"RH_mk22sd",0.50}, 
{"RH_mk22vsd",0.50}, 
{"Makarov",0.50}, 
{"Colt1911",0.50}, 
{"revolver_EP1",0.50}, 
{"MakarovSD",0.50}, 
{"RH_python",0.50}, 
{"RH_browninghp",0.50}, 
{"RH_p226",0.50}, 
{"RH_p226s",0.50}, 
{"RH_p38",0.50}, 
{"RH_ppk",0.50}, 
{"RH_m1911",0.50}, 
{"RH_m1911sd",0.50}, 
{"RH_m1911old",0.50}, 
{"RH_tt33",0.50}, 
{"RH_m93r",0.50}, 
{"vil_B_HP",0.50}, 
{"RH_mk22",0.50}, 
{"RH_mk22v",0.50}, 
{"RH_mk2",0.50}, 
{"vil_Tt33",0.50}, 
{"Vil_PYA",0.50} 
};



SubWeaps[] = {
	{"vil_uzimini",0.06}, 
	{"vil_uzi_c",0.03}, 
	{"vil_uzi_SD",0.03}, 
	{"vil_uzimini_SD",0.03}, 
	{"vil_9a91_c",0.07}, 
	{"vil_9a91_csd",0.04}, 
	{"MP5A5",0.03}, 
	{"MP5SD",0.03}, 
	{"vil_MP5SD_EOTech",0.02}, 
	{"vil_MP5_EOTech",0.03}, 
	{"bizon",0.11}, 
	{"bizon_silenced",0.02}, 
	{"vil_VAL_C",0.07}, 
	{"vil_Vikhr",0.11}, 
	{"vil_VAL",0.11}, 
	{"vil_9a91",0.11}, 
	{"vil_Groza_GL",0.03}, 
	{"vil_uzi",0.07}
	
};



RiflesLowWeaps[] = {
{"gms_k98",0.50}, 
{"vil_AG3",0.50}, 
{"LeeEnfield",0.50}, 
{"vil_sg542f",0.50}, 
{"gms_k98_rg",0.50}, 
{"gms_k98_knife",0.50}, 
{"RH_m14",0.50}, 
{"RH_sc2",0.50}, 
{"RH_m1s",0.50}, 
{"vil_SKS",0.50}, 
{"vil_G3a4",0.50}, 
{"vil_G3a4b",0.50}, 
{"vil_G3an",0.50}, 
{"vil_G3anb",0.50}, 
{"vil_sg540",0.50}, 
{"vil_sg542",0.50}, 
{"vil_Insas",0.50}, 
{"vil_M16A1",0.50}, 
{"vil_HK33",0.50} 
};



SniperLowWeaps[] = {
{"gms_k98zf39",0.50}, 
{"vil_Groza_SC",0.50}, 
{"M24_des_EP1",0.50}, 
{"vil_M21",0.50}, 
{"vil_M21G",0.50}, 
{"M40A3",0.50}, 
{"vil_m40a3",0.50}, 
{"huntingrifle",0.50}, 
{"VSS_vintorez",0.50}, 
{"RH_m21",0.50}, 
{"vil_vsk94",0.50}, 
{"vil_PSL1",0.50}, 
{"vil_M76",0.50}, 
{"vil_M91",0.50}, 
{"M24",0.50}, 
{"vil_VSS_PSO",0.50}, 
{"vil_M24b",0.50} 
};



AKLowWeaps[] = {
{"AKS_74_kobra",0.50}, 
{"AKS_74_U",0.50}, 
{"AK_107_kobra",0.50}, 
{"AK_107_GL_pso",0.50}, 
{"AK_107_pso",0.50}, 
{"AKS_74_pso",0.50}, 
{"AK_47_M",0.50}, 
{"AK_74",0.50}, 
{"vil_AKS_47",0.50}, 
{"vil_AK_47_49",0.50}, 
{"vil_AKM",0.50}, 
{"vil_AK_47_m1",0.50}, 
{"vil_AK_nato_m1",0.50}, 
{"vil_AKs_74_u45",0.50}, 
{"Vil_AKS_74_UB",0.50}, 
{"vil_AK_74M_PSO",0.50}, 
{"vil_AK_74m_k",0.50}, 
{"vil_AK_74m_c",0.50}, 
{"vil_AK_74m_p29",0.50}, 
{"Vil_AK_105_c",0.50}, 
{"Vil_AK_107_c",0.50}, 
{"vil_AEK1",0.50}, 
{"vil_AEK2",0.50}, 
{"vil_AeK_3_K",0.50}, 
{"Sa58V_CCO_EP1",0.50}, 
{"Sa58P_EP1",0.50}, 
{"Sa58V_EP1",0.50}, 
{"vil_Abakan_P29",0.50}, 
{"vil_ak12_ap",0.50}, 
{"AK_47_S",0.50}, 
{"AK_74_GL",0.50}, 
{"AK_107_GL_kobra",0.50}, 
{"AK_74_GL_kobra",0.50}, 
{"AKS_74",0.50}, 
{"vil_AK_47",0.50}, 
{"vil_AKM_GL",0.50}, 
{"vil_AKMS_GP25",0.50}, 
{"vil_M70",0.50}, 
{"vil_M70B",0.50}, 
{"vil_M64",0.50}, 
{"vil_ASH82",0.50}, 
{"vil_AMD63",0.50}, 
{"vil_PMI",0.50}, 
{"vil_MPi",0.50}, 
{"vil_AK_74",0.50}, 
{"vil_AK_74_gp",0.50}, 
{"vil_AKS_74",0.50}, 
{"vil_AKS_74_gp",0.50}, 
{"vil_AKS_74p",0.50}, 
{"vil_AKS_74p_45",0.50}, 
{"vil_AK_74P",0.50}, 
{"vil_AKS_74p_gp",0.50}, 
{"vil_AK_74m",0.50}, 
{"vil_AK_74m_gp_29",0.50}, 
{"vil_AK_74m_gp",0.50}, 
{"vil_type88_1",0.50}, 
{"vil_AK_103",0.50}, 
{"vil_AK_105",0.50}, 
{"vil_AK_107",0.50}, 
{"vil_Abakan",0.50}, 
{"vil_Abakan_gp",0.50}, 
{"vil_ak12",0.50}, 
{"vil_ak12_gp",0.50}, 
{"vil_AEK_GL",0.50}, 
{"vil_AeK_3",0.50}, 
{"vil_AeK_23",0.50} 
};


AKHighWeaps[] = {
	{"vil_AKMS",0.09}, 
	{"vil_AKs_74_u",0.09}, 
	{"vil_AMD",0.09}, 
	{"vil_PMIS",0.09}, 
	{"vil_PMI74S",0.09}, 
	{"vil_Rak74sgl",0.09},
	{"vil_AK_74m_EOT",0.08}, 
	{"vil_AK_74m_EOT_Alfa",0.08}, 
	{"vil_AK_74m_EOT_FSB",0.08}, 
	{"vil_AK_74m_EOT_FSB_45",0.07}, 
	{"vil_AK_74m_EOT_FSB_60",0.07}, 
	{"Sa58V_RCO_EP1",0.04}, 
	{"vil_AKMSB",0.02}, 
	{"Vil_AKS_74_UN_kobra",0.01}, 
	{"AKS_74_UN_kobra",0.01} 
};



LMGWeaps[] = {
	{"vil_Galil",0.07},  
	{"vil_Galil_arm",0.06},  
	{"vil_Insas_lmg",0.06}, 
	{"vil_RPK",0.05}, 
	{"vil_RPK75",0.05}, 
	{"vil_RPK75_M72",0.05}, 
	{"vil_RPK74",0.05}, 
	{"vil_RPK74M",0.05}, 
	{"vil_RPK74M_N",0.05}, 
	{"RPK_74",0.05}, 
	{"vil_RPK75_Romania",0.05}, 
	{"vil_RPD",0.05}, 
	{"vil_RPK74M_P29",0.05}, 
	{"vil_Minimi",0.04}, 
	{"vil_MG4",0.04}, 
	{"M249_DZ",0.04}, 
	{"vil_M249_Para",0.03}, 
	{"M249_EP1_DZ",0.03}, 
	{"MG36",0.03}, 
	{"MG36_camo",0.03}, 
	{"vil_MG4E",0.03},  
	{"M8_SAW",0.03}, 
	{"BAF_L110A1_Aim",0.02}, 
	{"M249_m145_EP1_DZE",0.01} 
};


L85Weaps[] = {
	{"BAF_L85A2_RIS_Holo",0.27},  
	{"BAF_L86A2_ACOG",0.13},      
	{"BAF_L85A2_UGL_Holo",0.20},  
	{"BAF_L85A2_RIS_SUSAT",0.10}, 
	{"BAF_L85A2_RIS_ACOG",0.10},  
	{"BAF_L85A2_UGL_SUSAT",0.10}, 
	{"BAF_L85A2_UGL_ACOG",0.10}  
};


M4Weaps[] = {
	{"M16A2",0.1}, 
	{"M4A1",0.1},  
	{"VIL_M4",0.1}, 
	{"m16a4",0.1}, 
	{"M16A4_GL",0.06}, 
	{"M16A2GL",0.06}, 
	{"vil_M4_EOT",0.06}, 
	{"VIL_M4_aim",0.06}, 
	{"M4A1_Aim",0.06}, 
	{"M4A1_Aim_camo",0.06}, 
	{"M4A3_CCO_EP1",0.06}, 
	{"M4A1_HWS_GL",0.04}, 
	{"M4A1_HWS_GL_camo",0.04}, 
	{"M4A1_AIM_SD_camo",0.03}, 
	{"M4A1_HWS_GL_SD_Camo",0.02}, 
	{"M16A4_ACG",0.01}, 
	{"M16A4_ACG_GL",0.01}, 
	{"M4A1_RCO_GL",0.01}, 
	{"M4A3_RCO_GL_EP1",0.01}, 
	{"M4SPR",0.01} 
};


M8Weaps[] = {
    {"m8_compact",0.20}, 
    {"m8_compact_pmc",0.17}, 
    {"m8_carbine_pmc",0.15}, 
    {"m8_carbine",0.14}, 
    {"m8_carbineGL",0.14}, 
    {"m8_holo_sd",0.11}, 
    {"m8_sharpshooter",0.09} 
};



HMGWeaps[] = {
	{"vil_zastava_m84",0.07}, 
	{"skavil_M60",0.07}, 
	{"skavil_M60e3",0.07}, 
	{"vil_Mg3",0.07}, 
	{"vil_FnMag",0.07}, 
	{"M240_DZ",0.07}, 
	{"M60A4_EP1_DZE",0.07}, 
	{"PK_DZ",0.07}, 
	{"BAF_L7A2_GPMG",0.07}, 
	{"vil_PKP",0.07}, 
	{"vil_PK",0.07}, 
	{"vil_PKM",0.07}, 
	{"vil_M240_B",0.07},
	{"Mk_48_DZ",0.03}, 
	{"vil_PKP_EOT",0.03},
	{"Pecheneg_DZ",0.02}, 
	{"m240_scoped_EP1_DZE",0.01} 
};



ShotgunWeaps[] = {
	{"Winchester1866",0.30}, 
	{"Crossbow_DZ",0.25},    
	{"Remington870",0.05},   
	{"Remington870_lamp",0.05},  
	{"M1014",0.15},  
	{"MR43",0.15},  
	{"Saiga12K",0.05} 
};


MeleeWeaps[] = {
	{"MeleeHatchet_DZE",0.35}, 
	{"MeleeMachete",0.25},  
	{"MeleeCrowbar",0.2},  
	{"MeleeFishingPole",0.14}
};


RocketWeaps[] = {
    {"Vil_RPO_A",0.004}, 
    {"M136",0.004},		
    {"vilas_rpg22",0.003}, 
    {"Vil_RPG7V_PGO",0.003}, 
    {"Vil_RPG7d_PGO",0.004}, 
    {"vil_Panzerfaust3",0.004}, 
    {"vil_CG84T",0.004}, 
    {"Vil_RPG16",0.003}, 
    {"Vil_RPG29",0.004}
};



UltraWeaps[] = {
	{"revolver_gold_EP1",0.28},
	{"RH_Deagleg",0.2},
	{"RH_anacg",0.24},
	{"Javelin",	0.002},
	{"AKS_GOLD",0.27}
};


SniperTopWeaps[] = {
	{"KSVK_DZE",0.25}, 
	{"FHQ_XM2010_DESERT", 0.16}, 
	{"BAF_LRR_scoped",0.16}, 
	{"BAF_LRR_scoped_W",0.13}, 
	{"FHQ_MSR_DESERT",0.12},  
	{"FHQ_XM2010_SD_DESERT",0.04}, 
	{"FHQ_MSR_SD_DESERT",0.04}, 
	{"USSR_cheytacM200",0.04}, 
	{"USSR_cheytacM200_sd",0.03}, 
	{"BAF_AS50_scoped_DZ",0.01} 
};



LauncherWeaps[] = {
	{"M32_EP1",0.05}, 
	{"M79_EP1",0.6},  
	{"Mk13_EP1",0.35} 
};


TWSWeaps[] = {
	{"AKS_74_GOSHAWK",0.22}, 
	{"BAF_L85A2_RIS_CWS",0.17}, 
	{"SCAR_L_STD_EGLM_TWS",0.07}, 
	{"SCAR_H_STD_TWS_SD",0.12}, 
	{"m8_tws_sd",0.12},
	{"m8_tws",0.10}, 
	{"M249_TWS_EP1",0.03}, 
	{"M110_TWS_EP1",0.02},
	{"FHQ_ACR_WDL_TWS",0.03}, 
	{"FHQ_ACR_WDL_TWS_SD",0.02}, 
	{"FHQ_ACR_BLK_TWS",0.03}, 
	{"FHQ_ACR_BLK_TWS_SD",0.02}, 
	{"FHQ_ACR_TAN_TWS",0.03}, 
	{"FHQ_ACR_TAN_TWS_SD",0.02}
};

NVweaps[] = {
{"vil_PKM_N",0.50}, 
{"FN_FAL_ANPVS4",0.50}, 
{"SVD_NSPU_EP1",0.50}, 
{"AKS_74_NSPU",0.50}, 
{"M110_NVG_EP1",0.50}, 
{"FHQ_MSR_NV_DESERT",0.50}, 
{"FHQ_MSR_NV_SD_DESERT",0.50}, 
{"FHQ_XM2010_NV_DESERT",0.50}, 
{"FHQ_XM2010_NV_SD_DESERT",0.50}, 
{"vil_VSS_N",0.50}, 
{"vil_VAL_N",0.50}, 
{"vil_AK_74_N",0.50} 
};


	trash[] = {
		{"TrashTinCan",0.5}
		,{"TrashJackDaniels",0.05}
		,{"ItemSodaEmpty",0.25}
		,{"ItemTrashToiletpaper",0.1}
		,{"ItemTrashRazor",0.1}
	};
	civilian[] = {
		{"FoodCanUnlabeled",0.07}
		,{"TrashJackDaniels",0.08}
		,{"ItemSodaEmpty",0.08}
		,{"ItemSodaCoke",0.09}
		,{"ItemSodaPepsi",0.09}
		,{"FoodCanBakedBeans",0.05}
		,{"FoodCanSardines",0.05}
		,{"FoodCanFrankBeans",0.05}
		,{"FoodCanPasta",0.05}
		,{"ItemBandage",0.06}
		,{"ItemPainkiller",0.06}
		,{"FoodBioMeat",0.01}
		,{"ItemDocument",0.03}
	};
	office2[] = {
		{"FoodCanUnlabeled",0.07}
		,{"TrashJackDaniels",0.08}
		,{"ItemSodaEmpty",0.08}
		,{"ItemSodaCoke",0.09}
		,{"ItemSodaPepsi",0.09}
		,{"FoodCanBakedBeans",0.05}
		,{"FoodCanSardines",0.05}
		,{"FoodCanFrankBeans",0.05}
		,{"FoodCanPasta",0.05}
		,{"ItemBandage",0.06}
		,{"ItemPainkiller",0.06}
		,{"FoodBioMeat",0.01}
		,{"ItemDocument",0.02}
	};
	food[] = {
		{"TrashTinCan",0.09}
		,{"TrashJackDaniels",0.12}
		,{"ItemSodaEmpty",0.12}
		,{"ItemSodaCoke",0.09}
		,{"ItemSodaPepsi",0.11}
		,{"FoodCanBakedBeans",0.07}
		,{"FoodCanSardines",0.07}
		,{"FoodCanFrankBeans",0.07}
		,{"FoodCanPasta",0.07}
		,{"FoodCanUnlabeled",0.1}
		,{"FoodPistachio",0.05}
		,{"FoodNutmix",0.04}
	};
	office[] = {
		{"FoodCanUnlabeled",0.06}
		,{"ItemSodaEmpty",0.06}
		,{"ItemSodaCoke",0.06}
		,{"ItemSodaPepsi",0.04}
		,{"TrashJackDaniels",0.04}
		,{"FoodCanBakedBeans",0.01}
		,{"FoodCanSardines",0.01}
		,{"FoodCanFrankBeans",0.01}
		,{"FoodCanPasta",0.01}
		,{"ItemWaterbottleUnfilled",0.01}
		,{"ItemWaterbottle",0.01}
		,{"ItemBandage",0.07}
		,{"ItemPainkiller",0.02}
		,{"ItemLockbox",0.01}
		,{"ItemDocument",0.02}
	};
	generic[] = {
		{"FoodCanUnlabeled",0.06}
		,{"ItemSodaEmpty",0.06}
		,{"ItemSodaCoke",0.06}
		,{"ItemSodaPepsi",0.04}
		,{"TrashJackDaniels",0.04}
		,{"FoodCanBakedBeans",0.01}
		,{"FoodCanSardines",0.01}
		,{"FoodCanFrankBeans",0.01}
		,{"FoodCanPasta",0.01}
		,{"ItemWaterbottleUnfilled",0.01}
		,{"ItemWaterbottle",0.01}
		,{"ItemBandage",0.11}
		,{"ItemPainkiller",0.02}
	};
	medical[] = {
		{"ItemBandage",0.4}
		,{"ItemPainkiller",0.15}
		,{"ItemMorphine",0.2}
		,{"ItemEpinephrine",0.1}
		,{"ItemAntibiotic",0.1}
	};
	hospital[] = {
		{"ItemBandage",0.33}
		,{"ItemPainkiller",0.16}
		,{"ItemMorphine",0.13}
		,{"ItemEpinephrine",0.09}
		,{"ItemBloodbag",0.17}
		,{"ItemAntibiotic",0.12}
	};
	military[] = {
		{"FoodCanUnlabeled",0.07}
		,{"ItemSodaEmpty",0.04}
		,{"ItemSodaCoke",0.01}
		,{"ItemSodaPepsi",0.01}
		,{"ItemBandage",0.04}
		,{"ItemAntibiotic",0.04}
		,{"ItemPainkiller",0.04}
		,{"ItemMorphine",0.01}
		,{"HandGrenade_west",0.01}
		,{"HandGrenade_east",0.01}
		,{"SmokeShell",0.04}
		,{"SmokeShellRed",0.02}
		,{"SmokeShellGreen",0.02}
		,{"FoodMRE",0.03}
		,{"ItemDocument",0.02}
	};
	militarypilot[] = {
		{"FoodCanUnlabeled",0.06}
		,{"ItemSodaEmpty",0.04}
		,{"ItemSodaCoke",0.01}
		,{"ItemSodaPepsi",0.01}
		,{"ItemBandage",0.04}
		,{"ItemAntibiotic",0.04}
		,{"ItemPainkiller",0.04}
		,{"ItemMorphine",0.01}
		,{"HandGrenade_west",0.01}
		,{"HandGrenade_east",0.01}
		,{"SmokeShell",0.04}
		,{"SmokeShellRed",0.02}
		,{"SmokeShellGreen",0.02}
		,{"FoodMRE",0.03}
		,{"ItemHotwireKit",0.03}
	};
	policeman[] = {
		{"ItemBandage",0.3}
		,{"ItemComboLock",0.05}
		,{"SmokeShell",0.04}
		,{"FoodMRE",0.04}
		,{"ItemHotwireKit",0.03}
		,{"ItemDocument",0.02}
	};
	hunter[] = {
		{"ItemBandage",0.4}
		,{"ItemWaterbottleUnfilled",0.05}
		,{"WoodenArrow",0.2}
		,{"FoodMRE",0.01}
		,{"FoodNutmix",0.02}
		,{"ItemDocument",0.01}
		,{"ItemMixOil",0.01}
	};
	worker[] = {
		{"FoodCanUnlabeled",0.09}
		,{"TrashJackDaniels",0.09}
		,{"ItemSodaEmpty",0.1}
		,{"ItemSodaCoke",0.1}
		,{"ItemSodaPepsi",0.1}
		,{"FoodCanBakedBeans",0.06}
		,{"FoodCanSardines",0.06}
		,{"FoodCanFrankBeans",0.06}
		,{"FoodCanPasta",0.06}
		,{"ItemBandage",0.11}
		,{"ItemPainkiller",0.06}
		,{"ItemWire",0.01}
		,{"ItemTankTrap",0.03}
		,{"ItemComboLock",0.04}
		,{"ItemSledgeHead",0.01}
		,{"ItemDocument",0.02}
	};
	clothes[] = {
		{"Skin_RU_Policeman_DZ",0.11}
		,{"Skin_Pilot_EP1_DZ",0.1}
		,{"Skin_Functionary1_EP1_DZ",0.1}
		,{"Skin_Priest_DZ",0.1}
		,{"Skin_Rocker1_DZ",0.07}
		,{"Skin_Rocker2_DZ",0.07}
		,{"Skin_Rocker3_DZ",0.08}
		,{"Skin_Rocker4_DZ",0.08}
		,{"Skin_SurvivorW3_DZ",0.09}
		,{"Skin_SurvivorWpink_DZ",0.09}
		,{"Skin_SurvivorWurban_DZ",0.07}
		,{"Skin_INS_Bardak_DZ",0.02}
		,{"Skin_INS_Worker2_DZ",0.02}
	};
	militaryclothes[] = {
		{"Skin_Camo1_DZ",0.09}
		,{"Skin_Sniper1_DZ",0.08}
		,{"Skin_Rocket_DZ",0.05}
		,{"Skin_Soldier1_DZ",0.5}
		,{"Skin_Drake_Light_DZ",0.07}
		,{"Skin_Soldier_TL_PMC_DZ",0.07}
		,{"Skin_Soldier_Sniper_PMC_DZ",0.05}
		,{"Skin_Soldier_Bodyguard_AA12_PMC_DZ",0.07}
		,{"Skin_CZ_Special_Forces_GL_DES_EP1_DZ",0.08}
		,{"Skin_FR_OHara_DZ",0.08}
		,{"Skin_FR_Rodriguez_DZ",0.09}
		,{"Skin_CZ_Soldier_Sniper_EP1_DZ",0.04}
		,{"Skin_Graves_Light_DZ",0.09}
		,{"Skin_INS_Soldier_AR_DZ",0.05}
		,{"Skin_INS_Soldier_CO_DZ",0.04}
	};
	specialclothes[] = {
		{"Skin_Ins_Soldier_GL_DZ",0.05}
		,{"Skin_GUE_Commander_DZ",0.08}
		,{"Skin_Bandit1_DZ",0.08}
		,{"Skin_Bandit2_DZ",0.06}
		,{"Skin_BanditW1_DZ",0.07}
		,{"Skin_BanditW2_DZ",0.07}
		,{"Skin_TK_INS_Soldier_EP1_DZ",0.05}
		,{"Skin_TK_INS_Warlord_EP1_DZ",0.07}
		,{"Skin_SurvivorWcombat_DZ",0.08}
		,{"Skin_SurvivorWdesert_DZ",0.08}
		,{"Skin_GUE_Soldier_MG_DZ",0.05}
		,{"Skin_GUE_Soldier_Sniper_DZ",0.04}
		,{"Skin_GUE_Soldier_Crew_DZ",0.04}
		,{"Skin_GUE_Soldier_CO_DZ",0.04}
		,{"Skin_GUE_Soldier_2_DZ",0.04}
		,{"Skin_TK_Special_Forces_MG_EP1_DZ",0.02}
		,{"Skin_TK_Soldier_Sniper_EP1_DZ",0.02}
		,{"Skin_TK_Commander_EP1_DZ",0.02}
		,{"Skin_RU_Soldier_Crew_DZ",0.02}
		,{"Skin_INS_Lopotev_DZ",0.02}
	};
	tents[] = {
		{"WeaponHolder_ItemTentOld",0.34}
		,{"WeaponHolder_ItemTentDomed",0.33}
		,{"WeaponHolder_ItemTentDomed2",0.33}
	};
	backpacks[] = {
		{"DZ_Patrol_Pack_EP1",0.49}
		,{"DZ_Assault_Pack_EP1",0.35}
		,{"DZ_ALICE_Pack_EP1",0.19}
		,{"DZ_TK_Assault_Pack_EP1",0.16}
		,{"DZ_CivilBackpack_EP1",0.11}
	};
	militarybackpacks[] = {
		{"DZ_TerminalPack_EP1",0.30}
		,{"DZ_ALICE_Pack_EP1",0.15}
		,{"DZ_TK_Assault_Pack_EP1",0.15}
		,{"DZ_CompactPack_EP1",0.20}
		,{"DZ_British_ACU",0.14}
		,{"DZ_GunBag_EP1",0.15}
		,{"DZ_Backpack_EP1",0.11}
	};
	militaryammo[] = {
		{"2000Rnd_762x51_M134",0.02}
		,{"PipeBomb",0.01}
		,{"29Rnd_30mm_AGS30",0.01}
		,{"50Rnd_127x107_DSHKM",0.6}
		,{"48Rnd_40mm_MK19",0.01}
		,{"100Rnd_127x99_M2",0.36}
	};
};
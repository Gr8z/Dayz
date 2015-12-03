startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

preload_done = false;
dayZ_instance =	33;	
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

player setVariable ["BIS_noCoreConversations", true];
enableRadio true;
enableSentences false;

call compile preprocessFileLineNumbers"GG\init\config.sqf";
call compile preprocessFileLineNumbers"GG\donators\donators.sqf";

spawnArea= 1500; 
dayz_minpos = -1; 
dayz_maxpos = 26000;
dayz_MapArea = 18000;

GGSafezones = [
	[Schratten, 75, "Schratten"],
	[Emmen, 100, "Emmen"],
	[Lenz, 50, "Lenzburg"],
	[Chatzbach, 25, "Chatzbach"],
	[Hero, 50, "Hero"],
	[Wholesale1, 100, "West Wholesaler and Boat Dealer"],
	[Wholesaler, 100, "East Wholesaler and Boat Dealer"],
	[black, 50, "Black Market"],
	[Aircraft, 100, "Aircraft"]
];

call compile preprocessFileLineNumbers "GG\init\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "GG\init\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "GG\init\compiles.sqf";
call compile preprocessFileLineNumbers "GG\bike\init.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "traders.sqf";
call compile preprocessFileLineNumbers "GG\tow_lift\init.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\dynamic_vehicle.sqf";
	call compile preprocessFileLineNumbers '\marmadebug\init\fn_init.sqf';
	execVM "\z\addons\dayz_server\missions\Napf\mission.sqf";
	diag_log text "APlotForLife";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	"ctc_HumanityChange" addPublicVariableEventHandler {[_this select 1] execVM 'GG\humanitychange.sqf'};
	execVM "\z\addons\dayz_server\init\most_wanted.sqf";
};

if (!isDedicated) then {
	0 fadeSound 0;
	
	waitUntil {(!isNil "sm_done" && !isNil "dayz_loadScreenMsg")};
	diag_log format["%1: Server done loading",servertime];
	
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	[] spawn {
		uiSleep 45;
		if(!preload_done) then {
			dayz_loadScreenMsg = "Loading is taking longer than usual, please relog and try again.";
			uiSleep 10;
			endMission "END1";
		};
	};
	
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "GG\compile\player_monitor.sqf";
	//Group Management
	[] execVM "GG\group\init.sqf";
	[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	//Remote Messages
	_nil = [] execVM "GG\remote.sqf";
	//Service Points
	execVM "GG\service_point\service_point.sqf";
	//Key changer
	_nil = [] execVM "GG\VehicleKeyChanger\VehicleKeyChanger_init.sqf";
	//Player Hud
	execVM "GG\hud\playerHud.sqf";
	//Map Marker Titling
	execVM "GG\MapMarkerTitling.sqf";
	
	preload_done = true;
};

execVM "GG\external\DynamicWeatherEffects.sqf";

execVM "GG\preview.sqf";
execVM "GG\gold\init.sqf";
execVM "GG\weed\farms.sqf";
execVM "GG\antimanualfire.sqf";

#include "GG\BIS_Effects\init.sqf"

_pic = "GG\images\logo.paa";
[
    '<img align=''left'' size=''2.0'' shadow=''0'' image='+(str(_pic))+' />',
    safeZoneX+0.027,
    safeZoneY+safeZoneH-0.2,
    99999,
    0,
    0,
    3090
] spawn bis_fnc_dynamicText;

6 cutRsc ["EarPlugs", "PLAIN"];

{
_adminated = _x getVariable ["adminated",0];
if( !isNil "_adminated" &&  _adminated != 0)then{
_x setObjectTexture [0, "GG\images\admin.jpg"];
};
}forEach playableUnits; 

GGNoBuildList = [
"RU_Doctor","RU_Housewife3","Villager1","RU_Policeman","RU_Profiteer4","TK_Commander_EP1_DZ",
"CDF_Soldier_Crew","BAF_Soldier_AAA_MTP","BAF_Soldier_FAC_DDPM","BAF_Soldier_EN_MTP","USMC_Soldier_Crew",
"Damsel1","Farmwife5","RU_Madam5","Profiteer1","Functionary2_EP1",
"RU_Damsel5","Farmwife2","HouseWife3",
"RU_Damsel1","Citizen4","RU_Damsel3",
"FR_Assault_GL","FR_Sapper","US_Soldier_AHAT_EP1","FR_Corpsman",
"Soldier_AT_PMC","Poet_PMC","Dixon_PMC","Soldier_Medic_PMC",
"TK_CIV_Takistani06_EP1","Tanny_PMC","Graves","US_Delta_Force_AR_EP1","GUE_Commander",
"Damsel3","Soldier_MG_PKM_PMC","GUE_Worker2","GUE_Woodlander2",
"RUS_Soldier2","Drake_Light","GUE_Woodlander3","Soldier_GL_PMC",
"GUE_Villager3","CIV_EuroWoman01_EP1","Dr_Annie_Baker_EP1","RUS_Commander",
"Damsel5","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","Ins_Soldier_AR",
"Ins_Lopotev","Ins_Worker2","Ins_Woodlander3","Dr_Hladik_EP1","pook_Doc_Bell47","Ins_Woodlander2","Sign_sphere100cm_EP1"
];
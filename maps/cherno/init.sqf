startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

preload_done = false;
dayZ_instance =	22;	
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

player setVariable ["BIS_noCoreConversations", true];
enableRadio true;
enableSentences false;

call compile preprocessFileLineNumbers"GG\config.sqf";

spawnArea= 1500; 
dayz_minpos= -1; 
dayz_maxpos	= 16000;
dayz_MapArea = 14000;

GGSafezones = [
	[zonestary, 100, "Stary"],
	[zonebash, 100, "Bash"],
	[zoneklen, 100, "Klen"],
	[zonebor, 75, "Bor"],
	[zonehero, 100, "Hero"],
	[zoneaircraft, 100, "Aircraft"],
	[zonewholesale1, 50, "Wholesale 1"],
	[zonewholesale2, 50, "Wholesale 2"]
];

EpochEvents = [
	["any","any","any","any",30,"abandonedvault"],
	["any","any","any","any",0,"crash_spawner"],
	["any","any","any","any",40,"supply_drop"]
];

call compile preprocessFileLineNumbers "GG\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "GG\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "GG\compiles.sqf";
call compile preprocessFileLineNumbers "GG\bike\init.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "traders.sqf";
call compile preprocessFileLineNumbers "GG\tow_lift\init.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\dynamic_vehicle.sqf";
	execVM "\z\addons\dayz_server\missions\Chernarus\mission.sqf";
	diag_log text "APlotForLife";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	"ctc_HumanityChange" addPublicVariableEventHandler {[_this select 1] execVM 'GG\humanitychange.sqf'};
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
	_playerMonitor = 	[] execVM "GG\player_monitor.sqf";
	[] execVM "GG\group\init.sqf";
	[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	_nil = [] execVM "GG\remote.sqf";
	execVM "GG\service_point\service_point.sqf";
	_nil = [] execVM "GG\VehicleKeyChanger\VehicleKeyChanger_init.sqf";
	execVM "GG\hud\playerHud.sqf";

	
	preload_done = true;
};

execVM "GG\debug.sqf";
execVM "GG\preview.sqf";
execVM "GG\gold\init.sqf";
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

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

dayZ_instance =	33;	
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

player setVariable ["BIS_noCoreConversations", true];
enableRadio true;
enableSentences false;

call compile preprocessFileLineNumbers"GG\config.sqf";

spawnArea= 1500; 
dayz_minpos = -1; 
dayz_maxpos = 26000;
dayz_MapArea = 18000;

EpochEvents = [
	["any","any","any","any",30,"abandonedvault"],
	["any","any","any","any",0,"crash_spawner"],
	["any","any","any","any",40,"supply_drop"]
];

call compile preprocessFileLineNumbers "GG\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "GG\A_Plot_for_Life\init\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "GG\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "traders.sqf";
call compile preprocessFileLineNumbers "GG\tow_lift\init.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\Napf\dynamic_vehicle.sqf";
	execVM "\z\addons\dayz_server\missions\Napf\mission.sqf";
	diag_log text "APlotForLife";
	_serverMonitor = [] execVM "custom\system\server_monitor1.sqf";
	diag_log format["[_serverMonitor: %1]",_serverMonitor];
	
};

if (!isDedicated) then {
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	execVM "GG\spawn\start.sqf";
	[] execVM "GG\group\init.sqf";
	[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	_nil = [] execVM "GG\remote.sqf";
	execVM "GG\service_point\service_point.sqf";
	_nil = [] execVM "GG\VehicleKeyChanger\VehicleKeyChanger_init.sqf";
	execVM "GG\hud\playerHud.sqf"
	execVM "GG\kill_msg.sqf";
	execVM "GG\checkDriver.sqf";
};
[] execVM "GG\safezone.sqf";
execVM "GG\gold\init.sqf";
execVM "GG\MapMarkerTitling.sqf";
execVM "GG\weed\farms.sqf";


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

{
_adminated = _x getVariable ["adminated",0];
if( !isNil "_adminated" &&  _adminated != 0)then{
_x setObjectTexture [0, "GG\images\admin.jpg"];
};
}forEach playableUnits; 

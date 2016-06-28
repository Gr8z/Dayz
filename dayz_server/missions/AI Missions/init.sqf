private["_modVariant"];

waitUntil{initialized};

sleep 60;

if (!isServer) exitWith { diag_log text format ["[AI Missions]: <ERROR> AI Missions Installed Incorrectly! AI Missions are not Running!"]; };
if (!isnil("AIMissionsInstalled")) exitWith { diag_log text format ["[AI Missions]: <ERROR> AI Missions are Installed Twice or Installed Incorrectly!"]; };

AIMissionsInstalled = true;

diag_log text format ["[AI Missions]: Starting AI Missions."];

if ( (isnil("DZAI_isActive")) && (isnil("SAR_version")) && (isnil("WAIconfigloaded")) ) then
{
	diag_log text format ["[AI Missions]: Relations not found! Using AI Mission Relations."];

	createCenter east;
	
	WEST setFriend [EAST,0];
	EAST setFriend [WEST,0];

	EAST setFriend [CIVILIAN,0];
	CIVILIAN setFriend [EAST,0];
} else {
	Relations = 0;
	if (!isnil("DZAI_isActive")) then {
		diag_log text format ["[AI Missions]: DZAI Found! Using DZAI's Relations!"];
		Relations = Relations + 1;
	};
	if (!isnil("SAR_version")) then {
		diag_log text format ["[AI Missions]: Sarge AI Found! Using Sarge AI's Relations!"];
		Relations = Relations + 1;
	};
	if (!isnil("WAIconfigloaded")) then {
		diag_log text format ["[AI Missions]: Wicked AI Found! Using Wicked AI's Relations!"];
		Relations = Relations + 1;
	};
	if (Relations > 1) then {
		diag_log text format ["[AI Missions]: Multiple Relations Detected! Unwanted AI Behaviour May Occur!"];
		diag_log text format ["[AI Missions]: If Issues Arise, Decide on a Single AI System! (DayZAI, SargeAI, or WickedAI)"];
	};
	Relations = nil;
};

call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\AI Missions\config.sqf";

diag_log text format ["[AI Missions]: Currently Running Version: %1", AIMissionVersion];

if (AIMissionVersion != "1.1FIN") then {
	diag_log text format ["[AI Missions]: Outdated Configuration Detected! Please Update AI Missions!"];
	diag_log text format ["[AI Missions]: Old Versions are not supported by the Mod Author!"];
};

diag_log text format ["[AI Missions]: Mission and Extended Configuration Loaded!"];

AIMissionWorldName = toLower format ["%1", worldName];
diag_log text format["[AI Missions]: %1 Detected. Map Specific Settings Adjusted!", AIMissionWorldName];

_modVariant = toLower( getText (configFile >> "CfgMods" >> "DayZ" >> "dir"));
if (_modVariant == "@dayz_epoch") then {Epoch = true;} else {Epoch = false;};
if ((!(Epoch)) AND (!(isNil "PVDZE_serverObjectMonitor"))) then {Epoch = true;};

if (Epoch) then {
	diag_log text format ["[AI Missions]: DayZ Epoch Detected! Some Scripts Adjusted!"];
};

call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\AI Missions\functions.sqf";

HeroUnits = [];
BanditUnits = [];

[] ExecVM HeroTimer;
[] ExecVM BanditTimer;
HeroDone = false;
BanditDone = false;

[] ExecVM MarkerRefresh;
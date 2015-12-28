private ["_isInfected","_doLoop","_hiveVer","_isHiveOk","_playerID","_playerObj","_primary","_key","_charID","_playerName","_backpack","_isNew","_inventory","_survival","_model","_mags","_wpns","_bcpk","_config","_newPlayer"];

_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;

if ((_playerName == '__SERVER__')||(_playerID == '')||(local player)||(isNil "sm_done")) exitWith {};

_inventory 	= [];
_backpack 	= [];
_survival 	= [0,0,0];
_isInfected = 0;
_model 		= "";

if (_playerID == "") then {_playerID = getPlayerUID _playerObj};


if ((_playerID == "")||(isNil "_playerID")) exitWith {diag_log ("server_playerLogin: LOGIN FAILED: Player [" + _playerName + "] has no login ID")};

_doLoop = 0;
while {_doLoop < 5} do {
	_key = format["CHILD:101:%1:%2:%3:",_playerID,dayZ_instance,_playerName];
	_primary = _key call server_hiveReadWrite;
	if (count _primary > 0) then {
		if ((_primary select 0) != "ERROR") then {
			_doLoop = 9;
		};
	};
	_doLoop = _doLoop + 1;
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith {diag_log ("server_playerLogin: LOGIN RESULT: Exiting, player object null: " + str(_playerObj))};
if ((_primary select 0) == "ERROR") exitWith {diag_log format ["server_playerLogin: LOGIN RESULT: Exiting, failed to load _primary: %1 for player: %2 ",_primary,_playerID]};
_newPlayer 	= _primary select 1;
_isNew 		= count _primary < 7;
_charID 	= _primary select 2;

_hiveVer = 0;
if (!_isNew) then {	
	_inventory 	= _primary select 4;
	_backpack 	= _primary select 5;
	_survival 	= _primary select 6;
	_model 		= _primary select 7;
	_hiveVer 	= _primary select 8;
	if (!(_model in AllPlayers)) then {
		_model = "Survivor2_DZ";
	};
} else {
	_playerObj setVariable["freshSpawn",1,true];
	_isInfected = 0;
	_model 		= _primary select 4;
	_hiveVer 	= _primary select 5;
	if (isNil "_model") then {
		_model = "Survivor2_DZ";
	} else {
		if (_model == "") then {
			_model = "Survivor2_DZ";
		};
	};
	_config = (configFile >> "CfgSurvival" >> "Inventory" >> "Default");
	_mags = getArray (_config >> "magazines");
	_wpns = getArray (_config >> "weapons");
	_bcpk = getText (_config >> "backpack");
	if (!isNil "DefaultMagazines") then 	{_mags = DefaultMagazines};
	if (!isNil "DefaultWeapons") then 	{_wpns = DefaultWeapons};
	if (!isNil "DefaultBackpack") then 	{_bcpk = DefaultBackpack};
	_key = format["CHILD:203:%1:%2:%3:",_charID,[_wpns,_mags],[_bcpk,[],[]]];
	_key call server_hiveWrite;
};

_msg = format ['%1 CONNECTED',toUpper(_playerName)];
[nil, nil, rspawn, [_msg], {systemChat (_this select 0);}] call RE;
diag_log format["server_playerLogin: LOGIN LOADED: %1(%2) Type: %3 Pos: %4 New: %5",_playerName,_playerObj,(typeOf _playerObj),(getPosATL _playerObj),_isNew];

_isHiveOk = false;
if (_hiveVer >= dayz_hiveVersionNo) then {_isHiveOk = true};
if (worldName == "chernarus") then {
	([4654,9595,0] nearestObject 145259) setDamage 1;
	([4654,9595,0] nearestObject 145260) setDamage 1;
};
dayzPlayerLogin = [_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer,_isInfected];
(owner _playerObj) publicVariableClient "dayzPlayerLogin";
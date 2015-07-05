private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_loc_message","_key","_death_record","_pic","_wepText","_killerPlayerID"];
//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_characterID = 	_this select 0;
_minutes =		_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_infected =		_this select 4;

if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then {
	_victimName =	_this select 5;
} else {
	_victimName =  if (alive _newObject) then {name _newObject;} else {"";};
};

_victim = _newObject;
_newObject setVariable ["bodyName", _victimName, true];
_newObject setVariable ["bodyUID", _playerID, true];

_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];

// when a zombie kills a player _killer, _killerName && _weapon will be "nil"
// we can use this to determine a zombie kill && send a customized message for that. right now no killmsg means it was a zombie.
if (_killerName != "nil") then
{
	_weapon = _victim getVariable["AttackedByWeapon", "nil"];
	_distance = _victim getVariable["AttackedFromDistance", "nil"];
	
	if (_distance > 9000) then {
		_distance = 0;
	} else {
		_distance = round _distance;
	};
	 
	if (_victimName == _killerName) then
	{
		_message = format["%1 killed himself",_victimName];
		_loc_message = format["PKILL: %1 killed himself", _victimName];
	}
	else
	{
		if (side _killer == EAST) then {	
			_killerName = "AI";
			_message = format["%1 was killed by AI with weapon %2 from %3m",_victimName, _weapon, _distance];
			_loc_message = format["PKILL: %1 (%4) was killed by AI with weapon %2 from %3m", _victimName, _weapon, _distance, _playerID];
			_pic = (getText (configFile >> 'cfgWeapons' >> _weapon >> 'picture'));
			_wepText = (getText (configFile >> 'cfgWeapons' >> _weapon >> 'displayName'));
			if (_pic == "") then {
				_weapon = typeOf (vehicle _killer);
				_pic = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'picture'));
				_wepText = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'displayName'));
			};
		} else {
			_killerPlayerID = getPlayerUID _killer;
			_message = format["%1 was killed by %2 with weapon %3 from %4m",_victimName, _killerName, _weapon, _distance];
			_loc_message = format["PKILL: %1 (%5) was killed by %2 (%6) with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance, _playerID, _killerPlayerID];
			_pic = (getText (configFile >> 'cfgWeapons' >> _weapon >> 'picture'));
			_wepText = (getText (configFile >> 'cfgWeapons' >> _weapon >> 'displayName'));
			if (_pic == "") then {
				_weapon = typeOf (vehicle _killer);
				_pic = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'picture'));
				_wepText = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'displayName'));
			};
		};
		PVDZGG_Death_msg = [_killerName, _pic, _victimName, _distance, _wepText, nil, nil];
		publicVariable "PVDZGG_Death_msg";
	};
};

uiSleep 3;

if (_killerName != "nil") then
{

	diag_log _loc_message;

	if(DZE_DeathMsgGlobal) then {
		[nil, nil, rspawn, [_killer, _message], { (_this select 0) globalChat (_this select 1) }] call RE;
	};
	/* needs customRemoteMessage
	if(DZE_DeathMsgGlobal) then {
		customRemoteMessage = ['globalChat', _message, _killer];
		publicVariable "customRemoteMessage";
	};
	*/
	if(DZE_DeathMsgSide) then {
		[nil, nil, rspawn, [_killer, _message], { (_this select 0) sideChat (_this select 1) }] call RE;
	};
	if(DZE_DeathMsgTitleText) then {
		[nil,nil,"per",rTITLETEXT,_message,"PLAIN DOWN"] call RE;
	};

	// build array to store death messages to allow viewing at message board in trader citys.
	_death_record = [
		_victimName,
		_killerName,
		_weapon,
		_distance,
		ServerCurrentTime
	];
	PlayerDeaths set [count PlayerDeaths,_death_record];

	// Cleanup
	_victim setVariable["AttackedBy", "nil", true];
	_victim setVariable["AttackedByName", "nil", true];
	_victim setVariable["AttackedByWeapon", "nil", true];
	_victim setVariable["AttackedFromDistance", "nil", true];
};

_newObject setVariable["processedDeath",diag_tickTime];

if (typeName _minutes == "STRING") then
{
	_minutes = parseNumber _minutes;
};

diag_log ("PDEATH: Player Died " + _playerID);

if (_characterID != "0") then
{
	_key = format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
	#ifdef DZE_SERVER_DEBUG_HIVE
	diag_log ("HIVE: WRITE: "+ str(_key));
	#endif
	_key call server_hiveWrite;
}
else
{
	deleteVehicle _newObject;
};
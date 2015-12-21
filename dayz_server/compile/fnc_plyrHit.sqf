private ["_victim","_attacker","_damage","_vehicle","_distance","_wepstate","_displayName","_weapon","_log","_stime","_hours","_minutes","_log_menu"];
_victim 	= _this select 0;
_attacker 	= _this select 1;
_damage 	= _this select 2;

_vehicle 	= vehicle _attacker;
_distance 	= _victim distance _attacker;
_wepstate 	= weaponState _attacker;
if (isNil '_wepstate') exitWIth {};

_weapon 	= _wepstate;
if ((!isPlayer _attacker) || (isNull _attacker) || (owner _victim == owner _attacker)) exitWith {
	if !(isNull _attacker) then {
		if ((getPlayerUID _attacker == '')&&!(isNull(group _attacker))) then {
			diag_log ("FNC_plyrHit: AI-KILL! Weapon: "+str _wepstate);
			_victim setVariable["AttackedBy", _attacker];
			_victim setVariable["AttackedByName", "AI"];
			_victim setVariable["AttackedByWeapon", _wepstate];
			_victim setVariable["AttackedFromDistance", _distance];
		};
	};
};
if ((_vehicle isKindOf "AIR")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "LandVehicle")) then {
	_displayName = (getText (configFile >> 'CfgVehicles' >> typeOf _vehicle >> 'displayName'));
	if !(isNull (gunner _vehicle)) then {
		_attacker = (gunner _vehicle);
		_weapon = [""+_displayName+"(gunner)",typeOf _vehicle,"Gunner"];
	} else {
		if (_vehicle isKindOf "AIR") then {
			_weapon = [""+_displayName+"(pilot)",typeOf _vehicle,"Driver"];
		} else {
			_weapon = [""+_displayName+"(driver)",typeOf _vehicle,"Driver"];
		};
	};
} else {
	if (_wepstate select 0 == "") then {_weapon = ["unknown","","Player"]} else {
		if (_wepstate select 0 == "Throw") then {
			_weapon = [_wepstate select 3,_wepstate select 3,"Player"];
		} else {
			_weapon = [_wepstate select 0,_wepstate select 0,"Player"];
		};
	};
};

_log 		= format["PHIT: %1 was hit by %2 with %3 from %4m with %5 dmg", name _victim, name _attacker, _weapon select 0, _distance, _damage];
_stime 		= (servertime);
_hours 		= round(_stime/60/60);
_minutes 	= round(_stime/60) - (_hours*60);
_log_menu 	= format [" @ UPT: "+str _hours+"h(s) "+str _minutes+"min(s)"];
PVOZ_hitlog = PVOZ_hitlog + [['     '+_log+_log_menu,'','0','1','0','0',[1,0.5,0,1]]];
diag_log (_log);

_victim setVariable["AttackedBy", _attacker];
_victim setVariable["AttackedByName", (name _attacker)];
_victim setVariable["AttackedByWeapon", _weapon];
_victim setVariable["AttackedFromDistance", _distance];
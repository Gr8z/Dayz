private ["_unit","_player","_humanity","_banditkills","_humankills"];
_unit = _this select 0;
_player = _this select 1;

if (isPlayer _player) then {
	private ["_banditkills","_humanity","_humankills"];
	_banditkills 	= _player getVariable["banditKills",0];
	_humankills 	= _player getVariable["humanKills",0];
	_humanity 		= _player getVariable["humanity",0];
	if (HumanityGain) then {
		if (_unit getVariable ["Hero", false]) exitWith { _player setVariable ["humanity",(_humanity - BanditHumanity),true]; };
		if (_unit getVariable ["Bandit", false]) exitWith { _player setVariable ["humanity",(_humanity + HeroHumanity),true]; };
	};
	if (CountKills) then {
		if (_unit getVariable ["Hero", false]) then {
			_player setVariable ["humanKills",(_humankills + 1),true];
		} else {
			_player setVariable ["banditKills",(_banditkills + 1),true];
		};
	};
	{
		if (((position _x) distance (position _unit)) <= 300) then {
			_x reveal [_player, 4.0];
		}
	} forEach allUnits;
} else {
	if (RunGear) then {
		removeAllWeapons _unit;
		{
			_unit removeMagazine _x
		} forEach magazines _unit;
	};
};

if (CleanDeath) then {
	_unit call AIMissionPurge;
	if (CleanDeath) exitWith {};
};

if (UseNVG) then {
	_unit removeWeapon "NVGoggles";
};

if (UseRPG AND ("RPG7V" in (weapons _unit))) then {
	_unit removeWeapon "RPG7V";
	_unit removeMagazines "PG7V";
};

[BodyTime,10] call AIMissionSleep;
_unit call AIMissionPurge;

private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_killer","_killerName","_isOK","_message","_loc_message","_weaponz","_distance","_weapon","_wptype","_dmtype","_stime","_hours","_minuz","_log_menu","_isWeapon","_isMagazine","_isVehicle","_pic","_lvl","_offset","_key"];
_characterID = 	_this select 0;
_minutes 	= _this select 1;
_newObject 	= _this select 2;
_playerID 	= _this select 3;
_infected 	= _this select 4;
_victim 	= _newObject;
_victimName = name _newObject;
_killer 	= _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];
_isOK 		= false;

_victim enableSimulation false;
_victim removeAllEventHandlers "MPHit";
_victim removeAllEventHandlers "HandleDamage";
_victim removeAllEventHandlers "Killed";
_victim removeAllEventHandlers "Fired";
_victim removeAllEventHandlers "FiredNear";
_victim removeAllEventHandlers "GetOut";
_victim removeAllEventHandlers "GetIn";
_victim removeAllEventHandlers "Local";
_victim removeAllMPEventHandlers "mpkilled";
_victim removeAllMPEventHandlers "mphit";
_victim removeAllMPEventHandlers "mprespawn";

diag_log format["server_playerDied: VIC: %1 KIL:%2(%3) ",_victimName,_killer,_killerName];
if ((typeName _killer) != "STRING") then {_isOK = true};
if (_killerName == "nil") then {
	if (_isOK) then [{_killerName = name _killer},{{if (name _x == _killerName) then {_killer = _x;_isOk = true}} forEach playableUnits}];
};
if (_isOK) then {
	if (_victimName == _killerName) then {
		_message = format["%1 killed himself",_victimName];
		_loc_message = format["PKILL: %1 killed himself", _victimName];
		[nil, nil, rspawn, [_message], {systemChat (_this select 0)}] call RE;
		diag_log ("server_playerDied: "+_loc_message);
	} else {
		_weaponz = _victim getVariable ["AttackedByWeapon", ["unknown","","Player"]];
		_distance = floor(_victim getVariable ["AttackedFromDistance", "nil"]);
		_weapon = _weaponz select 0;
		_wptype = _weaponz select 1;
		_dmtype = _weaponz select 2;
		
		diag_log format ["_weapon = %1 - _wptype = %2 - _dmtype = %3 - _distance = %4 - _weaponz = %5 - ",_weapon,_wptype,_dmtype,_distance,_weaponz];
		
		if ((_dmtype != "Gunner")&&(_dmtype != "Player")&&(_dmtype != "Driver")) then {
			diag_log ("Death type unknown: "+str _dmtype);
			_message = format["%1 was killed by %2 with weapon %3 from %4m.",_victimName, _killerName, _weapon, _distance];
			_loc_message = format["PKILL: %1 killed by %2 with weapon %3 from %4m.", _victimName, _killerName, _weapon, _distance];
		} else {
			if (_dmtype == "Driver") then {
				diag_log ("Death type is: " + str _dmtype);
				if (_distance < 8) then {
					_message = format["%1 was run over by %2 with vehicle %3.",_victimName, _killerName, _weapon, _distance];
					_loc_message = format["PKILL: %1 was run over %2 with vehicle %3.", _victimName, _killerName, _weapon, _distance];
					diag_log (_loc_message);
				} else {
					_message = format["%1 was shot down by %2's gunner(s) in their %3.",_victimName, _killerName, _weapon, _distance];
					_loc_message = format["PKILL: %1 was shot down by %2's gunner(s) in their %3.", _victimName, _killerName, _weapon, _distance];
					diag_log (_loc_message);
				};
			};
			if ((_dmtype == "Gunner")||(_dmtype == "Player")) then {
				diag_log ("Death type is: " + str _dmtype);
				if (_distance < 400) then {
					_message = format["%1 was shot down by %2 with weapon %3 from %4m.",_victimName, _killerName, _weapon, _distance];
					_loc_message = format["PKILL: %1 was shot down by %2 with weapon %3 from %4m.", _victimName, _killerName, _weapon, _distance];
					diag_log (_loc_message);
				};
				if ((_distance >= 400)&&(_distance < 900)) then {
					_message = format["%1 was sniped by %2 with weapon %3 from %4m.",_victimName, _killerName, _weapon, _distance];
					_loc_message = format["PKILL: %1 was sniped by %2 with weapon %3 from %4m.", _victimName, _killerName, _weapon, _distance];
					diag_log (_loc_message);
				};
				if (_distance >= 900) then {
					_message = format["%1 was sniped by %2 with weapon %3 from %4m. DAMN!!",_victimName, _killerName, _weapon, _distance];
					_loc_message = format["PKILL: %1 was sniped by %2 with weapon %3 from %4m.", _victimName, _killerName, _weapon, _distance];
					diag_log (_loc_message);
				};
			};
		};
		
		"HitLog" callExtension format ["%1 |DayZ Instance: %2|",_loc_message,dayz_instance];
		
		_stime = (servertime);
		_hours = floor(_stime/60/60);
		_minuz = floor(_stime/60) - (_hours*60);
		_log_menu = format ["PKILL: %1 was killed by %2 with %3 from %4m. @ UPT: "+str _hours+"h(s) "+str _minuz+"min(s)", _victimName, _killerName, _weapon, _distance];
		PVOZ_hitlog = PVOZ_hitlog + [['     '+_log_menu,'','0','1','0','0',[1,0,0,1]]];
		
		KM_pic = "";
		_isWeapon 	= isClass(configFile >> "CfgWeapons" >> _wptype);
		_isMagazine = isClass(configFile >> "CfgMagazines" >> _wptype);
		_isVehicle 	= isClass(configFile >> "CfgVehicles" >> _wptype);
		if (_isWeapon) then {KM_pic = (getText (configFile >> 'cfgWeapons' >> _wptype >> 'picture'))};
		if (_isMagazine) then {KM_pic = (getText (configFile >> 'cfgMagazines' >> _wptype >> 'picture'))};
		if (_isVehicle) then {KM_pic = (getText (configFile >> 'cfgVehicles' >> _wptype >> 'picture'))};
		if (KM_pic == "") then {KM_pic = "\ca\ca_e\data\flag_rcrystal_co.paa"};
		
		[nil, nil, rspawn, [_killerName, KM_pic, _victimName, 0, 0, _distance,_message], {
			_killerName = _this select 0;
			_pic		= _this select 1;
			_victimName = _this select 2;
			_lvl 		= _this select 3;
			_offset		= _this select 4;
			_distance 	= _this select 5;
			_message 	= _this select 6;
			
			systemChat ("(GG-AH):"+(str _message)+"");
			"<t color='#ffffff' align='left' size='0.66'>"+_killerName+"</t><img align='left' size='1' image='"+_pic+"'/><t color='#ffffff' align='left' size='0.66'> "+_victimName+" ["+str _distance+"m]</t>" spawn AH_fnc_dynTextMsg;
		}] call RE;
		diag_log ("server_playerDied: "+_loc_message);
		PlayerDeaths set [count PlayerDeaths,[_victimName,_killerName,_weapon,_distance,ServerCurrentTime]];
		_victim setVariable["AttackedBy", "nil", true];
		_victim setVariable["AttackedByName", "nil", true];
		_victim setVariable["AttackedByWeapon", "nil", true];
		_victim setVariable["AttackedFromDistance", "nil", true];
	};
};

_newObject setVariable["processedDeath",diag_tickTime];

if (typeName _minutes == "STRING") then {_minutes = parseNumber _minutes};
diag_log ("server_playerDied: PDEATH: Player ("+name _newObject+") died.. PID: " + _playerID);
if (_characterID != "0") then {
	_key = format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
	#ifdef DZE_SERVER_DEBUG_HIVE
	diag_log ("server_playerDied: HIVE: WRITE: "+ str(_key));
	#endif
	_key call server_hiveWrite;
} else {
	deleteVehicle _newObject;
};
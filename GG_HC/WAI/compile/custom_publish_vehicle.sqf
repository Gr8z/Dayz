
private ["_hit","_classnames","_count","_vehpos","_max_distance","_vehicle","_position_fixed","_position","_dir","_class","_dam","_damage","_hitpoints","_selection","_fuel","_key"];

_count = count _this;
_classnames = _this select 0;
_position 		= _this select 1;
_max_distance = 35;
_vehpos = [];

_class = (if (typeName(_classnames) == "ARRAY") then {_classnames call BIS_fnc_selectRandom} else {_classnames});
if (_count > 2) then {
	_position_fixed = _this select 2;
	_dir = (if (_count > 3) then {_this select 3} else {ceil(round(random 360))});
} else {
	_position_fixed = false;
	_dir = ceil(round(random 360));
};
if (!_position_fixed) then {	
	while{count _vehpos < 1} do {
		_vehpos = _position findEmptyPosition[10,_max_distance,_class]; 
		_max_distance = (_max_distance + 15);
	};
} else {_vehpos = _position};

_vehicle = createVehicle [_class,_vehpos,[],5,"FORM"];
_vehicle setDir _dir;
_vehicle setVectorUp surfaceNormal position _vehicle;
_vehicle setvelocity [0,0,1];

_vehicle setVariable ["ObjectID","1",true];
_vehicle setVariable ["CharacterID","0",true];

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;

_fuel = 0;

if (getNumber(configFile >> "CfgVehicles" >> _class >> "isBicycle") != 1) then {
	_damage 		= (wai_vehicle_damage select 0) / 100;
	_vehicle 		setDamage _damage;
	_hitpoints 		= _vehicle call vehicle_getHitpoints;
	{
		_dam 		= ((wai_vehicle_damage select 0) + random((wai_vehicle_damage select 1) - (wai_vehicle_damage select 0))) / 100;
		_selection	= getText(configFile >> "cfgVehicles" >> _class >> "HitPoints" >> _x >> "name");
		if ((_selection in dayZ_explosiveParts) && _dam > 0.8) then {_dam = 0.8};			
		_hit = [_vehicle,_selection,_dam] call object_setHitServer;
	} count _hitpoints;
	_fuel = ((wai_mission_fuel select 0) + random((wai_mission_fuel select 1) - (wai_mission_fuel select 0))) / 100;;

};

if (debug_mode) then {diag_log("WAI: Spawned " +str(_class) + " at " + str(_position) + " with " + str(_fuel) + " fuel and " + str(_damage) + " damage.")};

_vehicle setFuel _fuel;
_vehicle call dami_ammovehicle;
_vehicle addeventhandler ["HandleDamage",{_this call vehicle_handleDamage } ];

PVOZ_damiHCaddtomonitor = [_vehicle];publicVariableServer "PVOZ_damiHCaddtomonitor";

if (wai_keep_vehicles) then {
	PVOZ_damiHCpublish = [_vehicle];
	publicVariableServer "PVOZ_damiHCpublish";
};
_vehicle
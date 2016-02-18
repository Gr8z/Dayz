if(isServer) then {
    private ["_complete","_crate","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro","_crate_type","_baserunover"];
	high_value			   		= true;
	high_value2			   		= true;
	high_value3			   		= false;
	item_high_value_chance		= 25;
	item_high_value_chance2		= 10;
	weapon_high_value_chance	= 5;
	high_value_amounts 			= [1];
	high_value_amounts2 		= [1];
	high_value_amounts3 		= [1];
	items_high_value = [
	"ItemBriefcase100oz"
	];
	items_high_value2 = [
	"ItemVault"
	];
	weapons_high_value = [
	"ItemHotwireKit",
	"RPG18",
	"Stinger",
	"Javelin"
	];
	_mission 		= count wai_mission_data -1;
	_position = [30] call find_position;
	[_mission,_position,"Easy","Bandit Patrol","MainHero",true] call mission_init;
	diag_log  format["WAI: [Mission:[Hero] Bandit Patrol]: Starting... %1",_position];
	_crate_type  = crates_small call BIS_fnc_selectRandom;
	_crate  = createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0], [], 0, "CAN_COLLIDE"];
	_vehclass  = civil_vehicles call BIS_fnc_selectRandom;
	_rndnum  = 2 + round (random 1);
	_rndgro  = 1 + round (random 1);
	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy",[2,"at"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	};
	_vehicle = [_vehclass,_position,_mission] call custom_publish;
	_complete = [
		[_mission,_crate],
		["kill"],
		[_vehicle],
		"A bandit scout patrol is checking out a new base location, stop them before they get back and report!",
		"Survivors have dealt with the scout patrol!",
		"Survivors did not deal with the scout patrol in time! A bandit base might appear here soon!"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random2],8,25,2] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Hero] Bandit Patrol]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};
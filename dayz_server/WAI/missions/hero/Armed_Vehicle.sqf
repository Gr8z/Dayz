if(isServer) then {
	private 		["_complete","_crate","_mission","_static_gun","_crate_type","_rndnum","_playerPresent","_vehname","_vehicle","_position","_vehclass"];
	item_high_value			    = true;
	item_high_value2			= true;
	item_high_value3			= true;
	weapon_high_value			= true;
	weapon_high_value2			= true;
	weapon_high_value3			= true;
	item_high_value_chance		= 75;
	item_high_value_chance2		= 25;
	item_high_value_chance3 	= 10;
	item_high_value_amounts 	= [1];
	item_high_value_amounts2 	= [1];
	item_high_value_amounts3 	= [1];
	weapon_high_value_chance	= 15;
	weapon_high_value_chance2	= 15;
	weapon_high_value_chance3	= 75;
	weapon_high_value_amounts	= [1];
	weapon_high_value_amounts2	= [1];
	weapon_high_value_amounts3	= [1];
	_mission 		= count wai_mission_data -1;
	_vehclass 		= armed_vehicle call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");
	_position		= [30] call find_position;
	[_mission,_position,"Medium",format["Disabled %1",_vehname],"MainHero",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Hero] Armed Vehicle]: Starting... %1",_position];
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	_rndnum = (2 + round (random 4));
	[[_position select 0,_position select 1,0],3,"Medium",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],3,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	_static_gun = ai_static_weapons call BIS_fnc_selectRandom;
	[[
		[(_position select 0),(_position select 1) + 10, 0]
	],_static_gun,"Medium","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Hero] armed_vehicle spawned a %1",_vehname];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle],
		"Bandits have disabled an armed vehicle with lots of chain gun ammo in the gear! Check your map for the location!",
		"Survivors have secured the armed vehicle!",
		"Survivors did not secure the armed vehicle in time"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random2],5,25,2] call dynamic_crate;
	};
	diag_log format["WAI: [Bandit] armed_vehicle ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};
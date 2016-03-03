if(isServer) then {
	private 		["_complete","_crate_type","_mission","_position","_crate","_baserunover","_baserunover1","_baserunover2"];
	item_high_value			    = true;
	item_high_value2			= true;
	item_high_value3			= false;
	weapon_high_value			= false;
	weapon_high_value2			= false;
	weapon_high_value3			= true;
	item_high_value_chance		= 50;
	item_high_value_chance2		= 25;
	item_high_value_chance3 	= 10;
	item_high_value_amounts 	= [1];
	item_high_value_amounts2 	= [1];
	item_high_value_amounts3 	= [1];
	weapon_high_value_chance	= 50;
	weapon_high_value_chance2	= 50;
	weapon_high_value_chance3	= 25;
	weapon_high_value_amounts	= [1];
	weapon_high_value_amounts2	= [1];
	weapon_high_value_amounts3	= [1];
	_mission 		= count wai_mission_data -1;
	_position		= [30] call find_position;
	[_mission,_position,"Easy","Medical Supply Camp","MainHero",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Hero] Medical Supply Camp]: Starting... %1",_position];
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) + 15,(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["Land_fortified_nest_big",[(_position select 0) +15, (_position select 1) -20,0],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) +25, (_position select 1) +10,0],[], 0, "CAN_COLLIDE"];
	_baserunover 	= [_baserunover1,_baserunover2];
	{ _x setVectorUp surfaceNormal position  _x; } count _baserunover;
	[[_position select 0,_position select 1,0],4,"Easy",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Easy","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	_complete = [
		[_mission,_crate],
		["kill"],
		[_baserunover],
		"Bandits have taken over a medical re-supply camp! Check your map for the location!",
		"Survivors have taken control of the medical supply camp!",
		"Survivors were unable to capture the medical supply camp"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[3,ai_wep_random2],2,[25,crate_items_medical],2] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Hero] Medical Supply Camp]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};
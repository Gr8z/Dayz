if(isServer) then {
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","high_value","high_value2","high_value3","high_value_chance","high_value_chance2","high_value_chance3","high_value_amounts","high_value_amounts2","high_value_amounts3","items_high_value","items_high_value2","weapons_high_value"];
	high_value			   		= true;
	high_value2			   		= true;
	high_value3			   		= true;
	item_high_value_chance		= 90;
	item_high_value_chance2		= 60;
	weapon_high_value_chance	= 35;
	high_value_amounts 			= [1,2];
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
	_position		= [80] call find_position;
	[_mission,_position,"Hard","Bandit Base","MainHero",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Hero] Bandit Base]: Starting... %1",_position];
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	_baserunover0 	= createVehicle ["land_fortified_nest_big",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["land_fortified_nest_big",[(_position select 0) + 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) - 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) + 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) - 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover5 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) + 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover6 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover7 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7];
	_directions = [90,270,0,180,0,180,270,90];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	_num = 4 + round (random 3);
	[[_position select 0,_position select 1,0],_num,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	_complete = [
		[_mission,_crate],
		["crate"],
		[_baserunover],
		"A jungle task force have set up a temporary encampment! Go and ambush it to make it yours!",
		"Survivors captured the base, HOOAH!!",
		"Survivors were unable to capture the base"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random2],5,20,4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Hero] Bandit Base]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};
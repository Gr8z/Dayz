if(isServer) then {
	 
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];
	_mission 		= count wai_mission_data -1;
	_position		= [80] call find_position;
	[_mission,_position,"Hard","Hero Base","MainBandit",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Bandit] Hero Base]: Starting... %1",_position];
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
	[[_position select 0,_position select 1,0],_num,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	_complete = [
		[_mission,_crate],
		["crate"],
		[_baserunover],
		"Heroes have set up a heavily fortified base! Take the base and show them what you are made of!",	
		"Bandits have captured the Hero base",
		"Bandits did not capture the base in time"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random],10,25,4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Bandit] Hero Base]: Ended at %1",_position];
	b_missionsrunning = b_missionsrunning - 1;
};
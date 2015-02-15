// Made by AllenFromStacy's Mom
//check out my server, IP: 192.31.185.204:23136


if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_baserunover","_baserunover1","_baserunover2"];

	_position		= [30] call find_position;
	_mission		= [_position,"Easy","Denny's Farm","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] Denny's Farm]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) + 15,(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];

	//Medical Supply Camp
	_baserunover1 	= createVehicle ["Land_Farm_Cowshed_a",[(_position select 0) +15, (_position select 1) -20,0],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["Land_Farm_Cowshed_b",[(_position select 0) +35, (_position select 1) +10,0],[], 0, "CAN_COLLIDE"];
	_baserunover 	= [_baserunover1,_baserunover2];

	{ _x setVectorUp surfaceNormal position  _x; } count _baserunover;

	//Troops
	[[_position select 0,_position select 1,0],4,"Easy","Random",4,"Random","Assistant","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Easy","Random",4,"Random","RU_Villager2","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],1,"Random","Random",4,"Random","Citizen2_EP1","Random","Hero",_mission] call spawn_group;

	[[(_position select 0) + 50, _position select 1, 0],[(_position select 0) + 50, _position select 1, 0],50,2,"tractor","random","bandit","bandit",_mission] call vehicle_patrol;

	
	//Condition
	_complete = [
		[_mission,_crate],				// mission number and crate
		["kill"],						// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 				// cleanup objects
		"Denny is giving out supplies at his farm",	// mission announcement
		"Bandit have robbed the old farmer ! ",									// mission success
		"Survivors have obtained the supply from Denny's Farm"									// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,6,5,[40,crate_items_medical],5] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Denny's Farm]: Ended at %1",_position];
	
	b_missionrunning = false;
};







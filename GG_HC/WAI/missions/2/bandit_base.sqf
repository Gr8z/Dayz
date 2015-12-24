private ["_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];

_position = [80] call find_position2;
_mission = [_position,"Hard","Bandit Base","MainHero",true] call mission_init2;

diag_log format["WAI: [Mission:[Hero] Bandit Base]: Starting... %1",_position];

//Setup the crate
_crate_type = crates_large call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

//Buildings
_baserunover0 = createVehicle ["land_fortified_nest_big",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover1 = createVehicle ["land_fortified_nest_big",[(_position select 0) + 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) - 40,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) + 40,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover4 = createVehicle ["Land_Fort_Watchtower",[(_position select 0) - 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover5 = createVehicle ["Land_Fort_Watchtower",[(_position select 0) + 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover6 = createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover7 = createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7];

_directions = [90,270,0,180,0,180,270,90];
{_x setDir (_directions select _forEachIndex) } forEach _baserunover;

{_x setVectorUp surfaceNormal position _x; } count _baserunover;

//Troops
[[_position select 0,_position select 1,0],4,"hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],2,"hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],2,"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;

//Humvee Patrol
[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","Random","Bandit","Bandit",_mission] call vehicle_patrol2;
 
//Static Guns
[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static2;
[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static2;

//Heli Paradrop
[[(_position select 0), (_position select 1), 0],[0,0,0],400,"UH1H_DZ",6,"Random","Random",4,"Random","Bandit","Random","Bandit",true,_mission] spawn heli_para2;

//Condition
_complete = [
	[_mission,_crate],	// mission number and crate
	["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
	[_baserunover], 	// cleanup objects
	"A jungle task force have set up a temporary encampment! Go and ambush it to make it yours!",	// mission announcement
	"The jungle base has been captured, HOOAH!",															// mission success
	"Survivors were unable to capture the jungle base!"														// mission fail
] call mission_winorfail2;

if (_complete) then {[_crate] call spawn_ammo_box};
diag_log format["WAI: [Mission:[Hero] Bandit Base]: Ended at %1",_position];
h_missionrunning2 = false;
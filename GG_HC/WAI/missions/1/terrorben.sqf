private ["_room","_complete","_crate_type","_mission","_position","_crate","_baserunover"];
_position = [40] call find_position;
_mission = [_position,"Extreme","Terrorists?","MainHero",true] call mission_init;

diag_log format["WAI: [Mission:[Hero] Kill Benlate]: Starting... %1",_position];

//Setup the crate
_crate_type = crates_large call BIS_fnc_selectRandom;
_crate = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
 
_baserunover4 = createVehicle ["BMP2_HQ_CDF_unfolded",[(_position select 0) - 30, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover1 = createVehicle ["BRDM2_HQ_Gue_unfolded",[(_position select 0) + 30, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["CDF_WarfareBAntiAirRadar",[(_position select 0), (_position select 1) - 30,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["CDF_WarfareBFieldhHospital",[(_position select 0), (_position select 1) + 30,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover = [_baserunover4,_baserunover1,_baserunover2,_baserunover3];


//Troops
[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","TK_GUE_Soldier_AAT_EP1","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],2,"Hard",["Random","AT"],4,"Random","TK_GUE_Soldier_4_EP1","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","TK_GUE_Soldier_TL_EP1","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","TK_INS_Bonesetter_EP1","Random","Bandit",_mission] call spawn_group;


[[(_position select 0) + 50, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"Pickup_PK_GUE","random","bandit","bandit",_mission] call vehicle_patrol;


//Static mounted guns
[[
	[(_position select 0) - 15, (_position select 1) + 15, 0],
	[(_position select 0) + 15, (_position select 1) - 15, 0]
],"M2StaticMG","Easy","TK_INS_Bonesetter_EP1","Bandit",1,2,"Random","Random",_mission] call spawn_static;

_complete = [
	[_mission,_crate],		
	["crate"], 
	[_baserunover], 		
	"Rumour has it terrorists have arrived in town, go check it out!",	// mission announcement
	"The terror threat has been dealt with, the people of Chernarus are thankful!",						// mission success
	"You were too late in stopping the terrorists... so many innocent lives lost."										// mission fail
] call mission_winorfail;

if (_complete) then {[_crate,13,4,2,3] call dynamic_crate};
diag_log format["WAI: [Mission:[Hero] Kill Benlate]: Ended at %1",_position];
h_missionrunning = false;
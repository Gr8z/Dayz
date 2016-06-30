private ["_missName","_coords","_base","_base1","_veh1","_vehicle","_crate"];

_missName = "[Mission] Safe House";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"Heroes have set up a Safe House!\nGo Empty it Out!", "PLAIN",10] call RE;

[_coords,_missName] ExecVM HeroMarker;

_base = createVehicle ["Land_HouseV_1I4",_coords,[], 0, "CAN_COLLIDE"];
_base setDir 152.66766;
_base setPos _coords;
_base1 = createVehicle ["Land_kulna",[(_coords select 0) + 5.4585, (_coords select 1) - 2.885,0],[], 0, "CAN_COLLIDE"];
_base1 setDir -28.282881;
_base1 setPos [(_coords select 0) + 5.4585, (_coords select 1) - 2.885,0];

[_base] call ProtectObj;
[_base1] call ProtectObj;

_veh1 = ["large"] call GetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) - 10.6206, (_coords select 1) - 0.49,0],[], 0, "CAN_COLLIDE"];

[_vehicle] call SetupVehicle;

_crate = createVehicle ["USBasicAmmunitionBox",[(_coords select 0) + 0.7408, (_coords select 1) + 1.565, 0.10033049],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

[[(_coords select 0) - 4.0796, (_coords select 1) - 11.709,0],6,2,"HeroUnits","hero","hero"] call AISpawn;
sleep 3;
[[(_coords select 0) + 2.8872, (_coords select 1) + 18.964,0],6,2,"HeroUnits","hero","hero"] call AISpawn;
sleep 3;

[_coords,"HeroUnits"] call WaitMissionComp;

[_vehicle] ExecVM SaveVeh;

[nil,nil,rTitleText,"The Safe House is under Bandit Control!", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Hero Safe House Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;
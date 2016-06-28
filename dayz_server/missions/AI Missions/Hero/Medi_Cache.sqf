private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

_missName = "[Mission] Medical Cache";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"Heroes have Taken Over a Bandit Medical Cache!", "PLAIN",10] call RE;

[_coords,_missname] ExecVM HeroMarker;

_net = createVehicle ["Land_CamoNetB_NATO",[(_coords select 0) - 0.0649, (_coords select 1) + 0.6025,0],[], 0, "CAN_COLLIDE"];
[_net] call ProtectObj;

_veh1 = ["small"] call GetVeh;
_veh2 = ["large"] call GetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 10.0303, (_coords select 1) - 12.2979,10],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle [_veh2,[(_coords select 0) - 6.2764, (_coords select 1) - 14.086,10],[], 0, "CAN_COLLIDE"];

[_vehicle] call SetupVehicle;
[_vehicle1] call SetupVehicle;

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
_crate1 = createVehicle ["MedBox0",[(_coords select 0) - 3.7251,(_coords select 1) - 2.3614, 0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["MedBox0",[(_coords select 0) - 3.4346, 0, 0],[], 0, "CAN_COLLIDE"];
_crate3 = createVehicle ["MedBox0",[(_coords select 0) + 4.0996,(_coords select 1) + 3.9072, 0],[], 0, "CAN_COLLIDE"];

[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;
[_crate1] call ProtectObj;
[_crate2] call ProtectObj;
[_crate3] call ProtectObj;

[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;

[_coords,"HeroUnits"] call WaitMissionComp;

[_vehicle] ExecVM SaveVeh;
[_vehicle1] ExecVM SaveVeh;

[nil,nil,rTitleText,"The Medical Cache has been retaken by Bandits!", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Hero Medical Cache Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;
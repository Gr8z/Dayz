private ["_missName","_coords","_base1","_base2","_base3","_base4","_base5","_base6","_base7","_base8","_base9","_base10","_base11","_base12","_base13","_base14","_base15","_base16","_base17","_veh1","_vehicle","_crate"];

_missName = "[Mission] Hero Medical Camp";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"Heroes have Opened a Medical Camp!\nStop Them from Re-Supplying the Region!", "PLAIN",10] call RE;

[_coords,_missname] ExecVM HeroMarker;

//Create the scenery
_base1 = createVehicle ["Land_fort_artillery_nest",[(_coords select 0) - 5.939,(_coords select 1) + 10.0459,0],[], 0, "CAN_COLLIDE"];
_base1 setDir -31.158424;
[_base1] call ProtectObj;
_base1 setVehicleLock "LOCKED";
_base1 setPos [(_coords select 0) - 5.939,(_coords select 1) + 10.0459,0];

_base2 = createVehicle ["Land_fort_artillery_nest",[(_coords select 0) + 6.3374, (_coords select 1) - 11.1944,0],[], 0, "CAN_COLLIDE"];
_base2 setDir -211.14516;
[_base2] call ProtectObj;
_base2 setVehicleLock "LOCKED";
_base2 setPos [(_coords select 0) + 6.3374, (_coords select 1) - 11.1944,0];

_base3 = createVehicle ["Land_fort_rampart",[(_coords select 0) + 12.2456, (_coords select 1) + 6.249,0],[], 0, "CAN_COLLIDE"];
_base3 setDir -120.93051;
[_base3] call ProtectObj;
_base3 setVehicleLock "LOCKED";
_base3 setPos [(_coords select 0) + 12.2456, (_coords select 1) + 6.249,0];

_base4 = createVehicle ["Land_fort_rampart",[(_coords select 0) - 11.4253, (_coords select 1) - 7.628,0],[], 0, "CAN_COLLIDE"];
_base4 setDir 59.42643;
[_base4] call ProtectObj;
_base4 setVehicleLock "LOCKED";
_base4 setPos [(_coords select 0) - 11.4253, (_coords select 1) - 7.628,0];

_base5 = createVehicle ["MedBox0",[(_coords select 0) - 7.1519, (_coords select 1) + 1.8144,0],[], 0, "CAN_COLLIDE"];
_base5 setDir -29.851013;
[_base5] call ProtectObj;

_base6 = createVehicle ["MedBox0",[(_coords select 0) - 7.4116, (_coords select 1) + 2.5244,0],[], 0, "CAN_COLLIDE"];
[_base6] call ProtectObj;

_base7 = createVehicle ["WeaponHolder_ItemToolbox",[(_coords select 0) - 7.7041, (_coords select 1) + 3.332,0],[], 0, "CAN_COLLIDE"];
_base7 setDir -106.46461;
[_base7] call ProtectObj;

_base8 = createVehicle ["Land_CamoNetVar_EAST",[(_coords select 0) + 4.1738, (_coords select 1) - 7.9112],[], 0, "CAN_COLLIDE"];
_base8 setDir -27.004126;
[_base8] call ProtectObj;
_base8 setVehicleLock "LOCKED";
_base8 setPos [(_coords select 0) + 4.1738, (_coords select 1) - 7.9112];

_base9 = createVehicle ["PowGen_Big",[(_coords select 0) - 0.8936, (_coords select 1) + 8.1582,0],[], 0, "CAN_COLLIDE"];
_base9 setDir -56.044361;
[_base9] call ProtectObj;

_base10 = createVehicle ["Barrel5",[(_coords select 0) - 2.5074, (_coords select 1) + 7.3466,0],[], 0, "CAN_COLLIDE"];
[_base10] call ProtectObj;

_base11 = createVehicle ["Barrel5",[(_coords select 0) - 3.293, (_coords select 1) + 7.9179,0],[], 0, "CAN_COLLIDE"];
[_base11] call ProtectObj;

_base12 = createVehicle ["Land_Campfire_burning",[(_coords select 0) + 3.1367, (_coords select 1) - 5.087,0],[], 0, "CAN_COLLIDE"];
[_base12] call ProtectObj;

_base13 = createVehicle ["FoldChair",[(_coords select 0) + 0.8589, (_coords select 1) - 6.2676,0],[], 0, "CAN_COLLIDE"];
_base13 setDir -132.43658;
[_base13] call ProtectObj;

_base14 = createVehicle ["FoldChair",[(_coords select 0) + 2.6909, (_coords select 1) - 7.4805,0],[], 0, "CAN_COLLIDE"];
_base14 setDir -184.45828;
[_base14] call ProtectObj;

_base15 = createVehicle ["FoldChair",[(_coords select 0) + 5.4175, (_coords select 1) - 5.4903,0],[], 0, "CAN_COLLIDE"];
_base15 setDir 96.993355;
[_base15] call ProtectObj;

_base16 = createVehicle ["FoldChair",[(_coords select 0) + 4.5722, (_coords select 1) - 7.2305,0],[], 0, "CAN_COLLIDE"];
_base16 setDir 142.91867;
[_base16] call ProtectObj;

_base17 = createVehicle ["FoldChair",[(_coords select 0) + 5.0542, (_coords select 1) - 3.4649,0],[], 0, "CAN_COLLIDE"];
_base17 setDir 55.969147;
[_base17] call ProtectObj;

_veh1 = ["small"] call GetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) - 17.5078, (_coords select 1) + 5.2578,0],[], 0, "CAN_COLLIDE"];
[_vehicle] call SetupVehicle;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6.8277, (_coords select 1) + 5.6748,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;

[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"HeroUnits","hero","hero"] call AISpawn;

[_coords,"HeroUnits"] call WaitMissionComp;

[_vehicle] ExecVM SaveVeh;

[nil,nil,rTitleText,"Bandits have Taken Control of the Camp and Medical Supplies.", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Hero Medical Camp Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;
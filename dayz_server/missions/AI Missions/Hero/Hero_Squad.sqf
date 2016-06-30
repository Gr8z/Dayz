private ["_missName","_coords","_vehicle"];

_missName = "[Mission] Hero Squad";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"A Hero Squad has been spotted!\nStop them from completing their patrol!", "PLAIN",10] call RE;

[_coords,_missName] ExecVM HeroMarker;

[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 1;

[_coords,"HeroUnits"] call WaitMissionComp;

[nil,nil,rTitleText,"The Hero Squad has been Wiped Out!", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Hero Squad Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;
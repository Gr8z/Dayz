private ["_missName","_coords","_vehicle"];

_missName = "[Mission] Bandit Squad";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"A Bandit Squad has been spotted!\nStop them from completing their patrol!", "PLAIN",10] call RE;

[_coords,_missName] ExecVM HeroMarker;

[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;

[_coords,"BanditUnits"] call WaitMissionComp;

[nil,nil,rTitleText,"The Bandit Squad has been Wiped Out!", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Bandit Squad Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;
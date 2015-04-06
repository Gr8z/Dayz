private ["_time_count"];
cad_pvar_shared_var = player; cad_pvar_server_answer = 0; _time_count = diag_tickTime;
publicVariableServer "cad_pvar_shared_var";
while {diag_tickTime - _time_count < 8 && cad_pvar_server_answer == 0 } do {sleep 0.05;};
if (cad_pvar_server_answer == 0) exitWith {
	(findDisplay 49) closedisplay 0;
};
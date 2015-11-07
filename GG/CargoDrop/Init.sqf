 /******************************************************************************
 *
 *  Exec initAction to the vehicles near the player.
 *
 ******************************************************************************/


//// Add action to all vehicles, check every 5 seconds
while {true} do {
	{[_x] execVM "GG\CargoDrop\InitAction.sqf";} forEach (nearestObjects [player, ["Air"], 30]);
	sleep 5;
};
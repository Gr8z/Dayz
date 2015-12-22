diag_log ("(GG-AntiHack): Loading client AHME...");
_AH_MAPEDITS = {
	{
		_object = (_x select 0) createVehicleLocal (_x select 1);
		/*_object = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];*/
		_object setDir (_x select 2);
		_object setPos (_x select 1);
		_object allowDamage false;
		_object enableSimulation false;
	} forEach [
		["SmallTable",[0,0,0],300.011]
	];
};
_AH_scrhndlr = _AH_scrhndlr + [_AH_MAPEDITS];
diag_log ("(GG-AntiHack): Loaded client AHME!");
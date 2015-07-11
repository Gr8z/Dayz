while {alive player} do {
	waituntil {isManualFire vehicle player};
	if (typeOf(vehicle player) == "BMP2_HQ_INS") then {
		player action ["manualFireCancel", vehicle player];
		cutText ["Manual fire for BMP HQ has been disabled. You must have a gunner!", "PLAIN DOWN"];
	};
};
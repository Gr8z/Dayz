private ["_v"]; 

while {alive player} do {
	waitUntil {sleep 5; vehicle player != player || !alive player};
	_v = vehicle player;
	if (!(_v iskindof "LandVehicle") && !(_v iskindof "ParachuteBase") && (alive player)) then {
		if (driver _v == player) then {
			titleText ["WELCOME ON BOARD PILOT:\n\nDo NOT crash your air vehicle for cheap kills.\nKAMIKAZE PILOTING IS NOT ALLOWED!\n\nPlay Fair & Have Fun","PLAIN"]; titleFadeOut 15;
		};
	};
	waitUntil {sleep 0.5; vehicle player == player || !alive player};
	titleFadeOut 1;
};
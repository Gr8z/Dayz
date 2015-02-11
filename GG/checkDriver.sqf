private ["_v"]; 

while {alive player} do {
	waitUntil {sleep 5; vehicle player != player || !alive player};
	_v = vehicle player;
	if (!(_v iskindof "LandVehicle") && !(_v iskindof "ParachuteBase") && (alive player)) then {
		if (driver _v == player) then {
			titleText ["WELCOME ON BOARD PILOT:\n\nDo NOT crash your air vehicle for cheap kills.\nKAMIKAZE PILOTING IS NOT ALLOWED!\n\nPlay Fair & Have Fun","PLAIN"]; titleFadeOut 15;
		};
	};
	
	if ((_v iskindof "LandVehicle") || (_v iskindof "Ship")) then {
		if (!(_v iskindof "Bicycle") && !(_v iskindof "Motorcycle") && (alive player)) then {
			if (driver _v == player) then {
				titleText ["Your vehicle is equipped with a boostmode.\n\nPress LEFT SHIFT to use it!\n\nBut be carefull drive faster means die faster!","PLAIN"]; titleFadeOut 15;
			};
		};
	};
	waitUntil {sleep 0.5; vehicle player == player || !alive player};
	titleFadeOut 1;
};
private ["_vehicle","_status"];
_vehicle = _this select 0;
_status = _this select 1;
_alarmCar = typeOf _vehicle in [

"SUV_TK_CIV_EP1","SUV_TK_CIV_EP1_DZE1","SUV_TK_CIV_EP1_DZE2","SUV_TK_CIV_EP1_DZE3","SUV_TK_CIV_EP1_DZE4","SUV_PMC","ArmoredSUV_PMC","ArmoredSUV_PMC_DZ","ArmoredSUV_PMC_DZE","ArmoredSUV_PMC_BAF","VWGolf_DZE1","VWGolf_DZE2","VWGolf_DZE3","VWGolf_DZE4",
"SUV_Blue","SUV_Blue_DZE1","SUV_Blue_DZE2","SUV_Blue_DZE3","SUV_Blue_DZE4","SUV_Green","SUV_Green_DZE1","SUV_Green_DZE2","SUV_Green_DZE3","SUV_Green_DZE4","SUV_Yellow","SUV_Yellow_DZE1","SUV_Yellow_DZE2","SUV_Yellow_DZE3","SUV_Yellow_DZE4","SUV_Red",
"SUV_Red_DZE1","SUV_Red_DZE2","SUV_Red_DZE3","SUV_Red_DZE4","SUV_White","SUV_White_DZE1","SUV_White_DZE2","SUV_White_DZE3","SUV_White_DZE4","SUV_Pink","SUV_Pink_DZE1","SUV_Pink_DZE2","SUV_Pink_DZE3","SUV_Pink_DZE4","SUV_Charcoal","SUV_Charcoal_DZE1",
"SUV_Charcoal_DZE2","SUV_Charcoal_DZE3","SUV_Charcoal_DZE4","SUV_Orange","SUV_Orange_DZE1","SUV_Orange_DZE2","SUV_Orange_DZE3","SUV_Orange_DZE4","SUV_Silver","SUV_Silver_DZE1","SUV_Silver_DZE2","SUV_Silver_DZE3","SUV_Silver_DZE4","SUV_Camo","SUV_Camo_DZE1",
"SUV_Camo_DZE2","SUV_Camo_DZE3","SUV_Camo_DZE4","TT650_Ins","TT650_Civ","M1030_US_DES_EP1","M1030_TK_CIV_EP1","350z","350z_red","350z_kiwi","350z_black","350z_silver","350z_green","350z_blue","350z_gold","350z_white","350z_pink","350z_mod","350z_ruben",
"350z_v","350z_city","350z_yellow"

];

if (local _vehicle) then {
	if (_status) then {
		_vehicle setVehicleLock "LOCKED";
		_vehicle setVariable ["BTC_Cannot_Lift",true,true];
		_vehicle setVariable ["MF_Tow_Cannot_Tow",true,true];
		if (_alarmCar) then {
			[nil, _vehicle, rSAY, "suvLock", 50] call RE;
			} else {
			[nil, _vehicle, rSAY, "carLock", 50] call RE;
			};
			player action ["lightOn", _vehicle];
			sleep 0.5;
			player action ["lightOff", _vehicle];
	} else {
		_vehicle setVehicleLock "UNLOCKED";
		_vehicle setVariable ["BTC_Cannot_Lift",false,true];
		_vehicle setVariable ["MF_Tow_Cannot_Tow",false,true];
		if (_alarmCar) then {
			[nil, _vehicle, rSAY, "suvLock", 50] call RE;
			} else {
			[nil, _vehicle, rSAY, "carLock", 50] call RE;
			};
			player action ["lightOn", _vehicle];
			sleep 0.5;
			player action ["lightOff", _vehicle];
	};
};
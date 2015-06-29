//IF INFISTAR IS BROKEN THIS WORKS//
if (!isDedicated) then {
	waitUntil {uiSleep 0.25;(!isNil "PVDZE_plr_LoginRecord")};

	nopeGoodbye = {
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		uiSleep 1;
		createVehicle ['RUBasicWeaponsBox',getPosATL player,[],10,'CAN_COLLIDE'];
		disableUserInput true;
		disableUserInput true;
		disableUserInput true;
	};

	nopeScan = {
		_nopeListf = [
			(format['%1\init.sqf',name player]),(format['%1\exec.sqf',name player])
		];
		_nopeListfi = [
			'ArmA2OA_Extras\startbb.sqf','ArmA2OA_Extras\S_ben_bb.sqf','ArmA2OA_Extras\ben_ex.sqf','dll\BEBypass.dll','SlothCheats.sqf','hoen\config.sqf','worm\config.sqf','worm\dialog.sqf','whippyv7.sqf'
		]+_nopeListf;
		_nopeListv = [
			'manatee_craft_menu','manatee_craft_menu_wea','manatee_craft_menu_sur','manatee_craft_menu_ind','BTC_liftHudId',
			'MonsterCheats_Admin_Options','B1g_B3nProEsp','MonsterCheats_ESP','freddiesmm','vehiclemarkershuehuehue','Freddies_1stepbuild','MonsterCheats_Menu','hippoWiveHiveServer','whippyv7'
		];
		while {true} do {
			_nopeC = false;
			_cfg = configFile;
			for '_i' from 0 to count (_cfg)-1 do {
				_selected = _cfg select _i;
				if (isClass _selected) then {
					_c = configName _selected;
					if (_c in ['PoopLoop','RscRazzler','RscListBoxVG','RscHippoz','Rschippoz2']) then {_nopeC = true;};
				};
			};
			if (lbSize 109 > 2) then {_nopeC = true;};
			{if (!isNull (findDisplay _x)) exitWith {_nopeC = true;};} count [17,64,155,156,162,1001,2929,3030,125,69,19,71,45,132,32,165,157,2727,30,9899,0110,110,70000];
			_c = 0;
			{
				_c = _c + 1;
				if (_c >= 10) then {_c = 0;uiSleep 0.5;};
				_f = preprocessFileLineNumbers _x;
				if (_f != '') exitWith {_nopeC = true;};
				true
			} count _nopeListfi;
			{
				if (!isNil _x) exitWith {_nopeC = true;};
				true
			} count _nopeListv;
			if (_nopeC) exitWith {[] spawn nopeGoodbye;};
			uiSleep 5;
		};
	};

	if (!((getPlayerUID player) in (PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List))) then { //ADD ADMIN IDS HERE//
		preProcessFileLineNumbers 'Scan completed, bad content was not found';
		[] spawn nopeScan;
	};
};
//BYE BYE SCRIPT KIDDIES THT BYPASS INFISTAR//
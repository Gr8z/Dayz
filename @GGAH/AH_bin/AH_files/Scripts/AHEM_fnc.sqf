diag_log ("(GG-AntiHack): Loading client AHDS...");
_AH_DC = compile ("
	disableSerialization;
	if (isNil ""disconnect_timer"") then {disconnect_timer = 0};
	ESC_OPENED = false;
	_debugPos = getMarkerpos 'respawn_west';
	_ctp = 0;
	_mtp = 3;
	while {str(100) == str(100)} do {
		waitUntil {!isNull (findDisplay 49)};
		if (!isNull (findDisplay 49)) then {
			if !(ESC_OPENED) then {
				ESC_OPENED = true;
				((findDisplay 49) displayCtrl 523) ctrlSetText "+str _escTOP+";
				((findDisplay 49) displayCtrl 523) ctrlSetTextColor "+str _escTC+";
				((findDisplay 49) displayCtrl 523) ctrlSetFontHeight "+str _escTS+";
				((findDisplay 49) displayCtrl 523) ctrlSetFont 'Zeppelin33Italic';
				
				((findDisplay 49) displayCtrl 2) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 2) ctrlSetText 'Close';
				((findDisplay 49) displayCtrl 2) ctrlSetTextColor "+str _escTC+";
				
				((findDisplay 49) displayCtrl 103) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 103) ctrlSetTextColor [0.8,0.5,0.5,1];
				((findDisplay 49) displayCtrl 103) ctrlSetText 'Disabled';
				((findDisplay 49) displayCtrl 103) ctrlEnable false;
				
				((findDisplay 49) displayCtrl 119) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 119) ctrlSetTextColor [0.8,0.5,0.5,1];
				((findDisplay 49) displayCtrl 119) ctrlSetText 'Disabled';
				((findDisplay 49) displayCtrl 119) ctrlEnable false;
				
				((findDisplay 49) displayCtrl 1010) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 1010) ctrlSetTextColor [0.8,0.5,0.5,1];
				((findDisplay 49) displayCtrl 1010) ctrlSetText 'Disabled';
				((findDisplay 49) displayCtrl 1010) ctrlEnable false;
				
				((findDisplay 49) displayCtrl 101) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 101) ctrlSetTextColor [0.8,0.5,0.5,1];
				((findDisplay 49) displayCtrl 101) ctrlSetText 'Options';
				((findDisplay 49) displayCtrl 101) ctrlEnable true;
				
				((findDisplay 49) displayCtrl 104) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 104) ctrlSetTextColor [0.8,0.5,0.5,1];
				
				((findDisplay 49) displayCtrl 121) ctrlSetText "+str _escLOW+";
				((findDisplay 49) displayCtrl 121) ctrlSetTextColor "+str _escLC+";
				((findDisplay 49) displayCtrl 121) ctrlSetFontHeight "+str _escLS+";
				((findDisplay 49) displayCtrl 121) ctrlSetFont 'EtelkaMonospaceProBold';
				
				((findDisplay 49) displayCtrl 120) ctrlSetText "+str _escBTM+";
				((findDisplay 49) displayCtrl 120) ctrlSetTextColor "+str _escBC+";
				((findDisplay 49) displayCtrl 120) ctrlSetFontHeight "+str _escBS+";
				((findDisplay 49) displayCtrl 120) ctrlSetFont 'EtelkaMonospaceProBold';
				waitUntil {isNull (findDisplay 49)};
			} else {
				if (ESC_OPENED) then {['',safeZoneX,safezoneY,1,0,0,7691] spawn AH_fnc_dynamictext};
				ESC_OPENED = false;
			};
		};
	};
");
_AH_scrhndlr = _AH_scrhndlr + [_AH_DC];
diag_log ("(GG-AntiHack): Loaded client AHDS!");
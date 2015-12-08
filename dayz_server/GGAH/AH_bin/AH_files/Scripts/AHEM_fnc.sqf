diag_log ("(GG-AntiHack): Loading client AHDS...");
_AH_DC = compile ("
	disableSerialization;
	if (isNil ""disconnect_timer"") then {disconnect_timer = 0};
	ESC_OPENED = false;
	_debugPos = getMarkerpos 'respawn_west';
	_ctp = 0;
	_mtp = 3;
	if(!isNil 'UPTIMER')then
	{
		private['_stime','_hours','_minutes','_minutes2','_upTimeLeft'];
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_upTimeLeft = UPTIMER - _stime;
		_hours = (_upTimeLeft/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = floor(_upTimeLeft/60);
		_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
		_mytime = format['Restart in: %1h %2min',_hours,_minutes2];
		['<t size=''0.35'' align=''right'' font=''TahomaB''>'+_mytime+'</t>',safezoneX*-1,0.98 * safezoneH + safezoneY,15,0,0,1338] spawn bis_fnc_dynamicText;
	};
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
				((findDisplay 49) displayCtrl 103) ctrlSetText 'PlayerUID';
				((findDisplay 49) displayCtrl 103) ctrlEnable false;
				
				((findDisplay 49) displayCtrl 119) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 119) ctrlSetTextColor [0.8,0.5,0.5,1];
				((findDisplay 49) displayCtrl 119) ctrlSetText (format['%1',getPlayerUID player]);
				((findDisplay 49) displayCtrl 119) ctrlEnable false;
				
				((findDisplay 49) displayCtrl 1010) ctrlSetFont 'EtelkaMonospaceProBold';
				((findDisplay 49) displayCtrl 1010) ctrlSetTextColor [0.8,0.5,0.5,1];
				((findDisplay 49) displayCtrl 1010) ctrlSetText "+str _mytime+";
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
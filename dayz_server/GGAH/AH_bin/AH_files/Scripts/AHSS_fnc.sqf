//FORMAT: [Position,Name,Exact location] (Use exact location for custom spawns, set to TRUE, changes colour as well).
AH_fnc_spawnpoints = [
	[[],"Random",false],
	[[6743,2581,0],"Chernogorsk",false],
	[[12954,9783,0],"Berezino",false],
	[[10480,2217,0],"Elektro",false],
	[[1893,2210,0],"Kamenka",false],
	[[13454,6233,0],"Solnichniy",false],
	[[2758,5304,0],"Zelenogorsk",false]
];
_txt = "<t color='#FF5050'>Press ESC to disconnect</t><br/>";
_txt = _txt + "Welcome to DayZBonfire!<br/>";
_txt = _txt + "Type <t color='#FF5050'>!help</t> for a list of chat commands.<br/>";
_txt = _txt + "Type <t color='#FF5050'>!rules</t> for a list of rules.<br/>";
_txt = _txt + "Visit our website:<br/>";
_txt = _txt + "<t color='#FF5050'>DayZBonfire.net</t><br/>";
_txt = _txt + "Join our teamspeak:<br/>";
_txt = _txt + "<t color='#FF5050'>TS.DayZBonfire.net</t><br/>";
_txt = _txt + "<br/>";
_txt = _txt + "<t color='#FF5050'>Credits</t>:<br/>";
_txt = _txt + "  Dami, <t color='#FFF555'>god of cake</t><br/>";
_txt = _txt + "  Rob, <t color='#FFF555'>Dami's sweg support :)</t><br/>";
_txt = _txt + "  Epoch devs, <t color='#FFF555'>leaders of the n00b race</t><br/>";
_txt = _txt + "  Macca/Raymix, <t color='#FFF555'>neckbeard snapping</t><br/>";
_txt = _txt + "  Zupa, <t color='#FFF555'>base swegcoins</t><br/>";
AH_str_welcomeMsg = _txt;
AH_fnc_spawnMenu = {
	if (isNil 'added_cspawn') then {
		added_cspawn = true;
		switch (added_cspawn) do {
			comment 'Dami 			76561198126971094';
			comment 'Rob 			76561197983489485';
			comment 'Filthy 		76561198016010754';
			comment 'Jester 		76561198005656777';
			comment 'TBOZ 			76561197976283347';
			comment 'kail           76561198027296590   EXP 11/6/15';
			comment 'goose          76561198071557025   ExP 11/10/15';
			comment 'kappoddle      76561198132426801   EXP 10/27/15';
			comment 'pirate         76561198011843432   EXP 11/20/15';
			comment 'sarah          76561198046854709   EXP 10/22/15';
 			case ((getPlayerUID player) in ['76561198046854709','76561198011843432','76561198132426801','76561198071557025','76561197976283347','76561198027296590','76561198016010754','76561198005656777','76561197983489485','76561198126971094']): {
				AH_fnc_spawnpoints set [count AH_fnc_spawnPoints,[[6304,7851,0],"Stary",true]];
			};
			comment 'Marks			76561198146770226 	EXP 11/30/15';
			case ((getPlayerUID player) in ['76561198146770226']): {
				AH_fnc_spawnpoints set [count AH_fnc_spawnPoints,[[8968,10694,0],"Custom spawn",true]];
			};
			comment 'Franky         76561198014077781   EXP 10/20/15';
			comment 'derpie         76561198156473988   EXP 10/22/15';
			case ((getPlayerUID player) in ['76561198014077781','76561198156473988']): {
				AH_fnc_spawnpoints set [count AH_fnc_spawnPoints,[[3800,8846,0],"Custom spawn",true]];
			};
			comment 'Biscuit		76561198149864189   EXP 10/20/15';
			comment 'Reebes			76561198134595745   EXP 10/22/15';
			case ((getPlayerUID player) in ['76561198149864189','76561198134595745']): {
				AH_fnc_spawnpoints set [count AH_fnc_spawnPoints,[[9920,11638,5.6],"Custom spawn",true]];
			};
		};
	};
	
	_ctrl = ((findDisplay 38500) displayCtrl 1003);
	_ctrl ctrlSetStructuredText parseText AH_str_welcomeMsg;
	
	_ctrl = ((findDisplay 38500) displayCtrl 38510);
	_i = 0;
	{
		_ctrl lnbAddRow[(AH_fnc_spawnpoints select _forEachIndex) select 1,(AH_fnc_spawnpoints select _forEachIndex) select 0,""];
		_ctrl lnbSetData[[_forEachIndex,0],(AH_fnc_spawnpoints select _forEachIndex) select 0];
		if ((AH_fnc_spawnpoints select _forEachIndex) select 2) then {_ctrl lnbSetColor[[_i,0],[0.25,1,0.25,0.9]]} else {_ctrl lnbSetColor[[_i,0],[1,0.7,0.7,0.9]]};
		_i = _i + 1;
	} foreach AH_fnc_spawnpoints;
	
	0 call AH_fnc_spawnSelected;
};
publicVariable "AH_fnc_spawnpoints";
publicVariable "AH_str_welcomeMsg";
publicVariable "AH_fnc_spawnMenu";
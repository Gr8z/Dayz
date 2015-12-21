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
_txt = _txt + "Welcome to [GG] Ghostz Gamerz!<br/>";
_txt = _txt + "Type <t color='#FF5050'>!help</t> for a list of chat commands.<br/>";
_txt = _txt + "Type <t color='#FF5050'>!rules</t> for a list of rules.<br/>";
_txt = _txt + "Visit our website:<br/>";
_txt = _txt + "<t color='#FF5050'>GhostzGamerz.com</t><br/>";
_txt = _txt + "Join our teamspeak:<br/>";
_txt = _txt + "<t color='#FF5050'>TS.GhostzGamerz.com</t><br/>";
_txt = _txt + "<br/>";
_txt = _txt + "<t color='#FF5050'>Donation Perks Available at our Website.</t><br/>";
AH_str_welcomeMsg = _txt;
AH_fnc_spawnMenu = {
	if (isNil 'added_cspawn') then {
		added_cspawn = true;
		switch (added_cspawn) do {
 			case ((getPlayerUID player) in ['0','0','0','0','0','0','0','0','0','0']): {
				AH_fnc_spawnpoints set [count AH_fnc_spawnPoints,[[6304,7851,0],"Stary",true]];
			};
			case ((getPlayerUID player) in ['0']): {
				AH_fnc_spawnpoints set [count AH_fnc_spawnPoints,[[8968,10694,0],"Custom spawn",true]];
			};
			case ((getPlayerUID player) in ['0','0']): {
				AH_fnc_spawnpoints set [count AH_fnc_spawnPoints,[[3800,8846,0],"Custom spawn",true]];
			};
			case ((getPlayerUID player) in ['0','0']): {
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
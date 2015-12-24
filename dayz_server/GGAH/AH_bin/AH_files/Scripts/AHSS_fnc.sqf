//FORMAT: [Position,Name,Exact location] (Use exact location for custom spawns, set to TRUE, changes colour as well).
AH_fnc_spawnpoints = switch (toLower worldName) do {
case "chernarus":{
	[
		[[],"Random",false],
		[[1689,3850,0],"Pavlovo",false],
		[[3315,3934,0],"Bor",false],
		[[4480,4615,0],"Kozlovka",false],
		[[5839,4779,0],"Nadezhdino",false],
		[[7545,5144,0],"Mogilevka",false],
		[[10103,5483,0],"Staroye",false],
		[[11290,6557,0],"Dolina",false],
		[[10750,8133,0],"Polana",false],
		[[12818,8097,0],"Nizhnoye",false],
		[[10428,9850,0],"Dubrovka",false],
		[[12305,10818,0],"Khelm",false],
		[[7066,7680,0],"Novy Sobor",false],
		[[1896,2242,0],"Kamenka",false],
		[[3608,2152,0],"Komarovo",false],
		[[4523,2444,0],"Balota",false],
		[[6723,2562,0],"Cherno",false],
		[[7952,3205,0],"Prigor",false],
		[[10417,2120,0],"Elektro",false],
		[[12071,3591,0],"Kamyshovo",false],
		[[13407,4175,0],"Krutoy",false],
		[[13470,6306,0],"Solnichny",false],
		[[12037,9100,0],"Berezino",false],
		[[7068,11221,0],"Devils Castle",false],
		[[9711,8962,0],"Gorka",false],
		[[5939,10195,0],"Grishino",false],
		[[8421,6643,0],"Guglovo",false],
		[[8812,11642,0],"Gvozdno",false],
		[[5301,8548,0],"Kabanino",false],
		[[11053,12361,0],"Krasnostav",false],
		[[2718,10094,0],"Lopatino",false],
		[[4984,12492,0],"Petrovka",false],
		[[4582,6457,0],"Pogorevka",false],
		[[9153,3901,0],"Pusta",false],
		[[3626,8976,0],"Vybor",false],
		[[6587,6026,0],"Vyshnoye",false],
		[[2692,5284,0],"Zelenogorsk",false]
		]
	};
	case "tavi":{
		[
		[[],"Random",false],
		[[9093,2614,0],"Topolka",false],
		[[8150,21299,0],"Helfenburg",false],
		[[9506,17303,0],"Kozak",false],
		[[6496,9300,0],"Zmey",false],
		[[13201,16649,0],"Volcano Perun",false],
		[[6066,7404,0],"Volcano Vilas",false],
		[[7919,6727,0],"Novi Dvor",false],
		[[14032,12259,0],"Solibor",false],
		[[15120,9674,0],"Sabina",false],
		[[9095,5403,0],"Kryvoe",false],
		[[17588,4952,0],"Stari Sad",false],
		[[16674,13930,0],"Martin",false],
		[[11361,6685,0],"Komarovo",false],
		[[16222,11600,0],"Dubovo",false],
		[[18292,7537,0],"Byelov",false],
		[[13561,19300,0],"Khotanovsk",false],
		[[15246,17425,0],"Dalnogorsk",false],
		[[8350,18937,0],"Kameni",false],
		[[10180,19059,0],"Yaroslav",false],
		[[11238,14413,0],"Lyepestok",false],
		[[10184,1542,0],"Marina",false],
		[[1529,7271,0],"Race Track",false],
		[[5904,10519,0],"Cernovar",false]
		]
	};
	case "napf":{
		[
		[[],"Random",false],
		[[15515,13229,0],"Emmen",false],
		[[12862,14850,0],"Bunig",false],
		[[4672,14940,0],"Bubendorf",false],
		[[14445,2985,0],"Brienz",false],
		[[7409,6591,0],"Eggwill",false],
		[[5411,16676,0],"Seltishafen",false],
		[[2720,12226,0],"Hindelbank",false],
		[[1511,11479,0],"Hubel",false],
		[[9111,3539,0],"Hungerschwand",false],
		[[4104,13026,0],"Huttwil",false],
		[[17503,3743,0],"Froburg",false],
		[[12231,16319,0],"Lausen",false],
		[[8943,16281,0],"Lenzburg",false],
		[[6946,17385,0],"Seewen",false],
		[[1461,10584,0],"Ittingen",false],
		[[10283,18449,0],"Hordstern",false],
		[[10709,17085,0],"Magden",false],
		[[6433,9580,0],"Munchenstien",false],
		[[5964,13596,0],"Nue Welt",false],
		[[18291,1790,0],"South Airstrip",false],
		[[5906,5637,0],"Buckten",false],
		[[17101,5282,0],"Giswil",false],
		[[17262,13502,0],"Horw",false],
		[[12694,11878,0],"Romoos",false],
		[[15554,10651,0],"Sachseln",false],
		[[9412,5882,0],"Schangen",false],
		[[11111,8326,0],"Sissach",false],
		[[8538,852,0],"Waldegg",false]
		]
	};

};

_txt = "<t color='#FF5050'>Press ESC to disconnect</t><br/>";
_txt = _txt + "Welcome to [GG] Ghostz Gamerz!<br/>";
_txt = _txt + "Type <t color='#FF5050'>!help</t> for a list of chat commands.<br/>";
_txt = _txt + "Type <t color='#FF5050'>!rules</t> for a list of rules.<br/>";
_txt = _txt + "Visit our website:<br/>";
_txt = _txt + "<t color='#FF5050'>GhostzGamerz.com</t><br/>";
_txt = _txt + "Join our teamspeak:<br/>";
_txt = _txt + "<t color='#FF5050'>TS.GhostzGamerz.com</t><br/>";
_txt = _txt + "<br/>";
_txt = _txt + "<t color='#FF5050'>Unlock More Spawns with VIP spawns.</t><br/>";
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
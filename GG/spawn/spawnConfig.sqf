_bodyCheck = 1500; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 12000; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = false; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

_spawnPoints = switch (toLower worldName) do {
case "chernarus":{
	[
		["Random",[[4926,2385,0],[12229,12648,0],[4554,10269,0],[4470,8288,0],[7133,9676,0],[7771,4492,0],[8422,6680,0],[11317,6566,0],[12051,3513,0],[13468,6344,0],[10174,2449,0],[6338,3023,0],[1696,2315,0],[1822,3824,0],
		[3463,4972,0],[9606,8851,0],[10445,9964,0],[9486,11392,0],[4954,12381,0],[7467,11512,0],[2792,5609,0],[10178,5293,0]],0,0,1],
		["Balota",[4926,2385,0],0,0],
		["NE Airfield",[12229,12648,0],0,0],
		["NW Airfield",[4554,10269,0],0,0],
		["Dichina Base",[4470,8288,0],0,0],
		["Grishino Base",[7133,9676,0],0,0],
		["Mogilevka Base",[7771,4492,0],0,0],
		["Guglovo",[8422,6680,0],0,0],
		["Dolina",[11317,6566,0],0,0],
		["Kamyshovo",[12051,3513,0],0,0],
		["Solnichniy",[13468,6344,0],0,0],
		["Elektrozavodsk",[10174,2449,0],0,0],
		["Chernogorsk",[6338,3023,0],0,0],
		["Kamenka",[1696,2315,0],0,0],
		["Pavlovo",[1822,3824,0],0,0],
		["Drozhino",[3463,4972,0],0,0],
		["Gorka",[9606,8851,0],0,0],
		["Dubrovka",[10445,9964,0],0,0],
		["Novy Lung Base",[9486,11392,0],0,0],
		["Petrovka",[4954,12381,0],0,0],
		["Devils Castle",[7467,11512,0],0,0],
		["Zelenogorsk",[2792,5609,0],0,0],
		["Staroye",[10178,5293,0],0,0],
		["Bandit Vendor",[1607,7804,0],0,-70000],
		["Hero Vendor",[12944,12767,0],0,30000],
		["Vybor",[3626,8976,0],0,0],
		["Komarovo",[3608,2152,0],0,0]
		]
	};
	case "tavi":{
		[
		["Random",[[9093,2614,0],[8150,21299,0],[9506,17303,0],[6496,9300,0],[13201,16649,0],[6066,7404,0],[7919,6727,0],[14032,12259,0],[15120,9674,0],[17610,6293,0],[10939,652,0],[17588,4952,0],[15954,15847,0],[16674,13930,0],[8915,2301,0],[11361,6685,0],
		[17744,10299,0],[18292,7537,0],[13561,19300,0],[15246,17425,0],[8350,18937,0],[10180,19059,0],[11238,14413,0],[10184,1542,0],[1529,7271,0],[5904,10519,0]],0,0,1],
		["Topolka",[9093,2614,0],0,0],
		["Helfenburg",[8150,21299,0],0,0],
		["Kozak",[9506,17303,0],0,0],
		["Zmey",[6496,9300,0],0,0],
		["Volcano Perun",[13201,16649,0],0,0],
		["Volcano Vilas",[6066,7404,0],0,0],
		["Novi Dvor",[7919,6727,0],0,0],
		["Solibor",[14032,12259,0],0,0],
		["Sabina",[15120,9674,0],0,0],
		["Kryvoe",[9095,5403,0],0,0],
		["Stari Sad",[17588,4952,0],0,0],
		["Martin",[16674,13930,0],0,0],
		["Komarovo",[11361,6685,0],0,0],
		["Dubovo",[16222,11600,0],0,0],
		["Byelov",[18292,7537,0],0,0],
		["Khotanovsk",[13561,19300,0],0,0],
		["Dalnogorsk",[15246,17425,0],0,0],
		["Kameni",[8350,18937,0],0,0],
		["Yaroslav",[10180,19059,0],0,0],
		["Lyepestok",[11238,14413,0],0,0],
		["Marina",[10184,1542,0],0,0],
		["Race Track",[1529,7271,0],0,0],
		["Cernovar",[5904,10519,0],0,0],
		["Bandit Vendor",[10940,653,0],0,-10000],
		["Hero Vendor",[15586,16396,0],0,10000]
		]
	};
};

_vipListBase = [
	"0",
	"0",
	"0"
];
_vipListBases = [ // Do not use a z (height) higher than _autoOpenHeight in haloConfig.sqf if using halo
	["0",[2324,15365,0]],
	[],
	[]
];
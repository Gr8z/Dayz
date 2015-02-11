_bodyCheck = 500; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 12000; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = true; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

_spawnPoints = [
	["Random",[[4932,1989,0],[12048,8352,0],[6901,2509,0],[10294,2191,0],[2236,1923,0],[13510,5249,0]],0,0,1],
	["Kamenka",[2236,1923,0],0,0],
	["Komarovo",[3608,2152,0],0,0],
	["Balota",[4932,1989,0],0,0],
	["Cherno",[6901,2509,0],0,0],
	["Prigor",[7952,3205,0],0,0],
	["Elektro",[10294,2191,0],0,0],
	["Kamyshovo",[12071,3591,0],0,0],
	["Krutoy",[13407,4175,0],0,0],
	["Solnichny",[13510,5249,0],0,0],
	["Berezino",[12048,8352,0],0,0],
	["Devils",[7068,11221,0],1,0],
	["Gorka",[9711,8962,0],1,0],
	["Grishino",[5939,10195,0],1,0],
	["Guglovo",[8421,6643,0],1,0],
	["Gvozdno",[8812,11642,0],1,0],
	["Kabanino",[5301,8548,0],1,0],
	["Krasnostav",[11053,12361,0],1,0],
	["Lopatino",[2718,10094,0],1,0],
	["Petrovka",[4984,12492,0],1,0],
	["Pogorevka",[4582,6457,0],1,0],
	["Pusta",[9153,3901,0],1,0],
	["Vybor",[3626,8976,0],1,0],
	["Vyshnoye",[6587,6026,0],1,0],
	["Zelenogorsk",[2692,5284,0],1,0],
	["Bandit Vendor",[1607,7804,0],0,-10000],
	["Hero Vendor",[12944,12767,0],0,10000]
];


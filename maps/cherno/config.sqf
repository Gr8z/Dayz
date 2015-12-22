dayZ_instance =	2;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
enableSentences false;
ServerCurrentTime 	= 0;
spawnShoremode 		= 1;
spawnArea 			= 1000;
MaxHeliCrashes 		= 2;
MaxVehicleLimit 	= 300;
dayz_MapArea  		= 14000;
dayz_maxAnimals 	= 8;
dayz_minpos 		= -1; 
dayz_maxpos 		= 16000;
dayz_tameDogs 		= false;
MaxDynamicDebris 	= 0;
DynamicVehicleDamageLow = 0;
DynamicVehicleDamageHigh = 0.2;

//Welcome message config
GG_useWelcomeTxt		= true;
GG_serverName 		= "[GG] Ghostz Gamerz Overpoch Chernarus";//<img image=""Path\To\Logo.paa""/>
GG_HeaderColor 		= "FF3300";
GG_HeaderSize 		= "0.6";
GG_BodyColor 			= "ffffff";
GG_BodySize 			= "0.45";
GG_features_header 	= "Server features";
GG_website_header 	= "Community info";
GG_srvrrules_header 	= "Server rules";
GG_stafflist__header 	= "Server staff";
GG_features_body 		= [
	"<t color='#ffdb00'>Gold coin currency</t>",
	"<t color='#fff4b1'> - Bank at Solnichniy</t>",
	"<t color='#fff4b1'> - Online banking</t>",
	"<t color='#fff4b1'> - Lootable wallet</t>",
	"<t color='#fff4b1'> - Refuel n Repair stations</t>",
	"<t color='#bd0000'>Chat commands</t> !help",
	"<t color='#ff6c3b'> - Friend system</t> !addfriend !delfriend !grouptags",
	"<t color='#ff6c3b'> - PM system</t> !pm !re",
	"<t color='#ff6c3b'> - Custom player HUD</t> !nohud",
	"<t color='#ff6c3b'> - Suicide</t> !kill !die",
	"<t color='#bd0000'>Custom framework</t>",
	"<t color='#ff6c3b'> - Custom anti-hack since December 2012</t>",
	"<t color='#ff6c3b'> - Custom military camps!</t>",
	"<t color='#ff6c3b'> - Custom traders with safezones<!/t>",
	"<t color='#ff6c3b'> - Custom trader menu, buy/sell to/from your player, backpack, or vehicle!</t>",
	"<t color='#ff6c3b'> - Custom plot menu, works with our !addfriend system!</t>",
	"<t color='#ff6c3b'> - Custom death/respawn framework, respawn on death!</t>",
	"<t color='#ff6c3b'> - Custom spawn select!</t>",
	"<t color='#ff6c3b'> - Set your safe code on placement!</t>",
	"<t color='#ff6c3b'> - Many custom buildings</t>",
	"<t color='#ff6c3b'> - Revamped vector build</t>",
	"<t color='#ff6c3b'> - Take clothes, teabag</t>",
	"<t color='#ff6c3b'> - Self transfuse and consume</t>",
	"<t color='#ff6c3b'> - 30M player tags</t>",
	"<t color='#ff6c3b'> - Admin events like CTF, TDM, DM, KOTH, and more!</t>",
	"<t color='#ff6c3b'> - For a full list of features, check out DayZBonfire.net!</t>"
];
GG_website_body 		= [
	"<t color='#ffdb00'>Join our website:</t>",
	"www.ghostzgamerz.com",
	"<t color='#ffdb00'>Join our teamspeak:</t>",
	"TS.GhostzGamerz.com"
];
GG_srvrrules_body 	= [
	"<t color='#f00000'size='1.5'>Server rules</t>",
	"<t color='#D42436'>1</t>. Don't be homphobic!",
	"<t color='#D42436'>2</t>. Don't be homosexual!"
];
GG_stafflist__body 	= [
	"<t color='#FF3300'>Owner</t>: Gr8",
	"<t color='#FF3300'>Owner</t>: Ghost",
	"<t color='#FF3300'>Coder</t>: Deadskin",
	"<t color='#FF3300'>Admin</t>: Shahzad",
	"<t color='#FF3300'>Admin</t>: MeowMix"
];

//GG config
NameTagDistance = 20; //Distance player names show when looking at them.
DZE_restarttime = [1,59]; //Hour,Minute restart time. 1,59 logs people off at 1hr 59min uptime.
DZE_useGGammo = true; //If you want jets/planes/boats to get M13A4
DZE_removeammo 	= false; //Remove vehicle ammo when it spawns
DZE_removeweps 	= false; //Remove vehicle weapons when it spawns
DZE_removewlist = []; //Remove whitelist, if you want certain vehicles to spawn with full ammo
DZE_maxBank 	= 100000;
DZE_gasprice	= 5; //Price per litre
DZE_limitbank 	= true;
DZE_bloodperbb 	= 6000; //Max blood received via self bloodbag.
DZE_bloodcons 	= 2000; //Blood received when consuming bloodbag.
GCoins			= "Gold Coins";//Currency name
DZE_ATM 		= ["Laptop_EP1","Infostand_2_EP1"];
DZE_Bank_Trader = ["RU_Functionary2","Functionary2_EP1"];
DZE_rnr_trader 	= ["INS_Lopotev_DZ","Worker2"];
DZE_takePlot	= false;
MaxMineVeins 	= 5;

DZE_MissionLootTable = true;
DZE_DamageBeforeMaint  = 0.15;
DZE_PlayerZed 		= false;
DZE_HeliLift 		= false;
DZE_BuildOnRoads 	= true;
DZE_BackpackGuard 	= false;
DZE_R3F_WEIGHT 		= false;
DZE_FriendlySaving 	= true;
DZE_ConfigTrader 	= true;
DZE_LootSpawnTimer 	= 10;
DZE_requireplot 	= 1;
DZE_vehicleAmmo 	= 0.2;
DZE_BuildingLimit 	= 150;
DZE_maintainRange  	= 100;
DZE_curPitch 		= 45;
DZE_maxBuildHeight 	= 40;
DZE_PlotPole 		= [50,150];
DZE_maintainClasses = ["ModularItems","DZE_Housebase","BuiltItems","LightPole_DZ","Fortifications"];
DZE_noRotate 		= [
"ItemVault","ItemWoodStairs","ItemLockbox","ItemWoodStairsSupport","ItemWoodLadder",
"30m_plot_kit","workbench_kit","ItemSandbagLarge","ItemSandbagExLarge","ItemSandbagExLarge5x"
];
DZE_nobuildarray 	= [
	/*[Position,[marker radius,nobuild radius],"marker name","marker color"]*/
	[[6325.6772,7807.7412,0],[100,1000],"Stary Trader","ColorBlueFaded50"],
	[[4063.4226,11664.19,0],[100,1000],"Bash Trader","ColorBlueFaded50"],
	[[11452.472,11339.504,0],[100,1000],"Klen Trader","ColorBlueFaded50"],
	[[3445.0112,3804.1453,0],[75,1000],"Bor Trader","ColorBlueFaded50"],
	[[1606.6443,7803.5156,0],[100,1000],"Bandit Trader","ColorBlueFaded50"],
	[[12944.227,12766.889,0],[100,1000],"Hero Trader","ColorBlueFaded50"],
	[[5066.8984,9729.3574,0],[0,1000],"Aircraft Dealer",""],
	[[13441.16,5429.3013,0],[0,1000],"Wholesale East",""],
	[[4361.4937,2259.9526,0],[0,1000],"Wholesale South",""],
	[[8385.834,2368.8264,0],[0,1000],"Boat Trader1",""],
	[[13093.446,8241.5625,0],[0,1000],"Boat Trader2",""],
	[[9464.64, 11483.8,0],[0,500],"Weed Farm","ColorOrange"],
	[[7768.69,4499.63,0],[0,500],"Mogilevka Base","ColorRed"],
	[[13725.498, 2907.4512,0],[0,500],"Skalisty Base","ColorRed"],
	[[7286.0166, 9730.1201,0],[0,500],"Grishino Base","ColorRed"],
	[[4492.81,8296.52,0],[0,500],"Dichina Base","ColorRed"]
];

dayz_maxLocalZombies = 4;
EpochEvents = [["any","any","any","any",45,"crash_spawner"]];
dayz_fullMoonNights = true;
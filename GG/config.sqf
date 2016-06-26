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
MaxHeliCrashes 		= 2;
dayz_tameDogs 		= false;
MaxDynamicDebris 	= 0;
DynamicVehicleDamageLow = 0;
DynamicVehicleDamageHigh = 0.2;
MaxVehicleLimit 	= 5;

//GG config
NameTagDistance = 20; //Distance player names show when looking at them.
DZE_restarttime = [1,59]; //Hour,Minute restart time. 1,59 logs people off at 1hr 59min uptime.
DZE_useGGammo = true; //If you want jets/planes/boats to get M13A4
DZE_removeammo 	= false; //Remove vehicle ammo when it spawns
DZE_removeweps 	= false; //Remove vehicle weapons when it spawns
DZE_removewlist = []; //Remove whitelist, if you want certain vehicles to spawn with full ammo
DZE_maxBank 	= 250000;
MaxDonatorBankMoney = 500000;
DZE_gasprice	= 2; //Price per litre
DZE_limitbank 	= true;
DZE_bloodperbb 	= 6000; //Max blood received via self bloodbag.
DZE_bloodcons 	= 2000; //Blood received when consuming bloodbag.
GCoins			= "Gold Coins";//Currency name
DZE_ATM 		= ["Laptop_EP1","Infostand_2_EP1","Functionary2_EP1","Worker2"];
DZE_Bank_Trader = ["RU_Functionary2"];
DZE_rnr_trader 	= ["INS_Lopotev_DZ"];
DZE_takePlot	= true;
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
DZE_BuildingLimit = 150;
DZE_maintainRange  	= 100;
DZE_curPitch 		= 45;
DZE_maxBuildHeight 	= 45;
DZE_PlotPole 		= [60,150];
DZE_StaticConstructionCount = 1;
DZE_maintainClasses = ["ModularItems","DZE_Housebase","BuiltItems","LightPole_DZ","Fortifications"];
DZE_noRotate 		= [
"ItemVault","ItemWoodStairs","ItemLockbox","ItemWoodStairsSupport","ItemWoodLadder",
"30m_plot_kit","workbench_kit","ItemSandbagLarge","ItemSandbagExLarge","ItemSandbagExLarge5x"
];

ServerIllegalRadius = 500;
ServerIllegalRadius2 = 200;

GGNoBuildList = [
"Land_SS_hangar",
"Land_Mil_Barracks_i",
"Land_Mil_Barracks",
"Land_budova4_in",
"Land_Mil_ControlTower"
];

GGNoBuildList2 = [
"Land_a_stationhouse",
"Land_A_GeneralStore_01",
"Land_A_Hospital",
"Land_A_FuelStation_Feed",
"Land_fuelStation_army",
"Land_fuelstation",
"Land_Ind_FuelStation_Feed_EP1",
"Land_ibr_FuelStation_Feed",
"land_fuelStation_w"
];

EpochEvents = [
["any","any","any","any",5,"Building"],
["any","any","any","any",15,"Military"],
["any","any","any","any",25,"Treasure"],
["any","any","any","any",35,"Construction"],
["any","any","any","any",45,"SupplyItems"],
["any","any","any","any",55,"Construction"]
];

dayz_maxLocalZombies = 2;
dayz_maxGlobalZombiesInit = 2;
dayz_maxGlobalZombiesIncrease = 1;
dayz_maxZeds = 50;
dayz_maxGlobalZeds = 50;

dayz_fullMoonNights = true;

/**DoorManagement Config**/
DoorAdminList = ["2","3"];
AllowManualCode = false;
HarderPenalty = true;
DZE_DoorsLocked = ["Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallDoorLocked_DZ","CinderWallDoorSmallLocked_DZ"];
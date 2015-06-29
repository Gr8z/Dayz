 #include "CfgLoot.hpp"
 
 class CfgBuildingLoot {
         class Default {
                 zombieChance = 0.5;
                 minRoaming = 0;
                 maxRoaming = 2;
                 zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_villager1","z_villager2","z_villager3"};
                 lootChance = 0.6;
                 lootPos[] = {};
 
                 lootPosSmall[] = {};
                 lootPosZombie[] = {};
                 
                 itemType[] = {};
 
                 itemChance[] = {};
                 lootTypeSmall[] = {};
                 itemChanceSmall[] = {};
 
                 hangPos[] = {};
                 vehPos[] = {};
         };
         
         class Castle: Default {
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"ItemKnife","weapon",0.01},
                         {"WeaponHolder_ItemHatchet","object",0.01},
                         {"WeaponHolder_ItemTent","object",0.01},
                         {"","food",0.2},
                         {"", "AKHighWeaps",  0.06}, 
                         {"militarybackpacks","militarybackpacks",0.01},
                         {"", "SVDWeaps",  0.01}, 
                         {"", "AKLowWeaps",  0.09}, 
                         {"", "ShotgunWeaps",  0.03}, 
                         {"", "SniperLowWeaps",  0.02}, 
                         {"", "RiflesLowWeaps",  0.02}, 
                         {"", "PistolsLow",  0.1}, 
                         {"ItemToolbox","weapon",0.01},
                         {"","hunter",0.4},
                         {"","generic",0.4}
                 };
         };
         class Residential: Default {
                 zombieChance = 0.5;
                 maxRoaming = 2;
                 zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_villager1","z_villager2","z_villager3"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"","civilian",                                0.30},
                         {"","generic",                                 0.20},
                         {"","food",                                    0.15},
                         {"", "MeleeWeaps",                             0.15}, 
                         {"backpacks","backpacks",                      0.06},
                         {"clothes","clothes",                          0.04},
                         {"", "PistolsLow",                             0.03},
                         {"tents","tents",                              0.02},
                         {"", "ShotgunWeaps",                           0.03}, 
                         {"", "RiflesLowWeaps",                         0.02}
                 };
                 lootTypeSmall[] = {
                         { "ItemSodaMdew","magazine",                   0.1 },
                         { "ItemSodaRbull","magazine",                  0.15 },
                         { "ItemSodaOrangeSherbet","magazine",          0.13 },
                         { "", "PistolsLow",                            0.02 }, 
                         { "ItemKnife","weapon",                        0.1 },
                         { "ItemMatchbox_DZE","weapon",                 0.1 },
                         { "","generic",                                0.08 },
                         { "","civilian",                               0.04 },
                         { "","military",                               0.06 },
                         { "","food",                                   0.2  },
                         { "","office",                                 0.03 },
                         { "","office2",                                0.03 },
                         { "","trash",                                  0.04 },
                         { "clothes","single",                          0.02 },
                         { "ItemToolbox","weapon",                      0.07 },
                         { "specialclothes","single",                   0.01 }
                 };
         };
         class Office: Default {
                 maxRoaming = 3;
                 zombieClass[] = {"z_suit1","z_suit2"};
                 zombieChance = 0.5;
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"ItemKnife","generic",0.04},
                         {"ItemMatchbox_DZE","generic",0.01},
                         {"backpacks","backpacks",0.04},
                         {"tents","tents",0.01},
                         {"PartPlywoodPack","magazine",0.02},
                         {"clothes","clothes",0.02},
                         {"specialclothes","specialclothes",0.01},
                         {"", "AKLowWeaps",  0.01}, 
                         {"", "PistolsLow",  0.08}, 
                         {"", "SniperLowWeaps",  0.01}, 
                         {"", "MeleeWeaps",  0.08}, 
                         {"ItemToolbox","weapon",0.01},
                         {"", "RiflesLowWeaps",  0.01} 
                 };
                 lootTypeSmall[] = {
                         { "ItemSodaMdew","magazine",0.01 },
                         { "ItemSodaRbull","magazine",0.01 },
                         { "ItemSodaOrangeSherbet","magazine",0.02 },
                         { "ItemWatch","weapon",0.05 },
                         { "", "PistolsLow",  0.08}, 
                         { "ItemKnife","weapon",0.05 },
                         { "ItemMatchbox_DZE","weapon",0.03 },
                         { "","generic",0.01 },                  
                         { "","military",0.04 },
                         { "","trash",0.03 },
                         { "","office",0.15 },
                         { "","office2",0.15 },
                         { "clothes","single",0.16 },
                         { "specialclothes","single",0.01 },
                         { "ItemToolbox","weapon",0.01},
                         { "ItemDocument","magazine",0.01 }
                 };
         };
         class Industrial: Default {
                 zombieChance = 0.5;
                 zombieClass[] = {"z_worker1","z_worker2","z_worker3"};
                 maxRoaming = 2;
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                        //30%
                        {"PartGeneric","magazine",0.09},
                        {"PartWheel","magazine",0.06},
                        {"PartGlass","magazine",0.05},
                        {"PartEngine","magazine",0.04},
                        {"PartFueltank","magazine",0.04},
                        {"PartVRotor","magazine",0.02},
                        //30%
                        {"ItemPole","magazine",0.03},
                        {"ItemKiloHemp","magazine",0.01},
                        {"ItemCanvas","magazine",0.02},
                        {"ItemDocument","magazine",0.03},
                        {"ItemBurlap","magazine",0.02},
                        {"ItemCorrugated","magazine",0.02},
                        {"PartWoodLumber","magazine",0.02},
                        {"PartWoodPlywood","magazine",0.02},
                        {"MortarBucket","magazine",0.02},
                        {"CinderBlocks","magazine",0.02},
                        {"ItemGenerator","magazine",0.02},
                        {"ItemTankTrap","magazine",0.02},
                        {"ItemWire","magazine",0.02},
                        {"ItemSandbag","magazine",0.02},
                        {"ItemDocumentRamp","magazine",0.01},
                        //20%
                        {"", "generic",0.20},
                        //5%
                        {"ItemMixOil","magazine",0.01},
                        {"ItemJerrycanEmpty","magazine",0.03},
                        {"ItemJerrycan","magazine",0.01},
                        //5%
                        {"ItemToolbox","weapon",0.04},
                        {"ItemKeyKit","weapon",0.01},
                        //5%
                        {"", "PistolsLow",0.01}, 
                        {"", "MeleeWeaps",0.04},
                        //4%
                        {"", "trash", 0.04},
                        //1%
                        {"backpacks","backpacks",0.01}
                 };
                 lootTypeSmall[] = {
                         { "","generic",0.15 },
                         { "","trash",0.1 },
                         { "","military",0.1 },
                         { "ItemKnife","weapon",0.07 },
                         {"", "PistolsLow",  0.05}, 
                         { "ItemKeyKit","weapon",0.01 }
                 };
         };
         class IndustrialFuel: Default {
                 zombieChance = 0.5;
                 zombieClass[] = {"z_worker1","z_worker2","z_worker3"};
                 maxRoaming = 2;
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                        //30%
                        {"PartGeneric","magazine",0.09},
                        {"PartWheel","magazine",0.06},
                        {"PartGlass","magazine",0.05},
                        {"PartEngine","magazine",0.04},
                        {"PartFueltank","magazine",0.04},
                        {"PartVRotor","magazine",0.02},
                        //30%
                        {"", "generic",0.30},
                        //10%
                        {"ItemMixOil","magazine",0.02},
                        {"ItemJerrycanEmpty","magazine",0.06},
                        {"ItemJerrycan","magazine",0.02},
                        //10%
                        {"ItemToolbox","weapon",0.08},
                        {"ItemKeyKit","weapon",0.02},
                        //5%
                        {"", "PistolsLow",0.01}, 
                        {"", "MeleeWeaps",0.04},
                        //4%
                        {"", "trash", 0.04},
                        //1%
                        {"backpacks","backpacks",0.01}
                 };
                 lootTypeSmall[] = {
                         { "","generic",                                0.2  },
                         { "","trash",                                  0.14 },
                         { "","military",                               0.14 },
                         { "", "PistolsLow",                            0.1  }, 
                         { "ItemKnife","weapon",                        0.02 },
                         { "ItemKeyKit","weapon",                       0.01 }
                 };
         };
         class Farm: Default {
                 zombieChance = 0.5;
                 maxRoaming = 3;
                 zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"ItemJerrycan","magazine",            0.3},
                         {"PartPlankPack","magazine",           0.1},
                         { "","generic",                        0.19},
                         {"ItemFuelBarrelEmpty","magazine",     0.01},
                         {"", "PistolsLow",                     0.03}, 
                         {"", "SniperLowWeaps",                 0.01}, 
                         {"", "RiflesLowWeaps",                 0.02}, 
                         {"", "ShotgunWeaps",                   0.04}, 
                         {"backpacks","backpacks",              0.03},
                         {"", "MeleeWeaps",                     0.17}, 
                         {"ItemSledgeHandle","magazine",        0.01}
                 };
                 lootTypeSmall[] = {
                         { "","generic",                        0.3},
                         { "","trash",                          0.2},
                         { "","military",                       0.1},
                         {"ItemToolbox","weapon",               0.15},
                         {"", "PistolsLow",                     0.07}, 
                         { "ItemSledgeHead","magazine",         0.01}
                 };
         };
         class Supermarket: Default {
                 lootChance = 0.6;
                 minRoaming = 2;
                 maxRoaming = 6;
                 zombieChance = 0.5;
                 zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2"};
                 lootType[] = {
                         { "","generic",                        0.3},
                         { "","food",                           0.3},
                         {"backpacks","backpacks",              0.06},
                         {"tents","tents",                      0.04},
                         {"", "PistolsLow",                     0.15}, 
                         {"", "ShotgunWeaps",                   0.15}
                 };
                 lootTypeSmall[] = {
                         {"", "PistolsLow",                     0.01 }, 
                         { "ItemMixOil", "magazine",            0.1},
                         { "ItemSodaMdew","magazine",           0.08 },
                         { "ItemSodaRbull","magazine",          0.1 },
                         { "ItemSodaOrangeSherbet","magazine",  0.1 },
                         { "ItemWatch","weapon",                0.1 },
                         { "ItemKnife","weapon",                0.1 },
                         { "ItemMatchbox_DZE","weapon",         0.1},
                         { "","generic",                        0.1},
                         { "","food",                           0.21},
                         
                 };
         };
 
         class Hospital: Default {
                 zombieChance = 0.5;
                 minRoaming = 2;
                 maxRoaming = 6;
                 zombieClass[] = {"z_doctor","z_doctor","z_doctor"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"","hospital",0.7},
                         {"MedBox0","object",0.2}
                 };
                 lootTypeSmall[] = {
                         { "","trash",0.05 },
                         {"", "PistolsLow",  0.05}, 
                         { "","hospital",0.9 }
                 };
         };
         class Military: Default {
                 zombieChance = 0.5;
                 maxRoaming = 6;
                 zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"ItemFlashlightRed","military",0.04},
                         {"ItemKnife","military",0.01},
                         {"ItemGPS","weapon",0.01},
                         {"militarybackpacks","militarybackpacks",0.02},
                         {"ItemEtool","weapon",0.02},
                         {"ItemSandbag","magazine",0.02},
                         {"", "PistolMilWeaps",  0.08}, 
                         {"", "ACRLowWeaps",  0.05}, 
                         {"", "ScarLowWeaps",  0.05}, 
                         {"", "HK416Weaps",  0.05}, 
                         {"", "MasWeaps",  0.05}, 
                         {"", "G36Weaps",  0.05}, 
                         {"", "SVDWeaps",  0.02}, 
                         {"", "AKLowWeaps",  0.05}, 
                         {"", "LMGWeaps",  0.03}, 
                         {"", "L85Weaps",  0.05}, 
                         {"", "M4Weaps",  0.05}, 
                         {"", "M8Weaps",  0.05}, 
                         {"", "SubWeaps",  0.04}, 
                         {"", "AKHighWeaps",  0.02}, 
                         {"", "SniperMedWeaps",  0.01}, 
                         {"", "RiflesMedWeaps",  0.04}, 
                         {"ItemEtool","weapon",0.02}
                 };
                 lootTypeSmall[] = {
                         {"", "PistolMilWeaps",  0.08}, 
                         {"", "ShotgunWeaps",  0.03}, 
                         { "ItemFlashlightRed", "weapon", 0.01 },
                         { "ItemKnife", "weapon", 0.04 },
                         { "ItemGPS", "weapon", 0.02 },
                         {"ItemToolbox","weapon",0.01},
                         { "", "medical", 0.12 },
                         { "", "generic", 0.22 },
                         { "", "military", 0.35 },
                         { "ItemEtool", "weapon", 0.05 }
                 };
         };
         class MilitaryIndustrial: Default {
                 zombieChance = 0.5;
                 maxRoaming = 6;
                 zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman","z_soldier","z_soldier_heavy","z_policeman","z_worker1","z_worker2","z_worker3"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"", "MeleeWeaps",  0.02}, 
                         {"", "PistolMilWeaps",  0.1}, 
                         {"", "ACRLowWeaps",  0.05}, 
                         {"", "ScarLowWeaps",  0.05}, 
                         {"", "HK416Weaps",  0.05}, 
                         {"", "MasWeaps",  0.05}, 
                         {"", "G36Weaps",  0.05}, 
                         {"", "SVDWeaps",  0.02}, 
                         {"", "AKLowWeaps",  0.05}, 
                         {"", "LMGWeaps",  0.03}, 
                         {"", "L85Weaps",  0.05}, 
                         {"", "M4Weaps",  0.05}, 
                         {"", "M8Weaps",  0.05}, 
                         {"", "SubWeaps",  0.04}, 
                         {"", "AKHighWeaps",  0.08}, 
                         {"", "SniperMedWeaps",  0.01}, 
                         {"", "RiflesMedWeaps",  0.04}, 
                         {"PartGeneric","magazine",0.03},
                         {"ItemGenerator","magazine",0.01},
                         {"PartWheel","magazine",0.02},
                         {"ItemFlashlightRed","military",0.01},
                         {"ItemKnife","military",0.02},
                         {"ItemGPS","weapon",0.02},
                         {"PartVRotor","magazine",0.03},
                         {"militarybackpacks","militarybackpacks",0.02},
                         {"ItemEtool","weapon",0.02},
                         {"ItemSandbag","magazine",0.02},
                         {"ItemFuelBarrelEmpty","magazine",0.01},
                         {"fuel_pump_kit","magazine",0.01}
                 };
                 lootTypeSmall[] = {
                         {"", "PistolMilWeaps",  0.08}, 
                         {"", "ShotgunWeaps",  0.03}, 
                         { "ItemFlashlightRed", "weapon", 0.03 },
                         { "ItemKnife", "weapon", 0.04 },
                         { "ItemToolbox","weapon",0.03},
                         { "ItemGPS", "weapon", 0.02 },
                         { "", "medical", 0.12 },
                         { "", "generic", 0.22 },
                         { "", "military", 0.35 },
                         { "ItemEtool", "weapon", 0.03 }
                 };
         };
         class IndustrialMilitary: Default {
                 zombieChance = 0.5;
                 maxRoaming = 6;
                 zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman","z_soldier","z_soldier_heavy","z_policeman","z_worker1","z_worker2","z_worker3"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"", "MeleeWeaps",  0.02}, 
                         {"", "PistolMilWeaps",  0.1}, 
                         {"", "ACRLowWeaps",  0.05}, 
                         {"", "ScarLowWeaps",  0.05}, 
                         {"", "HK416Weaps",  0.05}, 
                         {"", "MasWeaps",  0.05}, 
                         {"", "G36Weaps",  0.05}, 
                         {"", "SVDWeaps",  0.02}, 
                         {"", "AKLowWeaps",  0.05}, 
                         {"", "LMGWeaps",  0.03}, 
                         {"", "L85Weaps",  0.05}, 
                         {"", "M4Weaps",  0.05}, 
                         {"", "M8Weaps",  0.05}, 
                         {"", "SubWeaps",  0.04}, 
                         {"", "AKHighWeaps",  0.08}, 
                         {"", "SniperMedWeaps",  0.01}, 
                         {"", "RiflesMedWeaps",  0.04}, 
                         {"PartGeneric","magazine",0.03},
                         {"ItemGenerator","magazine",0.01},
                         {"PartWheel","magazine",0.02},
                         {"ItemFlashlightRed","military",0.01},
                         {"ItemKnife","military",0.02},
                         {"ItemGPS","weapon",0.02},
                         {"PartVRotor","magazine",0.03},
                         {"militarybackpacks","militarybackpacks",0.02},
                         {"ItemEtool","weapon",0.02},
                         {"ItemSandbag","magazine",0.02},
                         {"ItemFuelBarrelEmpty","magazine",0.01},
                         {"fuel_pump_kit","magazine",0.01}
                 };
                 lootTypeSmall[] = {
                         {"", "PistolMilWeaps",  0.08}, 
                         {"", "ShotgunWeaps",  0.03}, 
                         { "ItemFlashlightRed", "weapon", 0.03 },
                         {"ItemToolbox","weapon",0.03},
                         { "ItemKnife", "weapon", 0.04 },
                         { "ItemGPS", "weapon", 0.02 },
                         { "", "medical", 0.12 },
                         { "militaryclothes","single",0.05 },
                         { "", "generic", 0.22 },
                         { "", "military", 0.35 },
                         { "ItemEtool", "weapon", 0.03 }
                 };
         };
         class MilitarySpecial: Default {
                 zombieChance = 0.5;
                 minRoaming = 2;
                 maxRoaming = 6;
                 zombieClass[] = {"z_soldier_heavy"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"", "PistolMilWeaps",  0.1}, 
                         {"", "ACRLowWeaps",  0.03}, 
                         {"", "ACRHighWeaps",  0.04}, 
                         {"", "G36Weaps",  0.04}, 
                         {"", "L85Weaps",  0.04}, 
                         {"", "M4Weaps",  0.04}, 
                         {"", "M8Weaps",  0.03}, 
                         {"", "AKHighWeaps",  0.07}, 
                         {"", "RiflesMedWeaps",  0.06}, 
                         {"", "ScarHighWeaps",  0.05}, 
                         {"", "HK417Weaps",  0.05}, 
                         {"", "LMGWeaps",  0.04}, 
                         {"", "HMGWeaps",  0.03}, 
                         {"", "SniperMedWeaps",  0.06}, 
                         {"", "LauncherWeaps",  0.03},
                         {"", "RocketWeaps",  0.01},
                         {"", "UltraWeaps",  0.01},
                         {"", "PistolTopWeaps",  0.01}, 
                         {"", "SniperTopWeaps",  0.01},
                         {"AmmoBoxSmall_556","object",0.02},
                         {"AmmoBoxSmall_762","object",0.02},
                         {"ItemFlashlightRed","military",0.01},
                         {"ItemGPS","weapon",0.01},
                         {"Binocular_Vector","military",0.02},
                         {"militarybackpacks","militarybackpacks",0.02},
                         {"militaryammo","militaryammo",0.06},
                         {"machinegunammo","machinegunammo",0.03},
                         {"militaryclothes","militaryclothes",0.05}
                 };
                 lootTypeSmall[] = {
                         {"", "PistolMilWeaps",  0.1}, 
                         {"", "PistolTopWeaps",  0.01}, 
                         { "AmmoBoxSmall_556","object",0.02 },
                         { "AmmoBoxSmall_762","object",0.02 },
                         { "ItemFlashlightRed","military",0.01 },
                         { "ItemGPS","weapon",0.02 },
                         { "ItemToolbox","weapon",0.03},
                         { "Binocular_Vector","weapon",0.03},
                         { "","medical",0.08},
                         { "","generic",0.15},
                         { "","military",0.33 },
                         { "machinegunammoexpl","single",0.02 },
                         { "militaryclothes","single",0.05 }
                 };
         };
         class Hunting: Default {
                 zombieChance = 0.5;
                 minRoaming = 1;
                 maxRoaming = 3;
                 zombieClass[] = {"z_hunter","z_hunter","z_hunter"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         {"ItemKnife","generic",0.01},
                         {"ItemMatchbox_DZE","generic",0.01},
                         {"","military",0.3},
                         {"", "MeleeWeaps",  0.08}, 
                         {"", "AKHighWeaps",  0.06}, 
                         {"", "SVDWeaps",  0.01}, 
                         {"", "AKLowWeaps",  0.09}, 
                         {"militarybackpacks","militarybackpacks",0.01},
                         {"militaryclothes","militaryclothes",0.01 },
                         {"", "ShotgunWeaps",  0.03}, 
                         {"", "SniperLowWeaps",  0.02}, 
                         {"", "RiflesLowWeaps",  0.02}, 
                         {"", "PistolsLow",  0.1}, 
                         {"","hunter",0.5}
                 };
                 lootTypeSmall[] =       {
                         {"", "PistolsLow",  0.05}, 
                         {"", "PistolMilWeaps",  0.05}, 
                         {"", "PistolTopWeaps",  0.01}, 
                         {"ItemKnife","weapon",0.02},
                         {"ItemMatchbox_DZE","weapon",0.04},
                         {"","military",0.4},
                         {"","hunter",0.5}
                 };
         };
         class DynamicDebris: Default
         {
                 lootChance = 0.6;
                 minRoaming = 0;
                 maxRoaming = 2;
                 zombieChance = 0.5;
                 zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2"};
                 lootType[] = {
                         { "ItemKnife", "generic", 0.06 },
                         { "ItemMatchbox_DZE", "generic", 0.06 },
                         { "ItemToolbox", "weapon", 0.02 },
                         { "", "generic", 0.17 },
                         { "", "food", 0.06 },
                         { "PartGeneric", "magazine", 0.07 },
                         { "PartWheel", "magazine", 0.06 },
                         { "PartFueltank", "magazine", 0.03 },
                         { "PartEngine", "magazine", 0.01 },
                         { "PartGlass", "magazine", 0.08 },
                         {"", "PistolsLow",  0.05}, 
                         {"", "AKLowWeaps",  0.01}, 
                         {"", "MeleeWeaps",  0.05}, 
                         {"", "ShotgunWeaps",  0.02}, 
                         { "WeaponHolder_ItemJerrycan", "object", 0.03 }
                 };
         };
         class DynamicDebrisMilitary: Default
         {
                 lootChance = 0.6;
                 minRoaming = 0;
                 maxRoaming = 2;
                 zombieChance = 0.5;
                 zombieClass[] = {"z_soldier_pilot","z_soldier_heavy"};
                 lootType[] = {
                         { "ItemEtool", "weapon", 0.05 },
                         { "ItemSandbag", "magazine", 0.1 },
                         { "", "military", 0.08 },
                         { "ItemKnife", "generic", 0.05 },
                         { "ItemMatchbox_DZE", "generic", 0.05 },
                         { "ItemToolbox", "weapon", 0.02 },
                         { "", "generic", 0.15 },
                         { "", "food", 0.05 },
                         { "PartGeneric", "magazine", 0.06 },
                         { "PartWheel", "magazine", 0.05 },
                         { "PartFueltank", "magazine", 0.03 },
                         { "PartEngine", "magazine", 0.02 },
                         { "PartGlass", "magazine", 0.03 },
                         { "PartVRotor", "magazine", 0.02 },
                         {"", "MeleeWeaps",  0.08}, 
                         {"", "PistolMilWeaps",  0.08}, 
                         {"", "ACRLowWeaps",  0.05}, 
                         {"", "ScarLowWeaps",  0.05}, 
                         {"", "HK416Weaps",  0.05}, 
                         {"", "MasWeaps",  0.05}, 
                         {"", "G36Weaps",  0.05}, 
                         {"", "SVDWeaps",  0.02}, 
                         {"", "AKLowWeaps",  0.05}, 
                         {"", "LMGWeaps",  0.03}, 
                         {"", "L85Weaps",  0.05}, 
                         {"", "M4Weaps",  0.05}, 
                         {"", "M8Weaps",  0.05}, 
                         {"", "SubWeaps",  0.04}, 
                         {"", "AKHighWeaps",  0.02}, 
                         {"", "SniperMedWeaps",  0.01}, 
                         {"", "RiflesMedWeaps",  0.04}, 
                         { "WeaponHolder_ItemJerrycan", "object", 0.03 }
                 };
         };
         class SupplyDrop: Default {
                 zombieChance = 1;
                 maxRoaming = 3;
                 zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_doctor","z_soldier_pilot","z_soldier_heavy"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         { "PartPlywoodPack", "magazine", 0.1 },
                         { "PartPlankPack", "magazine", 0.2 },
                         { "CinderBlocks", "magazine", 0.1 },
                         { "MortarBucket", "magazine", 0.1 },
                         { "bulk_PartGeneric", "magazine", 0.2 },
                         { "bulk_ItemSandbag", "magazine", 0.1 },
                         { "bulk_ItemTankTrap", "magazine", 0.1 },
                         { "ItemSledge", "weapon", 0.01 }
                 };
         };
         class MassGrave: Default {
                 zombieChance = 1;
                 maxRoaming = 3;
                 zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_doctor","z_soldier_pilot","z_soldier_heavy"};
                 lootChance = 0.6;
                 lootPos[] = {};
                 lootType[] = {
                         { "AmmoBoxSmall_556", "object", 0.03 },
                         { "AmmoBoxSmall_762", "object", 0.03 },
                         { "ItemFlashlightRed", "military", 0.02 },
                         { "ItemGPS", "weapon", 0.01 },
                         { "Binocular_Vector", "military", 0.01 },
                         { "DZ_ALICE_Pack_EP1", "object", 0.03 },
                         { "DZ_TK_Assault_Pack_EP1", "object", 0.02 },
                         { "DZ_British_ACU", "object", 0.02 },
                         { "DZ_CivilBackpack_EP1", "object", 0.02 },
                         { "DZ_Backpack_EP1", "object", 0.01 },
                         { "DZ_LargeGunBag_EP1", "object", 0.01 },
                         { "", "medical", 0.05 },
                         { "", "generic", 0.05 },
                         { "", "military", 0.13 },
                         { "", "militaryclothes", 0.05 },
                         { "WeaponHolder_ItemMachete", "object", 0.02 },
                         {"", "PistolMilWeaps",  0.1}, 
                         {"", "ACRLowWeaps",  0.1}, 
                         {"", "G36Weaps",  0.1}, 
                         {"", "L85Weaps",  0.1}, 
                         {"", "M4Weaps",  0.1}, 
                         {"", "M8Weaps",  0.1}, 
                         {"", "AKHighWeaps",  0.1}, 
                         {"", "RiflesMedWeaps",  0.1}, 
                         {"", "ACRHighWeaps",  0.1}, 
                         {"", "ScarHighWeaps",  0.1}, 
                         {"", "HK417Weaps",  0.08}, 
                         {"", "HMGWeaps",  0.08}, 
                         {"", "SniperMedWeaps",  0.05}, 
                         {"", "LauncherWeaps",  0.01}, 
                         { "2000Rnd_762x51_M134", "magazine", 0.01 }
                 };
         };
         #include "CfgBuildingPos.hpp"
 };
#include "shortcuts.h"
GG_indestructables = ["Land_MBG_Garage_Single_C","VaultStorageLocked","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","MetalFloor_DZ","CinderWallDoorSmallLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorLocked_DZ","CinderWallDoor_DZ","MetalPanel_DZ","Hedgehog_DZ","Plastic_Pole_EP1_DZ"];
GG_indarra = [];
GG_epochbooster 	= [
	"0",
"0"
];

GG_instntbarra 	= [] + GG_epochbooster;
GG_freemaintarra 	= [] + GG_epochbooster;
GG_notimerarra	= [] + GG_epochbooster;
GG_fasttrade 		= [] + GG_epochbooster;
GG_modbremarra	= GG_instntbarra;
if (!isDedicated) then {
	if (false) then {
		//Hero loadout
		loadout_loaded = true;
		DefaultMagazines = ["17Rnd_9x19_glock17","17Rnd_9x19_glock17","ItemBandage","ItemBandage","ItemPainkiller","PartGeneric"];
		DefaultWeapons = ["ItemToolbox","ItemMap","ItemFlashlight","ItemWatch","glock17_EP1"];
		DefaultBackpack = "DZ_TerminalPack_EP1";
		DefaultBackpackItems = [];
	};
	if (!isNil "loadout_loaded") exitWith {};
	diag_log ("Loaded custom loadouts! Loading default loadout...");
	//Default loadout
	DefaultMagazines = ["17Rnd_9x19_glock17","17Rnd_9x19_glock17","ItemBandage","ItemBandage","ItemPainkiller","PartGeneric"];
	DefaultWeapons = ["ItemToolbox","ItemMap","ItemFlashlight","ItemWatch","glock17_EP1"];
	DefaultBackpack = "DZ_TerminalPack_EP1";
	DefaultBackpackItems = [];
	diag_log ("Loaded default loadout...");
};
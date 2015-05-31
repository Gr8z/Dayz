class ExtraRc {

	class ItemToolbox {
		class ActionMenu {
			text = "Open Action Menu";
			script = "[] execVM ""GG\menu\actionmenu_main.sqf"";";
		};
	};
	
	class ItemKnife {
        class farmhemp {
            text = "Harvest weed";
            script = "execVM 'GG\weed\harvest.sqf'";
        };
    };	
	
	class ItemGPS {
        class playerNear {
            text = "Scan players (1000m)";
            script = "execVM 'GG\player_nearMe.sqf'";
        };
    };

	class EvMoney {
		class Bank {
            text = "Bank Stand";
            script = "[""Infostand_2_EP1"",[""ItemToolbox"",""ItemEtool""],[[""PartGeneric"", 1],[""ItemPole"", 1]],[0,3,1.1]] execVM ""GG\A_Plot_for_Life\Action\player_build.sqf"";";
        };
	};
	
	
	class Binocular_Vector  {
		class TurnONgr {
			text = "Turn ON Grass";
			script = "setTerrainGrid 25; systemChat('Grass turned ON');";
		};
		class TurnOFFgr {
			text = "Turn OFF Grass";
			script = "setTerrainGrid 50; systemChat('Grass turned OFF');";
		};
		class viewdistanceTitle {
			text = "View Distance:";
			script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance400m {
			text = "400 Meters";
			script = "setViewDistance 400; systemChat('ViewDistance: 400');";
		};
		class distance600m {
			text = "600 Meters";
			script = "setViewDistance 600; systemChat('ViewDistance: 600');";
		};
		class distance800m {
			text = "800 Meters";
			script = "setViewDistance 800; systemChat('ViewDistance: 800');";
		};
		class distance1000m {
			text = "1000 Meters";
			script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
		};
		class distance1250m {
			text = "1250 Meters";
			script = "setViewDistance 1250; systemChat('ViewDistance: 1250');";
		};
		class distance1500m {
			text = "1500 Meters";
			script = "setViewDistance 1500; systemChat('ViewDistance: 1500');";
		};
		class distance2000m {
			text = "2000 Meters";
			script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
			text = "3000 Meters";
			script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance5000m {
			text = "5000 Meters";
			script = "setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance6000m {
			text = "6000 Meters";
			script = "setViewDistance 6000; systemChat('ViewDistance: 6000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance7000m {
			text = "7000 Meters";
			script = "setViewDistance 7000; systemChat('ViewDistance: 7000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance8000m {
			text = "8000 Meters";
			script = "setViewDistance 8000; systemChat('ViewDistance: 8000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance9000m {
			text = "9000 Meters";
			script = "setViewDistance 9000; systemChat('ViewDistance: 9000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance10000m {
			text = "10000 Meters";
			script = "setViewDistance 10000; systemChat('ViewDistance: 10000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
		class Binocular  {
		class TurnONgr {
			text = "Turn ON Grass";
			script = "setTerrainGrid 25; systemChat('Grass turned ON');";
		};
		class TurnOFFgr {
			text = "Turn OFF Grass";
			script = "setTerrainGrid 50; systemChat('Grass turned OFF');";
		};
		class viewdistanceTitle {
			text = "View Distance:";
			script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance400m {
			text = "400 Meters";
			script = "setViewDistance 400; systemChat('ViewDistance: 400');";
		};
		class distance600m {
			text = "600 Meters";
			script = "setViewDistance 600; systemChat('ViewDistance: 600');";
		};
		class distance800m {
			text = "800 Meters";
			script = "setViewDistance 800; systemChat('ViewDistance: 800');";
		};
		class distance1000m {
			text = "1000 Meters";
			script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
		};
		class distance1250m {
			text = "1250 Meters";
			script = "setViewDistance 1250; systemChat('ViewDistance: 1250');";
		};
		class distance1500m {
			text = "1500 Meters";
			script = "setViewDistance 1500; systemChat('ViewDistance: 1500');";
		};
		class distance2000m {
			text = "2000 Meters";
			script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
			text = "3000 Meters";
			script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance5000m {
			text = "5000 Meters";
			script = "setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance6000m {
			text = "6000 Meters";
			script = "setViewDistance 6000; systemChat('ViewDistance: 6000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance7000m {
			text = "7000 Meters";
			script = "setViewDistance 7000; systemChat('ViewDistance: 7000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance8000m {
			text = "8000 Meters";
			script = "setViewDistance 8000; systemChat('ViewDistance: 8000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance9000m {
			text = "9000 Meters";
			script = "setViewDistance 9000; systemChat('ViewDistance: 9000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance10000m {
			text = "10000 Meters";
			script = "setViewDistance 10000; systemChat('ViewDistance: 10000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
	
	class NVGoggles  {
		class colorfilters {
			text = "Color Filters:";
			script = "systemChat('Change Color Filters Locally. Click on one of the filters');";
		};
		class ColorBluff {
			text = "Color Bluff";
			script = "execVM 'GG\menu\sky\16.sqf'";
		};
		class DarkDraining {
			text = "Dark Draining";
			script = "execVM 'GG\menu\sky\3.sqf'";
		};
		class Sandy {
			text = "Sandy";
			script = "execVM 'GG\menu\sky\4.sqf'";
		};
		class Summer {
			text = "Summer";
			script = "execVM 'GG\menu\sky\5.sqf'";
		};
		class DogVision {
			text = "Dog Vision";
			script = "execVM 'GG\menu\sky\6.sqf'";
		};
		class Tropical {
			text = "Tropical";
			script = "execVM 'GG\menu\sky\7.sqf'";
		};
		class Photo {
			text = "Photo";
			script = "execVM 'GG\menu\sky\8.sqf'";
		};
		class WarZone {
			text = "WarZone";
			script = "execVM 'GG\menu\sky\9.sqf'";
		};
		class colorfilters1 {
			text = "More...";
			script = "[] execVM ""GG\menu\actionmenu_main.sqf"";";
		};
	};
	
	class ItemRadio {
     class GroupManagement {
        text = "Group Management";
        script = "execVM 'GG\group\loadGroupManagement.sqf'";
        };
	};
};
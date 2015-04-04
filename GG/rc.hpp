class ExtraRc {

	class ItemToolbox {
		class BuildBike {
			text = "Deploy Bike";
			script = "['MMT_Civ'] execVM 'GG\deployables\deploy.sqf'";
		};
		class BuildMotorcycle {
			text = "Deploy Motorcycle";
			script = "['TT650_Civ'] execVM 'GG\deployables\deploy.sqf'";
		};
		class BuildMozzie {
			text = "Deploy Mozzie";
			script = "['CSJ_GyroC'] execVM 'GG\deployables\deploy.sqf'";
		};
	};
	
	class ItemKnife {
        class farmhemp {
            text = "Harvest weed";
            script = "execVM 'GG\weed\harvest.sqf'";
        };
    };
	
	class ItemKiloHemp {
        class smokeweed {
            text = "Smoke";
            script = "execVM 'GG\weed\smoke.sqf'";
        };
    };

	class EvMoney {
		class Bank {
            text = "Bank Stand";
            script = "[""Infostand_2_EP1"",[""ItemToolbox"",""ItemEtool""],[[""PartGeneric"", 1],[""ItemPole"", 1]],[0,3,1.1]] execVM ""GG\A_Plot_for_Life\Action\player_build.sqf"";";
        };
	};
	
	
	class Binocular_Vector  {
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
	};
	
	class ItemRadio {
     class GroupManagement {
        text = "Group Management";
        script = "execVM 'GG\group\loadGroupManagement.sqf'";
        };
	};
	
	 class ItemRuby {
	  class menuItem1 {
		text = "Virtual Garage";
		script = "[""Land_MBG_Garage_Single_A"",[""ItemToolbox"",""ItemHatchet_DZE""],[[""ItemRuby"", 1],[""PartGeneric"", 1]],[0,6.5,2.5]] execVM ""GG\A_Plot_for_Life\Action\player_build.sqf"";";
	  };
	 };
	
};
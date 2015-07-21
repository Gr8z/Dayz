DZE_CLICK_ACTIONS = [
	// View Distances
    ["Binocular_Vector","View Distance:","systemChat('Change View Distance Locally. Click on one of the distance options');","true"],
    ["Binocular_Vector","400 Meters","setViewDistance 400; systemChat('ViewDistance: 400'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","600 Meters","setViewDistance 600; systemChat('ViewDistance: 600'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","800 Meters","setViewDistance 800; systemChat('ViewDistance: 800'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","1000 Meters","setViewDistance 1000; systemChat('ViewDistance: 1000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","1500 Meters","setViewDistance 1500; systemChat('ViewDistance: 1500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","2000 Meters","setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","3000 Meters","setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","4000 Meters","setViewDistance 4000; systemChat('ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","5000 Meters","setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","View Distance:","systemChat('Change View Distance Locally. Click on one of the distance options');","true"],
    ["Binocular","400 Meters","setViewDistance 400; systemChat('ViewDistance: 400'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","600 Meters","setViewDistance 600; systemChat('ViewDistance: 600'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","800 Meters","setViewDistance 800; systemChat('ViewDistance: 800'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","1000 Meters","setViewDistance 1000; systemChat('ViewDistance: 1000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","1500 Meters","setViewDistance 1500; systemChat('ViewDistance: 1500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","2000 Meters","setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","3000 Meters","setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","4000 Meters","setViewDistance 4000; systemChat('ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","5000 Meters","setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	
	// Color Filters
    ["NVGoggles","Color Filters:","systemChat('Change Color Filters Locally. Click on one of the filters');","true"],
    ["NVGoggles","Normal","execVM 'GG\menu\sky\normal.sqf';","true"],
    ["NVGoggles","Contrast","execVM 'GG\menu\sky\clear.sqf';","true"],
    ["NVGoggles","Wasteland","execVM 'GG\menu\sky\wasteland.sqf';","true"],
    ["NVGoggles","Color Buff","execVM 'GG\menu\sky\colorbuff.sqf';","true"],
    ["NVGoggles","Summer","execVM 'GG\menu\sky\summer.sqf';","true"],
    ["NVGoggles","Africa","execVM 'GG\menu\sky\africa.sqf';","true"],
    ["NVGoggles","Tropical","execVM 'GG\menu\sky\tropical.sqf';","true"],
    ["NVGoggles","Flashpoint","execVM 'GG\menu\sky\flashpoint.sqf';","true"],
    ["NVGoggles","Dark Drain","execVM 'GG\menu\sky\darkdrain.sqf';","true"],
	
	// OTHERS
	["ItemRadio","Group Management","execVM 'GG\group\loadGroupManagement.sqf';","true"],
	["ItemToolbox","Open Action Menu","[] execVM 'GG\menu\actionmenu_main.sqf';","true"],
	["ItemKnife","Harvest weed","execVM 'GG\weed\harvest.sqf';","true"],
	["ItemGPS","Scan players (1000m)","execVM 'GG\player_nearMe.sqf';","true"],
	["ItemMap","Call Air Drop","execVM 'GG\carepackage.sqf';","true"],
	
	// GARAGE
	["ItemEtool","Build Garage","['Land_MBG_Garage_Single_D','Vehicle Garage','ItemBriefcase100oz'] spawn player_build_custom;","true"],
	["ItemEtool","Build Spawn Point","['HeliHCivil','Vehicle Garage Spawn Point','ItemBriefcase100oz'] spawn player_build_custom;","true"]
];
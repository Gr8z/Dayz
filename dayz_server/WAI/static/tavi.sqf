if(isServer) then {


	//Custom Spawns file//
	/*
	Custom group spawns Eg.

	[
		[953.237,4486.48,0.001],			// Position
		4,									// Number Of units
		"Random",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",	or ["Random","at"],		// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;

	Place your custom group spawns below
	*/
	[
		[4637.4297, 16357.171, 5.8582053],			// Position
		15,									// Number Of units
		"Random",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",	// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;
	[
		[4720.6265, 16360.209, 6.0620027],			// Position
		15,									// Number Of units
		"Random",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;
	[
		[4754.5864, 16433.988, 6.0977154],			
		15,									
		"Random",							
		"Random",	
		4,									
		"Random",							
		"Random",							
		"Random",							
		"Bandit"							
	] call spawn_group;
	[
		[4744.3706, 16297.144, 6.0759263],
		15,
		"Random",
		"Random",
		4,
		"Random",
		"Random",
		"Random",
		"Bandit"
	] call spawn_group;
		




	/*
	Custom static weapon spawns Eg. (with mutiple positions)

	[
		[									// Position(s) (can be multiple)
			[911.21,4532.76,2.62],
			[921.21,4542.76,2.62]
		],
		"M2StaticMG",						// Classname of turret
		"easy",								// Skill level of unit (easy, medium, hard, extreme, Random)
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		2,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;

	Place your custom static weapon spawns below
	*/
	[
		[									// Position(s) (can be multiple)
			[4602.9668,16512.455,-0.16192776],
			[4602.3701,16512.867,-0.14920866],
			[4602.793, 16517.42, -0.10584193],
			[4654.5059,16286.85,7.0639744],
			[4740.5308,16355.143,7.1397309],
			[4607.2891,16514.568,-0.17013001],
			[4669.4121,16287.606,7.110631],
			[4598.4307,16522.453,0.033300936],
			[4607.8838,16517.98,-0.15663409],
			[4606.5542,16513.898,-0.17447048],
			[4820.6196,16480.848,18.07336],
			[4604.6816,16515.941,-0.14379913],
			[4722.1689,16354.443,9.9330559],
			[4524.5503,16452.438,5.2371068],
			[4771.9473,16458.744,14.357543],
			[4820.9629,16465.455,17.674789],
			[4686.2847,16424.412,13.346181],
			[4692.7515,16359.446,7.1177206],
			[4675.4292,16410.176,12.759229],
			[4690.0132,16458.654,14.404888],
			[4617.4648,16351.863,7.1645865],
			[4575.8047,16459.16,14.456353],
			[4522.8774,16364.416,0.054643702],
			[4617.6162,16370.772,7.4380002],
			[4735.6196,16459.518,14.271019],
			[4470.0708,16440.471,6.9096413],
			[4470.5571,16239.575,7.0201845],
			[4469.6846,16400.66,7.0956435],
			[4469.6724,16479.799,6.9282136],
			[4532.0342,16460.365,14.500594],
			[4612.2056,16458.869,14.585779],
			[4521.6421,16363.956,7.2016473],
			[4470.8599,16320.79,6.9535551],
			[4521.6475,16351.157,7.1635375],
			[4470.2559,16358.837,7.0001717]
		],
		"M2StaticMG",						// Classname of turret
		"medium",								// Skill level of unit (easy, medium, hard, extreme, Random)
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		2,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;




	/*
	Custom Chopper Patrol spawn Eg.

	[
		[725.391,4526.06,0],				// Position to patrol
		[0,0,0],							// Position to spawn chopper at
		2000,								// Radius of patrol
		10,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;


	Place your heli patrols below
	*/
	[
		[4662.0879,16444.887,5.9835782],				// Position to patrol
		[4662.0879,16444.887,5.9835782],							// Position to spawn chopper at
		2000,								// Radius of patrol
		10,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;
	[
		[4643.6411, 16239.537, 6.1473274],				// Position to patrol
		[4643.6411, 16239.537, 6.1473274],							// Position to spawn chopper at
		2000,								// Radius of patrol
		10,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;[
		[4613.793, 16240.467, 5.9338222],				// Position to patrol
		[4613.793, 16240.467, 5.9338222],							// Position to spawn chopper at
		2000,								// Radius of patrol
		10,									// Number of waypoints to give
		"AH6X_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;





	/* 
	Custom Vehicle patrol spawns Eg. (Watch out they are stupid)

	[
		[725.391,4526.06,0],				// Position to patrol
		[725.391,4526.06,0],				// Position to spawn at
		200,								// Radius of patrol
		10,									// Number of waypoints to give
		"HMMWV_Armored",					// Classname of vehicle (make sure it has driver and gunner)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;

	Place your vehicle patrols below this line
	*/
	[
		[4405.0303,16388.998,-0.11979395],				// Position to patrol
		[4405.0303,16388.998,-0.11979395],				// Position to spawn at
		1000,								// Radius of patrol
		10,									// Number of waypoints to give
		"RHIB",					// Classname of vehicle (make sure it has driver and gunner)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;
	[
		[4391.9165,16326.883,0],    		// Position to patrol
		[4391.9165,16326.883,0],				// Position to spawn at
		1000,								// Radius of patrol
		10,									// Number of waypoints to give
		"RHIB",					// Classname of vehicle (make sure it has driver and gunner)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;





	/*
	Paradropped unit custom spawn Eg.

	[
		[911.21545,4532.7612,2.6292224],	// Position that units will be dropped by
		[0,0,0],							// Starting position of the heli
		400,								// Radius from drop position a player has to be to spawn chopper
		"UH1H_DZ",							// Classname of chopper (Make sure it has 2 gunner seats!)
		5,									// Number of units to be para dropped
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set.
		"Bandit",							// AI Type, "Hero" or "Bandit".
		true								// true: Aircraft will stay at position and fight. false: Heli will leave if not under fire. 
	] spawn heli_para;

	Place your paradrop spawns under this line
	*/
	[
		[4720.6265, 16360.209, 6.0620027],	// Position that units will be dropped by
		[0,0,0],							// Starting position of the heli
		150,								// Radius from drop position a player has to be to spawn chopper
		"UH1H_DZ",							// Classname of chopper (Make sure it has 2 gunner seats!)
		5,									// Number of units to be para dropped
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set.
		"Bandit",							// AI Type, "Hero" or "Bandit".
		false								// true: Aircraft will stay at position and fight. false: Heli will leave if not under fire. 
	] spawn heli_para;

	diag_log format["WAI: Static mission for %1 loaded", missionName];

};

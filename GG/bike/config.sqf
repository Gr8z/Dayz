// [_clickItem,_deployOffset,_packDistance,_damageLimit,_packAny,_cargo,_ammo,_hive,_plot,_simulation,_road,_deployables,_near,_parts,_condition],

DZE_DEPLOYABLES_CONFIG = [
    
	// Mountain Bike
	["ItemToolbox", // class name of the item to click on   
	[0,5,1],		// [_side,_front,_up] array to offset the deployable when buiding  
	5,				// how close does the packer need to be to pack the object? 
	0.9,			// item can't be repacked if damage is > this. (-1 = no re-packing) 
	false,			// can anyone repack the deployable?
	false,			// clear the cargo of the deployable?   
	true,			// should vehicle ammo be cleared?
	false,			// write deployable to database?
	false,			// require a plot from the owner to build the deployable?  
	true,			// enable simulation (movement/damage) for the object? (true for cars)
	true,			// enable road building for this object?
	["MMT_Civ"],	// array of class names that can be deployed with this method
	[],				// array of items required nearby to build
	["ItemToolbox"],// array of parts required to build
	"true"],
	
	// ATV
	["ItemToolbox", // class name of the item to click on   
	[0,5,1],		// [_side,_front,_up] array to offset the deployable when buiding  
	5,				// how close does the packer need to be to pack the object? 
	0.5,			// item can't be repacked if damage is > this. (-1 = no re-packing) 
	false,			// can anyone repack the deployable?
	false,			// clear the cargo of the deployable?   
	true,			// should vehicle ammo be cleared?
	false,			// write deployable to database?
	false,			// require a plot from the owner to build the deployable?  
	true,			// enable simulation (movement/damage) for the object? (true for cars)
	true,			// enable road building for this object?
	["ATV_CZ_EP1"],	// array of class names that can be deployed with this method
	[],				// array of items required nearby to build
	["PartGeneric","PartEngine","PartWheel","PartWheel"],// array of parts required to build
	"true"],
	
	// Mozzie
	["ItemToolbox", // class name of the item to click on   
	[0,5,2],		// [_side,_front,_up] array to offset the deployable when buiding  
	7,				// how close does the packer need to be to pack the object? 
	0.5,			// item can't be repacked if damage is > this. (-1 = no re-packing) 
	false,			// can anyone repack the deployable?
	false,			// clear the cargo of the deployable?   
	true,			// should vehicle ammo be cleared?
	false,			// write deployable to database?
	false,			// require a plot from the owner to build the deployable?  
	true,			// enable simulation (movement/damage) for the object? (true for cars)
	true,			// enable road building for this object?
	["CSJ_GyroC"],	// array of class names that can be deployed with this method
	[],				// array of items required nearby to build
	["PartVRotor","PartEngine","PartFueltank"],// array of parts required to build
	"true"]
];

//
DZE_DEPLOYABLE_NAME_MAP = [
    ["Notebook","Macbook Pro"]
];

DZE_DEPLOYABLE_ADMINS = [
	"76561198078201908", // Gr8
	"76561198153784743", // Ghost
	"76561198002511087", // TempSniper
	"76561198021389971", // Thirdhero
	"76561198182408150", // Pirate Admin
	"76561198137100220", // Deadskin
	"76561198182352055", // Milton
	"76561197973172761", // Milton
	"76561198183434467", // MeowMix
	"76561198195305425"  // Shahzad
];

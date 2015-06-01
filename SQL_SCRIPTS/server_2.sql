/* =================== DELETES =================== */

/* Delete old crap */
DELETE FROM `object_data_2`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 21 DAY);

/* Delete destroyed objects */
DELETE FROM `object_data_2`
WHERE Damage = 1;

/* Delete plots and doors not being cleaned */
DELETE FROM `object_data_2`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY)
AND `Classname` IN ('Plastic_Pole_EP1_DZ','CinderWallDoorSmallLocked_DZ','CinderWallDoorLocked_DZ','CinderWallSmallDoorway_DZ','CinderWallDoorway_DZ','Land_DZE_WoodDoorLocked','CinderWallDoor_DZ','CinderWallDoorSmall_DZ','Land_DZE_WoodDoor','Land_DZE_GarageWoodDoor','Land_DZE_GarageWoodDoorLocked','Land_DZE_LargeWoodDoorLocked','Land_DZE_LargeWoodDoor','WoodLargeWallDoor_DZ');

/* Delete deployed mozies and bikes */
DELETE FROM `object_data_2`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)
AND `Classname` IN ('CSJ_GyroC','TT650_Civ','MMT_Civ');

/* Delete old login data */
DELETE FROM `player_login`;

/* Delete Old Banks */
DELETE FROM banking_data
WHERE LastUpdated < NOW() - INTERVAL 20 DAY ;

/* Delete untouched server spawned vehicles */
DELETE FROM `object_data_2`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)
AND `CharacterID` = '0'
AND `Classname`
NOT REGEXP 'barrier|storage|shed|bench|wall|floor|fence|pump|wood|hrescue|stick|pole|generator|panel|house|rack|bag|stand|barrel|canvas|wire|hedgehog|net|trap|ramp|fort|sand|scaffold|nest|killhouse|villa|castle|pub|shelter|stodola';

/* Delete all vehicles not touched in 7 days */
DELETE FROM `object_data_2`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY)
AND `Classname`
NOT REGEXP 'barrier|storage|shed|bench|wall|floor|fence|pump|wood|hrescue|stick|pole|generator|panel|house|rack|bag|stand|barrel|canvas|wire|hedgehog|net|trap|ramp|fort|sand|scaffold|nest|killhouse|villa|castle|pub|shelter|stodola';

/* Delete empty storage objects */
DELETE FROM `object_data_2`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)
AND ( (`Inventory` IS NULL) OR (`Inventory` = '[]') OR (`Inventory` = '[[[],[]],[[],[]],[[],[]]]') )
AND `Classname` IN ('Wooden_shed_DZ','WoodShack_DZ', 'TentStorage', 'TentStorageDomed', 'TentStorageDomed2', 'WoodCrate_DZ', 'GunRack_DZ', 'OutHouse_DZ', 'StorageShed_DZ');

/* Delete unused storage objects */
DELETE FROM `object_data_2`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY)
AND `Classname` IN ('Wooden_shed_DZ','WoodShack_DZ', 'TentStorage', 'TentStorageDomed', 'TentStorageDomed2', 'WoodCrate_DZ', 'GunRack_DZ', 'OutHouse_DZ', 'StorageShed_DZ');

/* Delete all dead characters */
DELETE from Character_data
USING Character_data, Character_data as tempchartable
WHERE (Character_data.PlayerUID = tempchartable.PlayerUID)
AND (NOT Character_data.alive = tempchartable.alive)
AND (Character_data.alive = 0);

/* Delete Inactive Characters */
DELETE FROM Character_DATA 
WHERE LastLogin < NOW() - INTERVAL 10 DAY;


/* =================== UPDATES =================== */

/* Unlock Purchased Untouched Vehicles */
UPDATE `object_data_2`
SET `CharacterID` = 0
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY)
AND `CharacterID` > 0
AND `Classname`
NOT REGEXP 'barrier|storage|shed|bench|wall|floor|fence|pump|wood|hrescue|stick|pole|generator|panel|house|rack|bag|stand|barrel|canvas|wire|hedgehog|net|trap|ramp|fort|sand|scaffold|nest';

/* Fix inventory on maintain objects */
UPDATE `object_data_2`
SET `inventory` = '[]',`LastUpdated` = `LastUpdated`
WHERE `inventory` = '[[[],[]],[[],[]],[[],[]]]'
AND
`Classname` IN (
'BagFenceRound_DZ','CinderWall_DZ','CinderWallDoorLocked_DZ','CinderWallDoorSmall_DZ','CinderWallDoorSmallLocked_DZ',
'CinderWallHalf_DZ','FireBarrel_DZ','GunRack_DZ','LightPole_DZ','MetalFloor_DZ','MetalPanel_DZ','OutHouse_DZ','TentStorage',
'TentStorageDomed','TentStorageDomed2','Sandbag1_DZ','Scaffolding_DZ','StickFence_DZ','StorageShed_DZ','WorkBench_DZ',
'WoodCrate_DZ','WoodFloor_DZ','WoodFloorQuarter_DZ','WoodLargeWall_DZ','WoodLargeWallWin_DZ','WoodShack_DZ','WoodSmallWall_DZ',
'WoodSmallWallThird_DZ','WoodSmallWallWin_DZ','Land_DZE_GarageWoodDoor','WoodFloorHalf_DZ','Fort_RazorWire','Land_DZE_LargeWoodDoorLocked',
'WoodStairsRails_DZ','WoodLadder_DZ','WoodStairsSans_DZ','M240Nest_DZ','Land_DZE_WoodDoor'
);

/* Set Damage on all other objects */
UPDATE `object_data_2`
SET `Damage`=0.2
WHERE `ObjectUID` <> 0
AND `CharacterID` <> 0
AND `Datestamp` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)
AND ( (`Inventory` IS NULL) OR (`Inventory` = '[]') );

/* Set Damage On Doors/Plot Poles using Door Management via Age */
UPDATE `object_data_2`
SET `Damage`=0.2
WHERE `Classname` IN ('Plastic_Pole_EP1_DZ','CinderWallDoorSmallLocked_DZ','CinderWallDoorLocked_DZ','CinderWallSmallDoorway_DZ','CinderWallDoorway_DZ','Land_DZE_WoodDoorLocked','CinderWallDoor_DZ','CinderWallDoorSmall_DZ','Land_DZE_WoodDoor','Land_DZE_GarageWoodDoor','Land_DZE_GarageWoodDoorLocked','Land_DZE_LargeWoodDoorLocked','Land_DZE_LargeWoodDoor','WoodLargeWallDoor_DZ')
AND `Datestamp` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)
AND `Inventory` != '[]';

/* Set Safe Combo to 0000 */
UPDATE `object_data_2`
SET `CharacterID` = 0
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY)
AND `CharacterID` > 0
AND `Classname` = "VaultStorageLocked"
AND `Inventory` <> '[]'
AND `Inventory` IS NOT NULL;

/* Set Lock Box to RED 00 */
UPDATE `object_data_2`
SET `CharacterID` = 10000
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY)
AND `CharacterID` > 0
AND `Classname` = "LockboxStorageLocked"
AND `Inventory` <> '[]'
AND `Inventory` IS NOT NULL;

/* Unlock vehicles with lost keys */
UPDATE `object_data_2`
SET `object_data_2`.`CharacterID` = 0
WHERE `object_data_2`.`CharacterID` <> 0
AND`object_data_2`.`CharacterID` <= 12500
AND`object_data_2`.`Classname` NOT LIKE 'Tent%'
AND`object_data_2`.`Classname` NOT LIKE '%Locked'
AND`object_data_2`.`Classname` NOT LIKE 'Land%'
AND`object_data_2`.`Classname` NOT LIKE 'Cinder%'
AND`object_data_2`.`Classname` NOT LIKE 'Wood%'
AND`object_data_2`.`Classname` NOT LIKE 'Metal%'
AND`object_data_2`.`Classname` NOT LIKE '%Storage%'
AND`object_data_2`.`Classname` NOT IN ('OutHouse_DZ', 'GunRack_DZ', 'WorkBench_DZ', 'Sandbag1_DZ', 'FireBarrel_DZ', 'DesertCamoNet_DZ', 'StickFence_DZ', 'LightPole_DZ', 'DeerStand_DZ', 'ForestLargeCamoNet_DZ', 'Plastic_Pole_EP1_DZ', 'Hedgehog_DZ', 'FuelPump_DZ', 'Fort_RazorWire', 'SandNest_DZ', 'ForestCamoNet_DZ', 'Fence_corrugated_DZ', 'CanvasHut_DZ', 'Generator_DZ')
AND FindVehicleKeysCount2(object_data_2.CharacterID) = 0;

vkc_claimKey = 1;
vkc_changeKey = 1;
vkc_claimKeyPrice = "ItemGoldBar10oz";
vkc_changeKeyPrice = "ItemGoldBar";
vkc_claimNeedKeykit = 1;
vkc_changeNeedKeykit = 1;

waitUntil {!isNil "dayz_animalCheck"};

/* Start the loop check */
while{true} do {
	if (!isNull cursorTarget && (cursorTarget isKindOf "AllVehicles") && (player distance cursorTarget <= 10) && (!isEngineOn cursorTarget)) then {
		vkc_cursorTarget = cursorTarget;
		vkc_ownerID = vkc_cursorTarget getVariable ["CharacterID","0"];

		if (vkc_claimKey == 1 && vkc_ownerID == "0" && vkc_cursorTarget getVariable ["VKC_claiming_disabled", 0] == 0) then {
			vkc_magazinesPlayer = magazines player;
			vkc_itemsPlayer = items player;
		
			if (("ItemKeyKit" in vkc_itemsPlayer || vkc_claimNeedKeykit == 0) && (vkc_claimKeyPrice == "0" || vkc_claimKeyPrice in vkc_magazinesPlayer)) then {
				vkc_objectID = vkc_cursorTarget getVariable ["ObjectID","0"];
				vkc_objectUID = vkc_cursorTarget getVariable ["ObjectUID","0"];

				if (!(vkc_objectID == "0" && vkc_objectUID == "0")) then {

					if (s_player_claimKey < 0) then {
						s_player_claimKey = player addAction [("<t color='#00FFFF'>" + ("Claim Vehicle Key") + "</t>"),"GG\VehicleKeyChanger\VehicleKeyChanger.sqf",[vkc_cursorTarget, vkc_temp_keys, vkc_ownerID, vkc_temp_keysDisplayName, "0", "0", "0", vkc_claimKeyPrice],-1002,false,false,"",""];
					};

				} else {

					player removeAction s_player_claimKey;
					s_player_claimKey = -1;
				};

			} else {

				player removeAction s_player_claimKey;
				s_player_claimKey = -1;
			};

		} else {

			player removeAction s_player_claimKey;
			s_player_claimKey = -1;
		};

		if (vkc_changeKey == 1 && vkc_ownerID != "0" && vkc_cursorTarget getVariable ["VKC_disabled",0] == 0) then {
			vkc_magazinesPlayer = magazines player;
			vkc_itemsPlayer = items player;

			if (("ItemKeyKit" in vkc_itemsPlayer || vkc_changeNeedKeykit == 0) && (vkc_changeKeyPrice == "0" || vkc_changeKeyPrice in vkc_magazinesPlayer)) then {
				vkc_objectID = vkc_cursorTarget getVariable ["ObjectID","0"];
				vkc_objectUID = vkc_cursorTarget getVariable ["ObjectUID","0"];

				if (!(vkc_objectID == "0" && vkc_objectUID == "0")) then {
		
					vkc_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
					vkc_temp_keys = [];
					vkc_temp_keysDisplayName = [];
					vkc_temp_keysDisplayNameParse = [];
					vkc_temp_keysParse = [];

					{

						if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in vkc_key_colors) then {
							vkc_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
							vkc_keyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
							vkc_temp_keysDisplayName set [count vkc_temp_keysDisplayName,vkc_keyName];
							vkc_temp_keysDisplayNameParse set [vkc_ownerKeyId,vkc_keyName];
							vkc_temp_keys set [count vkc_temp_keys,str(vkc_ownerKeyId)];
							vkc_temp_keysParse set [vkc_ownerKeyId, _x];
						};
					} forEach vkc_itemsPlayer;

					vkc_hasKey = vkc_ownerID in vkc_temp_keys;

					if (vkc_hasKey && (count vkc_temp_keys) > 1) then {
						vkc_carKeyName = (vkc_temp_keysDisplayNameParse select (parseNumber vkc_ownerID));
						vkc_targetVehicleKey = (vkc_temp_keysParse select (parseNumber vkc_ownerID));
						vkc_temp_keys = vkc_temp_keys - [vkc_ownerID];
						vkc_temp_keysDisplayName = vkc_temp_keysDisplayName - [vkc_carKeyName];

						if (s_player_changeKey < 0) then {
							s_player_changeKey = player addAction [("<t color=""#0000FF"">" + ("Change Vehicle Key") + "</t>"),"GG\VehicleKeyChanger\VehicleKeyChanger.sqf",[vkc_cursorTarget, vkc_temp_keys, vkc_ownerID, vkc_temp_keysDisplayName, vkc_carKeyName, vkc_targetVehicleKey, vkc_changeKeyPrice, "0"],-1002,false,false,"",""];
						};

					} else {
				
						player removeAction s_player_changeKey;
						s_player_changeKey = -1;
					};

				} else {
				
					player removeAction s_player_changeKey;
					s_player_changeKey = -1;
				};

			} else {
			
				player removeAction s_player_changeKey;
				s_player_changeKey = -1;
			};

		} else {
				
			player removeAction s_player_changeKey;
			s_player_changeKey = -1;
		};

	} else {

		player removeAction s_player_claimKey;
		s_player_claimKey = -1;
		player removeAction s_player_changeKey;
		s_player_changeKey = -1;
	};
	uiSleep 2;
};
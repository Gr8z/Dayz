#include "shortcuts.h"
if (!isDedicated) then {
	"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4];
	setToneMapping "Filmic";
	BIS_Effects_Burn = 			xcm xlx "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
	player_zombieCheck = 		xcm xlx "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	player_zombieAttack = 		xcm xlx "\z\addons\dayz_code\compile\player_zombieAttack.sqf";
	fnc_inAngleSector =			xcm xlx "\z\addons\dayz_code\compile\fn_inAngleSector.sqf";
	fnc_usec_unconscious =		xcm xlx "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	player_temp_calculation	=	xcm xlx "\z\addons\dayz_code\compile\fn_temperatur.sqf";
	player_weaponFiredNear =	xcm xlx "\z\addons\dayz_code\compile\player_weaponFiredNear.sqf";
	player_animalCheck =		xcm xlx "\z\addons\dayz_code\compile\player_animalCheck.sqf";
	player_dumpBackpack = 		xcm xlx "\z\addons\dayz_code\compile\player_dumpBackpack.sqf";
	building_spawnZombies =		xcm xlx "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	dayz_spaceInterrupt =		xcm xlx "\z\addons\dayz_code\actions\dayz_spaceInterrupt.sqf";
	[] swx {
		GG_spaceInterrupt = (str dayz_spaceInterrupt);
		_text 	= toArray GG_spaceInterrupt;
		_cnt 	= count _text;
		_i 		= 0;
		_text set [_cnt - _cnt,objNull];
		_text set [_cnt,objNull];
		for '_i' from 0 to 10 do {_text set [_cnt - _i,objNull]};
		_txt = _text - [objNull];
		GG_spaceInterrupt = toString _txt;
		GG_spaceInterrupt2 = {
			if ((_dikCode == 0x21 and (!_alt and !_ctrl)) or (_dikCode in actionKeys "User6")) then {
				DZE_F = true;
			};
			_handled;
		};
		GG_spaceInterrupt2 = (str GG_spaceInterrupt2);
		_text = toArray GG_spaceInterrupt2;
		_cnt = count _text;
		_text set [_cnt - _cnt,objNull];
		_text set [_cnt - 0,objNull];
		_text set [_cnt - 1,objNull];
		_txt = _text - [objNull];
		GG_spaceInterrupt2 = toString _txt;
		GG_spaceInterrupt = GG_spaceInterrupt + GG_spaceInterrupt2;
		dayz_spaceInterrupt = xcm GG_spaceInterrupt;
	};
	player_fired =				xcm xlx "\z\addons\dayz_code\compile\player_fired.sqf";
	player_harvest =			xcm xlx "\z\addons\dayz_code\compile\player_harvest.sqf";
	player_packTent =			xcm xlx "\z\addons\dayz_code\compile\player_packTent.sqf";
	player_packVault =			xcm xlx "\z\addons\dayz_code\compile\player_packVault.sqf";
	player_removeNearby =    	xcm xlx "\z\addons\dayz_code\compile\object_removeNearby.sqf";
	player_unlockDoor =			xcm xlx "\z\addons\dayz_code\compile\player_unlockDoor.sqf";
	player_changeCombo =		xcm xlx "\z\addons\dayz_code\compile\player_changeCombo.sqf";
	player_crossbowBolt =		xcm xlx "\z\addons\dayz_code\compile\player_crossbowBolt.sqf";
	player_music = 				xcm xlx "\z\addons\dayz_code\compile\player_music.sqf";
	player_death = 				xcm xlx "GG\Epoch\GG_PD.sqf";
	player_switchModel =		xcm xlx "\z\addons\dayz_code\compile\player_switchModel.sqf";
	player_checkStealth =		xcm xlx "\z\addons\dayz_code\compile\player_checkStealth.sqf";
	world_sunRise =				xcm xlx "\z\addons\dayz_code\compile\fn_sunRise.sqf";
	world_surfaceNoise =		xcm xlx "\z\addons\dayz_code\compile\fn_surfaceNoise.sqf";
	player_throwObject = 		xcm xlx "\z\addons\dayz_code\compile\player_throwObject.sqf";
	player_alertZombies = 		xcm xlx "\z\addons\dayz_code\compile\player_alertZombies.sqf";
	player_fireMonitor = 		xcm xlx "\z\addons\dayz_code\system\fire_monitor.sqf";
	object_roadFlare = 			xcm xlx "\z\addons\dayz_code\compile\object_roadFlare.sqf";
	object_setpitchbank	=		xcm xlx "\z\addons\dayz_code\compile\fn_setpitchbank.sqf";
	object_monitorGear =		xcm xlx "\z\addons\dayz_code\compile\object_monitorGear.sqf";
	local_roadDebris =			xcm xlx "\z\addons\dayz_code\compile\local_roadDebris.sqf";
	zombie_findTargetAgent = 	xcm xlx "\z\addons\dayz_code\compile\zombie_findTargetAgent.sqf";
	zombie_loiter = 			xcm xlx "\z\addons\dayz_code\compile\zombie_loiter.sqf";
	zombie_generate	= 			xcm xlx "GG\Epoch\GG_ZG.sqf";
	wild_spawnZombies = 		xcm xlx "GG\Epoch\GG_WSZ.sqf";
	pz_attack = 				xcm xlx "\z\addons\dayz_code\actions\pzombie\pz_attack.sqf";
	dog_findTargetAgent = 		xcm xlx "\z\addons\dayz_code\compile\dog_findTargetAgent.sqf";
	player_countmagazines =		xcm xlx "\z\addons\dayz_code\actions\player_countmagazines.sqf";
	player_addToolbelt =		xcm xlx "\z\addons\dayz_code\actions\player_addToolbelt.sqf";
	player_copyKey =			xcm xlx "\z\addons\dayz_code\actions\player_copyKey.sqf";
	player_reloadMag =			xcm xlx "\z\addons\dayz_code\actions\player_reloadMags.sqf";
	player_loadCrate =			xcm xlx "\z\addons\dayz_code\actions\player_loadCrate.sqf";
	player_tentPitch =			xcm xlx "\z\addons\dayz_code\actions\tent_pitch.sqf";
	player_vaultPitch =			xcm xlx "\z\addons\dayz_code\actions\vault_pitch.sqf";
	player_drink =				xcm xlx "\z\addons\dayz_code\actions\player_drink.sqf";
	player_eat =				xcm xlx "\z\addons\dayz_code\actions\player_eat.sqf";
	player_useMeds =			xcm xlx "\z\addons\dayz_code\actions\player_useMeds.sqf";
	player_fillWater = 			xcm xlx "\z\addons\dayz_code\actions\water_fill.sqf";
	player_makeFire =			xcm xlx "\z\addons\dayz_code\actions\player_makefire.sqf";
	player_harvestPlant =		xcm xlx "\z\addons\dayz_code\actions\player_harvestPlant.sqf";
	player_goFishing =			xcm xlx "\z\addons\dayz_code\actions\player_goFishing.sqf";
	object_pickup = 			xcm xlx "\z\addons\dayz_code\actions\object_pickup.sqf";
	player_flipvehicle = 		xcm xlx "\z\addons\dayz_code\actions\player_flipvehicle.sqf";
	player_sleep = 				xcm xlx "\z\addons\dayz_code\actions\player_sleep.sqf";
	player_antiWall =			xcm xlx "\z\addons\dayz_code\compile\player_antiWall.sqf";
	player_deathBoard =			xcm xlx "\z\addons\dayz_code\actions\list_playerDeathsAlt.sqf";
	player_upgradeVehicle =		xcm xlx "\z\addons\dayz_code\compile\player_upgradeVehicle.sqf";
	player_gearSync	=			xcm xlx "\z\addons\dayz_code\compile\player_gearSync.sqf";
	player_gearSet	=			xcm xlx "\z\addons\dayz_code\compile\player_gearSet.sqf";
	ui_changeDisplay = 			xcm xlx "\z\addons\dayz_code\compile\ui_changeDisplay.sqf";
	ui_gear_sound =             xcm xlx "\z\addons\dayz_code\compile\ui_gear_sound.sqf";
	player_monitor =			xcm xlx "\z\addons\dayz_code\system\player_monitor.sqf";
	player_spawn_2 =			xcm xlx "\z\addons\dayz_code\system\player_spawn_2.sqf";
	garage_getnearVeh = 		xcm xlx "GG\Garage\garage_nearvehicles.sqf";
	garage_getstoredVeh = 		xcm xlx "GG\Garage\garage_storedvehicles.sqf";
	garage_manage = 			xcm xlx "GG\Garage\garage_manage.sqf";
	garage_fillplayers = 		xcm xlx "GG\Garage\garage_fillplayers.sqf";
	garage_addfriend = 			xcm xlx "GG\Garage\garage_addfriend.sqf";
	garage_removefriend = 		xcm xlx "GG\Garage\garage_removefriend.sqf";
	garage_spawnVehicle = 		xcm xlx "GG\Garage\garage_spawnvehicle.sqf";
	garage_storeVehicle = 		xcm xlx "GG\Garage\garage_storeVehicle.sqf";
	player_removeObject = {
		private ["_activatingPlayer","_obj","_objectID","_objectUID","_started","_finished","_animState","_isMedic","_isOk","_proceed","_counter","_limit","_objType","_sfx","_dis","_itemOut","_countOut","_selectedRemoveOutput","_friendlies","_nearestPole","_ownerID","_refundpart","_isWreck","_findNearestPoles","_findNearestPole","_IsNearPlot","_brokenTool","_removeTool","_isDestructable","_isRemovable","_objOwnerID","_isOwnerOfObj","_preventRefund","_ipos","_item","_radius","_isWreckBuilding","_nameVehicle","_isModular"];
		if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_88") , "PLAIN DOWN"]; };
		DZE_ActionInProgress = true;
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = 1;
		_obj = _this sel 3;
		_activatingPlayer = player;
		_objOwnerID = _obj getVariable["CharacterID","0"];
		_isOwnerOfObj = (_objOwnerID == dayz_characterID);
		if (_obj in DZE_DoorsLocked) exitWith { DZE_ActionInProgress = false; cutText [(localize "STR_EPOCH_ACTIONS_20"), "PLAIN DOWN"];};
		if(_obj getVariable ["GeneratorRunning", false]) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_89"), "PLAIN DOWN"];};
		_objectID 	= _obj getVariable ["ObjectID","0"];
		_objectUID	= _obj getVariable ["ObjectUID","0"];
		_isOk = true;
		_proceed = false;
		_objType = typeOf _obj;
		_isDestructable = _obj isKindOf "BuiltItems";
		_isWreck = _objType in DZE_isWreck;
		_isRemovable = _objType in DZE_isRemovable;
		_isWreckBuilding = _objType in DZE_isWreckBuilding;
		_isGarage = (_objType == "Land_MBG_Garage_Single_C");
		_isMine = _objType in ["Land_iron_vein_wreck","Land_silver_vein_wreck","Land_gold_vein_wreck"];
		_isModular = _obj isKindOf "ModularItems";
		_limit = 3;
		if (DZE_StaticConstructionCount > 0) then {
			_limit = DZE_StaticConstructionCount;
		} else {
			if (isNumber (configFile >> "CfgVehicles" >> _objType >> "constructioncount")) then {
				_limit = getNumber(configFile >> "CfgVehicles" >> _objType >> "constructioncount");
			};
		};
		if (_objType == "HeliH") then {_limit = 1};
		if (_isMine) then {_limit = (1 + (if (random 100 > 70) then [{1},{2}]))};
		_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], 30];
		_findNearestPole = [];
		{if (alive _x) then {_findNearestPole set [(count _findNearestPole),_x];};} count _findNearestPoles;
		_IsNearPlot = count (_findNearestPole);
		if(_IsNearPlot >= 1) then {
			_nearestPole = _findNearestPole sel 0;
			_ownerID = _nearestPole getVariable["CharacterID","0"];
			if(dayz_characterID != _ownerID) then {
				_friendlies		= player getVariable ["friendlyTo",[]];
				if(!(_ownerID in _friendlies)) then {
					_limit = round(_limit*2);
				};
			};
		};
		_nameVehicle = getText(configFile >> "CfgVehicles" >> _objType >> "displayName");
		cutText [format[(localize "str_epoch_player_162"),_nameVehicle], "PLAIN DOWN"];
		if (_isModular) then {cutText [(localize "STR_EPOCH_ACTIONS_21"), "PLAIN DOWN"]};
		[player,50,true,(getPosATL player)] spawn player_alertZombies;
		_brokenTool = false;
		_counter = 0;
		while {_isOk} do {
			if(isNull(_obj)) exitWith {
				_isOk = false;
				_proceed = false;
			};
			[1,1] call dayz_HungerThirst;
			player playActionNow "Medic";
			_dis=20;
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
			r_interrupt = false;
			_animState = animationState player;
			r_doLoop = true;
			_started = false;
			_finished = false;
			while {r_doLoop} do {
				_animState = animationState player;
				_isMedic = ["medic",_animState] call fnc_inString;
				if (_isMedic) then {_started = true};
				if (_started && !_isMedic) then {
					r_doLoop = false;
					_finished = true;
					_sfx = "repair";
					[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
				};
				if (r_interrupt) then {r_doLoop = false};
				sleep 0.1;

			};
			if(!_finished) exitWith {
				_isOk = false;
				_proceed = false;
			};
			if(_finished) then {
				_counter = _counter + 1;
				if((_isDestructable || _isRemovable) && !_isOwnerOfObj) then {
					if((random 10) <= 1) then {
						_brokenTool = true;
					};
				};
			};
			if(_brokenTool) exitWith {
				_isOk = false;
				_proceed = false;
			};
			cutText [format[(localize "str_epoch_player_163"), _nameVehicle, _counter,_limit], "PLAIN DOWN"];
			if(_counter == _limit) exitWith {
				_isOk = false;
				_proceed = true;
			};
		};
		if(_brokenTool) then {
			_removeTool = if(_isWreck) then [{_removeTool = "ItemToolbox"},{["ItemCrowbar","ItemToolbox"] call BIS_fnc_selectRandom}];
			if(([player,_removeTool,1] call BIS_fnc_invRemove) > 0) then {
				cutText [format[(localize "str_epoch_player_164"),getText(configFile >> "CfgWeapons" >> _removeTool >> "displayName"),_nameVehicle], "PLAIN DOWN"];
			};
		};
		if (_proceed) then {
			if (!isNull(_obj)) then {
				_ipos = getPosATL _obj;
				deleteVehicle _obj;
				if(!_isWreck) then {
					PVDZE_obj_Delete = [_objectID,_objectUID,_activatingPlayer];
					publicVariableServer "PVDZE_obj_Delete";
				};
				cutText [format[(localize "str_epoch_player_165"),_nameVehicle], "PLAIN DOWN"];
				_preventRefund = false;
				_selectedRemoveOutput = [];
				if(_isWreck) then {
					_refundpart = ["PartEngine","PartGeneric","PartFueltank","PartWheel","PartGlass","ItemJerrycan"] call BIS_fnc_selectRandom;
					_selectedRemoveOutput set [count _selectedRemoveOutput,[_refundpart,1]];
				} else {
					if(_isWreckBuilding) then {
						_selectedRemoveOutput = getArray (configFile >> "CfgVehicles" >> _objType >> "removeoutput");
					} else {
						_selectedRemoveOutput = getArray (configFile >> "CfgVehicles" >> _objType >> "removeoutput");
						_preventRefund = (_objectID == "0" && _objectUID == "0");
					};
				};
				if((count _selectedRemoveOutput) <= 0) then {cutText [(localize "str_epoch_player_90"), "PLAIN DOWN"]};
				if (_ipos sel 2 < 0) then {_ipos set [2,0]};
				_radius = 1;
				if (_isMine) then {
					if((random 10) >= 2) then {
						_gems = ["ItemObsidian","ItemSapphire","ItemEmerald","ItemRuby","ItemAmethyst","ItemTopaz","ItemCitrine","ItemSapphire","ItemEmerald","ItemRuby","ItemAmethyst","ItemTopaz","ItemCitrine","ItemEmerald","ItemRuby","ItemAmethyst","ItemTopaz","ItemCitrine","ItemRuby","ItemAmethyst","ItemTopaz","ItemCitrine","ItemAmethyst","ItemTopaz","ItemCitrine","ItemTopaz","ItemCitrine","ItemCitrine"];
						_gem = _gems sel (floor(random (count _gems)));
						_selectedRemoveOutput set [(count _selectedRemoveOutput),[_gem,1]];
					};
				};
				if((count _selectedRemoveOutput) > 0 && !_preventRefund) then {
					_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
					{
						_itemOut = _x sel 0;
						_countOut = _x sel 1;
						if (typeName _countOut == "ARRAY") then {
							_countOut = round((random (_countOut sel 1)) + (_countOut sel 0));
						};
						_item addMagazineCargoGlobal [_itemOut,_countOut];
					} count _selectedRemoveOutput;

					_item setposATL _iPos;

					player reveal _item;

					player action ["Gear", _item];
				};
			} else {
				cutText [(localize "str_epoch_player_91"), "PLAIN DOWN"];
			};
		} else {
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};
		};
		DZE_ActionInProgress = false;
		s_player_deleteBuild = -1;
	};
	onPreloadStarted 			"dayz_preloadFinished = false;";
	onPreloadFinished 			"dayz_preloadFinished = true;";
	player_hasTools =			xcm xlx "\z\addons\dayz_code\compile\fn_hasTools.sqf";
	player_removeItems =		xcm xlx "\z\addons\dayz_code\compile\fn_removeItems.sqf";
	player_traderCity = 		xcm xlx "\z\addons\dayz_code\compile\player_traderCity.sqf";
	PIDP_check = {
		private ["_charID","_array"];
		_array 	= toArray _this;
		_charID = "";
		if (count _array < 3) then [{diag_log ("PIDP_check: ERROR, player ID not passed.")},{_charID = toString[57,_array sel 9,_array sel 10,_array sel 11,_array sel 12,_array sel 13,_array sel 14,_array sel 15,_array sel 16]}];
		_charID;
	};
	[] swx {
		waitUntil {gpd player != ""};
		PIDP_playerUID = (gpd player) call PIDP_check;
	};
	a2s = {_info = _info + ("<t align='left'>"+_this+"</t><br/>")};
	GG_getTurretInfo = {
		private ["_result","_tw","_wep","_mags","_wepa"];
		_result = [];
		{
			_pos = [_x];
			_tw = _this weaponsTurret _pos;
			if (count _tw > 0) then {
				{
					_wep = _x;
					_mags = [];
					_wepa = configFile >> "CfgWeapons" >> _wep;
					{_mags = _mags + getArray ((if (_x == "this") then [{_wepa},{_wepa >> _x}]) >> "magazines")} foreach (getArray (_wepa >> "muzzles"));
					_result set [count _result,[_wep,_mags,_pos,getText (_wepa >> 'displayName')]];
				} forEach _tw;
			};
		} forEach [-1,0,1,3,4,5];
		_result;
	};
	GG_RATdo = {
		private ["_sel","_veh","_wep","_mag","_dis","_prc","_tur","_rlt","_crt","_magTyp","_turPos","_ctrl","_info","_money","_newBal","_msg"];
		if (count RAT_array < 1) exitWith {};
		_sel = RAT_array sel (_this sel 0);
		_veh = _sel sel 0;
		_wep = _sel sel 1;
		_mag = _sel sel 2;
		_dis = _sel sel 3;
		_prc = _sel sel 4;
		_tur = _sel sel 5;
		if (_prc <= 100) then {_prc = 10203};
		_rlt = "<t color='#FF3300'>";
		_crt = "</t>";
		_magTyp = (getText (configFile >> "CfgMagazines" >> _mag >> "displayName"));
		_turPos = (if (_tur sel 0 > -1) then [{"Gunner"+(str ((_tur sel 0) + 1))},{"Driver"}]);
		
		if ((_this sel 1) == "INFO") then {
			_ctrl = ((findDisplay 710420) displayCtrl 1100);
			_info = ("<t color='#FFB300'>Ammo information<br/>"+_crt);
			(_rlt+"Vehicle "+(typeOf _veh)+_crt) call a2s;
			(" -"+_rlt+"Weapon"+_crt+": "+_dis) call a2s;
			(" -"+_rlt+"Position"+_crt+": "+(_turPos)) call a2s;
			(" -"+_rlt+"Type"+_crt+":<br/>"+(_magTyp)+" ("+(_mag)+")") call a2s;
			(" -"+_rlt+"Price"+_crt+": <t color='#FFFF00'>"+(str _prc)+" "+GCoins+_crt) call a2s;
			
			_ctrl ctrlSetStructuredText parseText _info;
		} else {
			if ((_mag in ["14Rnd_FFAR","28Rnd_FFAR","38Rnd_FFAR"])&&(_mag in (_veh magazinesTurret _tur))&&(typeOf _veh in ["AH6J_EP1"])) then {
				_msg = "Max hydras reached for AH6J!";
				systemChat ("(GG-AH): "+str _msg+"");
				_msg call AH_fnc_dynTextMsg;
			} else {
				_money = player getVariable ["GGCoins",0];
				_newBal = (_money - _prc);
				if (_newBal >= 0) then {
					player setVariable ["GGCoins", _newBal, true];
					
					_msg = format["Bought %1 for %2 %3!",_magTyp,_prc,GCoins];
					_msg call AH_fnc_dynTextMsg;
					_veh addMagazineTurret [_mag,_tur];
				} else {
					_msg = "Not enough money to buy "+_magTyp+"! Need "+str(abs _newBal)+" more coins!";
					systemChat ("(GG-AH): "+str _msg+"");
					_msg call AH_fnc_dynTextMsg;
				};
			};
		};
	};
	RefuelUpdateCost = {private ["_ctrl","_val","_cost","_color","_fuelToBuyL"];_val = (_this sel 1) / 10;_fuel = fuel RefuelTargetVehicle;_fuelToBuyL = (((1 - _fuel) * _val) * (xgn(xcf >> "cfgVehicles" >> (typeOf RefuelTargetVehicle) >> "fuelCapacity")));_cost = if (RefuelTargetVehicle iko "AIR") then [{ceil(_fuelToBuyL * (DZE_gasprice / 4))},{ceil(_fuelToBuyL * DZE_gasprice)}];_info = fmt ["<t color='#FF3300'>Fuel cost</t>: <t color='%2'>%1</t> <img image='GG\GUI\hud\gold_p.paa' /><br/>%3 litres", [_cost] call BIS_fnc_numberText, (if (_cost > (player xgv["GGCoins",0])) then {"#ff0000"} else {"#00ff00"}), ceil(_fuelToBuyL)];((uiNamespace xgv "RefuelDialog") displayCtrl 4603) ctrlSetStructuredText parseText _info;};
	RefuelBuyFuel = {private ["_fuel","_slider","_capacity","_fuelDif","_cost","_playerWealth","_name"];_fuel 		= fuel RefuelTargetVehicle;_slider 	= (sliderPosition ((uiNamespace xgv "RefuelDialog") displayCtrl 4602) / 10);_capacity 	= xgn(xcf >> "cfgVehicles" >> (typeOf RefuelTargetVehicle) >> "fuelCapacity");_fuelDif 	= _capacity - (_fuel * _capacity);_cost 		= if (RefuelTargetVehicle iko "AIR") then [{ceil(((1 - _fuel) * _slider) * _capacity * (DZE_gasprice / 4))},{ceil(((1 - _fuel) * _slider) * _capacity * (DZE_gasprice))}];_name 		= getText(xcf >> "cfgVehicles" >> (typeOf RefuelTargetVehicle) >> "displayName");_playerWealth = player xgv["GGCoins",0];if (_cost > _playerWealth) exw {_msg = fmt ["Need %1 more %2!",_cost - _playerWealth,GCoins];systemChat ("(GG-AH): "+str _msg+"");_msg swx AH_fnc_dynTextMsg;};_msg = "Vehicle has been refueled for "+str _cost;systemChat ("(GG-AH): "+str _msg);_msg swx AH_fnc_dynTextMsg;player xsv["GGCoins",(_playerWealth - _cost),true];PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";PVDZE_send = [RefuelTargetVehicle,"SFuel",[RefuelTargetVehicle,((fuel RefuelTargetVehicle) + ((1 - _fuel) * _slider))]];publicVariableServer "PVDZE_send";};
	RepairVehicleCost = {private ["_prices","_vehicle","_hitpoints","_parts_cost","_parts_needed","_damage","_part","_armor","_cost"];_prices = ["PartGeneric", 10,"PartEngine", 20,"PartVRotor", 20,"PartFueltank", 150,"PartWheel", 20,"PartGlass", 10];_vehicle = _this;if (damage _vehicle == 0) exw {0};_hitpoints = switch (true) do {default {_vehicle call vehicle_getHitpoints};case ((_vehicle iko  "Car") && !(_vehicle iko  "Truck")): {["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitLFWheel","HitLBWheel","HitRFWheel","HitRBWheel","HitFuel","HitRGlass","HitLGlass","HitEngine"]};case (_vehicle iko  "Truck"): {["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitGlass7","HitGlass8","HitLFWheel","HitLBWheel","HitRFWheel","HitRBWheel","HitLMWheel","HitRMWheel","HitFuel","HitRGlass","HitLGlass","HitEngine"]};};_parts_cost = 0;_parts_needed = [];{private ["_damage", "_part"];_damage = [_vehicle,_x] call object_getHit;_part = switch (true) do {default {"PartGeneric"};case (["Engine",_x,false] call fnc_inString): 	{"PartEngine"};case (["HRotor",_x,false] call fnc_inString): 	{"PartVRotor"};case (["Fuel",_x,false] call fnc_inString): 	{"PartFueltank"};case (["Wheel",_x,false] call fnc_inString): 	{"PartWheel"};case (["Glass",_x,false] call fnc_inString): 	{"PartGlass"};};if (_damage > 0) then {_parts_needed set [count _parts_needed, _part];_parts_cost = _parts_cost + (_prices sel ((_prices find _part) + 1));_parts_needed set [count _parts_needed, (_prices sel ((_prices find _part) + 1))];};} forEach _hitpoints;_armor = xgn((xcf >> "cfgVehicles" >> (typeOf _vehicle)) >> "armor");_cost = if (_vehicle iko "Air") then [{ceil(_parts_cost + (damage _vehicle * (_armor * 100)))},{ceil(_parts_cost + (damage _vehicle * (_armor * 10)))}];_cost};
	RepairVehicle = {private ["_cost","_color","_playerWealth"];_cost = RefuelTargetVehicle call RepairVehicleCost;_playerWealth = player xgv["GGCoins",0];if (_cost > _playerWealth) exw {_msg = "You don't have enough money to do this.";systemChat ("(GG-AH): "+str _msg+"");_msg swx AH_fnc_dynTextMsg;};player xsv["GGCoins",(_playerWealth - _cost),true];PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";{private ["_damage", "_selection"];_damage = [RefuelTargetVehicle,_x] call object_getHit;if (_damage > 0) then {_selection = getText(xcf >> "cfgVehicles" >> (typeOf RefuelTargetVehicle) >> "HitPoints" >> _x >> "name");PVDZE_veh_SFix = [RefuelTargetVehicle,_selection,0];publicVariable "PVDZE_veh_SFix";if (local RefuelTargetVehicle) then {PVDZE_veh_SFix call object_setFixServer;};};} forEach (RefuelTargetVehicle call vehicle_getHitpoints);_msg = "Vehicle has been fully repaired!";systemChat ("(GG-AH): "+str _msg+"");_msg swx AH_fnc_dynTextMsg;RefuelTargetVehicle setDamage 0;};
	GG_cceff = {"filmGrain" ppEffectEnable true;_hndl = ppEffectCreate ["colorCorrections", 1501];_hndl ppEffectEnable true;if (( daytime < 18 )&&( daytime < 7)) then {_hndl ppEffectAdjust[1,1,0,[0,0.04,0,-0.01],[0,0,0,1.58],[-0.11,-0.11,-0.11,0]];_hndl ppEffectCommit 0;"filmGrain" ppEffectAdjust [0.01, 1, 1, 0.1, 1, true];"filmGrain" ppEffectCommit 0;};if (( daytime > 7 )&&( daytime < 18 )) then {_hndl ppEffectAdjust[1,1,0,[0,-0.12,0.05,0.03],[0,0,0,1.23],[-0.11,-0.11,-0.11,0]];_hndl ppEffectCommit 0;"filmGrain" ppEffectAdjust [0.0225, 1, 1, 0.1, 1, true];"filmGrain" ppEffectCommit 0;};if (( daytime > 18 )&&( daytime > 7 )) then {_hndl ppEffectAdjust[1,1,0,[0,0.04,0,-0.01],[0,0,0,1.58],[-0.11,-0.11,-0.11,0]];_hndl ppEffectCommit 0;"filmGrain" ppEffectAdjust [0.01, 1, 1, 0.1, 1, true];"filmGrain" ppEffectCommit 0;};};
	GG_DPP = {
		if !(isNil 'SZ_VEH') then {
			SZ_lastVehicle call GG_RVP;
			SZ_VEH = nil;
		} else {
			if (vehicle player != player) then {
				(vehicle player) reh "Fired";
				(vehicle player) reh "HandleDamage";
				(vehicle player) aeh ["HandleDamage",{_this call vehicle_handleDamage}];
				(vehicle player) allowDamage true;
			};
		};
		player removeEventHandler ["Fired", 	SafeZone_FIRED];
		player removeEventHandler ["Hit", 		SafeZone_HIT];
		player removeEventHandler ["Killed", 	SafeZone_KILLED];
		fnc_usec_unconscious 	= xcm preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
		if (preProcessFile "GG\Epoch\GG_PD.sqf" != "") then {
			player_death 		= xcm preprocessFileLineNumbers "GG\Epoch\GG_PD.sqf";
		} else {
			player_death 		= xcm preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_death.sqf";
		};
		player_zombieCheck 		= xcm preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler 	= xcm preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	};
	GG_PP = {
		_msg = "Infantry protection loaded.";
		systemChat ("(GG-AH): "+str _MSG);
		SafeZone_FIRED  = player aeh ["Fired",	{call GG_pfired}];
		SafeZone_HIT    = player aeh ["Hit",	{call GG_phit}];
		SafeZone_KILLED = player aeh ["Killed",	{call GG_pkill}];
		fnc_usec_unconscious 	= {};
		player_death 			= {};
		player_zombieCheck 		= {};
		fnc_usec_damageHandler 	= {};
	};
	GG_pfired = {
		nearestObject [(_this sel 0),(_this sel 4)] setPos[0,0,0];
		cutText ["You are not allowed to shoot in safezones","PLAIN"];
	};
	GG_pkill = {
		_killer = (_this sel 1);
		if ((izn _killer)||!(isPlayer _killer)||(name _killer in ["Error: No vehicle","Error: No unit"])||(_killer == player)) exw {};
		_nKill = name _killer;
		if (izn _killer) exw {};
		if (_nKill != name player) then {
			_locKILL = mapGridPosition (getPosATL _killer);
			_attker setDamage 1.337;
			_msg = ""+name player+" was killed by "+str _nKill+" in a safezone! The killer is @ "+str _locKILL+".";
			_sMSG = "SAFE-ZONE: "+str _msg+"";
			PVOZ_EPOCH_SAFEZONE = toArray _sMSG;
			publicVariableServer "PVOZ_EPOCH_SAFEZONE";
			_msg = "You were killed by "+str _nKill+"";
			systemChat ("(GG-AH): "+str _MSG);
		};
	};
	GG_phit = {
		_attker = (_this sel 1);
		if ((izn _attker)||!(isPlayer _attker)||(name _attker in ["Error: No vehicle","Error: No unit"])||(_attker == player)) exw {};
		_nAttkr = name _attker;
		if (_nAttkr != name player) then {
			_locATTK = mapGridPosition (getPosATL _attker);
			_attker setHit ["legs",1];
			_msg = ""+name player+" was shot by "+str _nAttkr+" in a safezone! The attacker is @ "+str _locATTK+".";
			_sMSG = "SAFE-ZONE: "+str _msg+"";
			PVOZ_EPOCH_SAFEZONE = toArray _sMSG;
			publicVariableServer "PVOZ_EPOCH_SAFEZONE";
			_msg = "You were shot by "+str _nAttkr+"";
			systemChat (str _msg);
		};
	};
	GG_ZSHIELD = {
		while {1 == 1} do {
			_zombies = ((getPosATL (vehicle player)) nearEntities ["zZombie_Base",50]);
			if (count _zombies > 0) then {{deletevehicle _x} forEach _zombies};
			sleep 1;
		};
	};
	GG_ANTITHEFT2 = {
		while {inSafeZone} do {
			waitUntil {((!izn (findDisplay 106))||(!inSafeZone))};
			_target = (cursorTarget);
			if !(izn _target) then {
				_temp_keys = [];
				_temp_keys_names = [];
				{
					if (configName(inheritsFrom(xcf >> "CfgWeapons" >> _x)) in ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"]) then {
						_ownerKeyId = xgn(xcf >> "CfgWeapons" >> _x >> "keyid");
						_ownerKeyName = getText(xcf >> "CfgWeapons" >> _x >> "displayName");
						_temp_keys_names set [_ownerKeyId,_ownerKeyName];
						_temp_keys set [count _temp_keys,str(_ownerKeyId)];
					};
				} forEach (items player);
				_ownerID = _target xgv ["CharacterID","0"];
				_hasKey = _ownerID in _temp_keys;
				_oldOwner = (_ownerID == dayz_playerUID);
				_isOk = false;
				{if (!_isOk) then {_isOk = _target iko _x}} forEach ["LandVehicle","Air", "Ship"];
				if (((vehicle player) distance _target) < 12) then {
					if ((_isOk)&&(!_hasKey)&&(!_oldOwner)) then {
						if (_hasKey) exw {};
						if (_oldOwner) exw {};
						_msg = "You do not own this vehicle!";
						systemChat ("(GG-AH): "+str _MSG);
						(findDisplay 106) closeDisplay 1;
					};
				};
				sleep 0.1;
			} else {sleep 1};
		};
	};
	GG_AVP = {
		SZ_lastVehicle reh "Fired";
		SZ_lastVehicle reh "HandleDamage";
		SZ_lastVehicle aeh ["Fired", {call GG_pfired}];
		SZ_lastVehicle aeh ["HandleDamage",{false}];
		SZ_lastVehicle allowDamage false;
	};
	GG_RVP = {
		SZ_lastVehicle reh "Fired";
		SZ_lastVehicle reh "HandleDamage";
		SZ_lastVehicle aeh ["HandleDamage",{_this call vehicle_handleDamage}];
		SZ_lastVehicle allowDamage true;
	};
	GG_VP = {
		if (isNil 'SZ_lastvehicle') then {SZ_lastVehicle = objNull};
		while {1 == 1} do {
			if ((vehicle player != player)&&(isNil 'SZ_VEH')) then {
				SZ_lastVehicle = (vehicle player);
				call GG_AVP;
				SZ_VEH = true;
			};
			if ((vehicle player != SZ_lastVehicle)&&!(isNil 'SZ_VEH')) then {
				call GG_RVP;
				SZ_VEH = nil;
			};
			sleep 1;
		};
	};
	GG_ANTIRUN = {
		waitUntil {uiSleep 1;
		(vehicle player != player)||(!inSafeZone)};
		if (!inSafeZone) exw {};
		_msg = "SAFE-ZONE: Vehicle protection loaded.";
		systemChat ("(GG-AH): "+str _MSG);
		while {1 == 1} do {
			waitUntil {((vehicle player != player)||(!inSafeZone))};
			if (!inSafeZone) exw {};
			if (driver (vehicle player) == player) then {
				_norun = {isPlayer _x} count (getPosATL (vehicle player) nearEntities [["Man"], 2]);
				if ((_norun > 0)&&(speed (vehicle player) > 5)) then {
					cutText ['Can not drive, '+(str _norun)+' players within 5m!','PLAIN'];
					(vehicle player) setVelocity [0,0,0];
					uiSleep 0.5;
				};
				sleep 0.1;
			} else {sleep 1};
		};
	};
	ANTI_THEFT = {
		BP_FIX = true;
		player xac ["GEAR",objNull];
		_msg = 'You can not access gear while too close to a player!';
		systemChat ("(GG-AH): "+str _MSG);
		sleep 1;
		_msg = 'You are only allowed to access your friends backpacks!';
		systemChat ("(GG-AH): "+str _MSG);
	};
	GG_ANTITHEFT = {
		BP_FIX = false;
		while {1 == 1} do {
			waitUntil {((izn (findDisplay 106))||(!inSafeZone))};
			if (!inSafeZone) exw {};
			if (vehicle player == player) then {
				_uncon = player xgv ["NORRN_unconscious", false];
				if ((_uncon)||(r_player_unconscious)) then {
					player xsv ["NORRN_unconscious", false, true];;
					player xsv ["USEC_isCardiac",false, true];
					player xsv["medForceUpdate",true];
					[objNull, player, rSwitchMove,''] call RE;
					disableUserInput false;
					r_player_unconscious = false;
					r_player_cardiac = false;
					r_player_handler1 = false;
				};
				_playerNear = (({isPlayer _x} count (nearestObjects [player, ['Man'],6])) > 1);
				if (_playerNear) then {
					if (izn (findDisplay 106)) then {if (BP_FIX) then {BP_FIX = false}} else {
						if !(izn cursorTarget) then {
							_puid 		= gpd player;
							_fuid 		= gpd cursorTarget;
							_playerID 	= player xgv ["CharacterID", "0"];
							_targetid 	= cursorTarget xgv ["CharacterID", "0"];
							_sFriends 	= player xgv ["friendlies", []];
							_pfls 		= player xgv ["AH_friendlist",[]];
							_tFriends 	= cursorTarget xgv ["friendlies", []];
							_ffls 		= cursorTarget xgv ["AH_friendlist",[]];
							
							_isOkay 	= ((cursorTarget iko "LandVehicle")||(cursorTarget iko "Ship")||(cursorTarget iko "Air")||(cursorTarget iko "WeaponHolder")||(!alive cursorTarget));
							_isFriend 	= (((_targetid in _sFriends)&&(_playerID in _tFriends))||((_fuid in _pfls)&&(_puid in _ffls)));
							_isNear 	= (cursorTarget distance player < 4);
							if (((_isOkay)||(_isFriend))&&(_isNear)) then {BP_FIX=true};
						};
						if (!BP_FIX) then ANTI_THEFT;
					};
				};
			} else {sleep 1};
		};
	};
	if (hasInterface) then {
		[] swx {
			waitUntil {(!isNil "GG_ANTIRUN")};
			if (isNil "inSafezone") then {inSafezone = false};
			while {1 == 1} do {
				waitUntil {uiSleep 1;(inSafeZone)};
				GG_szCHK = false;
				canbuild = false;
				SZ_SkTyp = typeOf player;
				SZ_timeEntered = time;
				_msg = "You have entered a safezone! griefing within safezones shall result in a ban! YOU HAVE BEEN WARNED!";
				systemChat ("(GG-AH): "+str _MSG);
				GG_thread1 = [] swx GG_ANTIRUN;
				GG_thread2 = [] swx GG_ZSHIELD;
				GG_thread3 = [] swx GG_ANTITHEFT;
				GG_thread4 = [] swx GG_ANTITHEFT2;
				GG_thread5 = [] swx GG_VP;
				["Safe Zone"] swx bis_fnc_infotext;
				call GG_PP;
				waitUntil {uiSleep 1;((!inSafeZone)||(typeOf player != SZ_SkTyp))};
				if (inSafeZone) then {
					if (typeOf player != SZ_SkTyp) then {
						[] swx {
							inSafeZone = false;
							_msg = "Skin change detected! Toggling safezone protection...";
							systemChat ("(GG-AH): "+str _MSG);
							waitUntil {GG_szCHK};
							inSafeZone = true;
						};
					};
				};
				waitUntil {uiSleep 1;(!inSafeZone)};
				systemChat ("SAFE-ZONE: You have left a safezone!");
				GG_szCHK = true;
				if ((floor(time - SZ_timeEntered) > 60)&&(typeOf player == SZ_SkTyp)) then {
					systemChat ("SAFE-ZONE: Safe-zone hit/kill protection will stay on for 20-30 seconds to prevent safezone snipers... TAKE COVER!");
					_time = time;
					_rtim = round(random 10);
					waitUntil {((inSafeZone)||((time - _time) > (20+_rtim)))};
				} else {if (typeOf player == SZ_SkTyp) then {systemChat ("SAFE-ZONE: You were only in the safezone for "+str floor(time - SZ_timeEntered)+" seconds!")}};
				canbuild = true;
				xtr GG_thread1;
				xtr GG_thread2;
				xtr GG_thread3;
				xtr GG_thread4;
				xtr GG_thread5;
				call GG_DPP;
				_msg = "";
				if (inSafeZone) then {_msg = "It appears you have re-entered a safezone. Reenabling protection..."} else {_msg = "Safe-zone hit/kill protection has been disabled!"};
				systemChat ("SAFE-ZONE: "+str _msg);
			};
		};
	};
	GGcam = {
		1 cutRsc ["default","PLAIN",0];
		3 cutRsc ["default","PLAIN",0];
		4 cutRsc ["default","PLAIN",0];
		playMusic "dayz_track_death_1";
		showCinemaBorder true;
		camUseNVG false;
		GG_CAM = "camera" camCreate [(getPosATL player sel 0), (getPosATL player sel 1),(getPosATL player sel 2)+1];
		GG_CAM cameraEffect ["internal","back"];
		GG_CAM camSetFOV 2;
		GG_CAM camSetTarget (vehicle player);
		GG_CAM camCommit 0;
		waitUntil{camCommitted GG_CAM};
		GG_CAM camSetTarget [(getPosATL player sel 0), (getPosATL player sel 1)+50,(getPosATL player sel 2)+50];
		GG_CAM camSetRelPos [50,50,0];
		GG_CAM camCommit 25;
		uiSleep 5;
		GG_CAM camSetRelPos [0,5,0];
		GG_CAM camCommit 20;
	};
	GGrespown = {
		player removeEventHandler ["FiredNear",eh_player_killed];
		player removeEventHandler ["HandleDamage",mydamage_eh1];
		player removeEventHandler ["Killed",mydamage_eh3];
		player removeEventHandler ["Fired",mydamage_eh2];
		666 cutText [format ["You survived %1 days, killed %2 zombies, %3 survivors, and %4 bandits...",dayz_Survived,(player getVariable ["zombieKills",0]),(player getVariable ["humanKills",0]),(player getVariable ["banditKills",0])],"PLAIN DOWN"];
		disableUserInput false;
		_humanity		= player getVariable ["humanity",0];
		_bankMoney 		= player getVariable ["GGBank",0];
		_friendlies		= player getVariable ["friendlies",[]];
		_tagList		= player getVariable ["tagList",[]];
		_friendlist 	= profileNamespace getVariable ['AH_friendlist',[]];
		1 cutRsc ['default','PLAIN',0];
		4 cutRsc ['default','PLAIN',0];
		((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl 1303) ctrlShow false;
		((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl 1203) ctrlShow false;
		_body = player;
		addSwitchableUnit dayz_originalPlayer;
		setPlayable dayz_originalPlayer;
		selectPlayer dayz_originalPlayer;
		player allowDamage false;
		_myGroup = group _body;
		[_body] joinSilent dayz_firstGroup;
		deleteGroup _myGroup;
		PVDZE_Server_Simulation = [_body, false];
		publicVariableServer "PVDZE_Server_Simulation";
		uiSleep 5;
		
		{if ((count (units _x)) == 0) then {deleteGroup _x}} forEach allGroups;
		0 cutText ["YOU ARE DEAD!","PLAIN"];
		uiSleep 10;
		
		r_handlercount 		= 0;
		r_player_blood 		= 12000;
		r_player_bloodTotal = r_player_blood;
		r_player_timeout 	= 0;
		dayz_myBackpackMags = [];
		dayz_myBackpackWpns = [];
		dayzPlayerLogin 	= [];
		dayzPlayerLogin2 	= [];
		loadout_loaded 		= nil;
		dayz_hasFire 		= objNull;
		dayz_myBackpack		= objNull;
		dayz_myCursorTarget = objNull;
		dayz_sourceBleeding = objNull;
		dayz_lastMeal 		= (time + 300);
		dayz_lastDrink 		= (time + 300);
		dayz_zombiesLocal 	= 0;
		dayz_Survived 		= 0;
		dayz_hunger 		= 0;
		dayz_temperatur 	= 40;
		dayz_thirst 		= 0;
		dayz_selectGender 	= "Survivor2_DZ";
		{call compile (_x+' = false')} forEach ["r_action","r_action_unload","r_doLoop","r_drag_sqf","r_fracture_arms","r_fracture_legs","r_interrupt","r_player_cardiac","r_player_dead","r_player_handler","r_player_handler1","r_player_infected","r_player_injured","r_player_inpain","r_player_loaded","r_player_lowblood","r_player_unconscious","r_self","DZE_InRadiationZone","dayz_unsaved","GG_respawn"];
		{player setVariable [_x sel 0,_x sel 1,_x sel 2]} forEach [["hit_arms",0,true],["hit_hands",0,true],["hit_legs",0,true],["NORRN_unconscious",false,true],["unconsciousTime",0,true],["USEC_BloodQty",r_player_blood,true],["USEC_injured",false,true],["USEC_inPain",false,true],["USEC_isCardiac",false,true],["USEC_lowBlood",false,true],["humanity",_humanity,true],["GGCoins",0,true],["GGBank",_bankMoney,true],["CharacterID",dayz_characterID,true],["friendlies",_friendlies,true],["USEC_isDead",false,true],["USEC_infected",false,true],["AH_friendlist",_friendlist,true]];
		{player removeMagazine _x} count (magazines player);
		removeAllWeapons player;
		"Survivor2_DZ" call player_switchModel;
		startLoadingScreen ["","RscDisplayLoadCustom"];
		GG_CAM cameraEffect ["terminate","back"];
		camDestroy GG_CAM;
		playMusic "";
		for "_x" from 5 to 1 step -1 do {
			((uiNameSpace getVariable "BIS_loadingScreen") displayctrl 8400) ctrlSetText ("Respawning in "+str _x);
			uiSleep 1;
		};
		1 cutRsc ["default","PLAIN",0];
		3 cutRsc ["default","PLAIN",0];
		4 cutRsc ["default","PLAIN",0];
		disableUserInput false;
		0 cutText ["","BLACK"];
		endLoadingScreen;
		
		diag_log ("(PLAYER_RESPAWN): Spawn select...");
		AH_fnc_selectedSpawn = [[],"Random",false];
		createDialog "AH_fnc_spawnSelect";
		call AH_fnc_spawnMenu;
		waitUntil{!dialog};
		if (!GG_respawn) exitWith {
			systemChat ("(GG-AH): You didn't sel respawn or disconnect!");
			for "_x" from 5 to 1 step -1 do {
				systemChat format ["Returning to lobby in %1 second(s)...", _x];
				uiSleep 1;
			};
			endMission 'END1';
		};
		
		diag_log ("(PLAYER_RESPAWN): Gender select...");
		createDialog "RscDisplayGenderSelect";
		waitUntil{!dialog};
		startLoadingScreen ["","RscDisplayLoadCustom"];
		
		diag_log ("(PLAYER_RESPAWN): Request new char...");
		((uiNameSpace getVariable "BIS_loadingScreen") displayctrl 8400) ctrlSetText "Waiting for character to create...";
		progressLoadingScreen 0.25;
		call compile preprocessFileLineNumbers "GG\v.sqf";
		_playerUID = getPlayerUID player;
		PVDZE_plr_Login = [_playerUID,player];
		publicVariableServer "PVDZE_plr_Login";
		
		diag_log ("(PLAYER_RESPAWN): Wait for dayzPlayerLogin...");
		waitUntil {count (dayzPlayerLogin) > 1};
		
		diag_log ("(PLAYER_RESPAWN): dayzPlayerLogin received!");
		((uiNameSpace getVariable "BIS_loadingScreen") displayctrl 8400) ctrlSetText "Sending login request...";
		progressLoadingScreen 0.5;
		_charid = dayzPlayerLogin sel 0;
		dayz_characterID = _charid;
		if (!isNil "DefaultPlayerSkin") then {dayz_selectGender=DefaultPlayerSkin};
		dayz_selectGender call player_switchModel;
		PVDZE_plr_Login2 = [_charid,player,_playerUID,AH_fnc_selectedSpawn];
		publicVariableServer "PVDZE_plr_Login2";
		
		diag_log ("(PLAYER_RESPAWN): Waiting for dayzPlayerLogin2...");
		waitUntil{count (dayzPlayerLogin2) > 0};
		
		diag_log ("(PLAYER_RESPAWN): dayzPlayerLogin2 received...");
		((uiNameSpace getVariable "BIS_loadingScreen") displayctrl 8400) ctrlSetText "Login complete! Please wait...";
		progressLoadingScreen 1;
		call dayz_resetSelfActions;
		_worldspace = dayzPlayerLogin2 sel 0;
		_setDir 	= _worldspace sel 0;
		_setPos 	= _worldspace sel 1;
		player setDir _setDir;
		player setPosATL _setPos;
		player addBackpack DefaultBackpack;
		 dayz_myBackpack = unitBackpack player;
		{
			if (isClass(configFile >> "CfgMagazines" >> _x)) then {player addMagazine _x};
			if (isClass(configFile >> "CfgWeapons" >> _x)) then {player addWeapon _x};
		} count (DefaultMagazines+DefaultWeapons);
		{
			if (isClass(configFile >> "CfgMagazines" >> _x)) then {dayz_myBackpack addMagazineCargoGlobal [_x,1]};
			if (isClass(configFile >> "CfgWeapons" >> _x)) then {dayz_myBackpack addWeaponCargoGlobal [_x,1]};
		} count DefaultBackpackItems;
		dayz_myWeapons 	= weapons player;
		dayz_myItems 	= items player;
		dayz_myMagazines = magazines player;
		dayz_myPosition = getPosATL player;
		3 cutRsc ["playerStatusGUI","PLAIN",0];
		((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl 1303) ctrlShow false;
		((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl 1203) ctrlShow false;
		call ui_changeDisplay;
		5 fadeSound 1;
		eh_player_killed = player addeventhandler ["FiredNear",{_this call player_weaponFiredNear}];
		[player] call fnc_usec_damageHandle;
		call compile format["PVDZE_player%1 = player;publicVariableServer 'PVDZE_player%1';",_playerUID];
		PVDZE_plr_LoginRecord = [_playerUID,_charid,0];
		publicVariableServer "PVDZE_plr_LoginRecord";
		dayz_unsaved = true;
		dayz_gui = [] spawn {
			private["_distance"];
			dayz_musicH = [] spawn player_music;
			_wasInVehicle = false;
			_thisVehicle = objNull;
			while {true} do {
				_array = player call world_surfaceNoise;
				dayz_surfaceNoise = _array sel 1;
				dayz_surfaceType = _array sel 0;
				call player_checkStealth;
				dayz_statusArray = [] call player_updateGui;
				_vehicle = vehicle player;
				if (_vehicle != player) then {
					_wasInVehicle = true;
					_thisVehicle = _vehicle;
				} else {
					if (_wasInVehicle) then {
						_wasInVehicle = false;
						_thisVehicle call player_antiWall;
					};
				};
				sleep 0.5;
			};
		};
		dayz_animalCheck = [] spawn player_spawn_1;
		dayz_slowCheck = [] spawn player_spawn_2;
		dayz_medicalH = [] execVM "\z\addons\dayz_code\medical\init_medical.sqf";
		player_death = compile preprocessFileLineNumbers "GG\Epoch\GG_PD.sqf";
		deathHandled = false;
		player addWeapon "Flare";
		player addWeapon "Loot";
		[objNull,player,rSwitchMove,''] call RE;
		'colorCorrections'ppEffectAdjust[1,1,0,[1,1,1,0.0],[1,1,1,1 min (4*r_player_blood/3/r_player_bloodTotal)],[1,1,1,0.0]];
		'colorCorrections'ppEffectCommit 0;
		'colorCorrections'ppEffectEnable true;
		'dynamicBlur'ppEffectAdjust[0];
		'dynamicBlur'ppEffectCommit 0;
		'dynamicBlur'ppEffectEnable false;
		call GG_cceff;
		if (!isNil 'dayzSetFogAH') then {0 setFog dayzSetFogAH};
		if (!isNil 'dayzSetDateAH') then {setDate dayzSetDateAH};
		if (!isNil 'dayzSetRainAH') then {0 setRain dayzSetRainAH};
		if (!isNil 'dayzSetOvercastAH') then {0 setOvercast dayzSetOvercastAH};
		{if ((count (units _x)) == 0) then {deleteGroup _x}} forEach allGroups;
		{player reveal _x} count (nearestObjects [player call AH_fnc_getPos,dayz_reveal,50]);
		{if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'type')) in [1,2,3]) then {player selectWeapon _x}} forEach (weapons player);
		3 cutRsc ["playerStatusGUI","PLAIN",0];
		0 cutText ["","BLACK IN"];
		call ui_changeDisplay;
		reload player;
		endLoadingScreen;
	};
	GG_maintainbase = {
		BM_getControl = {(findDisplay 7331) displayCtrl _this};
		baseManage_alphaSort = {
			if (count _this < 2) exitWith {aht_plrs = _this};
			private ['_array1', '_array2', '_tmp', '_itemSorted'];
			for '_inc' from 0 to (count _this - 2) do {
				for '_dec' from _inc to 0 step -1 do {
					_objStr1 	= name (_this sel _dec);
					_objStr2 	= name (_this sel _dec + 1);
					_array1 	= toArray(toLower(_objStr1));
					_array2 	= toArray(toLower(_objStr2));
					_itemSorted = false;
					for '_i' from 0 to (count _array1) do {
						if (_i >= count _array2 || {_array1 sel _i > _array2 sel _i}) exitWith {
							_tmp = _this sel _dec;
							_this set [_dec, _this sel _dec +1];
							_this set [_dec +1, _tmp]
						};
						if (_array1 sel _i < _array2 sel _i) exitWith {_itemSorted = true};
					};
					if (_itemSorted) exitWith {};
				};
			};
			aht_plrs = _this;
		};
		baseManage_fillLists = {
			_allPlayers = playableUnits;
			_ctrl = 1003 call BM_getControl;
			lbclear _ctrl;
			
			_allPlayers call baseManage_alphaSort;
			_playerList = aht_plrs;
			
			_cnt = 0;
			_friends = (player getVariable ['AH_friendlist',[]]);
			{
				if (((getPlayerUID _x call PIDP_check) in _friends)&&(_x != player)) then {
					_ctrl lbAdd format ["%1",name _x];
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0.6, 1, 0.6, 1]];
					_cnt = _cnt + 1;
				};
			} forEach _playerList;
			_ctrl ctrlSetFontHeight 0.025;
			
			_ctrl = 1006 call BM_getControl;
			_ctrl ctrlSetText format ["Friends: %1",_cnt];
			_ctrl ctrlSetTextColor [0,1,0,1];
			_ctrl ctrlSetFontHeight 0.03;
			_allPlayers = playableUnits;
			
			_allPlayers call baseManage_alphaSort;
			_playerList = aht_plrs;
			
			_ctrl = 1002 call BM_getControl;
			lbclear _ctrl;
			_cnt = 0;
			_friends = (player getVariable ['AH_friendlist',[]]);
			{
				if (!((getPlayerUID _x call PIDP_check) in _friends)&&(_x != player)) then {
					if ((isPlayer _x)&&(alive _x)) then {
						_cnt = _cnt + 1;
						_ctrl lbAdd format ["%1",name _x];
						_ctrl lbSetColor [(lbsize _ctrl)-1, [0.8, 0.8, 1, 1]];
					};
				};
			} forEach _playerList;
			_ctrl ctrlSetFontHeight 0.025;
			
			_ctrl = 1005 call BM_getControl;
			_ctrl ctrlSetText format ["Players: %1",_cnt];
			_ctrl ctrlSetTextColor [0.5,0.5,1,1];
			_ctrl ctrlSetFontHeight 0.03;
		};
		baseManage_countBuildables = {
			_objects_filtered = [];
			{if (damage _x >= 0.1) then {_objects_filtered set [count _objects_filtered, _x]}} forEach (nearestObjects [player, DZE_maintainClasses, DZE_maintainRange]);
			_count = count _objects_filtered;
			baseManage_requirements = [[GCoins,(50 * _count)]];
			
			if (_require sel 1 == 0) then {
				_txt = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><t align='center' color='#44FF00' size='1' font='EtelkaMonospaceProBold'>Your base is fully maintained!</t>";
				_ctrl = 1007 call BM_getControl;
				lbclear _ctrl;
				_ctrl ctrlSetStructuredText parseText _txt;
				_ctrl ctrlSetTextColor [1,1,0.5,1];
				_ctrl ctrlSetFontHeight 0.03;
				_maint = 1008 call BM_getControl;
				_maint ctrlEnable false;
			} else {
				if (getPlayerUID player in GG_freemaintarra) then {baseManage_requirements = [["Thanks for donating!","Free"]]};
				_txtstart = "<t align='center' color='#FFFFFF' size='2'>";
				_txtfinal = "</t>";
				_textleft = "<t color='#cc3333'>";
				_txtright = "</t>";
				_txt = "<t align='center' color='#ff524a' size='1.5' font='EtelkaMonospaceProBold'>Base maintenance</t><br/>";
				_txt = _txt + _txtstart;
				_pic = "GG\GUI\hud\gold_p.paa";
				_txt = _txt + format ["<br/>%2Objects%3: <br/>%1<br/><br/>",_count,_textleft,_txtright];
				_txt = _txt + format ["%2Cost%3: <br/>%1<br/>",_require sel 1,_textleft,_txtright];
				_txt = _txt + format ["<img size='3' image='%1'/>",_pic];
				_txt = _txt + format ["<t size='0.8'><br/>%1</t><br/>",_require sel 0];
				_txt = _txt + _txtfinal;
				_ctrl = 1007 call BM_getControl;
				lbclear _ctrl;
				_ctrl ctrlSetStructuredText parseText _txt;
				_ctrl ctrlSetTextColor [1,1,0.5,1];
				_ctrl ctrlSetFontHeight 0.03;
			};
		};
		baseManage_addFriend = {
			_allPlayers = playableUnits;
			if (player getVariable['combattimeout', 0] >= time) exitWith {
				_msg = format ['Friend request from %1 blocked because you are in combat.',name _caller];
				systemChat ('(GG-AH): '+str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			_name = _this sel 0;
			if (_name == "") exitWith {};
			if (_name == name player) exitWith {
				_msg = "You can not add yourself!";
				systemChat ('(GG-AH): '+str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			SEL_TARGET = objNull;
			_isCF = false;
			_friendList = profileNameSpace getVariable ["AH_friendlist",[]];
			{
				if (name _x == _name) then {
					SEL_TARGET = _x;
					if ((getPlayerUID _x call PIDP_check) in _friendList) exitWith {
						_isCF = true;
					};
				};
			} foreach _allPlayers;
			if (isNull SEL_TARGET) exitWith {
				_msg = format ['Could not find %1.',_name];
				systemChat ('(GG-AH): ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			if (_isCF) exitWith {
				_msg = format ['%1 is already your friend.',name SEL_TARGET];
				systemChat ('(GG-AH): ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			_msg = format ['Sending friend request to %1.',name SEL_TARGET];
			systemChat ('(GG-AH): ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			PVOZ_FL_handle = [SEL_TARGET,player,'request'];
			publicVariableServer 'PVOZ_FL_handle';
			_tt = time;
			waitUntil {((getPlayerUID SEL_TARGET call PIDP_check) in (player getVariable ["AH_friendlist",[]]))};
			uiSleep 1;
			if ((getPlayerUID SEL_TARGET call PIDP_check) in (player getVariable ["AH_friendlist",[]])) then {
				call baseManage_fillLists;
			} else {
				_msg = "Player did not accept your friend request in time!";
				systemChat ("(GG-AH): "+str _msg+"");
			};
		};
		baseManage_delFriend = {
			_allPlayers = playableUnits;
			_name = _this sel 0;
			if (_name == "") exitWith {};
			if (_name == name player) exitWith {
				_msg = "You can not delete yourself!";
				systemChat ('(GG-AH): '+str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			_foundFriend = false;
			SEL_TARGET = objNull;
			_friendList = profileNameSpace getVariable ["AH_friendlist",[]];
			{
				if (name _x == _name) then {
					SEL_TARGET = _x;
					if ((getPlayerUID SEL_TARGET call PIDP_check) in _friendList) exitWith {_foundFriend = true};
				};
			} forEach _allPlayers;
			if (isNull SEL_TARGET) exitWith {
				_msg = format ['Could not find %1.',_name];
				systemChat ('(GG-AH): ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			if (_foundFriend) then {
				_friendList = profileNameSpace getVariable ["AH_friendlist",[]];
				
				_friendList = _friendList - [(getPlayerUID SEL_TARGET call PIDP_check)];
				player setVariable ['AH_friendlist',_friendList,true];
				profileNamespace setVariable ['AH_friendlist',_friendList];
				saveProfileNamespace;
				
				_targetList = SEL_TARGET getvariable ["AH_friendlist",[]];
				
				_targetList = _targetList - [(getPlayerUID player call PIDP_check)];
				SEL_TARGET setVariable ['AH_friendlist',_targetList,true];
				
				_msg = format ['%1 has been removed from your friendlist.',name SEL_TARGET];
				systemChat ('(GG-AH): ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
				call baseManage_fillLists;
			} else {
				_msg = format ['Could not find %1!',_name];
				systemChat ('(GG-AH): ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
		};
		disableSerialization;
		createDialog "RscPlotMenu";
		waitUntil {!(isNull (findDisplay 7331))};
		call baseManage_countBuildables;
		call baseManage_fillLists;
	};
	AH_fnc_spawnSelected = {
		disableSerialization;
		
		_sp = AH_fnc_spawnpoints sel _this;
		ctrlSetText [38501,format["Selected spawn: %1",_sp sel 1]];
		if (_sp sel 1 == "Random") then {
			AH_fnc_selectedSpawn = (AH_fnc_spawnpoints sel (round(random (count AH_fnc_spawnpoints - 1))));
			[((findDisplay 38500) displayCtrl 38502),1,0.5,[7110,7782,0]] call AH_fnc_setMapPos;
		} else {
			[((findDisplay 38500) displayCtrl 38502),1,0.1,_sp sel 0] call AH_fnc_setMapPos;
		};
		
		AH_fnc_selectedSpawn = _sp;
	};
	AH_fnc_setMapPos = {
		disableSerialization;
		_ctrl 	= _this sel 0;
		_time 	= _this sel 1;
		_zoom 	= _this sel 2;
		_pos 	= _this sel 3;

		if ((isNull _ctrl)||(count _pos == 0)) exitWith {};

		_ctrl ctrlMapAnimAdd [_time,_zoom,_pos];
		ctrlMapAnimCommit _ctrl;
	};
	GG_getPlayerCargo = {
		GG_plyrmags = magazines player;
		GG_plyrweps = weapons player;
	};
	GG_getBackpackCargo = {
		private ["_backpack","_mags","_weps","_megs","_waps"];
		_backpack = (unitBackpack player);
		if (isNull _backpack) exitWith {
			GG_bpmags = [];
			GG_bpweps = [];
			GG_bpobj = objNull;
		};
		_mags = getMagazineCargo (unitBackpack player);
		_weps = getWeaponCargo (unitBackpack player);
		_megs = [];
		_waps = [];
		{for "_i" from 1 to ((_mags sel 1) sel _forEachIndex) do {_megs set [count _megs,_x]}} forEach (_mags sel 0);
		{for "_i" from 1 to ((_weps sel 1) sel _forEachIndex) do {_waps set [count _waps,_x]}} forEach (_weps sel 0);
		GG_bpmags = _megs;
		GG_bpweps = _waps;
		GG_bpobj = (unitBackpack player);
	};
	GG_getVehicleCargo = {
		private ["_vehicle","_mags","_weps","_megs","_waps"];
		_temp_keys = [];
		_temp_keys_names = [];
		{
			if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"]) then {
				_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
				_ownerKeyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
				_temp_keys_names set [_ownerKeyId,_ownerKeyName];
				_temp_keys set [count _temp_keys,str(_ownerKeyId)];
			};
		} forEach (items player);
		
		_vehicle = objNull;
		{
			_ownerID = _x getVariable ["CharacterID","0"];
			if ((alive _x) && ((count(crew _x)) < 1) && (_ownerID in _temp_keys)) then {_vehicle = _x}
		} forEach (nearestObjects [(getPosATL player), ["LandVehicle","Air","Ship"], 80]);
		
		if (isNull _vehicle) exitWith {
			GG_vehmags = [];
			GG_vehweps = [];
			GG_vehobj = objNull;
		};
		_megs = [];
		_waps = [];
		_mags = getMagazineCargo _vehicle;
		_weps = getWeaponCargo _vehicle;
		{for "_i" from 1 to ((_mags sel 1) sel _forEachIndex) do {_megs set [count _megs,_x]}} forEach (_mags sel 0);
		{for "_i" from 1 to ((_weps sel 1) sel _forEachIndex) do {_waps set [count _waps,_x]}} forEach (_weps sel 0);
		GG_vehmags = _megs;
		GG_vehweps = _waps;
		GG_vehobj = _vehicle;
	};
	GG_removeFromCargo = {
		private ["_obj","_item","_qty","_typ","_ocm1","_ocm2","_ocw1","_ocw2","_cnt","_num"];
		_obj 	= _this sel 0;
		_item 	= _this sel 1;
		_qty 	= _this sel 2;
		_typ 	= _this sel 3;
		_ocm1 	= (getMagazineCargo _obj) sel 0;
		_ocm2 	= (getMagazineCargo _obj) sel 1;
		_ocw1 	= (getWeaponCargo _obj) sel 0;
		_ocw2 	= (getWeaponCargo _obj) sel 1;
		if (_item in (_ocm1+_ocw1)) then {
			clearWeaponCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			
			_cnt = 0;
			switch (_typ) do {
				case "mag": {
					{
						if (_x == _item) then {
							_quantity = ((_ocm2 sel _forEachIndex) - _qty);
							if (_quantity < 1) then {
								_ocm1 set [_forEachIndex,objNull];
								_ocm2 set [_forEachIndex,objNull];
							} else {_ocm2 set [_forEachIndex,_quantity]};
						};
					} forEach _ocm1;
					_ocm1 = _ocm1 - [objNull];
					_ocm2 = _ocm2 - [objNull];
				};
				case "wep": {
					{
						if (_x == _item) then {
							_quantity = ((_ocw2 sel _forEachIndex) - _qty);
							if (_quantity < 1) then {
								_ocw1 set [_forEachIndex,objNull];
								_ocw2 set [_forEachIndex,objNull];
							} else {_ocw2 set [_forEachIndex,_quantity]};
						};
					} forEach _ocw1;
					_ocw1 = _ocw1 - [objNull];
					_ocw2 = _ocw2 - [objNull];
				};
			};
			
			_num = 0;
			{_obj addMagazineCargoGlobal [_x,_ocm2 sel _num];_num = _num + 1;} forEach _ocm1;
			_num = 0;
			{_obj addWeaponCargoGlobal [_x,_ocw2 sel _num];_num = _num + 1;} forEach _ocw1;
		} else {
			GG_failed = true;
			systemChat ("ERROR: Could not find "+str _item+" inside of "+typeOf _obj+"!!!");
		};
	};
	GG_addToCargo = {
		private ["_obj","_item","_qty","_typ","_ocm1","_ocm2","_ocw1","_ocw2","_ocb1","_ocb2","_cnt","_indx","_num"];
		_obj 	= _this sel 0;
		_item 	= _this sel 1;
		_qty 	= _this sel 2;
		_typ 	= _this sel 3;
		_ocm1 	= (getMagazineCargo _obj) sel 0;
		_ocm2 	= (getMagazineCargo _obj) sel 1;
		_ocw1 	= (getWeaponCargo _obj) sel 0;
		_ocw2 	= (getWeaponCargo _obj) sel 1;
		
		clearWeaponCargoGlobal _obj;
		clearMagazineCargoGlobal _obj;
		
		_cnt = 0;
		switch (_typ) do {
			case "mag": {
				if (_item in _ocm1) then {
					_indx = _ocm1 find _item;
					_ocm2 set [_indx,((_ocm2 sel _indx) + _qty)];
				} else {
					_ocm1 set [count _ocm1,_item];
					_ocm2 set [count _ocm2,_qty];
				};
			};
			case "wep": {
				if (_item in _ocw1) then {
					_indx = _ocm1 find _item;
					_ocw2 set [_indx,((_ocw2 sel _indx) + _qty)];
				} else {
					_ocw1 set [count _ocw1,_item];
					_ocw2 set [count _ocw2,_qty];
				};
			};
		};
		_num = 0;
		{_obj addMagazineCargoGlobal [_x,_ocm2 sel _num];_num = _num + 1;} forEach _ocm1;
		_num = 0;
		{_obj addWeaponCargoGlobal [_x,_ocw2 sel _num];_num = _num + 1;} forEach _ocw1;
	};
	GG_countReqWepSlots = {
		private "_req";
		_req = 1;
		if (isClass (configFile >> 'CfgWeapons' >> _this)) then {
			if ((getNumber (configFile >> "CfgWeapons" >> _this >> "type")) in [0,1,4]) then {_req = 10};
			if ((getNumber (configFile >> "CfgWeapons" >> _this >> "type")) in [2,16]) then {_req = 5};
		};
		_req
	};
	GG_checkFreeSlotsBP = {
		private ["_books","_title","_author","_obj","_ocm1","_ocm2","_ocw1","_ocw2","_totalis","_qty"];
		_obj = _this;
		_ocm1 	= (getMagazineCargo _obj) sel 0;
		_ocm2 	= (getMagazineCargo _obj) sel 1;
		_ocw1 	= (getWeaponCargo _obj) sel 0;
		_ocw2 	= (getWeaponCargo _obj) sel 1;
		_totalis = 0;
		
		{_totalis = _totalis + _x} forEach _ocm2;
		{
			_qty = _x * ((_ocw1 sel _forEachIndex) call GG_countReqWepSlots);
			_totalis = _totalis + _qty;
		} forEach _ocw2;
		[((getNumber (configFile >> "cfgVehicles" >> typeOf _obj >> "transportMaxMagazines")) - _totalis)]
	};
	GG_checkFreeSlotsVEH = {
		private ["_obj","_ocm1","_ocm2","_ocw1","_ocw2","_ocb1","_ocb2","_totalmags","_totalweps","_totalbaks","_magslotsfree","_wepslotsfree","_bakslotsfree"];
		_obj = _this;
		_ocm1 	= (getMagazineCargo _obj) sel 0;
		_ocm2 	= (getMagazineCargo _obj) sel 1;
		_ocw1 	= (getWeaponCargo _obj) sel 0;
		_ocw2 	= (getWeaponCargo _obj) sel 1;
		_ocb1	= (getBackpackCargo _obj) sel 0;
		_ocb2	= (getBackpackCargo _obj) sel 1;
		_totalmags = 0;
		_totalweps = 0;
		_totalbaks = 0;
		_magslotsfree = getNumber (configFile >> "cfgVehicles" >> typeOf _obj >> "transportMaxMagazines");
		_wepslotsfree = getNumber (configFile >> "cfgVehicles" >> typeOf _obj >> "transportMaxWeapons");
		_bakslotsfree = getNumber (configFile >> "cfgVehicles" >> typeOf _obj >> "transportMaxBackpacks");
		
		{_totalmags = _totalmags + _x} forEach _ocm2;
		{_totalweps = _totalweps + _x} forEach _ocw2;
		{_totalbaks = _totalbaks + _x} forEach _ocb2;
		[(_magslotsfree - _totalmags),(_wepslotsfree - _totalweps),(_bakslotsfree - _totalbaks)]
	};
	fnc_usec_selfActions = {
		private ["_isWreckBuilding","_temp_keys","_magazinesPlayer","_isPZombie","_vehicle","_inVehicle","_hasFuelE","_hasRawMeat","_hasKnife","_hasToolbox","_onLadder","_nearLight","_canPickLight","_canDo","_text","_isHarvested","_isVehicle","_isVehicletype","_isMan","_traderType","_ownerID","_isAnimal","_isDog","_isZombie","_isDestructable","_isTent","_isFuel","_isAlive","_Unlock","_lock","_buy","_dogHandle","_lieDown","_warn","_hastinitem","_allowedDistance","_menu","_menu1","_humanity_logic","_low_high","_cancel","_metals_trader","_traderMenu","_isWreck","_isRemovable","_isDisallowRepair","_rawmeat","_humanity","_speed","_dog","_hasbottleitem","_isAir","_isShip","_playersNear","_findNearestGens","_findNearestGen","_IsNearRunningGen","_cursorTarget","_isnewstorage","_itemsPlayer","_ownerKeyId","_typeOfCursorTarget","_hasKey","_oldOwner","_combi","_key_colors","_player_deleteBuild","_player_flipveh","_player_lockUnlock_crtl","_player_butcher","_player_studybody","_player_cook","_player_boil","_hasFuelBarrelE","_hasHotwireKit","_player_SurrenderedGear","_isSurrendered","_isModular","_isModularDoor","_ownerKeyName","_temp_keys_names","_hasAttached","_allowTow","_liftHeli","_found","_posL","_posC","_height","_liftHelis","_attached"];
		if (DZE_ActionInProgress) exw {};
		_vehicle = vehicle player;
		_isPZombie = player iko "PZombie_VB";
		_inVehicle = (_vehicle != player);
		_onLadder = (xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1;
		_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder);
		_nearLight = nearestObject [player,"LitObject"];
		_canPickLight = false;
		if (!izn _nearLight) then {
			if (_nearLight distance player < 4) then {
				_canPickLight = izn (_nearLight xgv ["owner",objNull]);
			};
		};
		if (_canPickLight && !dayz_hasLight && !_isPZombie) then {
			if (s_player_grabflare < 0) then {
				_text = getText (xcf >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
				s_player_grabflare = player xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "str_actions_medical_15",_text]], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
				s_player_removeflare = player xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "str_actions_medical_17",_text]], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
			};
		} else {
			player rac s_player_grabflare;
			player rac s_player_removeflare;
			s_player_grabflare = -1;
			s_player_removeflare = -1;
		};
		if (DZE_HeliLift) then {
			_hasAttached = _vehicle xgv["hasAttached",false];
			if (_inVehicle && (_vehicle iko "Air") && (((_vehicle call AH_fnc_getPos) sel 2) < 30) && (speed _vehicle < 5) && (typeName _hasAttached == "OBJECT")) then {
				if (s_player_heli_detach < 0) then {
					dayz_myLiftVehicle = _vehicle;
					s_player_heli_detach = dayz_myLiftVehicle xaa ["<t color='#dddddd'>Detach Vehicle</t>","\z\addons\dayz_code\actions\player_heliDetach.sqf",[dayz_myLiftVehicle,_hasAttached],2,false,true,"",""];
				};
			} else {
				dayz_myLiftVehicle rac s_player_heli_detach;
				s_player_heli_detach = -1;
			};
		};
		if (_isPZombie) then {
			if (s_player_callzombies < 0) then {
				s_player_callzombies = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_RAISEHORDE"], "\z\addons\dayz_code\actions\call_zombies.sqf",player, 5, true, false, "",""];
			};
			if (DZE_PZATTACK) then {
				call pz_attack;
				DZE_PZATTACK = false;
			};
			if (s_player_pzombiesvision < 0) then {
				s_player_pzombiesvision = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_NIGHTVIS"], "\z\addons\dayz_code\actions\pzombie\pz_vision.sqf", [], 4, false, true, "nightVision", "_this == _target"];
			};
			if (!izn cursorTarget && (player distance cursorTarget < 3)) then {
				_isAnimal = cursorTarget iko "Animal";
				_isZombie = cursorTarget iko "zZombie_base";
				_isHarvested = cursorTarget xgv["meatHarvested",false];
				_isMan = cursorTarget iko "Man";
				if (!alive cursorTarget && (_isAnimal || _isMan) && !_isZombie && !_isHarvested) then {
					if (s_player_pzombiesfeed < 0) then {
						s_player_pzombiesfeed = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_FEED"], "\z\addons\dayz_code\actions\pzombie\pz_feed.sqf",cursorTarget, 3, true, false, "",""];
					};
				} else {
					player rac s_player_pzombiesfeed;
					s_player_pzombiesfeed = -1;
				};
			} else {
				player rac s_player_pzombiesfeed;
				s_player_pzombiesfeed = -1;
			};
		};
		_allowedDistance = 4;
		_isAir = cursorTarget iko "Air";
		_isShip = cursorTarget iko "Ship";
		if (_isAir || _isShip) then {_allowedDistance = 8};
		if (!izn cursorTarget && !_inVehicle && !_isPZombie && (player distance cursorTarget < _allowedDistance) && _canDo) then {
			_cursorTarget = cursorTarget;
			_typeOfCursorTarget = typeOf _cursorTarget;
			_isVehicle = _cursorTarget iko "AllVehicles";
			_isVehicletype = _typeOfCursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
			_isnewstorage = _typeOfCursorTarget in DZE_isNewStorage;
			_magazinesPlayer = magazines player;
			_hasbottleitem = "ItemWaterbottle" in _magazinesPlayer;
			_hastinitem = false;
			{
				if (_x in _magazinesPlayer) then {
					_hastinitem = true;
				};
			} forEach boil_tin_cans;
			_hasFuelE = 	"ItemJerrycanEmpty" in _magazinesPlayer;
			_hasFuelBarrelE = 	"ItemFuelBarrelEmpty" in _magazinesPlayer;
			_hasHotwireKit = 	"ItemHotwireKit" in _magazinesPlayer;
			_itemsPlayer = items player;
			_temp_keys = [];
			_temp_keys_names = [];
			_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
			{
				if (configName(inheritsFrom(xcf >> "CfgWeapons" >> _x)) in _key_colors) then {
					_ownerKeyId = xgn(xcf >> "CfgWeapons" >> _x >> "keyid");
					_ownerKeyName = getText(xcf >> "CfgWeapons" >> _x >> "displayName");
					_temp_keys_names set [_ownerKeyId,_ownerKeyName];
					_temp_keys set [count _temp_keys,str(_ownerKeyId)];
				};
			} forEach _itemsPlayer;
			_hasKnife = "ItemKnife" in _itemsPlayer;
			_hasToolbox = "ItemToolbox" in _itemsPlayer;
			_isMan = _cursorTarget iko "Man";
			_traderType = _typeOfCursorTarget;
			_ownerID = _cursorTarget xgv ["CharacterID","0"];
			_isAnimal = _cursorTarget iko "Animal";
			_isDog =  (_cursorTarget iko "DZ_Pastor" || _cursorTarget iko "DZ_Fin");
			_isZombie = _cursorTarget iko "zZombie_base";
			_isDestructable = _cursorTarget iko "BuiltItems";
			_isWreck = _typeOfCursorTarget in DZE_isWreck;
			_isWreckBuilding = _typeOfCursorTarget in DZE_isWreckBuilding;
			_isModular = _cursorTarget iko "ModularItems";
			_isModularDoor = _typeOfCursorTarget in ["Land_DZE_WoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_GarageWoodDoor","CinderWallDoor_DZ","CinderWallDoorSmall_DZ"];
			_isRemovable = _typeOfCursorTarget in DZE_isRemovable;
			_isGarage = (_typeOfCursorTarget == "Land_MBG_Garage_Single_C");
			_isDisallowRepair = _typeOfCursorTarget in ["M240Nest_DZ"];
			_isTent = _cursorTarget iko "TentStorage";
			_isAlive = alive _cursorTarget;
			_text = getText (xcf >> "CfgVehicles" >> _typeOfCursorTarget >> "displayName");
			_rawmeat = meatraw;
			_hasRawMeat = false;
			{
				if (_x in _magazinesPlayer) then {
					_hasRawMeat = true;
				};
			} forEach _rawmeat;
			_isFuel = false;
			if (_hasFuelE || _hasFuelBarrelE) then {
				{
					if (_cursorTarget iko _x) exw {_isFuel = true};
				} forEach dayz_fuelsources;
			};
			_player_flipveh = false;
			_player_deleteBuild = false;
			_player_lockUnlock_crtl = false;
			if (_canDo && (speed player <= 1) && (_cursorTarget iko "Plastic_Pole_EP1_DZ")) then {
				if (s_player_maintain_area < 0) then {
					s_player_maintain_area = player xaa ["<t color='#FFE700'>Manage base</t>", "GG\Epoch\GG_PPM.sqf", "", 5, false];
					s_player_maintain_area_preview = player xaa ["<t color='#ff0000'>Toggle plot arrows</t>", "GG\Epoch\GG_MA.sqf", "preview", 5, false];
				};
			} else {
				player rac s_player_maintain_area;
				s_player_maintain_area = -1;
				player rac s_player_maintain_area_preview;
				s_player_maintain_area_preview = -1;
			};
			if (_isAlive) then {
				if (_isDestructable || _isWreck || _isRemovable || _isWreckBuilding) then {
					if (_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {
						if (DZE_takePlot) then {
							_player_deleteBuild = true;
						} else {
							if (_cursorTarget iko "Plastic_Pole_EP1_DZ") then {
								if ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID)) then [{_player_deleteBuild = true},{_player_deleteBuild = false}];
							} else {_player_deleteBuild = true};
						};
					};
				};
				if ((_isModular || _isModularDoor || _isGarage) && ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID))) then {
					if (_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {
						_player_deleteBuild = true;
					};
				};
				if (_isVehicle) then {
					if (!(canmove _cursorTarget) && (player distance _cursorTarget >= 2) && (count (crew _cursorTarget))== 0 && ((vectorUp _cursorTarget) sel 2) < 0.5) then {
						_playersNear = {isPlayer _x} count (player nearEntities ["CAManBase", 6]);
						if (_isVehicletype || (_playersNear >= 2)) then {
							_player_flipveh = true;
						};
					};
					if (!_isMan && _ownerID != "0" && !(_cursorTarget iko "Bicycle")) then {
						_player_lockUnlock_crtl = true;
					};
				};
			};
			if (_player_deleteBuild) then {
				if (s_player_deleteBuild < 0) then {
					s_player_deleteBuild = player xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "str_actions_delete",_text]], "GG\Epoch\GG_removeObj.sqf",_cursorTarget, 1, true, true, "", ""];
				};
			} else {
				player rac s_player_deleteBuild;
				s_player_deleteBuild = -1;
			};
			if (DZE_HeliLift) then {
				_liftHeli = objNull;
				_found = false;
				_allowTow = false;
				if ((count (crew _cursorTarget)) == 0) then {
					{
						if (!_allowTow) then {
							_allowTow = _cursorTarget iko _x;
						};
					} forEach DZE_HeliAllowToTow;
				};
				if (_allowTow) then {
					_liftHelis = nearestObjects [player, DZE_HeliAllowTowFrom, 15];
					{
						if (!_found) then {
							_posL = getPosATL _x;
							_posC = getPosATL _cursorTarget;
							_height = (_posL sel 2) - (_posC sel 2);
							_hasAttached = _x xgv["hasAttached",false];
							if (_height < 15 && _height > 5 && (typeName _hasAttached != "OBJECT")) then {
								if (((abs((_posL sel 0) - (_posC sel 0))) < 10) && ((abs((_posL sel 1) - (_posC sel 1))) < 10)) then {
									_liftHeli = _x;
									_found = true;
								};
							};
						};
					} forEach _liftHelis;
				};
				_attached = _cursorTarget xgv["attached",false];
				if (_found && _allowTow && _canDo && !locked _cursorTarget && !_isPZombie && (typeName _attached != "OBJECT")) then {
					if (s_player_heli_lift < 0) then {
						s_player_heli_lift = player xaa ["<t color='#dddddd'>Attach to Heli</t>", "\z\addons\dayz_code\actions\player_heliLift.sqf",[_liftHeli,_cursorTarget], -10, false, true, "",""];
					};
				} else {
					player rac s_player_heli_lift;
					s_player_heli_lift = -1;
				};
			};
			if (_player_lockUnlock_crtl) then {
				if (s_player_lockUnlock_crtl < 0) then {
					_hasKey = _ownerID in _temp_keys;
					_oldOwner = ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID));
					if (locked _cursorTarget) then {
						if (_hasKey || _oldOwner) then {
							_Unlock = player xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_UNLOCK",_text]], "\z\addons\dayz_code\actions\unlock_veh.sqf",[_cursorTarget,(_temp_keys_names sel (parseNumber _ownerID))], 2, true, true, "", ""];
							s_player_lockunlock set [count s_player_lockunlock,_Unlock];
							s_player_lockUnlock_crtl = 1;
						} else {
							if (_hasHotwireKit) then {
								if !(inSafeZone) then {
									_Unlock = player xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_HOTWIRE",_text]], "\z\addons\dayz_code\actions\hotwire_veh.sqf",_cursorTarget, 2, true, true, "", ""];
								};
							} else {
								_Unlock = player xaa [fmt ["<t color='#ff0000'>%1</t>",lzl "STR_EPOCH_ACTIONS_VEHLOCKED"], "",_cursorTarget, 2, true, true, "", ""];
							};
							s_player_lockunlock set [count s_player_lockunlock,_Unlock];
							s_player_lockUnlock_crtl = 1;
						};
					} else {
						if (_hasKey || _oldOwner) then {
							_lock = player xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_LOCK",_text]], "\z\addons\dayz_code\actions\lock_veh.sqf",_cursorTarget, 1, true, true, "", ""];
							s_player_lockunlock set [count s_player_lockunlock,_lock];
							s_player_lockUnlock_crtl = 1;
						};
					};
				};
			} else {
				{player rac _x} forEach s_player_lockunlock;s_player_lockunlock = [];
				s_player_lockUnlock_crtl = -1;
			};
			if (DZE_AllowForceSave) then {
				if ((_isVehicle || _isTent) && !_isMan) then {
					if (s_player_forceSave < 0) then {
						s_player_forceSave = player xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "str_actions_save",_text]], "\z\addons\dayz_code\actions\forcesave.sqf",_cursorTarget, 1, true, true, "", ""];
					};
				} else {
					player rac s_player_forceSave;
					s_player_forceSave = -1;
				};
			};
			if (DZE_AllowCargoCheck) then {
				if ((_isVehicle || _isTent || _isnewstorage) && _isAlive && !_isMan && !locked _cursorTarget) then {
					if (s_player_checkGear < 0) then {
						s_player_checkGear = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_CARGO"], "\z\addons\dayz_code\actions\cargocheck.sqf",_cursorTarget, 1, true, true, "", ""];
					};
				} else {
					player rac s_player_checkGear;
					s_player_checkGear = -1;
				};
			};
			if (_player_flipveh) then {
				if (s_player_flipveh  < 0) then {
					s_player_flipveh = player xaa [fmt [lzl "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",_cursorTarget, 1, true, true, "", ""];
				};
			} else {
				player rac s_player_flipveh;
				s_player_flipveh = -1;
			};
			if ((_hasFuelE || _hasFuelBarrelE) && _isFuel) then {
				if (s_player_fillfuel < 0) then {
					s_player_fillfuel = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_self_10"], "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
				};
			} else {
				player rac s_player_fillfuel;
				s_player_fillfuel = -1;
			};
			_player_butcher = false;
			_player_studybody = false;
			_player_SurrenderedGear = false;
			if (!_isAlive) then {
				if ((_isAnimal || _isZombie) && _hasKnife) then {
					_isHarvested = _cursorTarget xgv["meatHarvested",false];
					if (!_isHarvested) then {
						_player_butcher = true;
					};
				};
				if (_isMan && !_isZombie && !_isAnimal) then {
					_player_studybody = true;
				}
			} else {
				if (_isMan && !_isZombie && !_isAnimal) then {
					_isSurrendered = _cursorTarget xgv ["DZE_Surrendered",false];
					if (_isSurrendered) then {
						_player_SurrenderedGear = true;
					};
				};
			};
			if (_player_butcher) then {
				if (s_player_butcher < 0) then {
					if (_isZombie) then {
						s_player_butcher = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_GUTZOM"], "\z\addons\dayz_code\actions\gather_zparts.sqf",_cursorTarget, 0, true, true, "", ""];
					} else {
						s_player_butcher = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_self_04"], "\z\addons\dayz_code\actions\gather_meat.sqf",_cursorTarget, 3, true, true, "", ""];
					};
				};
			} else {
				player rac s_player_butcher;
				s_player_butcher = -1;
			};
			if (_player_studybody) then {
				if (s_player_studybody < 0) then {
					s_player_studybody = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_action_studybody"], "\z\addons\dayz_code\actions\study_body.sqf",_cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_player_studybody;
				s_player_studybody = -1;
			};
			_isUncon = _cursorTarget xgv ["NORRN_unconscious", false];
			if ((_player_studybody)||(_isUncon)) then {
				if (s_player_teabag < 0) then {
					_name = _cursorTarget xgv ["bodyName","body"];
					s_player_teabag = player xaa ["<t color='#dddddd'>Teabag "+str _name+"</t>", "GG\Epoch\GG_TB.sqf",_cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_player_teabag;
				s_player_teabag = -1;
			};
			_bodymoney = -1;
			_bodymoney = _cursorTarget xgv["GGCoins",-1];
			if ((_player_studybody)&&(_bodymoney > 0)) then {
				if (s_player_checkWallet < 0) then {
					s_player_checkWallet = player xaa [fmt  [("<t color=""#FFE700"">"+("Take %1 %2") + "</t>"),_bodymoney call BIS_fnc_numberText, GCoins], "GG\Epoch\Trader\check_wallet.sqf",_cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_player_checkWallet;
				s_player_checkWallet = -1;
			};
			if (_player_studybody) then {
				if (s_clothes < 0) then {
					s_clothes = player xaa ["<t color='#dddddd'>Take Clothes</t>", "GG\Epoch\GG_TC.sqf",cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_clothes;
				s_clothes = -1;
			};
			
			private ["_garageowner","_garagefriends","_garageallowed","_friend"];
			_garageowner = _cursorTarget getVariable ["CharacterID","0"];
			_friend = _cursorTarget getVariable ["GarageFriends",[]];
			_garagefriends = [];
			{_garagefriends set [count _garagefriends,(_x sel 0)]} count _friend;
			_garageallowed = [_garageowner] + _garagefriends;
			if ((_typeOfCursorTarget == "Land_MBG_Garage_Single_C") && (speed player <= 1) && _canDo) then {
				if (s_player_garage < 0) then {
					if (PIDP_playerUID in _garageallowed) then {
						s_player_garage =  player addAction ["<t color='#FFAA00'>Garage Menu</t>", "GG\Garage\player_virtualgarage.sqf", _cursorTarget, 2, false];
					} else {
						s_player_garage = player addAction ["<t color='#FF0000'>Garage Locked</t>", "",_cursorTarget, 2, true, true, "", ""];   
					};
				};
			} else {
				player removeAction s_player_garage;
				s_player_garage = -1;       
			};
			
			if !(izn cursorTarget) then {
				_HEdistance = cursorTarget distance (vehicle player);
				_isDeployed = cursorTarget xgv ["Deployed",false];
				if ((_HEdistance < 5)&&(_isDeployed)) then {
					if (s_player_packOBJ < 0) then {
						s_player_packOBJ = player xaa [("<t color=""#00FF04"">" + ("Pack "+typeOf cursorTarget+"") +"</t>"),"GG\Epoch\GG_PV.sqf",cursorTarget,6,false,true,"", ""];
					};
				};
			} else {
				player rac s_player_packOBJ;
				s_player_packOBJ = -1;
			};
			if (cursorTarget iko "Land_Water_Pipe_ep1") then {
				_dObj = cursorTarget;
				if (s_player_hookahHit < 0) then {
					s_player_hookahHit = player xaa ["<t color='#009000'>Take a hit</t>","GG\Epoch\GG_HOOKAH.sqf",cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_player_hookahHit;
				s_player_hookahHit = -1;
			};
			_player_cook = false;
			_player_boil = false;
			if (inflamed _cursorTarget) then {
				if (_hasRawMeat) then {
					_player_cook = true;
				};
				if (_hasbottleitem && _hastinitem) then {
					_player_boil = true;
				};
			};
			if (_player_SurrenderedGear) then {
				if (s_player_SurrenderedGear < 0) then {
					s_player_SurrenderedGear = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTION_GEAR"], "\z\addons\dayz_code\actions\surrender_gear.sqf",_cursorTarget, 1, true, true, "", ""];
				};
			} else {
				player rac s_player_SurrenderedGear;
				s_player_SurrenderedGear = -1;
			};
			if (_player_cook) then {
				if (s_player_cook < 0) then {
					s_player_cook = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_self_05"], "\z\addons\dayz_code\actions\cook.sqf",_cursorTarget, 3, true, true, "", ""];
				};
			} else {
				player rac s_player_cook;
				s_player_cook = -1;
			};
			if (_player_boil) then {
				if (s_player_boil < 0) then {
					s_player_boil = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_boilwater"], "\z\addons\dayz_code\actions\boil.sqf",_cursorTarget, 3, true, true, "", ""];
				};
			} else {
				player rac s_player_boil;
				s_player_boil = -1;
			};
			if (_cursorTarget == dayz_hasFire) then {
				if ((s_player_fireout < 0) && !(inflamed _cursorTarget) && (player distance _cursorTarget < 3)) then {
					s_player_fireout = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_self_06"], "\z\addons\dayz_code\actions\fire_pack.sqf",_cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_player_fireout;
				s_player_fireout = -1;
			};
			if (_isTent && (player distance _cursorTarget < 3)) then {
				if ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID)) then {
					if (s_player_packtent < 0) then {
						s_player_packtent = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_self_07"], "\z\addons\dayz_code\actions\tent_pack.sqf",_cursorTarget, 0, false, true, "",""];
					};
				} else {
					if (("ItemJerrycan" in _magazinesPlayer) && ("ItemMatchbox_DZE" in weapons player)) then {
						if (s_player_packtent < 0) then {
							s_player_packtent = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_DESTROYTENT"], "GG\Epoch\GG_removeObj.sqf",_cursorTarget, 1, true, true, "", ""];
						};
					};
				};
			} else {
				player rac s_player_packtent;
				s_player_packtent = -1;
			};
			if ((_typeOfCursorTarget in DZE_LockableStorage) && _ownerID != "0" && (player distance _cursorTarget < 3)) then {
				if (s_player_unlockvault < 0) then {
					if (_typeOfCursorTarget in DZE_LockedStorage) then {
						if (_ownerID == dayz_combination || ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID))) then {
							_combi = player xaa [fmt ["<t color='#dddddd'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_OPEN",_text]], "\z\addons\dayz_code\actions\vault_unlock.sqf",_cursorTarget, 0, false, true, "",""];
							s_player_combi set [count s_player_combi,_combi];
						} else {
							_combi = player xaa [fmt ["<t color='#dddddd'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_UNLOCK",_text]], "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
							s_player_combi set [count s_player_combi,_combi];
						};
						s_player_unlockvault = 1;
					} else {
						if (_ownerID != dayz_combination && _ownerID != dayz_playerUID) then {
							_combi = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_RECOMBO"], "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
							s_player_combi set [count s_player_combi,_combi];
							s_player_unlockvault = 1;
						};
					};
				};
			} else {
				{player rac _x} forEach s_player_combi;s_player_combi = [];
				s_player_unlockvault = -1;
			};
			if ((_isDestructable || _cursorTarget iko "Land_DZE_WoodDoorLocked_Base" || _cursorTarget iko "CinderWallDoorLocked_DZ_Base") && (DZE_Lock_Door == _ownerID)) then {
				if ((s_player_lastTarget sel 4) != _cursorTarget) then {
					if (s_player_door_ckc > 0) then {
						player rac s_player_door_ckc;
						s_player_door_ckc = -1;
					};
				};
				if (s_player_door_ckc < 0) then {
					s_player_lastTarget set [4,_cursorTarget];
					s_player_door_ckc = player xaa [("<t color=""#999FFF"">Set new code</t>"), "GG\DoorLock\ckc_startUI.sqf","",0,false,true,"", ""];
				};
			} else {
				player rac s_player_door_ckc;
				s_player_door_ckc = -1;
			};
			_unlockedVault = ["VaultStorage"];
			if (typeOf(cursortarget) in _unlockedVault && _ownerID != "0" && (player distance _cursorTarget < 2)) then {
				if (s_player_vault_ckc < 0) then {
					if ((typeOf(cursortarget) == "VaultStorage") &&(_ownerID == dayz_combination || _ownerID == dayz_playerUID)  ) then {
						s_player_vault_ckc = player xaa [("<t color=""#999FFF"">Set new code</t>"), "GG\DoorLock\ckc_startSafeUI.sqf",_cursorTarget,1,false,true,"", ""];
					};
				};
			} else {
				player rac s_player_vault_ckc;
				s_player_vault_ckc = -1;
			};
			// Start money system scripts
			// ======================================================================================================================
			if (_typeOfCursorTarget in DZE_UnLockedStorage && _ownerID != "0" && (player distance _cursorTarget < 3)) then {
				if (s_player_lockvault < 0) then {
					if (_ownerID == dayz_combination || ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID))) then {
						s_player_lockvault = player xaa [fmt  ["<t color='#dddddd'>%1</t>",(fmt [lzl "STR_EPOCH_ACTIONS_LOCK",_text])], "\z\addons\dayz_code\actions\vault_lock.sqf",_cursorTarget, 0, false, true, "",""];
					};
				};
				_playerNear = _cursorTarget call dze_isnearest_player;
				if (s_player_packvault < 0 && (!_playerNear)  && (_ownerID == dayz_combination || ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID)))) then {
					s_player_packvault = player xaa [fmt  ["<t color='#ff0000'>%1</t>",(fmt [lzl "STR_EPOCH_ACTIONS_PACK",_text])], "\z\addons\dayz_code\actions\vault_pack.sqf",_cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_player_packvault;
				s_player_packvault = -1;
				player rac s_player_lockvault;
				s_player_lockvault = -1;
				player rac s_bank_dialog;
				s_bank_dialog = -1;
			};
			if (_typeOfCursorTarget in DZE_ATM  and (player distance _cursorTarget < 3)) then {
				if (s_bank_dialog2 < 0) then {
					s_bank_dialog2 = player xaa [fmt  [("<t color=""#00F000"">"+("Bank ATM") + "</t>")], "GG\Epoch\Trader\bank_dialog.sqf",_cursorTarget, 3, true, true, "", ""];
				};
			} else {
				player rac s_bank_dialog2;
				s_bank_dialog2 = -1;
			};
			if (_typeOfCursorTarget in DZE_Bank_Trader and (player distance _cursorTarget < 3)) then {
				if (s_bank_dialog3 < 0) then {
					s_bank_dialog3 = player xaa [fmt  [("<t color=""#00F000"">"+("Manage account") + "</t>")], "GG\Epoch\Trader\bank_dialog.sqf",_cursorTarget, 3, true, true, "", ""];
				};
			} else {
				player rac s_bank_dialog3;
				s_bank_dialog3 = -1;
			};
			if (isNil "SmeltingInProgress") then {SmeltingInProgress = false};
			if ((_typeOfCursorTarget in DZE_rnr_trader)&&(player distance _cursorTarget < 3)) then {
				if (s_player_autorefuel < 0) then {
					s_player_autorefuel = player xaa [fmt  [("<t color=""#00F000"">"+("Refuel and repair vehicle") + "</t>")], "GG\Epoch\GG_RNR.sqf",_cursorTarget, 3, true, true, "", ""];
				};
			} else {
				player rac s_player_autorefuel;
				s_player_autorefuel = -1;
			};
			if (_isMan and _isAlive and !_isPZombie and isPlayer _cursorTarget) then {
				if (s_givemoney_dialog < 0) then {
					s_givemoney_dialog = player xaa [fmt  [("<t color=""#00F000"">Give coins to %1</t>"), (name _cursorTarget)], "GG\Epoch\Trader\give_player_dialog.sqf",_cursorTarget, 3, true, true, "", ""];
				};
			} else {
				player rac s_givemoney_dialog;
				s_givemoney_dialog = -1;
			};
			// End money system scripts
			// ======================================================================================================================
			if (_typeOfCursorTarget == "Info_Board_EP1") then {
				if (s_player_information < 0) then {
					s_player_information = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_MURDERS"], "\z\addons\dayz_code\actions\list_playerDeaths.sqf",[], 7, false, true, "",""];
				};
			} else {
				player rac s_player_information;
				s_player_information = -1;
			};
			if (_typeOfCursorTarget in dayz_fuelpumparray) then {
				if (s_player_fuelauto < 0) then {
					// check if Generator_DZ is running within 30 meters
					_findNearestGens = nearestObjects [player, ["Generator_DZ"], 30];
					_findNearestGen = [];
					{
						if (alive _x && (_x xgv ["GeneratorRunning", false])) then {
							_findNearestGen set [(count _findNearestGen),_x];
						};
					} foreach _findNearestGens;
					_IsNearRunningGen = count (_findNearestGen);
					// show that pump needs power if no generator nearby.
					if (_IsNearRunningGen > 0) then {
						s_player_fuelauto = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_FILLVEH"], "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",objNull, 0, false, true, "",""];
					} else {
						s_player_fuelauto = player xaa [fmt ["<t color='#ff0000'>%1</t>",lzl "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
					};
				};
			} else {
				player rac s_player_fuelauto;
				s_player_fuelauto = -1;
			};
			if (_typeOfCursorTarget in DZE_fueltruckarray && alive _cursorTarget) then {
				if (s_player_fuelauto2 < 0) then {
					if (isEngineOn _cursorTarget) then {
						s_player_fuelauto2 = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_FILLVEH"], "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",_cursorTarget, 0, false, true, "",""];
					} else {
						s_player_fuelauto2 = player xaa [fmt ["<t color='#ff0000'>%1</t>",lzl "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
					};
				};
			} else {
				player rac s_player_fuelauto2;
				s_player_fuelauto2 = -1;
			};
			if ((_cursorTarget iko "ModularItems") || (_cursorTarget iko "Land_DZE_WoodDoor_Base") || (_cursorTarget iko "CinderWallDoor_DZ_Base")) then {
				if ((s_player_lastTarget sel 0) != _cursorTarget) then {
					if (s_player_upgrade_build > 0) then {
						player rac s_player_upgrade_build;
						s_player_upgrade_build = -1;
					};
				};
				if (s_player_upgrade_build < 0) then {
					s_player_lastTarget set [0,_cursorTarget];
					s_player_upgrade_build = player xaa [fmt ["<t color='#FF0000'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_UPGRADE",_text]], "GG\Epoch\GG_upgradeObj.sqf",_cursorTarget, -1, false, true, "",""];
				};
			} else {
				player rac s_player_upgrade_build;
				s_player_upgrade_build = -1;
			};
			if ((_isDestructable || _cursorTarget iko "Land_DZE_WoodDoorLocked_Base" || _cursorTarget iko "CinderWallDoorLocked_DZ_Base") && (DZE_Lock_Door == _ownerID)) then {
				if ((s_player_lastTarget sel 1) != _cursorTarget) then {
					if (s_player_downgrade_build > 0) then {
						player rac s_player_downgrade_build;
						s_player_downgrade_build = -1;
					};
				};
				if (s_player_downgrade_build < 0) then {
					s_player_lastTarget set [1,_cursorTarget];
					s_player_downgrade_build = player xaa [fmt ["<t color='#FF0000'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_REMLOCK",_text]], "GG\Epoch\GG_downgradeObj.sqf",_cursorTarget, -2, false, true, "",""];
				};
			} else {
				player rac s_player_downgrade_build;
				s_player_downgrade_build = -1;
			};
			if ((_cursorTarget iko "ModularItems" || _cursorTarget iko "DZE_Housebase" || _typeOfCursorTarget == "LightPole_DZ") && (damage _cursorTarget >= DZE_DamageBeforeMaint)) then {
				if ((s_player_lastTarget sel 2) != _cursorTarget) then {
					if (s_player_maint_build > 0) then {
						player rac s_player_maint_build;
						s_player_maint_build = -1;
					};
				};
				if (s_player_maint_build < 0) then {
					s_player_lastTarget set [2,_cursorTarget];
					s_player_maint_build = player xaa [fmt ["<t color='#00F000'>%1</t>",fmt [lzl "STR_EPOCH_ACTIONS_MAINTAIN",_text]], "GG\Epoch\GG_MB.sqf",_cursorTarget, -2, false, true, "",""];
				};
			} else {
				player rac s_player_maint_build;
				s_player_maint_build = -1;
			};
			if (gpd player in GG_modbremarra) then {
				_isModItem 		= _cursorTarget iko "ModularItems";
				_isHouseBase 	= _cursorTarget iko "DZE_Housebase";
				if ((_isModItem)||(_isHouseBase)) then {
					if ((s_player_lastTarget sel 3) != _cursorTarget) then {
						if (s_player_remove_build > 0) then {
							player rac s_player_remove_build;
							s_player_remove_build = -1;
						};
					};
					_ownerID = _cursorTarget xgv["CharacterID","0"];
					if ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID)) then {
						if (s_player_remove_build < 0) then {
							s_player_lastTarget set [3,_cursorTarget];
							s_player_remove_build = player xaa ["<t color='#FF0000'>Remove "+str _typeOfCursorTarget+"</t>", "GG\Epoch\GG_MBR.sqf",_cursorTarget, -2, false, true, "",""];
						};
					};
				} else {
					player rac s_player_remove_build;
					s_player_remove_build = -1;
				};
			};
			if (_cursorTarget iko "Generator_DZ") then {
				if (s_player_fillgen < 0) then {
					if ((_cursorTarget xgv ["GeneratorRunning", false])) then {
						s_player_fillgen = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_GENERATOR1"], "\z\addons\dayz_code\actions\stopGenerator.sqf",_cursorTarget, 0, false, true, "",""];
					} else {
						if ((_cursorTarget xgv ["GeneratorFilled", false])) then {
							s_player_fillgen = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_GENERATOR2"], "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
						} else {
							if ("ItemJerrycan" in _magazinesPlayer) then {
								s_player_fillgen = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_ACTIONS_GENERATOR3"], "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
							};
						};
					};
				};
			} else {
				player rac s_player_fillgen;
				s_player_fillgen = -1;
			};
			if (_isTent && ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID))) then {
				if ((s_player_sleep < 0) && (player distance _cursorTarget < 3)) then {
					s_player_sleep = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_self_sleep"], "\z\addons\dayz_code\actions\player_sleep.sqf",_cursorTarget, 0, false, true, "",""];
				};
			} else {
				player rac s_player_sleep;
				s_player_sleep = -1;
			};
			if ((dayz_myCursorTarget != _cursorTarget) && _isVehicle && !_isMan && _hasToolbox && (damage _cursorTarget < 1) && !_isDisallowRepair && !locked _cursorTarget) then {
				if (s_player_repair_crtl < 0) then {
					dayz_myCursorTarget = _cursorTarget;
					_menu = dayz_myCursorTarget xaa [fmt ["<t color='#3cff00'>%1</t>",lzl "STR_EPOCH_PLAYER_REPAIRV"], "GG\Epoch\GG_RVE.sqf",_cursorTarget, 0, true, false, "",""];
					s_player_repairActions set [count s_player_repairActions,_menu];
					if !(inSafeZone) then {
						_menu1 = dayz_myCursorTarget xaa [fmt ["<t color='#3cff00'>%1</t>",lzl "STR_EPOCH_PLAYER_SALVAGEV"], "GG\Epoch\GG_SVE.sqf",_cursorTarget, 0, true, false, "",""];
						s_player_repairActions set [count s_player_repairActions,_menu1];
					};
					s_player_repair_crtl = 1;
				} else {
					{dayz_myCursorTarget rac _x} forEach s_player_repairActions;s_player_repairActions = [];
					s_player_repair_crtl = -1;
				};
			};
			if (_isMan && !_isPZombie && _traderType in serverTraders) then {
				if (s_player_parts_crtl < 0) then {
					_humanity = player xgv ["humanity",0];
					_traderMenu = xcc fmt ["menu_%1;",_traderType];
					_low_high = "low";
					_humanity_logic = false;
					if ((_traderMenu sel 2) == "friendly") then {
						_humanity_logic = (_humanity < -5000);
					};
					if ((_traderMenu sel 2) == "hostile") then {
						_low_high = "high";
						_humanity_logic = (_humanity > -5000);
					};
					if ((_traderMenu sel 2) == "hero") then {
						_humanity_logic = (_humanity < 5000);
					};
					if (_humanity_logic) then {
						_cancel = player xaa [fmt [lzl "STR_EPOCH_ACTIONS_HUMANITY",_low_high], "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
						s_player_parts set [count s_player_parts,_cancel];
					} else {
						{
							_buy = player xaa [fmt ["Trade %1 %2 for %3 %4",(_x sel 3),(_x sel 5),(_x sel 2),(_x sel 6)], "\z\addons\dayz_code\actions\trade_items_wo_db.sqf",[(_x sel 0),(_x sel 1),(_x sel 2),(_x sel 3),(_x sel 4),(_x sel 5),(_x sel 6)], (_x sel 7), true, true, "",""];
							s_player_parts set [count s_player_parts,_buy];
						} forEach (_traderMenu sel 1);
						_buy = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_289"], "GG\Epoch\Trader\show_dialog.sqf",(_traderMenu sel 0), 99, true, false, "",""];
						s_player_parts set [count s_player_parts,_buy];
						_metals_trader = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_301"], "\z\addons\dayz_code\actions\trade_metals.sqf",["na"], 0, true, false, "",""];
						s_player_parts set [count s_player_parts,_metals_trader];
					};
					s_player_parts_crtl = 1;
				};
			} else {
				{player rac _x} forEach s_player_parts;s_player_parts = [];
				s_player_parts_crtl = -1;
			};
			if (dayz_tameDogs) then {
				if (_isDog && _isAlive && (_hasRawMeat) && _ownerID == "0" && player xgv ["dogID", 0] == 0) then {
					if (s_player_tamedog < 0) then {
						s_player_tamedog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_tamedog"], "\z\addons\dayz_code\actions\tame_dog.sqf", _cursorTarget, 1, false, true, "", ""];
					};
				} else {
					player rac s_player_tamedog;
					s_player_tamedog = -1;
				};
				if (_isDog && ((_ownerID == PIDP_playerUID)||(dayz_characterID == _ownerID)) && _isAlive) then {
					_dogHandle = player xgv ["dogID", 0];
					if (s_player_feeddog < 0 && _hasRawMeat) then {
						s_player_feeddog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_feeddog"],"\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,0], 0, false, true,"",""];
					};
					if (s_player_waterdog < 0 && "ItemWaterbottle" in _magazinesPlayer) then {
						s_player_waterdog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_waterdog"],"\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,1], 0, false, true,"",""];
					};
					if (s_player_staydog < 0) then {
						_lieDown = _dogHandle getFSMVariable "_actionLieDown";
						if (_lieDown) then {_text = "str_actions_liedog"} else {_text = "str_actions_sitdog"};
						s_player_staydog = player xaa [lzl _text,"\z\addons\dayz_code\actions\dog\stay.sqf", _dogHandle, 5, false, true,"",""];
					};
					if (s_player_trackdog < 0) then {
						s_player_trackdog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_trackdog"],"\z\addons\dayz_code\actions\dog\track.sqf", _dogHandle, 4, false, true,"",""];
					};
					if (s_player_barkdog < 0) then {
						s_player_barkdog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_barkdog"],"\z\addons\dayz_code\actions\dog\speak.sqf", _cursorTarget, 3, false, true,"",""];
					};
					if (s_player_warndog < 0) then {
						_warn = _dogHandle getFSMVariable "_watchDog";
						if (_warn) then {_text = (lzl "str_epoch_player_247"); _warn = false} else {_text = (lzl "str_epoch_player_248"); _warn = true};
						s_player_warndog = player xaa [fmt [lzl "str_actions_warndog",_text],"\z\addons\dayz_code\actions\dog\warn.sqf",[_dogHandle, _warn], 2, false, true,"",""];
					};
					if (s_player_followdog < 0) then {
						s_player_followdog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_followdog"],"\z\addons\dayz_code\actions\dog\follow.sqf",[_dogHandle,true], 6, false, true,"",""];
					};
				} else {
					player rac s_player_feeddog;
					s_player_feeddog = -1;
					player rac s_player_waterdog;
					s_player_waterdog = -1;
					player rac s_player_staydog;
					s_player_staydog = -1;
					player rac s_player_trackdog;
					s_player_trackdog = -1;
					player rac s_player_barkdog;
					s_player_barkdog = -1;
					player rac s_player_warndog;
					s_player_warndog = -1;
					player rac s_player_followdog;
					s_player_followdog = -1;
				};
			};
		} else {
			{dayz_myCursorTarget rac _x} forEach s_player_repairActions;s_player_repairActions = [];
			{player rac _x} forEach s_player_combi;s_player_combi = [];
			{player rac _x} forEach s_player_parts;s_player_parts = [];
			{player rac _x} forEach s_player_lockunlock;s_player_lockunlock = [];
			dayz_myCursorTarget = objNull;
			s_player_lastTarget = [objNull,objNull,objNull,objNull,objNull];
			s_player_repair_crtl = -1;
			s_player_parts_crtl = -1;
			s_player_lockUnlock_crtl = -1;
			player rac s_player_checkGear;
			s_player_checkGear = -1;
			player rac s_player_SurrenderedGear;
			s_player_SurrenderedGear = -1;
			player rac s_player_maintain_area;
			s_player_maintain_area = -1;
			player rac s_player_maintain_area_preview;
			s_player_maintain_area_preview = -1;
			player rac s_player_door_ckc;
			s_player_door_ckc = -1;
			player rac s_player_vault_ckc;
			s_player_vault_ckc = -1;
			//Money
			player rac s_bank_dialog;
			s_bank_dialog = -1;
			player rac s_bank_dialog2;
			s_bank_dialog2 = -1;
			player rac s_bank_dialog3;
			s_bank_dialog3 = -1;
			player rac s_player_autorefuel;
			s_player_autorefuel = -1;
			player rac s_givemoney_dialog;
			s_givemoney_dialog = -1;
			//Others
			player rac s_player_forceSave;
			s_player_forceSave = -1;
			player rac s_player_flipveh;
			s_player_flipveh = -1;
			player rac s_player_sleep;
			s_player_sleep = -1;
			player rac s_player_deleteBuild;
			s_player_deleteBuild = -1;
			player rac s_player_butcher;
			s_player_butcher = -1;
			player rac s_player_cook;
			s_player_cook = -1;
			player rac s_player_boil;
			s_player_boil = -1;
			player rac s_player_fireout;
			s_player_fireout = -1;
			player rac s_player_packtent;
			s_player_packtent = -1;
			player rac s_player_fillfuel;
			s_player_fillfuel = -1;
			player rac s_player_studybody;
			s_player_studybody = -1;
			player rac s_player_teabag;
			s_player_teabag = -1;
			player rac s_player_checkWallet;
			s_player_checkWallet = -1;
			player rac s_clothes;
			s_clothes = -1;
			player rac s_player_dance;
			s_player_dance = -1;
			player rac s_player_hookahHit;
			s_player_hookahHit = -1;
			player rac s_player_packOBJ;
			s_player_packOBJ = -1;
			//Dog
			player rac s_player_tamedog;
			s_player_tamedog = -1;
			player rac s_player_feeddog;
			s_player_feeddog = -1;
			player rac s_player_waterdog;
			s_player_waterdog = -1;
			player rac s_player_staydog;
			s_player_staydog = -1;
			player rac s_player_trackdog;
			s_player_trackdog = -1;
			player rac s_player_barkdog;
			s_player_barkdog = -1;
			player rac s_player_warndog;
			s_player_warndog = -1;
			player rac s_player_followdog;
			s_player_followdog = -1;
			// vault
			player rac s_player_unlockvault;
			s_player_unlockvault = -1;
			player rac s_player_packvault;
			s_player_packvault = -1;
			player rac s_player_lockvault;
			s_player_lockvault = -1;
			player rac s_player_information;
			s_player_information = -1;
			player rac s_player_fillgen;
			s_player_fillgen = -1;
			player rac s_player_upgrade_build;
			s_player_upgrade_build = -1;
			player rac s_player_maint_build;
			s_player_maint_build = -1;
			player rac s_player_remove_build;
			s_player_remove_build = -1;
			player rac s_player_downgrade_build;
			s_player_downgrade_build = -1;
			player rac s_player_towing;
			s_player_towing = -1;
			player rac s_player_fuelauto;
			s_player_fuelauto = -1;
			player rac s_player_fuelauto2;
			s_player_fuelauto2 = -1;
			player rac s_player_garage;
			s_player_garage = -1;
		};
		_dogHandle = player xgv ["dogID", 0];
		if (_dogHandle > 0) then {
			_dog = _dogHandle getFSMVariable "_dog";
			_ownerID = "0";
			if (!izn cursorTarget) then {_ownerID = cursorTarget xgv ["CharacterID","0"]};
			if (_canDo && !_inVehicle && alive _dog && _ownerID != dayz_characterID) then {
				if (s_player_movedog < 0) then {
					s_player_movedog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_movedog"], "\z\addons\dayz_code\actions\dog\move.sqf", player xgv ["dogID", 0], 1, false, true, "", ""];
				};
				if (s_player_speeddog < 0) then {
					_text = (lzl "str_epoch_player_249");
					_speed = 0;
					if (_dog xgv ["currentSpeed",1] == 0) then {_speed = 1; _text = (lzl "str_epoch_player_250")};
					s_player_speeddog = player xaa [fmt [lzl "str_actions_speeddog", _text], "\z\addons\dayz_code\actions\dog\speed.sqf",[player xgv ["dogID", 0],_speed], 0, false, true, "", ""];
				};
				if (s_player_calldog < 0) then {
					s_player_calldog = player xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_calldog"], "\z\addons\dayz_code\actions\dog\follow.sqf", [player xgv ["dogID", 0], true], 2, false, true, "", ""];
				};
			};
		} else {
			player rac s_player_movedog;
			s_player_movedog =		-1;
			player rac s_player_speeddog;
			s_player_speeddog =		-1;
			player rac s_player_calldog;
			s_player_calldog = 		-1;
		};
	};
	fn_gearMenuChecks = {
		private ["_cTarget","_isOk","_display","_inVehicle"];
		disableSerialization;
		_display = (_this sel 0);
		_inVehicle = (vehicle player) != player;
		_cTarget = cursorTarget;
		if (_inVehicle) then {_cTarget = (vehicle player)};
		_isOk = false;
		{if (!_isOk) then {_isOk = _cTarget iko _x}} count ["LandVehicle","Air", "Ship"];
		if ((locked _cTarget) && _isOk && !_inVehicle && (((vehicle player) distance _cTarget) < 12)) then {
			cutText [(lzl "str_epoch_player_7") , "PLAIN DOWN"];
			_display closeDisplay 1;
		};
	};
	building_spawnLoot = {
		private ["_lootChance"];
		_obj = _this;
		_type = toLower(typeOf _obj);
		_config = xcf >> "CfgBuildingLoot" >> _type;
		if (DZE_MissionLootTable) then {_config = missionConfigFile >> "CfgBuildingLoot" >> _type};
		_pos = [] + getArray (_config >> "lootPos");
		_itemTypes = [] + getArray (_config >> "lootType");
		_lootChance = xgn (_config >> "lootChance");
		_qty = 0;
		_lootSpawnBias = 67;
		_ShuffleArray = {
			private ["_ar","_rand_array","_rand"];
			_ar = _this;
			_rand_array = [];
			while {count _ar > 0} do {
				_rand = (count _ar);
				_rand = floor (random _rand);
				_rand_array set [count _rand_array, _ar sel _rand];
				_ar set [_rand, "randarray_del"];
				_ar = _ar - ["randarray_del"];
			};
			_rand_array;
		};
		_positions = _pos call _ShuffleArray;
		_bias = 50 max _lootSpawnBias;
		_bias = 100 min _bias;
		_bias = (_bias + random(100 - _bias)) / 100;
		{
			if (count _x == 3) then {
				_rnd = (random 1) / _bias;
				_iPos = _obj modelToWorld _x;
				_nearBy = nearestObjects [_iPos, ["ReammoBox"], 2];
				if (count _nearBy > 0) then {_lootChance = _lootChance + 0.05};
				if (dayz_currentWeaponHolders < dayz_maxMaxWeaponHolders) then {
					if (_rnd <= _lootChance) then {
						if (count _nearBy == 0) then {
							_index = dayz_CBLBase find _type;
							_weights = dayz_CBLChances sel _index;
							_cntWeights = count _weights;
							_index = floor(random _cntWeights);
							_index = _weights sel _index;
							_itemType = _itemTypes sel _index;
							[_itemType sel 0, _itemType sel 1 , _iPos, 0.0] call spawn_loot;
							dayz_currentWeaponHolders = dayz_currentWeaponHolders + 1;
							_obj xsv ["looted", (DateToNumber date)];
						};
					};
				};
			};
		} forEach _positions;
		_posSmall 		= [] + getArray (_config >> "lootPosSmall");
		_itemTypesSmall = [] + getArray (_config >> "lootTypeSmall");
		_positionsSmall = _posSmall call _ShuffleArray;
		{
			if (count _x == 3) then {
				_rnd = (random 1) / _bias;
				_iPos = _obj modelToWorld _x;
				_nearBy = nearestObjects [_iPos, ["ReammoBox"], 2];
				if (count _nearBy > 0) then {_lootChance = _lootChance + 0.05};
				if (dayz_currentWeaponHolders < dayz_maxMaxWeaponHolders) then {
					if (_rnd <= _lootChance) then {
						if (count _nearBy == 0) then {
							_index = dayzE_CBLSBase find _type;
							_weights = dayzE_CBLSChances sel _index;
							_cntWeights = count _weights;
							_index = floor(random _cntWeights);
							_index = _weights sel _index;
							_itemType = _itemTypesSmall sel _index;
							[_itemType sel 0, _itemType sel 1, _iPos, 0.0] call spawn_loot_small;
							dayz_currentWeaponHolders = dayz_currentWeaponHolders +1;
							_obj xsv ["looted",(DateToNumber date)];
						};
					};
				};
			};
		} forEach _positionsSmall;
	};
	DZE_HumanityTargetDistance = -1;
	player_updateGui = {
		disableSerialization;
		NT_TARGT = (cursorTarget);
		if ((izn NT_TARGT)||!(isPlayer NT_TARGT)||(player distance NT_TARGT > NameTagDistance)) then [{NT_STRNG = ""},{
			NT_STRNG = "";
			NT_HMVAL = NT_TARGT xgv ["humanity",0];
			NT_SIZET = (1 - (((vehicle player) distance NT_TARGT) / 75));
			NT_COLOR = "#ffffff";
			if (NT_HMVAL <= -2500) then {NT_COLOR = "#ff0000"};
			if (NT_HMVAL >= 2500) then {NT_COLOR = "#3333ff"};
			if ((NT_HMVAL > -2500)&&(NT_HMVAL < 0)) then {NT_COLOR = "#ffa900"};
			if ((NT_HMVAL < 2500)&&(NT_HMVAL >= 0)) then {NT_COLOR = "#33e4ff"};
			if ((NT_TARGT iko 'ATV_CZ_EP1')||(NT_TARGT iko 'ATV_US_EP1')||(NT_TARGT iko 'LandVehicle')||(NT_TARGT iko 'Air')||(NT_TARGT iko 'Ship')) then {
				if (((count (crew NT_TARGT)) > 0)&&(player distance NT_TARGT < NameTagDistance)) then {
					player_tag = name (driver NT_TARGT);
					P_cre = [];
					_crew = (crew NT_TARGT);
					{if (name _x != player_tag) then {P_cre = P_cre + [name _x]}} forEach _crew;
					if (player_tag == 'Error: No vehicle') then {
						NT_STRNG = fmt  ["<t size='%1' color='#3333ff' align='center'>Driver</t><t size='%1'>:</t><t size='%1' color='%2' align='center'>No Driver</t> <t color='#3333ff' align='center' size='%1'>Crew</t><t size='%1'>:</t><t size='%1' color='%2' align='center'>%3</t>",NT_SIZET,NT_COLOR,P_cre,player_tag]
					} else {
						NT_STRNG = fmt  ["<t size='%1' color='#3333ff' align='center'>Driver</t><t size='%1'>:</t><t size='%1' color='%2' align='center'>%4</t> <t color='#3333ff' align='center' size='%1'>Crew</t><t size='%1'>:</t><t size='%1' color='%2' align='center'>%3</t>",NT_SIZET,NT_COLOR,P_cre,player_tag]
					};
				};
			} else {
				if ((isPlayer NT_TARGT)&&(alive NT_TARGT)&&!(NT_TARGT iko 'zZombie_Base')&&!(NT_TARGT iko 'CAAnimalBase')&&(player distance NT_TARGT < NameTagDistance)) then {
					player_tag = name NT_TARGT;
					NT_STRNG = fmt  ["<t size='%1' color='%2' align='center'>"+player_tag+"</t>",NT_SIZET,NT_COLOR]
				};
			};
		}];
		[NT_STRNG,0,safezoneY+0.55,10,0,0,753178] swx AH_fnc_dynamictext;
		private ["_display","_bloodVal","_ctrlFood","_ctrlThirst","_thirstVal","_foodVal","_ctrlTemp","_tempVal","_combatVal","_array","_ctrlCombat","_ctrlFracture","_visualText","_visual","_audibleText","_audible","_blood","_thirstLvl","_foodLvl","_tempImg","_thirst","_food","_temp","_bloodLvl","_tempLvl","_color","_string","_humanity","_size","_friendlies","_charID","_rcharID","_rfriendlies","_rfriendlyTo","_distance","_targetControl","_humanityName"];
		_foodVal 	= 1 - (dayz_hunger / sleepFood);
		_thirstVal 	= 1 - (dayz_thirst / sleepWater);
		_tempVal 	= 1 - ((dayz_temperatur - dayz_temperaturmin)/(dayz_temperaturmax - dayz_temperaturmin));
		_combatVal 	= 1 - dayz_combat;
		_bloodVal 	= r_player_blood / r_player_bloodTotal;
		_guiColor 	= [1,1,1,1];
		Dayz_GUI_R 	= 0;
		Dayz_GUI_G 	= 0.5;
		Dayz_GUI_B 	= 0;
		_scale 		= 1;
		if (uiNamespace xgv ['DZ_displayUI', 0] == 1) exw {
			_array = [_foodVal,_thirstVal];
			_array
		};
		_display 		= uiNamespace xgv 'DAYZ_GUI_display';
		_ctrlTemp 		= _display displayCtrl 1306;
		_ctrlTempBorder = _display displayCtrl 1208;
		_ctrlTempBack 	= _display displayCtrl 1903;
		_ctrlFood 		= _display displayCtrl 1301;
		_ctrlFoodBorder = _display displayCtrl 1201;
		_ctrlFoodBack 	= _display displayCtrl 1908;
		_ctrlThirst 	= _display displayCtrl 1302;
		_ctrlThirstBord = _display displayCtrl 1202;
		_ctrlThirstBack = _display displayCtrl 1205;
		_ctrlCombat 	= _display displayCtrl 1307;
		_ctrlFracture 	= _display displayCtrl 1203;
		_ctrlNB1 		= _display displayCtrl 13001;
		_ctrlNB2 		= _display displayCtrl 13002;
		_ctrlNB3 		= _display displayCtrl 13003;
		_ctrlNB4 		= _display displayCtrl 13004;
		_ctrlNB5 		= _display displayCtrl 13005;
		_ctrlNB6 		= _display displayCtrl 13006;
		_ctrlNB7 		= _display displayCtrl 13007;
		_ctrlDS1 		= _display displayCtrl 17001;
		_ctrlDS2 		= _display displayCtrl 17002;
		_ctrlDS3 		= _display displayCtrl 17003;
		_ctrlDS4 		= _display displayCtrl 17004;
		_ctrlDS5 		= _display displayCtrl 17005;
		_ctrlDS6 		= _display displayCtrl 17006;
		_ctrlDS7 		= _display displayCtrl 17007;
		_ctrlNB8 		= _display displayCtrl 13008;
		_ctrlNB9 		= _display displayCtrl 13009;
		_ctrlNB8i 		= _display displayCtrl 12008;
		_ctrlNB9i 		= _display displayCtrl 12009;
		_ctrlDS8 		= _display displayCtrl 17008;
		_ctrlDS9 		= _display displayCtrl 17009;
		_ctrlDS10 		= _display displayCtrl 17010;
		
		_ERhours = floor((servertime)/60/60);
		_ERminutes = floor((servertime)/60) - (_ERhours*60);
		if ((_ERhours == DZE_restarttime sel 0)&&(_ERminutes == DZE_restarttime sel 1)) exw {
			_msg = "Restart detected! Logging you out now..";
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
			(findDisplay 49) closeDisplay 0;
			PVDZE_plr_Save = [player,(magazines player),true,true];
			publicVariableServer "PVDZE_plr_Save";
			player xsv ["combattimeout",0,true];
			disableUserInput true;
			if (vehicle player == player) then {
				sleep 1;
				endMission 'loser'
			} else {
				(vehicle player) reh "Fired";
				(vehicle player) reh "HandleDamage";
				(vehicle player) aeh ["Fired", {call GG_pfired}];
				(vehicle player) aeh ["HandleDamage",{false}];
				(vehicle player) allowDamage false;
				(vehicle player) setVectorUp [0,0,1];
				(vehicle player) setVelocity [0,0,0];
				if ((vehicle player) iko "AIR") then {
					if (driver (vehicle player) == player) then {
						_pos = ([((vehicle player) call AH_fnc_getPos),10,1000,2,0,5,0] call BIS_fnc_findSafePos);
						[(vehicle player),[_pos sel 0,_pos sel 1,2]] call AH_fnc_setPos;
						sleep 1;
						{if (_x != player) then {_x xac ['Eject',(vehicle player)]}} forEach (crew (vehicle player));
						player xac ['Eject',(vehicle player)];
					} else {
						waitUntil {(vehicle player == player)};
						sleep 1;
					};
				} else {
					sleep 1;
					{if (_x != player) then {_x xac ['Eject',(vehicle player)]}} forEach (crew (vehicle player));
					player xac ['Eject',(vehicle player)];
				};
				endMission 'loser';
			};
		};
		
		_time = (round(120-(serverTime)/60));
		_hours = (floor(_time/60));
		_minutes = (_time - (_hours * 60));
		_ctrlDS10 ctrlSetPosition [(safeZoneX),(safeZoneY + safeZoneH) - 0.1];
		_ctrlDS10 ctrlSetStructuredText parseText fmt ["<t size='1'align='left'>%1</t>",name player];
		_ctrlDS10 ctrlCommit 0;
		_bank1 = player xgv ["bank","none"];
		_bank2 = player xgv ["GGBank","none"];
		if ((typeName(_bank1) == "SCALAR")||(typeName(_bank2) == "SCALAR")) then {
			_ctrlNB8 ctrlShow true;
			_ctrlNB8i ctrlShow true;
			_ctrlDS8 ctrlShow true;
			_ctrlNB9 ctrlShow true;
			_ctrlNB9i ctrlShow true;
			_ctrlDS9 ctrlShow true;
			_ctrlNB8 ctrlSetScale 0.6;
			_ctrlNB8 ctrlCommit 0;
			_ctrlDS8 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",[player xgv ["GGCoins",0]] call BIS_fnc_numberText];
			_ctrlDS8 ctrlCommit 0;
			_ctrlNB9 ctrlSetScale 0.6;
			_ctrlNB9 ctrlCommit 0;
			_ctrlDS9 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",[player xgv ["GGBank",0]] call BIS_fnc_numberText];
			_ctrlDS9 ctrlCommit 0;
		} else {
			_ctrlNB8 ctrlShow false;
			_ctrlNB8i ctrlShow false;
			_ctrlDS8 ctrlShow false;
			_ctrlNB9 ctrlShow false;
			_ctrlNB9i ctrlShow false;
			_ctrlDS9 ctrlShow false;
		};
		_ctrlNB1 ctrlSetScale 0.670000;
		_ctrlNB1 ctrlCommit 0;
		_ctrlDS1 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1h %2m</t>",_hours,_minutes];
		_ctrlDS1 ctrlCommit 0;
		_ctrlNB2 ctrlSetScale 0.670000;
		_ctrlNB2 ctrlCommit 0;
		_ctrlDS2 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",(round diag_fps)];
		_ctrlDS2 ctrlCommit 0;
		_ctrlNB3 ctrlSetScale 0.670000;
		_ctrlNB3 ctrlCommit 0;
		_ctrlDS3 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",r_player_blood];
		_ctrlDS3 ctrlCommit 0;
		_ctrlNB4 ctrlSetScale 0.670000;
		_ctrlNB4 ctrlCommit 0;
		_ctrlDS4 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",(round(player xgv ['humanity',0]))];
		_ctrlDS4 ctrlCommit 0;
		_ctrlNB5 ctrlSetScale 0.670000;
		_ctrlNB5 ctrlCommit 0;
		_ctrlDS5 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",(player xgv ['humanKills',0])];
		_ctrlDS5 ctrlCommit 0;
		_ctrlNB6 ctrlSetScale 0.670000;
		_ctrlNB6 ctrlCommit 0;
		_ctrlDS6 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",(player xgv ['banditKills',0])];
		_ctrlDS6 ctrlCommit 0;
		_ctrlNB7 ctrlSetScale 0.670000;
		_ctrlNB7 ctrlCommit 0;
		_ctrlDS7 ctrlSetStructuredText parseText fmt ["<t size='1'align='right'>%1</t>",(player xgv ['zombieKills',0])];
		_ctrlDS7 ctrlCommit 0;
		_pic = "\z\addons\dayz_code\gui\status_combat_inside_ca.paa";
		if (vehicle player == player) then [{_pic = (getText (xcf >> 'CfgWeapons' >> (currentWeapon (vehicle player)) >> 'picture'))},{_pic = (getText (xcf >> 'CfgVehicles' >> (typeOf (vehicle player)) >> 'picture'))}];
		if (_pic == "") then {_pic = "\z\addons\dayz_code\gui\status_combat_inside_ca.paa"};
		_ctrlCombat ctrlSetText _pic;
		_ctrlCombat ctrlSetPosition [(safeZoneX + safeZoneW - 0.25),(safeZoneY + 0.09)];
		if (_combatVal == 0) then {
			_ctrlCombat ctrlSetTextColor	[1,0,0,1];
			_ctrlCombat call player_guiControlFlash
		} else {
			if ((_pic == "\z\addons\dayz_code\gui\status_combat_inside_ca.paa")||(vehicle player != player)) then {
				_ctrlCombat ctrlSetScale 1.5;
				_ctrlCombat ctrlSetTextColor [0,1,0,0.8];
			} else {
				_ctrlCombat ctrlSetScale 2;
				_ctrlCombat ctrlSetTextColor [1,1,1,0.8];
			};
		};
		_ctrlCombat ctrlCommit 0;
		_ctrlFood ctrlSetTextColor 		[(Dayz_GUI_R + (0.6 * (1 - _foodVal)))		,(Dayz_GUI_G * _foodVal)	,(Dayz_GUI_B * _foodVal), 1];
		_ctrlThirst ctrlSetTextColor 	[(Dayz_GUI_R + (0.6 * (1 - _thirstVal)))	,(Dayz_GUI_G * _thirstVal)	,(Dayz_GUI_B * _thirstVal), 1];
		_ctrlTemp ctrlSetTextColor 		[(Dayz_GUI_R + (0.6 * (1 - _tempVal)))		,(Dayz_GUI_G * _tempVal)	,_tempVal, 1];
		_ctrlFoodBorder ctrlSetTextColor _guiColor;
		_ctrlThirstBord ctrlSetTextColor _guiColor;
		_ctrlTempBorder ctrlSetTextColor _guiColor;
		_thirst 	= "";
		_food 		= "";
		_temp 		= "";
		_tempImg 	= 0;
		_thirstLvl 	= round(_thirstVal / 0.25);
		_foodLvl 	= round(_foodVal / 0.25);
		_tempLvl 	= round(dayz_temperatur);
		if (_thirstLvl < 0) then {_thirstLvl = 0};
		_thirst = "\z\addons\dayz_code\gui\status\status_thirst_inside_" + str(_thirstLvl) + "_ca.paa";
		if (_foodLvl < 0) then {_foodLvl = 0};
		_food = "\z\addons\dayz_code\gui\status\status_food_inside_" + str(_foodLvl) + "_ca.paa";
		switch true do {
			case (_tempLvl >= 36): {_tempImg = 4};
			case (_tempLvl > 33 && _tempLvl < 36): {_tempImg = 3};
			case (_tempLvl >= 30 && _tempLvl <= 33): {_tempImg = 2};
			case (_tempLvl > 28 && _tempLvl < 30): {_tempImg = 1};
			default {_tempImg = 0};
		};
		_temp = "\z\addons\dayz_code\gui\status\status_temp_" + str(_tempImg) + "_ca.paa";
		_ctrlThirst ctrlSetText _thirst;
		_ctrlFood ctrlSetText _food;
		_ctrlTemp ctrlSetText _temp;
		if ((!canStand player)&&(!(ctrlShown _ctrlFracture))) then {
			r_fracture_legs = true;
			_ctrlFracture ctrlShow true;
		};
		if (_bloodVal < 0.6) then {_ctrlDS3 call player_guiControlFlash} else {_ctrlDS3 ctrlShow true};
		if (_thirstVal < 0.2) then {_ctrlThirst call player_guiControlFlash};
		if (_foodVal < 0.2) then {_ctrlFood call player_guiControlFlash};
		if (_tempVal > 0.8) then {_ctrlTemp call player_guiControlFlash} else {_ctrlTemp ctrlShow true};
		if (r_player_injured) then {_ctrlNB3 call player_guiControlFlash} else {_ctrlNB3 ctrlShow true};
		_array = [_foodVal,_thirstVal];
		_array
	};
	if (isNil 's_player_rearm_aa') then {s_player_rearm_aa = false;};
	if (isNil 's_player_rearm_ar') then {s_player_rearm_ar = []};
	r_player_removeGunActionz = {
		if (!izn r_player_lastVehicle) then {
			{r_player_lastVehicle rac _x} forEach r_player_gunactions;
			r_player_gunactions = [];
			r_gunaction2 = false;
		};
		if (!izn r_player_lastvehicle) then {
			{r_player_lastVehicle rac _x} forEach s_player_rearm_ar;
			s_player_rearm_ar = [];
			s_player_rearm_aa = false;
		};
	};
	fnc_usec_damageActions = {
		private ["_action","_weaponName","_turret","_weapons","_assignedRole","_driver","_action1","_action2","_vehicle","_unit","_vehType","_type","_typeVeh","_isDisallowRefuel","_vehClose","_hasVehicle","_unconscious","_lowBlood","_injured","_inPain","_legsBroke","_armsBroke","_charID","_friendlies","_playerMagazines","_hasBandage","_hasEpi","_hasMorphine","_hasBlood","_hasJerry","_hasBarrel","_hasJerryE","_hasBarrelE","_hasPainkillers","_unconscious_crew","_patients","_crew","_menClose","_hasPatient","_inVehicle","_isClose"];
		disableSerialization;
		if (DZE_ActionInProgress) exitWith {};
		_menClose = cursorTarget;
		_hasPatient = alive _menClose;
		_vehicle = vehicle player;
		_inVehicle = (_vehicle != player);
		_isClose = ((player distance _menClose) < ((sizeOf typeOf _menClose) / 2));
		if (_inVehicle) then {
			r_player_lastVehicle = _vehicle;
			_assignedRole = assignedVehicleRole player;
			_driver = driver (vehicle player);
			if (str (_assignedRole) != str (r_player_lastSeat)) then {
				call r_player_removeactions2;
				call r_player_removeGunActionz;
			};
			if (!r_player_unconscious && !r_gunaction2) then {
				if (typeOf _vehicle in ["ArmoredSUV_PMC_DZE"]) then {
					_isClosed = _vehicle getVariable ["SUV_closed",false];
					if (_isClosed) then {
						_action = _vehicle xaa ["<t color='#dddddd'>Open Gunner</t>","GG\Epoch\GG_SO1.sqf",_vehicle,2,false,true,"",""];
						r_player_gunactions set [count r_player_gunactions,_action];
						r_gunaction2 = true;
					} else {
						if ((gunner _vehicle == player)||(izn (gunner _vehicle))) then {_action = _vehicle xaa ["<t color='#dddddd'>Close Gunner</t>","GG\Epoch\GG_SO2.sqf",_vehicle,2,false,true,"",""];
							r_player_gunactions set [count r_player_gunactions,_action];
							r_gunaction2 = true;
						};
					};
				};
			};
			_nearrnrs = (nearestObjects [_vehicle,DZE_rnr_trader,80]);
			_isNearTrader = (({typeOf _x in DZE_rnr_trader} count _nearrnrs) > 0);
			if (_isNearTrader) then {
				if (!s_player_rearm_aa) then {
					_action = _vehicle xaa [fmt  [("<t color=""#00F000"">"+("Rearm vehicle") + "</t>")], "GG\Epoch\GG_RAT.sqf",_nearrnrs sel 0, 3, true, true, "", ""];
					s_player_rearm_ar set [count s_player_rearm_ar,_action];
					s_player_rearm_aa = true;
				};
			} else {
				if (s_player_rearm_aa) then {
					{r_player_lastVehicle rac _x} forEach s_player_rearm_ar;
					s_player_rearm_ar = [];
					s_player_rearm_aa = false;
				};
			};
			if (!r_player_unconscious && !r_action2) then {
				r_player_lastSeat = _assignedRole;
				if (DZE_useGGammo) then {
					if ((_vehicle isKindOf "plane")||(typeOf _vehicle in ["AH6J_EP1_DZ","pook_H13_gunship"])) then {
						_action = (switch (true) do {default {"M240"};
						case (typeOf _vehicle == "pook_H13_gunship") : {"M60"};
						case (typeOf _vehicle in ["AH6J_EP1_DZ","AH6J_EP1_DZE"]) : {"M134"};
						case (typeOf _vehicle in ["F35B","SU34","L39_TK_EP1"]) : {"DSHKM"};
						});
						_action = _vehicle xaa ["<t color='#dddddd'>Add AMMO to "+_action+"</t>", "GG\Epoch\GG_ammo.sqf",[_vehicle], 0, false, true];
						r_player_actions2 set [count r_player_actions2,_action];
						r_action2 = true;
					};
				};
				if (_vehicle isKindOf "helicopter") then {
					if (((_assignedRole sel 0) != "driver") && ((!alive _driver) || ((_vehicle emptyPositions "Driver") > 0))) then {
						if (_vehicle isKindOf "helicopter") then {
							_action = _vehicle xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_308A"], "\z\addons\dayz_code\actions\veh_seatActions.sqf",["MoveToPilot",_driver], 0, false, true];
						} else {
							_action = _vehicle xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_308"], "\z\addons\dayz_code\actions\veh_seatActions.sqf",["MoveToPilot",_driver], 0, false, true];
						};
						r_player_actions2 set [count r_player_actions2,_action];
						r_action2 = true;
					};
					if (((_assignedRole sel 0) != "cargo") && ((_vehicle emptyPositions "Cargo") > 0)) then {
						_action = _vehicle xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_309"], "\z\addons\dayz_code\actions\veh_seatActions.sqf",["MoveToCargo",_driver], 0, false, true];
						r_player_actions2 set [count r_player_actions2,_action];
						r_action2 = true;
					};
					_isClosed = _vehicle getVariable ["SUV_closed",false];
					if !(_isClosed) then {
						if (((_assignedRole sel 0) != "Turret")  && ((_vehicle emptyPositions "Gunner") > 0)) then {
							_action = _vehicle xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_310"], "\z\addons\dayz_code\actions\veh_seatActions.sqf",["MoveToTurret",_driver], 0, false, true];
							r_player_actions2 set [count r_player_actions2,_action];
							r_action2 = true;
						};
					};
					if (((assignedCommander _vehicle) != player) && ((_vehicle emptyPositions "Commander") > 0)) then {
						_action = _vehicle xaa [fmt  ["<t color='#dddddd'>%1</t>",lzl "STR_EPOCH_PLAYER_311"], "\z\addons\dayz_code\actions\veh_seatActions.sqf", ["MoveToTurret", _driver], 0, false, true];
						r_player_actions2 set [count r_player_actions2,_action];
						r_action2 = true;
					};
				};
				if (count _assignedRole > 1) then {
					_turret = _assignedRole sel 1;
					_weapons = _vehicle weaponsTurret _turret;
					{
						_weaponName = getText (xcf >> "cfgWeapons" >> _x >> "displayName");
						_action = _vehicle xaa [fmt ["<t color='#dddddd'>Add AMMO to %1</t>",_weaponName], "\z\addons\dayz_code\actions\ammo.sqf",[_vehicle,_x,_turret], 0, false, true];
						r_player_actions2 set [count r_player_actions2,_action];
						r_action2 = true;
					} forEach _weapons;
				};
			};
		} else {
			call r_player_removeactions2;
			call r_player_removeGunActionz;
			r_player_lastVehicle = objNull;
			r_player_lastSeat = [];
		};
		if (!izn _menClose && _hasPatient && !r_drag_sqf && !r_action && !_inVehicle && !r_player_unconscious && _isClose) then {
			_unit = 		cursorTarget;
			_isDisallowRefuel = typeOf _unit in ["M240Nest_DZ"];
			_vehClose = 	(player call AH_fnc_getPos) nearEntities [["Car","Tank","Helicopter","Plane","StaticWeapon","Ship"],5];
			_hasVehicle = 	({alive _x} count _vehClose > 0);
			_unconscious = 	_unit getVariable ["NORRN_unconscious", false];
			_lowBlood = 	_unit getVariable ["USEC_lowBlood", false];
			_injured = 		_unit getVariable ["USEC_injured", false];
			_inPain = 		_unit getVariable ["USEC_inPain", false];
			_legsBroke = 	_unit getVariable ["hit_legs", 0] >= 1;
			_armsBroke = 	_unit getVariable ["hit_hands", 0] >= 1;
			_friendlies =	player getVariable ["friendlies", []];
			_playerMagazines = magazines player;
			_hasBandage = 	"ItemBandage" in _playerMagazines;
			_hasEpi = 		"ItemEpinephrine" in _playerMagazines;
			_hasMorphine = 	"ItemMorphine" in _playerMagazines;
			_hasBlood = 	"ItemBloodbag" in _playerMagazines;
			_hasJerry = 	"ItemJerrycan" in _playerMagazines;
			_hasBarrel = 	"ItemFuelBarrel" in _playerMagazines;
			_hasJerryE = 	"ItemJerrycanEmpty" in _playerMagazines;
			_hasBarrelE = 	"ItemFuelBarrelEmpty" in _playerMagazines;
			_hasPainkillers = "ItemPainkiller" in _playerMagazines;
			if (_unconscious) then {
				r_action = true;
				if (isNil "inSafeZone") then {inSafeZone=false};
				if !(inSafeZone) then {
					_action1 = _unit xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_medical_01"], "\z\addons\dayz_code\medical\drag.sqf",_unit, 0, true, true];
					_action2 = _unit xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_medical_02"], "\z\addons\dayz_code\medical\pulse.sqf",_unit, 0, true, true];
					_action3 = _unit xaa [fmt  ["<t color='#dddddd'>Loot %1</t>",name _unit],"GG\Epoch\GG_OG.sqf",_unit, 0, true, true];
					r_player_actions = r_player_actions + [_action1,_action2,_action3];
				} else {
					_action1 = _unit xaa ["<t color='#ff000>Drag disabled</t>", "",_cursorTarget, 2, true, true, "", ""];
					_action2 = _unit xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_medical_02"], "\z\addons\dayz_code\medical\pulse.sqf",_unit, 0, true, true];
					r_player_actions = r_player_actions + [_action1,_action2];
				};
			};
			if (_hasVehicle && _unconscious) then {
				_x = 0;
				r_action = true;
				_unit = _unit;
				_vehicle = (_vehClose sel _x);
				while{((!alive _vehicle) && (_x < (count _vehClose)))} do {_x = _x + 1;_vehicle = (_vehClose sel _x);};
				_vehType = typeOf _vehicle;
				_action = _unit xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "str_actions_medical_03",_vehType]], "\z\addons\dayz_code\medical\load\load_act.sqf",[player,_vehicle,_unit], 0, true, true];
				r_player_actions set [count r_player_actions,_action];
			};
			if (_injured && _hasBandage) then {
				r_action = true;
				_action = _unit xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_medical_04"], "\z\addons\dayz_code\medical\bandage.sqf",[_unit], 0, true, true, "", ""];
				r_player_actions set [count r_player_actions,_action];
			};
			if (_unconscious && _hasEpi) then {
				r_action = true;
				_action = _unit xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_medical_05"], "\z\addons\dayz_code\medical\epinephrine.sqf",[_unit], 0, true, true];
				r_player_actions set [count r_player_actions,_action];
			};
			if ((_legsBroke || _armsBroke) && _hasMorphine) then {
				r_action = true;
				if (_legsBroke) then {
					_action = _unit xaa ["Give morphine (Broken leg)", "\z\addons\dayz_code\medical\morphine.sqf",[_unit], 0, true, true, "", ""];
				} else {
					_action = _unit xaa ["Give morphine (Broken arm)", "\z\addons\dayz_code\medical\morphine.sqf",[_unit], 0, true, true, "", ""];
				};
				r_player_actions set [count r_player_actions,_action];
			};
			if (_inPain && _hasPainkillers) then {
				r_action = true;
				_action = _unit xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_medical_07"], "\z\addons\dayz_code\medical\painkiller.sqf",[_unit], 0, true, true, "", ""];
				r_player_actions set [count r_player_actions,_action];
			};
			if (_lowBlood && _hasBlood) then {
				r_action = true;
				_action = _unit xaa [fmt ["<t color='#dddddd'>%1</t>",lzl "str_actions_medical_08"], "\z\addons\dayz_code\medical\transfusion.sqf",[_unit], 0, true, true, "", ""];
				r_player_actions set [count r_player_actions,_action];
			};
			if ((_unit isKindOf "AllVehicles") && !(_unit isKindOf "Man") && !_isDisallowRefuel) then {
				_type = TypeOf(_unit);
				_typeVeh = getText(xcf >> "cfgVehicles" >> _type >> "displayName");
				if ((fuel _unit < 1) && (_hasJerry || _hasBarrel)) then {
					r_action = true;
					_action = _unit xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "str_actions_medical_10",_typeVeh]], "\z\addons\dayz_code\actions\refuel.sqf",[], 0, true, true, "", ""];
					r_player_actions set [count r_player_actions,_action];
				};
				if ((fuel _unit > 0) && (_hasJerryE || _hasBarrelE) && (!inSafeZone)) then {
					r_action = true;
					_action = _unit xaa [fmt ["<t color='#dddddd'>%1</t>Siphon fuel from %1</t>",_typeVeh], "\z\addons\dayz_code\actions\siphonFuel.sqf",[], 0, true, true, "", ""];
					r_player_actions set [count r_player_actions,_action];
				};
			} else {
				if ((isPlayer _unit) && !(PIDP_playerUID in _friendlies)) then {
					r_action = true;
					_action = _unit xaa ["<t color='#dddddd'>Tag as friendly</t>", "GG\Epoch\GG_TF.sqf", [], 0, false, true, "", ""];
					r_player_actions set [count r_player_actions,_action];
				};
			};
			if (r_action) then {r_action_targets = r_action_targets + [_unit]};
		};
		if (_inVehicle) then {
			_crew = crew _vehicle;
			if (count _crew > 0) then {
				_unconscious_crew = [];
				{if (_x getVariable "NORRN_unconscious") then {_unconscious_crew = _unconscious_crew + [_x]}} forEach _crew;
				_patients = (count _unconscious_crew);
				if (_patients > 0) then {
					if (!r_action_unload) then {
						r_action_unload = true;
						_vehType = typeOf _vehicle;
						_action = _vehicle xaa [fmt  ["<t color='#dddddd'>%1</t>",fmt [lzl "str_actions_medical_14",_vehType]], "\z\addons\dayz_code\medical\load\unLoad_act.sqf",[player,_vehicle], 0, false, true];
						r_player_actions set [count r_player_actions,_action];
					};
				} else {
					if (r_action_unload) then {
						call fnc_usec_medic_removeactions;
						r_action_unload = false;
					};
				};
			};
		} else {
			if (r_action_unload) then {
				r_action_unload = false;
				call fnc_usec_medic_removeactions;
			};
		};
		if ((!_isClose || !_hasPatient) && r_action) then {
			call fnc_usec_medic_removeactions;
			r_action = false;
		};
	};
	snap_object = xcm xlx "GG\Epoch\Snap\snap_object.sqf";
	player_build = {
		private ["_isNear2","_isNear3","_helperColor","_objectHelper","_objectHelperDir","_objectHelperPos","_canDo","_found","_friendlies","_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx","_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_isNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_nearestPole","_ownerID","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_abort","_isNear","_need","_objHdwnDiff","_needNear"];
		if (DZE_ActionInProgress) exw {cutText [(lzl "str_epoch_player_40") , "PLAIN DOWN"]};
		_isNear2 = count (nearestObjects [player, [
			"Land_A_Hospital","Land_A_GeneralStore_01a","Land_A_FuelStation_Feed","MASH_EP1","Camp_EP1","CampEast_EP1",
			"Land_SS_hangar","Land_Mil_Barracks_i","Land_A_BuildingWIP","Land_a_stationhouse","Land_Mil_Barracks",
			"Land_Tovarna2","Land_Mil_ControlTower"
		], 75]);
		if(_isNear2 > 0) then { _cancel = true; _reason = "It is forbidden to build within 75m of a high value building."; };
		if((count (nearestObjects [player, ["MAP_R2_Boulder1"], 500])) > 0) then { _cancel = true; _reason = "It is forbidden to build within 500m of a air field."; };
		if ((((vehicle player) call AH_fnc_getPos) sel 2 > DZE_maxBuildHeight)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {
			_msg = "You are not allowed to build over 40M altitude!";
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		
		_nobuildcheck = "";
		{
			private ["_pos","_dis","_loc","_rng"];
			_pos = _x sel 0;
			_dis = (_x sel 1) sel 1;
			_loc = _x sel 2;
			_rng = (player distance _pos);
			if (_rng <= _dis) exw {
				_nobuildcheck = fmt ["You can not build within %1m of %2. Current distance: %3m",_dis,_loc,_rng];
			};
		} forEach DZE_nobuildarray;
		if ((_nobuildcheck != "")&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {
			DZE_ActionInProgress = false;
			_msg = "Building canceled, reason: "+str _nobuildcheck;
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		
		if ((count (nearestObjects [player,dayz_allowedObjects,30])) >= DZE_BuildingLimit) exw {
			DZE_ActionInProgress = false;
			cutText [(lzl "str_epoch_player_41"), "PLAIN DOWN"]
		};
		
		if (isNil "GG_donatorarra") then {GG_donatorarra = []};
		DZE_ActionInProgress = true;
		_onLadder 	= (xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1;
		_isWater 	= dayz_isSwimming;
		_cancel 	= false;
		_reason 	= "";
		_vehicle 	= vehicle player;
		_inVehicle 	= (_vehicle != player);
		DPB_canBuildOnPlot = false;
		helperDetach = false;
		_objHDiff = 0;
		_canDo = (!r_drag_sqf and !r_player_unconscious);
		if (isNil 's_player_toggleSnapSelectPoint') then {
			s_player_toggleSnap = -1;
			s_player_toggleSnapsel = -1;
			s_player_toggleSnapSelectPoint = [];
			snapActions = -1;
		};
		_vector = [];
		fnc_SetPitchBankYaw = { 
			private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY","_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp",
			"_upXTemp"];
			_object = _this sel 0; 
			_rotations = _this sel 1; 
			_aroundX = _rotations sel 0; 
			_aroundY = _rotations sel 1; 
			_aroundZ = (360 - (_rotations sel 2)) - 360; 
			_dirX = 0; 
			_dirY = 1; 
			_dirZ = 0; 
			_upX = 0; 
			_upY = 0; 
			_upZ = 1; 
			if (_aroundX != 0) then { 
				_dirY = cos _aroundX; 
				_dirZ = sin _aroundX; 
				_upY = -sin _aroundX; 
				_upZ = cos _aroundX; 
			}; 
			if (_aroundY != 0) then { 
				_dirX = _dirZ * sin _aroundY; 
				_dirZ = _dirZ * cos _aroundY; 
				_upX = _upZ * sin _aroundY; 
				_upZ = _upZ * cos _aroundY; 
			}; 
			if (_aroundZ != 0) then { 
				_dirXTemp = _dirX; 
				_dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
				_dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
				_upXTemp = _upX; 
				_upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
				_upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ); 		
			}; 
			_dir = [_dirX,_dirY,_dirZ]; 
			_up = [_upX,_upY,_upZ]; 
			_object sdu [_dir,_up];
			DZE_BuildVector = [_dir,_up];
		}; 
		DZE_updated = false;
		DZE_Q 		= false;
		DZE_Z 		= false;
		DZE_Q_alt 	= false;
		DZE_Z_alt 	= false;
		DZE_Q_ctrl 	= false;
		DZE_Z_ctrl 	= false;
		DZE_5 		= false;
		DZE_4 		= false;
		DZE_6 		= false;
		DZE_togglesnap = false;
		DZE_cancelBuilding = false;
		DZE_F 		= false;
		call gear_ui_init;
		cdg 1;
		if ((_isWater)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {DZE_ActionInProgress = false; cutText [lzl "str_player_26", "PLAIN DOWN"]};
		if ((_inVehicle)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {DZE_ActionInProgress = false; cutText [(lzl "str_epoch_player_42"), "PLAIN DOWN"]};
		if ((_onLadder)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {DZE_ActionInProgress = false; cutText [lzl "str_player_21", "PLAIN DOWN"]};
		if ((player xgv ["combattimeout", 0] >= time)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {DZE_ActionInProgress = false; cutText [(lzl "str_epoch_player_43"), "PLAIN DOWN"]};
		_item = _this;
		_abort = false;
		_distance = 3;
		_reason = "";
		_needNear = getArray (xcf >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "neednearby");
		{
			_need = _x sel 0;
			_distance = _x sel 1;
			switch(_need) do {
				case "fire":
				{
					_isNear = {inflamed _x} count (position player nearObjects _distance);
					if (_isNear == 0) then {
						_abort = true;
						_reason = "fire";
					};
				};
				case "workshop":
				{
					_isNear = count (nearestObjects [player, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);
					if (_isNear == 0) then {
						_abort = true;
						_reason = "workshop";
					};
				};
				case "fueltank":
				{
					_isNear = count (nearestObjects [player, dayz_fuelsources, _distance]);
					if (_isNear == 0) then {
						_abort = true;
						_reason = "fuel tank";
					};
				};
			};
		} forEach _needNear;
		if ((_abort)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {cutText [fmt [(lzl "str_epoch_player_135"),_reason,_distance], "PLAIN DOWN"];DZE_ActionInProgress = false};
		_classname 		= getText (xcf >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "create");
		_classnametmp 	= _classname;
		_require 		= getArray (xcf >> "cfgMagazines" >> _this >> "ItemActions" >> "Build" >> "require");
		_text 			= getText (xcf >> "CfgVehicles" >> _classname >> "displayName");
		_ghost 			= getText (xcf >> "CfgVehicles" >> _classname >> "ghostpreview");
		_lockable 		= 0;
		_requireplot 	= DZE_requireplot;
		_isAllowedUnderGround = 1;
		if (isNumber (xcf >> "CfgVehicles" >> _classname >> "lockable")) then {_lockable = xgn(xcf >> "CfgVehicles" >> _classname >> "lockable")};
		if (isNumber (xcf >> "CfgVehicles" >> _classname >> "requireplot")) then {_requireplot = xgn(xcf >> "CfgVehicles" >> _classname >> "requireplot")};
		if (isNumber (xcf >> "CfgVehicles" >> _classname >> "nounderground")) then {_isAllowedUnderGround = xgn(xcf >> "CfgVehicles" >> _classname >> "nounderground")};
		_offset = 	getArray (xcf >> "CfgVehicles" >> _classname >> "offset");
		if ((count _offset) <= 0) then {_offset = [0,1.5,0]};
		_isPole = (_classname == "Plastic_Pole_EP1_DZ");
		_isLandFireDZ = (_classname == "Land_Fire_DZ");
		_distance = (DZE_PlotPole sel 0);
		_needText = lzl "str_epoch_player_246";
		if (_isPole) then {_distance = (DZE_PlotPole sel 0) * 2};
		_findNearestPole = call player_nearPP;
		_isNearPlot = count (_findNearestPole);
		if ((_isPole && _isNearPlot > 0)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {
			DZE_ActionInProgress = false;
			cutText ["Cannot build plot pole within "+str(DZE_PlotPole sel 0)+"m of an existing plot pole!","PLAIN"];
		};
		if ((_isNearPlot == 0)||(!isNil "AM_Epoch_ADMIN_norestrict")) then {
			if (_requireplot == 0 || _isLandFireDZ) then {
				DPB_canBuildOnPlot = true;
			};
		} else {
			if (!_isPole) then {DPB_canBuildOnPlot = call player_canBuildPP};
		};
		if ((!DPB_canBuildOnPlot)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {
			DZE_ActionInProgress = false;
			_msg = "You do not own the plot pole that exists within 60m of this area!";
			systemChat ("(GG-AH): "+str _msg);
			cutText [_msg,"PLAIN"];
		};
		_missing = "";
		_hasrequireditem = true;
		{
			_hastoolweapon = _x in weapons player;
			if (!_hastoolweapon) exw {_hasrequireditem = false; _missing = getText (xcf >> "cfgWeapons" >> _x >> "displayName")}
		} forEach _require;
		_hasbuilditem = _this in magazines player;
		if (_item == "HeliH") then {
			_classname = "HeliH";
			_classnametmp = _classname;
			_text = "Safe";
			_require = [];
			_hasbuilditem = "ItemVault" in magazines player;
		};
		if (_item == "Land_MBG_Garage_Single_C") then {
			_offset = [0,5,2];
			_classname = "Land_MBG_Garage_Single_C";
			_classnametmp = _classname;
			_text = "Block garage doorway";
			_require = [];
			_hasbuilditem = "cinder_garage_kit" in magazines player;
		};
		if ((!_hasbuilditem)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {
			DZE_ActionInProgress = false;
			_msg = fmt ["%1 must be in your main inventory to %2 it.",_text,"build"];
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		if ((!_hasrequireditem)&&(isNil "AM_Epoch_ADMIN_norestrict")&&(_this != "Land_MBG_Garage_Single_C")&&(_this != "HeliH")) exw {
			DZE_ActionInProgress = false;
			_msg = fmt ["You need a %1!",_missing];
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		if ((_hasrequireditem)||(!isNil "AM_Epoch_ADMIN_norestrict")) then {
			_location = [0,0,0];
			_timestartbuilding = time;
			_isOk = true;
			_location1 = player call AH_fnc_getPos;
			_dir = 0;
			_original_classname = _classname;
			if (_ghost != "") then {_classname = _ghost};
			_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
			_objectHelper = "Sign_sphere10cm_EP1" createVehicle _location;
			_helperColor = "#(argb,8,8,3)color(0,0,0,0,ca)";
			_objectHelper setobjecttexture [0,_helperColor];
			_objectHelper attachTo [player,_offset];
			_object attachTo [_objectHelper,[0,0,0]];
			_position = _objectHelper call AH_fnc_getPos;
			_previewCounter = 150;
			if (isClass (missionConfigFile >> "SnapPoints" >> _classname)) then {
				["","","",["Init",_object,_classname,_objectHelper]] swx snap_object;
			};
			DZE_updateVec = false;
			DZE_memDir = getDir _objectHelper;
			DZE_memForBack = 0;
			DZE_memLeftRight = 0;
			if !(_item in DZE_noRotate) then {
				s_player_setVectorsReset = player xaa 	["<t color='#FF0000'>Reset pitch</t>","GG\Epoch\snap\player_vectorChange.sqf","reset",3,false,false];
				s_player_setVectorsForward = player xaa ["<t color='#00FFFF'>Pitch Forward</t>","GG\Epoch\snap\player_vectorChange.sqf","forward",3,false,false];
				s_player_setVectorsBack = player xaa 	["<t color='#00FFFF'>Pitch Back</t>","GG\Epoch\snap\player_vectorChange.sqf","back",3,false,false];
				s_player_setVectorsLeft = player xaa 	["<t color='#00FFFF'>Pitch Left</t>","GG\Epoch\snap\player_vectorChange.sqf","left",3,false,false];
				s_player_setVectorsRight = player xaa 	["<t color='#00FFFF'>Pitch Right</t>","GG\Epoch\snap\player_vectorChange.sqf","right",3,false,false];
				s_player_setVectors1 = player xaa 		["<t color='#006EFF'>Pitch modifier: 1 degree</t>","GG\Epoch\snap\player_vectorChange.sqf","1",3,false,false];
				s_player_setVectors5 = player xaa 		["<t color='#006EFF'>Pitch modifier: 5 degrees</t>","GG\Epoch\snap\player_vectorChange.sqf","5",3,false,false];
				s_player_setVectors45 = player xaa 		["<t color='#006EFF'>Pitch modifier: 45 degrees</t>","GG\Epoch\snap\player_vectorChange.sqf","45",3,false,false];
				s_player_setVectors90 = player xaa 		["<t color='#006EFF'>Pitch modifier: 90 degrees</t>","GG\Epoch\snap\player_vectorChange.sqf","90",3,false,false];
			};
			private ["_zheightchanged", "_zheightdirection", "_rotate"];
			while {_isOk} do {
				_timeBuilding = time - _timestartbuilding;
				if (_timeBuilding > 240) exw {
					_isOk = false;
					_cancel = true;
					_reason = "Ran out of time to find position.";
					_msg = "Building terminated..."+(str _reason);
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
				_location1 = (vehicle player) call AH_fnc_getPos;
				_lastLoop = time;
				waitUntil {((DZE_F)||(DZE_Q)||(DZE_Z)||(DZE_Q_alt)||(DZE_Z_alt)||(DZE_Q_ctrl)||(DZE_Z_ctrl)||(DZE_4)||(DZE_5)||(DZE_6)||(DZE_cancelBuilding)||(DZE_updated)||((time - _lastLoop) > 5))};
				_zheightchanged = false;
				_zheightdirection = "";
				_rotate = false;
				if (DZE_updated) then {
					[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
					DZE_updated = false;
				};
				if (DZE_Q) then {
					DZE_Q = false;
					_zheightdirection = "up";
					_zheightchanged = true;
				};
				if (DZE_Z) then {
					DZE_Z = false;
					_zheightdirection = "down";
					_zheightchanged = true;
				};
				if (DZE_Q_alt) then {
					DZE_Q_alt = false;
					_zheightdirection = "up_alt";
					_zheightchanged = true;
				};
				if (DZE_Z_alt) then {
					DZE_Z_alt = false;
					_zheightdirection = "down_alt";
					_zheightchanged = true;
				};
				if (DZE_Q_ctrl) then {
					DZE_Q_ctrl = false;
					_zheightdirection = "up_ctrl";
					_zheightchanged = true;
				};
				if (DZE_Z_ctrl) then {
					DZE_Z_ctrl = false;
					_zheightdirection = "down_ctrl";
					_zheightchanged = true;
				};
				if (DZE_4) then {
					_rotate = true;
					DZE_4 = false;
					_dir = -45;
					DZE_memDir = DZE_memDir - 45;
				};
				if (DZE_6) then {
					_rotate = true;
					DZE_6 = false;
					_dir = 45;
					DZE_memDir = DZE_memDir + 45;
				};
				if (DZE_F) then {
					if (helperDetach) then {
						_objectHelper attachTo [player];
						DZE_memDir = DZE_memDir-(getDir player);
						helperDetach = false;
						[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
					} else {
						_objectHelperPos = _objectHelper call AH_fnc_getPos;
						detach _objectHelper;
						DZE_memDir = getDir _objectHelper;
						[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
						[_objectHelper]	call FNC_GetSetPos;
						_objectHelper setVelocity [0,0,0];
						helperDetach = true;
					};
					DZE_F = false;
				};
				if (_rotate) then {[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw};
				if (_zheightchanged) then {
					if (!helperDetach) then {
						detach _objectHelper;
						_objectHelperDir = getDir _objectHelper;
					};
					_position = _objectHelper call AH_fnc_getPos;
					if (_zheightdirection == "up") then {
						_position set [2,((_position sel 2)+0.1)];
						_objHDiff = _objHDiff + 0.1;
					};
					if (_zheightdirection == "down") then {
						_position set [2,((_position sel 2)-0.1)];
						_objHDiff = _objHDiff - 0.1;
					};

					if (_zheightdirection == "up_alt") then {
						_position set [2,((_position sel 2)+1)];
						_objHDiff = _objHDiff + 1;
					};
					if (_zheightdirection == "down_alt") then {
						_position set [2,((_position sel 2)-1)];
						_objHDiff = _objHDiff - 1;
					};
					if (_zheightdirection == "up_ctrl") then {
						_position set [2,((_position sel 2)+0.01)];
						_objHDiff = _objHDiff + 0.01;
					};
					if (_zheightdirection == "down_ctrl") then {
						_position set [2,((_position sel 2)-0.01)];
						_objHDiff = _objHDiff - 0.01;
					};
					
					if ((_isAllowedUnderGround == 0) && ((_position sel 2) < 0)) then {_position set [2,0]};
					[_objectHelper,_position] call AH_fnc_setPos;
					if (!helperDetach) then {
						_objectHelper attachTo [player];
						_objectHelper setDir _objectHelperDir-(getDir player);
					};
					[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
				};
				_location2 = player call AH_fnc_getPos;
				if (DZE_5) exw {
					_isOk = false;
					_position = _object call AH_fnc_getPos;
					_dir = getDir _object;
					_vector = [(vectorDir _object),(vectorUp _object)];	
					detach _object;
					_msg = "Preparing to build.";
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
				if (DZE_cancelBuilding) exw {
					_isOk = false;
					_cancel = true;
					_reason = "Cancelled building.";
					_msg = "Building terminated... REASON:"+(str _reason);
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
				if (_location1 distance _location2 > 10) exw {
					_isOk = false;
					_cancel = true;
					_reason = "Moving too fast.";
					_msg = "Building terminated... REASON:"+(str _reason);
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
				if (_previewCounter <= 0) exw {
					_isOk = false;
					_cancel = true;
					_reason = "Ran out of time to find position.";
					_msg = "Building terminated... REASON:"+(str _reason);
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
				_previewCounter = _previewCounter - 1;
				if (abs(_objHDiff) > 10) exw {
					_isOk = false;
					_cancel = true;
					_reason = "Cannot move up or down more than 10 meters";
				};
				if ((player xgv ["combattimeout", 0] >= time)&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {
					_isOk = false;
					_cancel = true;
					_reason = "Cannot build while in combat.";
					_msg = "Building terminated... REASON:"+(str _reason);
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
			};
			{deleteVehicle _x} forEach (nearestObjects [player,["Sign_sphere10cm_EP1"],200]);
			if !(_item in DZE_noRotate) then {
				player rac s_player_setVectorsReset;
				player rac s_player_setVectorsForward;
				player rac s_player_setVectorsBack;
				player rac s_player_setVectorsLeft;
				player rac s_player_setVectorsRight;
				player rac s_player_setVectors1;
				player rac s_player_setVectors5;
				player rac s_player_setVectors45;
				player rac s_player_setVectors90;
			};
			if ((_classnametmp == "Plastic_Pole_EP1_DZ")||(_classname == "Plastic_Pole_EP1_DZ")) then {
				_near = nearestObjects [_object, DZE_LockableStorage, 2];
				_types = [];
				_dontAllow = false;
				{
					_types = _types + [typeOf _x];
					if (_x in (DZE_LockableStorage+dayz_allowedObjects)) then {
						if (_x distance _object <= 2) then {
							_dontAllow = true;
						};
					};
				} forEach _near;
				if (_dontAllow) then {
					_cancel = true;
					_reason = "You can not build plot pole inside other objects: "+str (_types);
				};
			} else {
				if (typeOf _object in DZE_LockableStorage) then {
					_nearestVault = nearestObject [_object,"Plastic_Pole_EP1_DZ"];
					if (_object distance _nearestVault <= 1.5) then {
						_cancel = true;
						_reason = "You can not build over a plot pole.";
					};
				} else {
					_nearestVault = nearestObject [_object,"Plastic_Pole_EP1_DZ"];
					if (_object distance _nearestVault <= 1.75) then {
						_cancel = true;
						_reason = "You can not build over a plot pole.";
					};
				};
			};
			_canbuildcheck = {
				private ["_findNearestPole","_canBuildOnPlot"];
				_findNearestPole = [];
				{if (alive _x) then {_findNearestPole set [(count _findNearestPole),_x]}} foreach (nearestObjects[_this, ["Plastic_Pole_EP1_DZ"], ((DZE_PlotPole sel 0)*1.5)]);
				_isNearPlot = count (_findNearestPole);
				_canBuildOnPlot = false;
				if (_isNearPlot == 0) then {_canBuildOnPlot = true} else {
					_nearestPole = _findNearestPole sel 0;
					_ownerID = _nearestPole xgv ["CharacterID","0"];
					if (PIDP_playerUID == _ownerID) then {_canBuildOnPlot = true} else {
						_friendlies = player xgv ["friendlyTo",[]];
						_friendList = player xgv ["AH_friendlist",[]];
						if ((_ownerID in _friendlies)||(_ownerID in _friendList)) then {_canBuildOnPlot = true};
					};
				};
				_canBuildOnPlot;
			};
			if (!(_position call _canbuildcheck)&&(isNil "AM_Epoch_ADMIN_norestrict")&&(_requireplot != 0)&&(!_isLandFireDZ)) then {
				_cancel = true;
				_reason = "You can not build near this person's plot pole.";
			};
			if ((((vehicle player) call AH_fnc_getPos) sel 2 > DZE_maxBuildHeight)&&(isNil "AM_Epoch_ADMIN_norestrict")) then {
				_cancel = true;
				_reason = "You are not allowed to build over 100m altitude.";
			};
			detach _object;
			deleteVehicle _object;
			detach _objectHelper;
			deleteVehicle _objectHelper;
			if ((isOnRoad _position)&&(isNil "AM_Epoch_ADMIN_norestrict")&&(!DZE_BuildOnRoads)) then {_cancel = true; _reason = "Cannot build on a road."};
			if ((!canbuild)&&(isNil "AM_Epoch_ADMIN_norestrict")) then {_cancel = true; _reason = "Cannot build in a city."};
			if (!_cancel) then {
				_classname = _classnametmp;
				_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
				_tmpbuilt setdir _dir;
				_tmpbuilt sdu _vector;
				if (_classname in GG_indestructables) then {
					_tmpbuilt allowDamage false;
					_tmpbuilt aeh ["HandleDamage", {false}];
					_tmpbuilt enableSimulation false;
				} else {_tmpbuilt addEventHandler ["HandleDamage", {_this call GG_bohandleDamage}]};
				_location = _position;
				if ((_isAllowedUnderGround == 0) && ((_location sel 2) < 0)) then {_location set [2,0]};
				_buildOffset = [0,0,0];
				_vUp = _vector sel 1;
				if (_classname == "MetalFloor_DZ") then {_buildOffset = [(_vUp sel 0) * .148, (_vUp sel 1) * .148,0]};
				_location = [(_location sel 0) - (_buildOffset sel 0),(_location sel 1) - (_buildOffset sel 1),(_location sel 2) - (_buildOffset sel 2)];
				_tmpbuilt setPosATL _location;
				_msg = fmt [(lzl "str_epoch_player_138"),_text];
				systemChat ("(GG-AH): "+str _msg);
				_msg swx AH_fnc_dynTextMsg;
				_limit = 3;
				if (isNumber (xcf >> "CfgVehicles" >> _classname >> "constructioncount")) then {_limit = xgn(xcf >> "CfgVehicles" >> _classname >> "constructioncount")};
				_isOk = true;
				_proceed = false;
				_counter = 0;
				while {_isOk} do {
					if ((!isNil "AM_Epoch_ADMIN")||(gpd player in GG_instntbarra)) exw {
						_isOk = false;
						_proceed = true;
						_msg = "Instant build! Thanks for donating!";
						systemChat ("(EPOCH BOOSTER): "+str _msg);
						_msg swx AH_fnc_dynTextMsg;
					};
					[10,10] call dayz_HungerThirst;
					player playActionNow "Medic";
					_dis=20;
					_sfx = "repair";
					[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
					[player,_dis,true,(player call AH_fnc_getPos)] swx player_alertZombies;
					r_interrupt = false;
					_animState = xas player;
					r_doLoop = true;
					_started = false;
					_finished = false;
					while {r_doLoop} do {
						_animState = xas player;
						_isMedic = ["medic",_animState] call fnc_inString;
						if (_isMedic) then {_started = true};
						if (_started && !_isMedic) then {
							r_doLoop = false;
							_finished = true;
						};
						if (r_interrupt || (player xgv ["combattimeout", 0] >= time)) then {r_doLoop = false};
						if (DZE_cancelBuilding) exw {r_doLoop = false};
						uiSleep 0.1;
					};
					r_doLoop = false;
					if (!_finished) exw {
						_isOk = false;
						_proceed = false;
					};
					if (true) exw {
						_isOk = false;
						_proceed = true;
					};
				};
				if (_proceed) then {
					_num_removed = ([player,_item] call BIS_fnc_invRemove);
					if (_item == "HeliH") then {_num_removed = ([player,"ItemVault"] call BIS_fnc_invRemove)};
					if (_item == "Land_MBG_Garage_Single_C") then {_num_removed = ([player,"cinder_garage_kit"] call BIS_fnc_invRemove)};
					if (_num_removed == 1) then {
						_msg = fmt [lzl "str_build_01",_text];
						systemChat ("(GG-AH): "+str _msg);
						if (_isPole) then {[] swx player_plotPreview};
						_tmpbuilt xsv ["OEMPos",_location,true];
						if (_lockable > 1) then {
							_combinationDisplay = "";
							switch (_lockable) do {
								case 2: {
									_combination_1 = (floor(random 3)) + 100;
									_combination_2 = floor(random 10);
									_combination_3 = floor(random 10);
									_combination = fmt ["%1%2%3",_combination_1,_combination_2,_combination_3];
									if (_combination_1 == 100) then {_combination_1_Display = "Red"};
									if (_combination_1 == 101) then {
										_combination_1_Display = "Green";
									};
									if (_combination_1 == 102) then {
										_combination_1_Display = "Blue";
									};
									_combinationDisplay = fmt ["%1%2%3",_combination_1_Display,_combination_2,_combination_3];
								};
								case 3: {
									_combination_1 = floor(random 10);
									_combination_2 = floor(random 10);
									_combination_3 = floor(random 10);
									_combination = fmt ["%1%2%3",_combination_1,_combination_2,_combination_3];
									_combinationDisplay = _combination;
								};
								case 4: {
									_msg = "Please sel your desired safe code, maximum 8 digits.";
									systemChat ("(GG-AH): "+str _msg);
									_msg swx AH_fnc_dynTextMsg;
									
									dayz_combination = "";
									_oldupd = ckc_updSafe;
									ckc_updSafe = {};
									cdx "ckc_SafeUI";
									waitUntil {(izn (findDisplay 118338))};
									ckc_updSafe = _oldupd;
									
									if (parseNumber dayz_combination > 99999999) then {
										_combination_1 = floor(random 10);
										_combination_2 = floor(random 10);
										_combination_3 = floor(random 10);
										_combination_4 = floor(random 10);
										_combination = fmt ["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
										_combinationDisplay = _combination;
									} else {
										_combination = dayz_combination;
										_combinationDisplay = dayz_combination;
									};
								};
							};
							_tmpbuilt xsv ["CharacterID",_combination,true];
							PVDZE_obj_Publish = [_combination,_tmpbuilt,[_dir,_location,_vector],_classname];
							publicVariableServer "PVDZE_obj_Publish";
							_msg = fmt [(lzl "str_epoch_player_140"),_combinationDisplay,_text];
							systemChat ("(GG-AH): "+str _msg);
						} else {
							_tmpbuilt xsv ["CharacterID",PIDP_playerUID,true];
							if (_tmpbuilt iko "Land_Fire_DZ") then {
								_tmpbuilt swx player_fireMonitor;
							} else {
								PVDZE_obj_Publish = [PIDP_playerUID,_tmpbuilt,[_dir,_location,_vector],_classname];
								publicVariableServer "PVDZE_obj_Publish";
							};
						};
					} else {
						deleteVehicle _tmpbuilt;
						_msg = (lzl "str_epoch_player_46");
						systemChat ("(GG-AH): "+str _msg);
						_msg swx AH_fnc_dynTextMsg;
					};
				} else {
					r_interrupt = false;
					if (vehicle player == player) then {
						[objNull, player, rSwitchMove,""] call RE;
						player playActionNow "stop";
					};
					deleteVehicle _tmpbuilt;
					_msg = (lzl "str_epoch_player_46");
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
			} else {
				if !(isNil "_tmpbuilt") then {deleteVehicle _tmpbuilt};
				_msg = fmt ["Canceled construction of %1 %2.",_text,_reason];
				systemChat ("(GG-AH): "+str _msg);
				_msg swx AH_fnc_dynTextMsg;
			};
		};
		DZE_ActionInProgress = false;
	};
	player_wearClothes = {
		private ["_item","_hasclothesitem","_config","_text","_myModel","_itemNew","_currentSex","_newSex","_model","_playerNear"];
		if (DZE_ActionInProgress) exw {cutText [(lzl "str_epoch_player_83") , "PLAIN DOWN"]};
		DZE_ActionInProgress = true;
		_item = _this;
		call gear_ui_init;
		if ((xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1) exw {
			DZE_ActionInProgress = false;
			cutText [(lzl "str_player_21") , "PLAIN DOWN"]
		};
		_hasclothesitem = _this in magazines player;
		_config = xcf >> "CfgMagazines";
		_text = getText (_config >> _item >> "displayName");
		if (!_hasclothesitem) exw {
			DZE_ActionInProgress = false;
			cutText [fmt [(lzl "str_player_31"),_text,"wear"] , "PLAIN DOWN"]
		};
		if (vehicle player != player) exw {
			DZE_ActionInProgress = false;
			cutText [(lzl "str_epoch_player_85"), "PLAIN DOWN"]
		};
		if ("CSGAS" in (magazines player)) exw {
			DZE_ActionInProgress = false;
			cutText [(lzl "STR_EPOCH_ACTIONS_10"), "PLAIN DOWN"]
		};
		if (!izn (unitBackpack player)) then {
			GG_oldbp = typeOf(unitBackpack player);
			player addbackpack "DZ_TerminalPack_EP1";
			sleep 0.1;
			removeBackpack player;
		};
		_myModel = (typeOf player);
		_itemNew = "Skin_" + _myModel;
		if ((isClass(_config >> _itemNew))) then {
			if ((isClass(_config >> _item))) then {
				_currentSex = getText (xcf >> "CfgSurvival" >> "Skins" >> _itemNew >> "sex");
				_newSex = getText (xcf >> "CfgSurvival" >> "Skins" >> _item >> "sex");
				if (_currentSex == _newSex) then {
					_model = getText (xcf >> "CfgSurvival" >> "Skins" >> _item >> "playerModel");
					if (_model != _myModel) then {
						if (([player,_item] call BIS_fnc_invRemove) == 1) then {
							player addMagazine _itemNew;
							[dayz_playerUID,dayz_characterID,_model] swx player_humanityMorph;
						};
					};
				} else {cutText [(lzl "str_epoch_player_86"), "PLAIN DOWN"]};
			};
		};
		DZE_ActionInProgress = false;
	};
	player_switchModel = {
		private ["_weapons","_backpackWpn","_backpackMag","_currentWpn","_backpackWpnTypes","_backpackWpnQtys","_countr","_class","_position","_dir","_currentAnim","_playerUID","_countMags","_magazines","_primweapon","_secweapon","_muzzles","_oldUnit","_group","_newUnit","_playerObjName"];
		_class 			= _this;
		_position 		= player call AH_fnc_getPos;
		_dir 			= getDir player;
		_currentAnim 	= xas player;
		_playerUID 		= gpd player;
		_weapons 		= weapons player;
		_countMags 		= call player_countMagazines;
		_magazines 		= _countMags sel 0;
		if ((_playerUID == dayz_playerUID) && (count _magazines == 0) && (count (magazines player) > 0 )) exw {cutText [(lzl "str_epoch_player_17"),"PLAIN DOWN"]};
		_primweapon		= primaryWeapon player;
		_secweapon		= secondaryWeapon player;
		_currentWpn 	= currentWeapon player;
		_muzzles 		= getArray(xcf >> "cfgWeapons" >> _currentWpn >> "muzzles");
		if (!(_primweapon in _weapons) && (_primweapon != "")) then {_weapons = _weapons + [_primweapon]};
		if (!(_secweapon in _weapons) && (_secweapon != "")) then {_weapons = _weapons + [_secweapon]};
		if (count _muzzles > 1) then {_currentWpn = currentMuzzle player};
		dayz_myBackpack = unitBackpack player;
		[player,dayz_spawnPos] call AH_fnc_setPos;
		_oldUnit = player;
		_group = createGroup west;
		_newUnit = _group createUnit [_class,dayz_spawnPos,[],0,"NONE"];
		[_newUnit,_position] call AH_fnc_setPos;
		_newUnit setDir _dir;
		{_newUnit removeMagazine _x} count (magazines _newUnit);
		removeAllWeapons _newUnit;
		{if (typeName _x == "ARRAY") then {if ((count _x) > 0) then {_newUnit addMagazine [(_x sel 0),(_x sel 1)]}} else {_newUnit addMagazine _x}} count _magazines;
		{_newUnit addWeapon _x} count _weapons;
		if (str(_weapons) != str(weapons _newUnit)) then {
			{_weapons = _weapons - [_x]} count (weapons _newUnit);
			{_newUnit addWeapon _x} count _weapons;
		};
		if (_primweapon != (primaryWeapon _newUnit)) then {_newUnit addWeapon _primweapon};
		if (_primweapon == "MeleeCrowbar") then {_newUnit addMagazine 'crowbar_swing'};
		if (_primweapon == "MeleeSledge") then {_newUnit addMagazine 'sledge_swing'};
		if (_primweapon == "MeleeHatchet_DZE") then {_newUnit addMagazine 'Hatchet_Swing'};
		if (_primweapon == "MeleeMachete") then {_newUnit addMagazine 'Machete_swing'};
		if (_primweapon == "MeleeFishingPole") then {_newUnit addMagazine 'Fishing_Swing'};
		if (_secweapon != (secondaryWeapon _newUnit) && _secweapon != "") then {_newUnit addWeapon _secweapon};
		
		addSwitchableUnit _newUnit;
		setPlayable _newUnit;
		selectPlayer _newUnit;
		removeAllWeapons _oldUnit;
		{_oldUnit removeMagazine _x} count  magazines _oldUnit;
		deleteVehicle _oldUnit;
		if (_currentWpn != "") then {_newUnit selectWeapon _currentWpn};
		
		[objNull,player,rSwitchMove,_currentAnim] call RE;
		player disableConversation true;
		player xsv ["bodyName",dayz_playerName,true];
		_playerUID = gpd player;
		xcc fmt ["PVDZE_player%1 = player;publicVariableServer 'PVDZE_player%1';",_playerUID];
		if ((getText (xcf >> "CfgWeapons" >> (primaryWeapon player) >> "melee")) == "true") then dayz_meleeMagazineCheck;
		{player reveal _x} count (nearestObjects [player call AH_fnc_getPos,dayz_reveal,50]);
	};
	player_humanityMorph = {
		private ["_updates","_playerUID","_charID","_humanity","_worldspace","_model","_friendlies","_fractures","_old","_medical","_zombieKills","_headShots","_humanKills","_banditKills","_tagList"];
		_playerUID 	= _this sel 0;
		_charID 	= _this sel 1;
		_model 		= _this sel 2;
		if (typeOF player == _model) exw {cutText ['You''re already wearing this skin!','PLAIN']};
		_old = player;
		player allowDamage false;
		if !(isNil 'eh_player_killed') then {__reh(FiredNear,eh_player_killed)};
		if !(isNil 'mydamage_eh1') then {__reh(HandleDamage,mydamage_eh1)};
		if !(isNil 'mydamage_eh3') then {__reh(Killed,mydamage_eh3)};
		if !(isNil 'mydamage_eh2') then {__reh(Fired,mydamage_eh2)};
		_updates = player xgv ["updatePlayer",[false,false,false,false,false]];
		_updates set [0,true];
		player xsv ["updatePlayer",_updates,true];
		dayz_unsaved = true;
		_humanity		= player xgv ["humanity",0];
		_medical 		= player call player_sumMedical;
		_worldspace 	= [round(direction player),player call AH_fnc_getPos];
		_zombieKills 	= player xgv ["zombieKills",0];
		_headShots 		= player xgv ["headShots",0];
		_cashMoney 		= player xgv ["GGCoins",0];
		_bankMoney 		= player xgv ["GGBank",0];
		_humanKills 	= player xgv ["humanKills",0];
		_banditKills 	= player xgv ["banditKills",0];
		_friendlies		= player xgv ["friendlies",[]];
		_tagList		= player xgv ["tagList",[]];
		_friendlist 	= pns xgv ['AH_friendlist',[]];
		_model call player_switchModel;
		if (count _medical > 0) then {
			player xsv ["USEC_isDead",(_medical sel 0),true];
			player xsv ["NORRN_unconscious",(_medical sel 1),true];
			player xsv ["USEC_infected",(_medical sel 2),true];
			player xsv ["USEC_injured",(_medical sel 3),true];
			player xsv ["USEC_inPain",(_medical sel 4),true];
			player xsv ["USEC_isCardiac",(_medical sel 5),true];
			player xsv ["USEC_lowBlood",(_medical sel 6),true];
			player xsv ["USEC_BloodQty",(_medical sel 7),true];
			player xsv ["unconsciousTime",(_medical sel 10),true];
			{
				player xsv [_x,true,true];
				usecBleed = [player,_x,0];
				publicVariable "usecBleed";
			} count (_medical sel 8);
			_fractures = (_medical sel 9);
			[player,"legs",(_fractures sel 0)] call object_setHit;
			[player,"hands",(_fractures sel 1)] call object_setHit;
		} else {
			player xsv ["hit_legs",0,true];
			player xsv ["hit_hands",0,true];
			player xsv ["USEC_injured",false,true];
			player xsv ["USEC_inPain",false,true];
		};
		player xsv ["GGCoins",_cashMoney,true];
		player xsv ["GGBank",_bankMoney,true];
		player xsv ["humanity",_humanity,true];
		player xsv ["zombieKills",_zombieKills,true];
		player xsv ["headShots",_headShots,true];
		player xsv ["GGCoins",_cashMoney,true];
		player xsv ["GGBank",_bankMoney,false];
		player xsv ["humanKills",_humanKills,true];
		player xsv ["banditKills",_banditKills,true];
		player xsv ["CharacterID",dayz_characterID,true];
		player xsv ["worldspace",_worldspace,true];
		player xsv ["friendlies",_friendlies,true];
		player xsv ["tagList",_tagList,true];
		player xsv ["AH_friendlist",_friendlist,true];
		call dayz_resetSelfActions;
		eh_player_killed = player aeh ["FiredNear",{_this call player_weaponFiredNear}];
		[player] call fnc_usec_damageHandle;
		player allowDamage true;
		player addWeapon "Loot";
		player addWeapon "Flare";
		if ((getText (xcf >> "CfgWeapons" >> (primaryWeapon player) >> "melee")) == "true") then dayz_meleeMagazineCheck;
		if (!izn _old) then {deleteVehicle _old};
		if (!isNil 'GG_oldbp') then {
			player action ["takeBag",nearestObject [player,GG_oldbp]];
			GG_oldbp = nil;
		};
	};
	player_nearPP = {_findNearestPole = [];{if (alive _x) then {_findNearestPole set [(count _findNearestPole),_x];};} foreach (nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole sel 0]);_findNearestPole;};
	player_canBuildPP = {_findNearestPole = call player_nearPP;_isNearPlot = count (_findNearestPole);_canBuildOnPlot = false;if (_isNearPlot == 0) then {_canBuildOnPlot = true;} else {_nearestPole = _findNearestPole sel 0;_ownerID = _nearestPole xgv ["CharacterID","0"];if (PIDP_playerUID == _ownerID) then {_canBuildOnPlot = true} else {_friendlies = player xgv ["friendlyTo",[]];_friendList = player xgv ["AH_friendlist",[]];if ((_ownerID in _friendlies)||(_ownerID in _friendList)) then {_canBuildOnPlot = true};};};_canBuildOnPlot;};
	player_plotPreview = {private ["_location","_object","_objects","_i","_dir","_nearPlotPole"];_nearPlotPole = nearestObject [player, "Plastic_Pole_EP1_DZ"];_BD_radius = DZE_PlotPole sel 0;_BD_center = _nearPlotPole call AH_fnc_getPos;_objects = [];if (isNil "plot_previewArrows") then {plot_previewArrows = []};_msg = "Plot pole preview loaded, check for red arrows.";systemChat ("(GG-AH): "+str _msg);_msg swx AH_fnc_dynTextMsg;for "_i" from 0 to 360 step (600 / _BD_radius) do {_location = [(_BD_center sel 0) + ((cos _i) * _BD_radius), (_BD_center sel 1) + ((sin _i) * _BD_radius), _BD_center sel 2];_object = "Sign_arrow_down_large_EP1" createVehicleLocal _location;plot_previewArrows = plot_previewArrows + [_object];};uiSleep 30;{deleteVehicle _x;} foreach plot_previewArrows;plot_previewArrows = [];_msg = "Plot pole preview has been deleted!";systemChat ("(GG-AH): "+str _msg);_msg swx AH_fnc_dynTextMsg;};
	player_spawnCheck = {
		private ["_type","_inVehicle","_dateNow","_maxWildZombies","_age","_radius","_position","_markerstr","_markerstr1","_markerstr2","_markerstr3","_nearByObj","_handle","_looted","_cleared","_zombied","_config","_canLoot","_dis","_players","_nearby","_nearbyCount","_onTheMove","_soundLimit"];
		_type 		= _this sel 0;
		_inVehicle 	= (vehicle player != player);
		_onTheMove 	= (speed (vehicle player) > 10);
		_dateNow 	= (DateToNumber date);
		_age 		= -1;
		_radius 	= 200;
		_position 	= player call AH_fnc_getPos;
		_soundLimit = 2;
		
		dayz_spawnZombies = 0;
		dayz_CurrentZombies = 0;
		{
			if (!alive _x) then {
				if (!(_x iko "zZombie_Base")) then {
					[player,"flysound",1,true] call dayz_zombieSpeak;
					_soundLimit = _soundLimit - 1;
				};
			};
			if (_soundLimit == 0) exw {};
		} count (nearestObjects [player, ["CAManBase"], 8]);

		_players = _position nearEntities ["CAManBase",_radius+200];
		dayz_maxGlobalZombies = dayz_maxGlobalZombiesInit;
		{
			if (isPlayer _x) then {dayz_maxGlobalZombies = dayz_maxGlobalZombies + dayz_maxGlobalZombiesIncrease} else {
				if (_x iko "zZombie_Base") then {
					if (local _x) then {dayz_spawnZombies = dayz_spawnZombies + 1};
					dayz_CurrentZombies = dayz_CurrentZombies + 1;
				};
			};
		} count _players;
		
		_nearby = _position nearObjects ["building",_radius];
		_nearbyCount = count _nearby;
		if (_nearbyCount < 1) exw {if ((dayz_spawnZombies < 3) && !_inVehicle)  then {[_position] call wild_spawnZombies}};
		{
			_type 	= typeOf _x;
			_config = if (DZE_MissionLootTable) then [{missionConfigFile >> "CfgBuildingLoot" >> _type},{xcf >> "CfgBuildingLoot" >> _type}];
			if (isClass (_config)) then {
				_dis = _x distance player;
				if ((_dis < 120) && (_dis > 30) && !_inVehicle) then {
					_looted = (_x xgv ["looted",-0.1]);
					_cleared = (_x xgv ["cleared",true]);
					_dateNow = (DateToNumber date);
					_age = (_dateNow - _looted) * 525948;
					if ((_age > DZE_LootSpawnTimer) && (!_cleared)) then {
						_nearByObj = nearestObjects [(_x call AH_fnc_getPos), ["WeaponHolder","WeaponHolderBase"],((sizeOf _type)+5)];
						{deleteVehicle _x} count _nearByObj;
						_x xsv ["cleared",true,true];
						_x xsv ["looted",_dateNow,true];
					};
					if ((_age > DZE_LootSpawnTimer) && (_cleared)) then {
						_x xsv ["looted",_dateNow,true];
						_x call building_spawnLoot;
					};
				};
				if (!_onTheMove) then {
					if ((time - dayz_spawnWait) > dayz_spawnDelay) then {
						if (dayz_maxCurrentZeds < dayz_maxZeds) then {
							if (dayz_CurrentZombies < dayz_maxGlobalZombies) then {
								if (dayz_spawnZombies < dayz_maxLocalZombies) then {
										_zombied = (_x xgv ["zombieSpawn",-0.1]);
										_dateNow = (DateToNumber date);
										_age = (_dateNow - _zombied) * 525948;
										if (_age > 3) then {
											_x xsv ["zombieSpawn",_dateNow,true];
											[_x] call building_spawnZombies;
										};
								} else {dayz_spawnWait = time};
							};
						};
					};
				};
			};
		} forEach _nearby;
	};
	player_checkitems = {
		private ["_items","_inventory","_hasItems","_itemIn","_countIn","_qty","_missing","_missingQty","_textMissing"];
		_items = _this;
		_inventory = magazines player;
		_hasItems = true;
		{
			_itemIn = "";
			_countIn = 1;
			if (typeName _x == "ARRAY") then {
				if (count _x > 0) then {
					_itemIn = _x sel 0;
					if (count _x > 1) then {_countIn = _x sel 1};
				};
			} else {_itemIn = _x};
			if (_itemIn != "") then {
				_qty = { (_x == _itemIn) || (configName(inheritsFrom(xcf >> "cfgMagazines" >> _x)) == _itemIn) } count _inventory;
			} else {_qty = _countIn};
			if (_qty < _countIn) exw {
				_missing = _itemIn;
				_missingQty = (_countIn - _qty);
				_hasItems = false;
				_textMissing = getText(xcf >> "CfgMagazines" >> _missing >> "displayName");
				cutText [fmt [(lzl "STR_EPOCH_ACTIONS_12"), _missingQty, _textMissing], "PLAIN DOWN"];
			};
		} forEach _items;
		_hasItems
	};
	player_spawn_1 = {
		private ["_handle","_cursor","_delMe","_first","_town","_day","_world","_nearestCity"];
		_timer = diag_tickTime;
		_timer1 = diag_tickTime;
		_spawnCheck = diag_tickTime;
		_timer2 = diag_Ticktime;
		_NewDay  = diag_tickTime;
		while {1 == 1} do {
			if ((diag_tickTime - _timer2) >= 0.5) then {
				[] call fnc_usec_damageActions;
				[] call fnc_usec_selfActions;
				_timer2 = diag_Ticktime;
			};
			if ((diag_tickTime - _timer) >= 300) then {
				dayz_currentGlobalAnimals = count entities "CAAnimalBase";
				dayz_currentGlobalZombies = count entities "zZombie_Base";
				[] swx player_animalCheck;
				_timer = diag_tickTime;
			};
			if ((diag_tickTime - _timer1) >= 60) then {
				_position = player call AH_fnc_getPos;
				dayz_spawnZombies = {alive _x AND local _x} count (_position nearEntities ["zZombie_Base",200]);
				dayz_CurrentNearByZombies = {alive _x} count (_position nearEntities ["zZombie_Base",200]);
				dayz_currentWeaponHolders = count (_position nearObjects ["ReammoBox",100]);
				_timer1 = diag_tickTime;
			};
			if ((diag_tickTime - _spawnCheck) >= 14) then {
				["both"] swx player_spawnCheck;
				_spawnCheck  = diag_tickTime;
			};
			if ((diag_tickTime - _NewDay) >= 5) then {
				private "_day";
				_day = round(360 * (dateToNumber date));
				if (dayz_currentDay != _day) then {
					dayz_sunRise = call world_sunRise;
					dayz_currentDay = _day;
				};
				_NewDay  = diag_tickTime;
				_world = toUpper(worldName);
				_nearestCity = nearestLocations [(player call AH_fnc_getPos), ["NameCityCapital","NameCity","NameVillage","NameLocal"],300];
				if (count _nearestCity > 0) then {
					_town = text (_nearestCity sel 0);
					if (dayz_PreviousTown == "Wilderness") then {dayz_PreviousTown = _town};
					if (_town != dayz_PreviousTown) then {_first = [_world,_town,""] swx BIS_fnc_infoText};
					dayz_PreviousTown = _town;
				};
			};
			uiSleep 0.5;
		};
	};
	player_craftMsg = {["<t color='#FF0000'>"+_this+"</t>",safeZoneX * 0.1,safeZoneY * -0.5,3,0,0,77398] swx AH_fnc_dynamictext};
	player_craftItem = {cdg 0;private ["_crafting","_baseClass","_item","_abort","_distance","_reason","_waterLevel","_canDo","_outputWeapons","_selectedRecipeOutput","_needNear","_isNear","_selectedRecipeTools","_selectedRecipeInput","_selectedRecipeInputStrict","_inputWeapons","_sfx","_randomOutput","_craft_doLoop","_tradeComplete","_temp_removed_array","_missing","_missingTools","_hastoolweapon","_proceed","_itemIn","_countIn","_qty","_missingQty","_finished","_removed_total","_tobe_removed_total","_waterLevel_lowest","_removed","_configParent","_num_removed","_num_removed_weapons","_selectedWeapon","_selectedMag","_itemOut","_countOut","_textCreate","_textMissing"];if (player xgv['combattimeout',0] >= time) exw {cutText ["Can not craft in combat!","PLAIN DOWN"]};if (DZE_ActionInProgress) exw { cutText [(lzl "str_epoch_player_63") , "PLAIN DOWN"]; };DZE_ActionInProgress = true;_crafting 	= _this sel 0;_baseClass 	= _this sel 1;_item 		= _this sel 2;_abort 		= false;_distance 	= 3;_reason 	= "";_waterLevel = 0;_canDo 		= (!r_drag_sqf && !r_player_unconscious && !((xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1));_outputWeapons = [];_selectedRecipeOutput = [];_needNear = getArray (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "neednearby");switch (true) do {case ("fire" in _needNear): {_isNear = {inflamed _x} count ((player call AH_fnc_getPos) nearObjects _distance);if (_isNear == 0) then {_abort = true;_reason = "fire";};};case ("workshop" in _needNear): {_isNear = count (nearestObjects [player, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);if (_isNear == 0) then {_abort = true;_reason = "workshop";};};};if (_abort) exw {cutText [fmt [(lzl "str_epoch_player_149"),_reason,_distance], "PLAIN DOWN"];DZE_ActionInProgress = false;};if (_canDo) then {_selectedRecipeTools = getArray (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "requiretools");_selectedRecipeOutput = getArray (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "output");_selectedRecipeInput = getArray (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "input");_selectedRecipeInputStrict = if ((isNumber (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputstrict")) && (xgn (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputstrict") > 0)) then {true} else {false};_outputWeapons = getArray (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "outputweapons");_inputWeapons = getArray (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputweapons");_sfx = getText(xcf >> _baseClass >> _item >> "sfx");if (_sfx == "") then {_sfx = "repair"};_randomOutput = if (isNumber (xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "randomOutput")) then [{xgn(xcf >> _baseClass >> _item >> "ItemActions" >> _crafting >> "randomOutput")},{0}];_craft_doLoop = true;_tradeComplete = 0;DZE_cancelBuilding = false;while {_craft_doLoop} do {_temp_removed_array = [];_missing = "";_missingTools = false;{_hastoolweapon = _x in weapons player;if (!_hastoolweapon) exw { _craft_doLoop = false; _missingTools = true; _missing = _x; };} forEach _selectedRecipeTools;if (!_missingTools) then {_proceed = true;if (count _selectedRecipeInput > 0) then {{_itemIn = _x sel 0;_countIn = _x sel 1;_qty = { (_x == _itemIn) || (!_selectedRecipeInputStrict && configName(inheritsFrom(xcf >> "cfgMagazines" >> _x)) == _itemIn) } count magazines player;if (_qty < _countIn) exw { _missing = _itemIn; _missingQty = (_countIn - _qty); _proceed = false; };} forEach _selectedRecipeInput;};if (_proceed) then {sleep 0.1;_crti = time;_crpo = (vehicle player) call AH_fnc_getPos;_tocancel = "<br/>Move to cancel crafting. ";if (gpd player in GG_notimerarra) then {if !(pns xgv ['AH_instacraft',false]) then {_tocancel = "";("<t size='0.5'>Insta craft: Toggle menu with !instacraft.</t>") call player_craftMsg;cont_crft = nil;GGSpawn = [['Insta-craft', true],['Craft?',[-1],'',-5,[['expression','']],'1','0'],['Yes',[2],'',-5,[['expression','cont_crft=true;']],'1','1'],['No',[3],'',-5,[['expression','cont_crft=false;']],'1','1'],['',[-1],'',-5,[['expression','']],'1','0'],['Exit', [10], '', -5, [['expression', '']], '1','1'],['', [-1], '', -5, [['expression', '']], '1', '0']];showCommandingMenu '#USER:GGSpawn';waitUntil {((!isNil 'cont_crft')||(commandingMenu == ''))};if (!cont_crft) then {DZE_cancelBuilding = true};} else {_tocancel = "<br/>Press ESC to cancel crafting.";("<t size='0.5'>Insta craft: Toggle menu with !instacraft.</t>"+_tocancel) call player_craftMsg;sleep 1;};} else {waitUntil {_ciret = false;_elps = round(time - _crti);_tlft = (3 - _elps);if ((_crpo distance (vehicle player) > 3)||(player xgv['combattimeout',0] >= time)||(_elps >=3)) then {_ciret = true;if (_elps < 3) then {DZE_cancelBuilding = true};};("<t size='0.5'>Crafting complete in "+str _tlft+"</t>"+_tocancel) call player_craftMsg;_ciret;};};if (DZE_cancelbuilding) then {DZE_cancelBuilding = false;r_interrupt = false;_craft_doLoop = false;("Cancelled crafting.") call player_craftMsg;} else {[player,_sfx,0,false] call dayz_zombieSpeak;_removed_total = 0;_tobe_removed_total = 0; _waterLevel_lowest = 0;{_removed = 0;_itemIn = _x sel 0;_countIn = _x sel 1;_tobe_removed_total = _tobe_removed_total + _countIn;{_configParent = configName(inheritsFrom(xcf >> "cfgMagazines" >> _x));if ((_x == _itemIn) || (!_selectedRecipeInputStrict && _configParent == _itemIn)) then {if ((_x == "ItemWaterbottle") ||( _configParent == "ItemWaterbottle")) then {_waterLevel = xgn(xcf >> "CfgMagazines" >> _x >> "wateroz");if (_waterLevel_lowest == 0 || _waterLevel < _waterLevel_lowest) then {_waterLevel_lowest = _waterLevel};};};} forEach (magazines player);{_configParent = configName(inheritsFrom(xcf >> "cfgMagazines" >> _x));if ( (_removed < _countIn) && ((_x == _itemIn) || (!_selectedRecipeInputStrict && _configParent == _itemIn))) then {_num_removed = if ((_waterLevel_lowest == 0) || ((_waterLevel_lowest > 0) && (xgn(xcf >> "CfgMagazines" >> _x >> "wateroz") == _waterLevel_lowest))) then [{([player,_x] call BIS_fnc_invRemove)},{0}];_removed = _removed + _num_removed;_removed_total = _removed_total + _num_removed;if (_num_removed >= 1) then {if (_x == "ItemWaterbottle" || _configParent == "ItemWaterbottle") then {_waterLevel = floor((xgn(xcf >> "CfgMagazines" >> _x >> "wateroz")) - 1)};_temp_removed_array set [count _temp_removed_array,_x];};};} forEach (magazines player);} forEach _selectedRecipeInput;if (_removed_total == _tobe_removed_total) then {_num_removed_weapons = 0;{_num_removed_weapons = _num_removed_weapons + ([player,_x] call BIS_fnc_invRemove)} forEach _inputWeapons;if (_num_removed_weapons == (count _inputWeapons)) then {if (_randomOutput == 1) then {if (!isNil "_outputWeapons" && count _outputWeapons > 0) then {_selectedWeapon = _outputWeapons call BIS_fnc_selectRandom;_outputWeapons = [_selectedWeapon];};if (!isNil "_selectedRecipeOutput" && count _selectedRecipeOutput > 0) then {_selectedMag = _selectedRecipeOutput call BIS_fnc_selectRandom;_selectedRecipeOutput = [_selectedMag];};_craft_doLoop = false;};{player addWeapon _x;} forEach _outputWeapons;{_itemOut = _x sel 0;_countOut = _x sel 1;if (_itemOut == "ItemWaterbottleUnfilled") then {if (_waterLevel > 0) then {_itemOut = fmt ["ItemWaterbottle%1oz",_waterLevel];};};for "_x" from 1 to _countOut do {player addMagazine _itemOut;};_textCreate = getText(xcf >> "CfgMagazines" >> _itemOut >> "displayName");("<t size='0.5'>Crafted "+str _countOut+" "+str _textCreate+"</t>"+_tocancel) call player_craftMsg;sleep 1;} forEach _selectedRecipeOutput;_tradeComplete = _tradeComplete+1;};} else {{player addMagazine _x;} forEach _temp_removed_array;fmt ["Missing parts after first check Item: %1 / %2",_removed_total,_tobe_removed_total] call player_craftMsg;};};} else {_textMissing = getText(xcf >> "CfgMagazines" >> _missing >> "displayName");fmt ["%3 complete, missing %1 more of %2",_missingQty, _textMissing,_tradeComplete] call player_craftMsg;_craft_doLoop = false;};} else {_textMissing = getText(xcf >> "CfgWeapons" >> _missing >> "displayName");fmt ["Missing tool %1",_textMissing] call player_craftMsg;_craft_doLoop = false;};};};DZE_ActionInProgress = false;};
	player_unlockVault = {
		private ["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_holder","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr","_alreadyPacking","_playerNear","_playerID","_claimedBy","_unlockedClass","_text","_nul","_objType"];
		if (DZE_ActionInProgress) exw {
			_msg = (lzl "str_epoch_player_21");
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		DZE_ActionInProgress = true;
		{player rac _x} forEach s_player_combi;
		s_player_combi = [];
		s_player_unlockvault = 1;
		_obj = _this;
		_objType = typeOf _obj;
		
		_nobuildcheck = "";
		{
			private ["_pos","_dis","_loc","_rng"];
			_pos = _x sel 0;
			_dis = (_x sel 1) sel 1;
			_loc = _x sel 2;
			_rng = (player distance _pos);
			if (_rng <= _dis) exw {
				_nobuildcheck = fmt ["You can not build within %1m of %2. Current distance: %3m",_dis,_loc,_rng];
			};
		} forEach DZE_nobuildarray;
		if ((_nobuildcheck != "")&&(count ((_obj xgv ["WeaponCargo",[]]) sel 0) == 0)&&(count ((_obj xgv ["MagazineCargo",[]]) sel 0) == 0)) exw {
			_objectID 	= _obj xgv ['ObjectID','0'];
			_objectUID 	= _obj xgv ['ObjectUID','0'];
			PVDZE_obj_Delete = [_objectID,_objectUID,player];
			publicVariableServer 'PVDZE_obj_Delete';
			
			deleteVehicle _obj;
			
			_msg = "Empty safe detected! Safe deleted, reason: "+str _nobuildcheck;
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
			
			DZE_ActionInProgress = false;
		};
		
		if (!(_objType in DZE_LockedStorage)) exw {
			s_player_unlockvault = -1;
			DZE_ActionInProgress = false;
		};
		if (_obj call dze_isnearest_player) exw {
			DZE_ActionInProgress = false;
			_msg = (lzl "str_epoch_player_20");
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		if (izn _obj || !(alive _obj)) exw {DZE_ActionInProgress = false};
		_unlockedClass 	= getText (xcf >> "CfgVehicles" >> _objType >> "unlockedClass");
		_text 			= getText (xcf >> "CfgVehicles" >> _objType >> "displayName");
		_alreadyPacking = _obj xgv ["packing",0];
		_claimedBy 		= _obj xgv ["claimed","0"];
		_ownerID 		= _obj xgv ["CharacterID","0"];
		if (_alreadyPacking == 1) exw {
			DZE_ActionInProgress = false;
			_msg = (lzl "str_epoch_player_124");
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		if ((_ownerID == dayz_combination) || (_ownerID == dayz_playerUID)) then {
			_playerNear = {isPlayer _x} count (player nearEntities ["CAManBase", 6]) > 1;
			_playerID = gpd player;
			if (_claimedBy == "0" || !_playerNear) then {
				_obj xsv ["claimed",_playerID,true];
			};
			_dir 		= direction _obj;
			_vector 	= [(vectorDir _obj),(vectorUp _obj)];
			_pos		= _obj xgv ["OEMPos",(_obj call AH_fnc_getPos)];
			_objectID 	= _obj xgv ["ObjectID","0"];
			_objectUID	= _obj xgv ["ObjectUID","0"];
			_claimedBy 	= _obj xgv ["claimed","0"];
			if (_claimedBy == _playerID) then {
				if (!izn _obj && alive _obj) then {
					PVDZE_log_lockUnlock = [player, _obj, false];
					publicVariableServer "PVDZE_log_lockUnlock";
					_obj xsv ["packing",1];
					[1,1] call dayz_HungerThirst;
					_weapons = 		_obj xgv ["WeaponCargo",[]];
					_magazines = 	_obj xgv ["MagazineCargo",[]];
					_backpacks = 	_obj xgv ["BackpackCargo",[]];
					if (gpd player in GG_notimerarra) then {
						_msg = "Vault unlock timer removed. Thanks for donating!";
						systemChat ("(EPOCH BOOSTER): "+str _msg);
						_msg swx AH_fnc_dynTextMsg;
					} else {
						_msg = "Please wait 5 seconds.. Hate timers? Donate for the epoch booster!";
						systemChat ("(GG-AH): "+str _msg);
						_msg swx AH_fnc_dynTextMsg;
						
						player playActionNow "Medic";
						[player,"repair",0,false] call dayz_zombieSpeak;
						[player,25,true,(player call AH_fnc_getPos)] swx player_alertZombies;
						disableUserInput true;disableUserInput true;disableUserInput true;
						uiSleep 5;
						disableUserInput false;disableUserInput false;disableUserInput false;
					};
					_holder = createVehicle [_unlockedClass,_pos,[], 0, "CAN_COLLIDE"];
					deleteVehicle _obj;
					_holder setdir _dir;
					_holder sdu _vector;
					[_holder,_pos] call AH_fnc_setPos;
					player reveal _holder;
					_holder xsv ["CharacterID",_ownerID,true];
					_holder xsv ["ObjectID",_objectID,true];
					_holder xsv ["ObjectUID",_objectUID,true];
					_holder xsv ["OEMPos", _pos, true];
					if (count _weapons > 0) then {
						_objWpnTypes = 	_weapons sel 0;
						_objWpnQty = 	_weapons sel 1;
						_countr = 0;
						{
							_holder addweaponcargoGlobal [_x,(_objWpnQty sel _countr)];
							_countr = _countr + 1;
						} count _objWpnTypes;
					};
					if (count _magazines > 0) then {
						_objWpnTypes = _magazines sel 0;
						_objWpnQty = _magazines sel 1;
						_countr = 0;
						{
							if ( _x != "CSGAS" ) then {
								_holder addmagazinecargoGlobal [_x,(_objWpnQty sel _countr)];
								_countr = _countr + 1;
							};
						} count _objWpnTypes;
					};
					if (count _backpacks > 0) then {
						_objWpnTypes = _backpacks sel 0;
						_objWpnQty = _backpacks sel 1;
						_countr = 0;
						{
							_holder addbackpackcargoGlobal [_x,(_objWpnQty sel _countr)];
							_countr = _countr + 1;
						} count _objWpnTypes;
					};
					_msg = fmt [(lzl "str_epoch_player_125"),_text];
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				};
			} else {
				DZE_ActionInProgress = false;
				_msg = fmt [(lzl "str_player_beinglooted"),_text];
				systemChat ("(GG-AH): "+str _msg);
				_msg swx AH_fnc_dynTextMsg;
			};
		} else {
			[nil,player,rSAY,['z_scream_4',100]] call RE;
			DZE_wrong_code = _obj xgv ["wrong_code",0];
			_obj xsv ["wrong_code",(DZE_wrong_code + 1),true];
			if (DZE_wrong_code >= 4) then {
				addCamShake [50, 60, 1000];
				for "_a" from 1000 to 1300 do {
					player say ['z_scream_4',100];
					_coef = 0.10 - ((Random 0.0010) * _a);
					(vehicle player) setVectorUp [((vectorup (vehicle player)) sel 0) + (-_coef + random (5 * _coef)), ((vectorup (vehicle player)) sel 1) + (-_coef + random (5 * _coef)), ((vectorup (vehicle player)) sel 2) + (-_coef + random (5 * _coef))];
					sleep 0.1;
				};
				if (DZE_wrong_code == 5) then {
					"<t size ='0.75' font='Zeppelin33' color='#FF0000'>You have 3 more attempts before you are killed...</t>" swx AH_fnc_dynTextMsg;
					player setHit ["legs",1];
					r_player_blood = (r_player_blood / 2);
					[player,0.4] call fnc_usec_damageunconscious;
				};
				if (DZE_wrong_code == 6) then {
					"<t size ='0.75' font='Zeppelin33' color='#FF0000'>You have 2 more attempts before you are killed...</t>" swx AH_fnc_dynTextMsg;
					player setHit ["legs",1];
					r_player_blood = (r_player_blood / 2);
					[player,0.6] call fnc_usec_damageunconscious;
				};
				if (DZE_wrong_code == 7) then {
					"<t size ='0.75' font='Zeppelin33' color='#FF0000'>You have 1 more attempt before you are killed...</t>" swx AH_fnc_dynTextMsg;
					player setHit ["legs",1];
					r_player_blood = (r_player_blood / 2);
					[player,0.8] call fnc_usec_damageunconscious;
				};
				if (DZE_wrong_code >= 8) then {[] swx player_death};
			} else {
				[10,10] call dayz_HungerThirst;
				player playActionNow "Medic";
				_msg = fmt [(lzl "str_epoch_player_126"),_text];
				systemChat ("(GG-AH): "+str _msg);
				"<t size ='0.75' font='Zeppelin33' color='#FF0000'>You have entered a code wrong "+str DZE_wrong_code+" time(s). Be careful...</t>" swx AH_fnc_dynTextMsg;
			};
		};
		s_player_unlockvault = -1;
		DZE_ActionInProgress = false;
	};
	player_lockVault = {
		private ["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_holder","_weapons","_magazines","_backpacks","_alreadyPacking","_lockedClass","_text","_playerNear"];
		if (DZE_ActionInProgress) exw {cutText [(lzl "str_epoch_player_10") , "PLAIN DOWN"]};
		DZE_ActionInProgress = true;
		player rac s_player_lockvault;
		s_player_lockvault = 1;
		_obj 		= _this;
		_objType 	= typeOf _obj;
		
		_lockedClass = getText (xcf >> "CfgVehicles" >> _objType >> "lockedClass");
		_text 		= getText (xcf >> "CfgVehicles" >> _objType >> "displayName");
		if (izn _obj) exw {DZE_ActionInProgress = false};
		[1,1] call dayz_HungerThirst;
		if (_obj call dze_isnearest_player) exw {
			DZE_ActionInProgress = false;
			_msg = (lzl "str_epoch_player_11");
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		_ownerID 	= _obj xgv ["CharacterID","0"];
		_objectID 	= _obj xgv ["ObjectID","0"];
		_objectUID	= _obj xgv ["ObjectUID","0"];
		if ((_ownerID != dayz_combination) && (_ownerID != dayz_playerUID)) exw {
			DZE_ActionInProgress = false;
			s_player_lockvault = -1;
			_msg = (lzl "str_epoch_player_115");
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		_alreadyPacking = _obj xgv ["packing",0];
		if (_alreadyPacking == 1) exw {
			DZE_ActionInProgress = false;
			s_player_lockvault = -1;
			_msg = (lzl "str_epoch_player_116");
			systemChat ("(GG-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		};
		[objNull, player, rSwitchMove,""] call RE;
		(findDisplay 106) closeDisplay 0;
		_obj xsv ["packing",1];
		_dir = direction _obj;
		_vector = [(vectorDir _obj),(vectorUp _obj)];
		_pos = _obj xgv ["OEMPos",(_obj call AH_fnc_getPos)];
		if (!izn _obj) then {
			[] spawn {
				if (gpd player in GG_notimerarra) then {
					_msg = "Vault lock timer removed. Thanks for donating!";
					systemChat ("(EPOCH BOOSTER): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
				} else {
					_msg = "Please wait 5 seconds.. Hate timers? Donate for the epoch booster!";
					systemChat ("(GG-AH): "+str _msg);
					_msg swx AH_fnc_dynTextMsg;
					
					player playActionNow "Medic";
					[player,"repair",0,false] call dayz_zombieSpeak;
					[player,25,true,(player call AH_fnc_getPos)] swx player_alertZombies;
					disableUserInput true;disableUserInput true;disableUserInput true;
					uiSleep 5;
					disableUserInput false;disableUserInput false;disableUserInput false;
				};
			};
			PVDZE_log_lockUnlock = [player, _obj, false];
			publicVariableServer "PVDZE_log_lockUnlock";
			_holder = createVehicle [_lockedClass,_pos,[], 0, "CAN_COLLIDE"];
			_holder setdir _dir;
			_holder sdu _vector;
			[_holder,_pos] call AH_fnc_setPos;
			player reveal _holder;
			_holder xsv ["CharacterID",_ownerID,true];
			_holder xsv ["ObjectID",_objectID,true];
			_holder xsv ["ObjectUID",_objectUID,true];
			_holder xsv ["OEMPos", _pos, true];
			_holder xsv ["WeaponCargo", (getWeaponCargo _obj), true];
			_holder xsv ["MagazineCargo", (getMagazineCargo _obj), true];
			_holder xsv ["BackpackCargo", (getBackpackCargo _obj), true];
			cutText [fmt [(lzl "str_epoch_player_117"),_text], "PLAIN DOWN"];
			deleteVehicle _obj;
		};
		s_player_lockvault = -1;
		DZE_ActionInProgress = false;
	};
	GG_deletehelipad = {
		_nearpads = nearestObjects [player,['HeliH'],10];
		if (count _nearpads == 0) exw {cutText ["No helipads found within 10m, try again.", "PLAIN DOWN"]};
		_helipad = _nearpads sel 0;
		_ownerID = _helipad getVariable ["CharacterID", "0"];
		if ((_ownerID != PIDP_playerUID)&&(dayz_characterID != _ownerID)) exw {cutText ["You do not own this helipad.","PLAIN DOWN"]};
		if (!r_drag_sqf && !r_player_unconscious && !((xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1)) then {
			[0,1,2,_nearpads sel 0] swx player_removeObject;
		};
	};
	player_selectSlot = {
		private ["_control","_button","_parent","_group","_pos","_item","_conf","_name","_cfgActions","_numActions","_height","_menu","_config","_type","_script","_outputOriented","_compile","_array","_outputClass","_outputType"];
		disableSerialization;
		_control 	= _this sel 0;
		_button 	= _this sel 1;
		_parent 	= findDisplay 106;
		
		if (_button == 1) then {
			_group = _parent displayCtrl 6902;
			_pos = ctrlPosition _group;
			_pos set [0,((_this sel 2) + 0.48)];
			_pos set [1,((_this sel 3) + 0.07)];
			_item = gearSlotData _control;
			_conf = configFile >> "cfgMagazines" >> _item;
			if (!isClass _conf) then {_conf = configFile >> "cfgWeapons" >> _item};
			_name = getText(_conf >> "displayName");
			_cfgActions = _conf >> "ItemActions";
			_numActions = (count _cfgActions);
			_height = 0;
			if (_item == "ItemRadio") then {
				_menu = _parent displayCtrl (1600 + 0);
				_menu ctrlShow true;
				_type = "Track Vehicles";
				_script = "GG\Epoch\GG_TV.sqf";
				_height = _height + (0.025 * safezoneH);
				_compile = fmt ["_id = '%2' execVM '%1';",_script,_item];
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
			};
			if (_item == "ItemBloodbag") then {
				_menu = _parent displayCtrl (1600 + 0);
				_menu ctrlShow true;
				_type = "Bloodbag myself";
				_script = "GG\Epoch\GG_SBB.sqf";
				_height = _height + (0.025 * safezoneH);
				_compile = fmt ["_id = '%2' execVM '%1';",_script,_item];
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
				
				_menu = _parent displayCtrl (1600 + 1);
				_menu ctrlShow true;
				_type = "Consume bloodbag";
				_script = "GG\Epoch\GG_CBB.sqf";
				_height = _height + (0.025 * safezoneH);
				_compile = fmt ["_id = '%2' execVM '%1';",_script,_item];
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
			};
			if (_item == "ItemKiloHemp") then {
				_menu = _parent displayCtrl (1600 + 1);
				_menu ctrlShow true;
				_type = "Smoke Weed";
				_script = "GG\Epoch\GG_hookah.sqf";
				_height = _height + (0.025 * safezoneH);
				_compile = fmt ["_id = '%2' execVM '%1';",_script,_item];
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
			};
			if (_item == "ItemKnife") then {
				_menu = _parent displayCtrl (1600 + 1);
				_menu ctrlShow true;
				_type = "Harvest Weed";
				_script = "GG\Epoch\GG_harvest.sqf";
				_height = _height + (0.025 * safezoneH);
				_compile = fmt ["_id = '%2' execVM '%1';",_script,_item];
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
			};
			if (_item == "ItemMap") then {
				_menu = _parent displayCtrl (1600 + 0);
				_menu ctrlShow true;
				_type = "Call Airdrop";
				_script = "GG\Epoch\GG_AD.sqf";
				_height = _height + (0.025 * safezoneH);
				_compile = fmt ["_id = '%2' execVM '%1';",_script,_item];
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
			};
			if (_item == "ItemGPS") then {
				_menu = _parent displayCtrl (1600 + 0);
				_menu ctrlShow true;
				_type = "Scan Players";
				_script = "GG\Epoch\GG_SP.sqf";
				_height = _height + (0.025 * safezoneH);
				_compile = fmt ["_id = '%2' execVM '%1';",_script,_item];
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
			};
			if (_item == "ItemToolbox") then {
				_menu = _parent displayCtrl (1600 + 2);
				_menu ctrlShow true;
				_type = "Deploy bicycle";
				_height = _height + (0.025 * safezoneH);
				_compile = "_id = ['MMT_Civ',['PartGeneric']] execVM 'GG\Epoch\GG_DV.sqf';closeDialog 0;";
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
				
				_menu = _parent displayCtrl (1600 + 3);
				_menu ctrlShow true;
				_type = "Deploy ATV";
				_height = _height + (0.025 * safezoneH);
				_compile = "_id = ['ATV_CZ_EP1',['PartGeneric','PartEngine','PartWheel','PartWheel']] execVM 'GG\Epoch\GG_DV.sqf';closeDialog 0;";
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
				
				_menu = _parent displayCtrl (1600 + 4);
				_menu ctrlShow true;
				_type = "Deploy Mozzie";
				_height = _height + (0.025 * safezoneH);
				_compile = "_id = ['CSJ_GyroC',['PartVRotor','PartEngine','PartFueltank']] execVM 'GG\Epoch\GG_DV.sqf';closeDialog 0;";
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];

				_menu = _parent displayCtrl (1600 + 5);
				_menu ctrlShow true;
				_type = "Build virtual garage";
				_height = _height + (0.025 * safezoneH);
				_compile = "_id = 'Land_MBG_Garage_Single_C' spawn player_build;closeDialog 0;";
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
				
				_menu = _parent displayCtrl (1600 + 6);
				_menu ctrlShow true;
				_type = "Build helipad";
				_height = _height + (0.025 * safezoneH);
				_compile = "_id = 'HeliH' spawn player_build;closeDialog 0;";
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
				
				_menu = _parent displayCtrl (1600 + 7);
				_menu ctrlShow true;
				_type = "Delete helipad";
				_height = _height + (0.025 * safezoneH);
				_compile = "_id = [] spawn GG_deletehelipad;closeDialog 0;";
				uiNamespace xsv ['uiControl', _control];
				_menu ctrlSetText fmt [_type,_name];
				_menu ctrlSetTextColor [1,0,0,1];
				_menu ctrlSetEventHandler ["ButtonClick",_compile];
			};
			if (_item != "ItemBloodbag") then {
				for "_i" from 0 to (_numActions - 1) do {
					_menu = _parent displayCtrl (1600 + _i);
					_menu ctrlShow true;
					_config 	= (_cfgActions sel _i);
					_type 		= getText	(_config >> "text");
					_script 	= getText (_config >> "script");
					_outputOriented = xgn (_config >> "outputOriented") == 1;
					_height 	= _height + (0.025 * safezoneH);
					_compile 		= fmt ["_id = '%2' %1;",_script,_item];
					uiNamespace xsv ['uiControl', _control];
					if (_outputOriented) then {
						_array = getArray	(_config >> "output");
						_outputClass = _array sel 0;
						_outputType = _array sel 1;
						_name = getText (configFile >> _outputType >> _outputClass >> "displayName");
						_compile = fmt ["_id = ['%2',%3] %1;",_script,_item,_array];
					};
					_menu ctrlSetText fmt [_type,_name];
					_menu ctrlSetTextColor [1,0.25,0.25,1];
					_menu ctrlSetEventHandler ["ButtonClick",_compile];
				};
			};
			if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _item)) in ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"]) then {
				{
					if (alive _x) then {
						_ownerID = _x xgv ["CharacterID", "0"];
						_hasKey = (_ownerID == str(xgn(configFile >> "CfgWeapons" >> _item >> "keyid")));
						_oldOwner = (_ownerID == dayz_playerUID);
						if (_hasKey or _oldOwner) then {
							if (locked _x) then {
								_menu =  _parent displayCtrl (1600 + _numActions);
								_menu ctrlShow true;
								_text =  "Unlock";
								_script =  "{_vehicle = _x;if (alive _vehicle) then {if ("+str _ownerID+" == (_vehicle getVariable ['CharacterID', '0'])) then {if (locked _vehicle) then {if (player distance _vehicle < 100) then {PVDZE_veh_Lock = [_vehicle,false];if (local _vehicle) then {PVDZE_veh_Lock spawn local_lockUnlock} else {publicVariable 'PVDZE_veh_Lock'};_msg = (typeOf _vehicle+' has been unlocked!');systemChat ('(GG-AH): '+str _msg);}}}}} forEach (nearestObjects [getPos player, ['LandVehicle','Air','Ship'], 100]);";
								
								_height = _height + (0.025 * safezoneH);
								uiNamespace xsv ['uiControl', _control];
								_menu ctrlSetText _text;
								_menu ctrlSetEventHandler ["ButtonClick",_script];
							} else {
								_menu =  _parent displayCtrl (1600 + _numActions);
								_menu ctrlShow true;
								_text =  "Lock";
								_script = "{_vehicle = _x;if (alive _vehicle) then {if ("+str _ownerID+" == (_vehicle getVariable ['CharacterID', '0'])) then {if (!locked _vehicle) then {if (player distance _vehicle < 100) then {PVDZE_veh_Lock = [_vehicle,true];if (local _vehicle) then {PVDZE_veh_Lock spawn local_lockUnlock} else {publicVariable 'PVDZE_veh_Lock'};_msg = (typeOf _vehicle+' has been locked!');systemChat ('(GG-AH): '+str _msg);}}}}} forEach (nearestObjects [getPos player, ['LandVehicle','Air','Ship'], 100]);";
								
								_height = _height + (0.025 * safezoneH);
								uiNamespace xsv ['uiControl', _control];
								_menu ctrlSetText _text;
								_menu ctrlSetEventHandler ["ButtonClick",_script];
							};
						};
					};
				} forEach (nearestObjects [(vehicle player), ['LandVehicle','Air','Ship'], 100]);
			};
			_pos set [3,_height];
			_group ctrlShow true;
			ctrlSetFocus _group;
			_group ctrlSetPosition _pos;
			_group ctrlCommit 0;
		};
	};
	player_removeTankTrap = {_neartanks = nearestObjects [player,['Hedgehog_DZ'],5];if (count _neartanks == 0) exw {cutText [(lzl "STR_EPOCH_ACTIONS_14"), "PLAIN DOWN"]};if (!r_drag_sqf && !r_player_unconscious && !((xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1)) then {[0,1,2,_neartanks sel 0] swx player_removeObject;};};player_removeNet = {_nearnets = nearestObjects [player,['DesertCamoNet_DZ','DesertLargeCamoNet','ForestCamoNet_DZ','DesertLargeCamoNet_DZ','ForestLargeCamoNet_DZ'],10];if (count _nearnets == 0) exw {cutText [(lzl "str_epoch_player_8"), "PLAIN DOWN"]};if (!r_drag_sqf && !r_player_unconscious && !((xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1)) then {[0,1,2,_nearnets sel 0] swx player_removeObject;};};
	player_login = {private ["_unit","_detail","_PUID"];_unit = _this sel 0;_detail = _this sel 1;_PUID = [player] call FNC_GetPlayerUID;if (_unit == _PUID) then {player xsv["publish",_detail]};};
	player_checkAndRemoveItems = {private ["_items","_b"];_items = _this;_b = _items call player_checkItems;if (_b) then {_b = _items call player_removeItems};_b};
	dayz_HungerThirst = {dayz_hunger = dayz_hunger + (_this sel 0);dayz_thirst = dayz_thirst + (_this sel 1);};
	epoch_totalCurrency = {_total_currency = 0;{_part =  (xcf >> "CfgMagazines" >> _x);_worth =  (_part >> "worth");if isNumber (_worth) then {_total_currency = _total_currency + xgn(_worth)};} count (magazines player);_total_currency};
	epoch_itemCost = {_trade_total = 0;{_part_in_configClass =  xcf >> "CfgMagazines" >> (_x sel 0);if (isClass (_part_in_configClass)) then {_part_inWorth = (_part_in_configClass >> "worth");if isNumber (_part_inWorth) then {_trade_total = _trade_total + (xgn(_part_inWorth) * (_x sel 1))};};} count _this;_trade_total};
	EpochDeathBoardDialogList = 21000;
	EpochDeathBoardDialogSText = 21001;
	EpochDeathBoardDeaths = [];
	EpochDeathBoardLoad = {cdx "EpochDeathBoardDialog";{lbAdd [EpochDeathBoardDialogList, (_x sel 0)]} forEach PVDZE_plr_DeathBResult;};
	EpochDeathBoardClick = {disableSerialization;private ["_i", "_record", "_output", "_record_stxt", "_name", "_image", "_h", "_m", "_format"];_quotes = ["GG's sweg appears to have exploded your anus.","What happens if you get scared half to death, twice?","Don't upset me.. I'm running out of places to hide the bodies.","Don't run, you'll just die tired.","You want some of GG's penis?","The best thing about 29 year olds? There's 20 of them.","Why won't you die?!?!","Guns don't kill people; death kills people. It's a proven medical fact."];_i = _this sel 0;if (_i < 0) exw {};_output = _this sel 1;_record = PVDZE_plr_DeathBResult sel _i;_record_stxt = xcc fmt ["epoch_death_board_record_%1;",_i];if (isNil "_record_stxt") then {_record_stxt = fmt ["<t size='1.6' align='left'>%1</t><br /><br />", (_record sel 0)];_format = {private ["_codeCount", "_str"];_str = fmt ["%1", _this];_codeCount = (count (toArray _str));if (_codeCount == 1) then {_str = fmt ["0%1", _str];};_str;};_h = ((_record sel 4) sel 0)+timezoneswitch;_m = (_record sel 4) sel 1;_record_stxt = fmt ["%1<t size='1' align='left'>Died at %2:%3</t><br /><br />", _record_stxt, (_h call _format), (_m call _format)];if ((_record sel 1) != 'unknown') then {_record_stxt = fmt ["%1<t size='1' align='left'>Was killed by %2</t><br /><br />", _record_stxt, (_record sel 1)]};if ((_record sel 2) != 'unknown') then {_name = getText(xcf >> "cfgWeapons" >> (_record sel 2) >> "displayName");_image = getText(xcf >> "cfgWeapons" >> (_record sel 2) >> "picture");_record_stxt = fmt ["%1<t size='1' align='left'>With a %2<br /><img size='3' image='%3' /></t><br /><br />", _record_stxt, _name, _image];};if (fmt ["%1", (_record sel 3)] != 'unknown') then {_record_stxt = fmt ["%1<t size='1' align='left'>At a distance of %2m</t><br /><br />", _record_stxt, (_record sel 3)]};_record_stxt = fmt ["%1<t font='Bitstream'>%2</t>", _record_stxt, (_quotes call BIS_fnc_selectRandom)];xcc fmt ["epoch_death_board_record_%1 = ""%2"";" ,_i , _record_stxt];};if (!isNil "_record_stxt") then {_output ctrlSetStructuredText (parseText _record_stxt)};};
	epoch_returnChange = xcm xlx "\z\addons\dayz_code\compile\epoch_returnChange.sqf";
	dayz_losChance = {private["_agent","_maxDis","_dis","_val","_maxExp","_myExp"];_agent = _this sel 0;_dis = _this sel 1;_maxDis = _this sel 2;_val = (_maxDis - _dis) max 0;_maxExp = ((exp 2) * _maxDis);_myExp = ((exp 2) * (_val)) / _maxExp;_myExp = _myExp * 0.7;_myExp};
	ui_initDisplay = {
		private["_control","_ctrlBleed","_display","_ctrlFracture","_ctrlDogFood","_ctrlDogWater","_ctrlDogWaterBorder", "_ctrlDogFoodBorder"];
		disableSerialization;
		_display = uiNamespace xgv 'DAYZ_GUI_display';
		_control = 	_display displayCtrl 1204;
		_control ctrlShow false;
		if (!r_player_injured) then {
			_ctrlBleed = _display displayCtrl 1303;
			_ctrlBleed ctrlShow false;
		};
		if (!r_fracture_legs && !r_fracture_arms) then {
			_ctrlFracture = _display displayCtrl 1203;
			_ctrlFracture ctrlShow false;
		};
		_ctrlDogFoodBorder = _display displayCtrl 1501;
		_ctrlDogFoodBorder ctrlShow false;
		_ctrlDogFood = _display displayCtrl 1701;
		_ctrlDogFood ctrlShow false;
		
		_ctrlDogWaterBorder = _display displayCtrl 1502;
		_ctrlDogWaterBorder ctrlShow false;
		_ctrlDogWater = _display displayCtrl 1702;
		_ctrlDogWater ctrlShow false
	};
	dayz_losCheck = {
		private["_target","_agent","_cantSee"];
		_target = _this sel 0;
		_agent = _this sel 1;
		_cantSee = true;
		if (!izn _target) then {
			
			_tPos = visiblePositionASL _target;
			_zPos = visiblePositionASL _agent;
			
			_tPos set [2,(_tPos sel 2)+1];
			_zPos set [2,(_zPos sel 2)+1];
			
			if ((count _tPos > 0) && (count _zPos > 0)) then {
				_cantSee = terrainIntersectASL [_tPos, _zPos];
				if (!_cantSee) then {_cantSee = lineIntersects [_tPos, _zPos, _agent, vehicle _target]};
			};
		};
		_cantSee
	};
	vehicle_gear_count = {
		private["_counter"];
		_counter = 0;
		{_counter = _counter + _x} count _this;
		_counter
	};
	player_serverModelChange = {
		private["_object","_model"];
		_object = _this sel 0;
		_model = _this sel 1;
		if (_object == player) then {_model call player_switchModel};
	};
	player_guiControlFlash = 	{
		private["_control"];
		_control = _this;
		if (ctrlShown _control) then {_control ctrlShow false} else {_control ctrlShow true};
	};
	gearDialog_create = {
		private ["_i","_dialog"];
		if (!izn (findDisplay 106)) then {(findDisplay 106) closeDisplay 0};
		openMap false;
		cdg 0;
		if (gear_done) then {sleep 0.001};
		player xac ["Gear", player];
		if (gear_done) then {sleep 0.001};
		_dialog = findDisplay 106;
		_i = 0;
		while {izn _dialog} do {
			_i = _i + 1;
			_dialog = findDisplay 106;
			if (gear_done) then {sleep 0.001};
			if (_i in [100,200,299]) then {
				cdg 0;
				player xac ["Gear", player];
			};
			if (_i > 300) exw {};
		};
		if (gear_done) then {sleep 0.001};
		_dialog = findDisplay 106;
		if ((parseNumber(_this sel 0)) != 0) then {
			ctrlActivate (_dialog displayCtrl 157);
			if (gear_done) then {
				waitUntil {ctrlShown (_dialog displayCtrl 159)};
				sleep 0.001;
			};
		};
		_dialog
	};
	gear_ui_offMenu = {
		private["_control","_parent","_menu"];
		disableSerialization;
		_control = 	_this sel 0;
		_parent = 	findDisplay 106;
		if (!(_this sel 3)) then {
			for "_i" from 0 to 9 do {
				_menu = _parent displayCtrl (1600 + _i);
				_menu ctrlShow false;
			};
			_grpPos = ctrlPosition _control;
			_grpPos set [3,0];
			_control ctrlSetPosition _grpPos;
			_control ctrlShow false;
			_control ctrlCommit 0;
		};
	};
	dze_surrender_off = {
		if (player xgv ["DZE_Surrendered",true]) then {player xsv ["DZE_Surrendered", false, true]};
		DZE_Surrender = false;
	};
	gear_ui_init = {
		private["_control","_parent","_menu","_dspl","_grpPos"];
		disableSerialization;
		_parent = findDisplay 106;
		_control = 	_parent displayCtrl 6902;
		for "_i" from 0 to 9 do {
			_menu = _parent displayCtrl (1600 + _i);
			_menu ctrlShow false;
		};
		_grpPos = ctrlPosition _control;
		_grpPos set [3,0];
		_control ctrlSetPosition _grpPos;
		_control ctrlShow false;
		_control ctrlCommit 0;
	};
	DZE_getModelName = {
		_objInfo = toArray(str(_this));
		_lenInfo = count _objInfo - 1;
		_objName = [];
		_i = 0;
		{
			if (58 == _objInfo sel _i) exw {};
			_i = _i + 1;
		} count _objInfo;
		_i = _i + 2;
		for "_k" from _i to _lenInfo do {_objName set [(count _objName), (_objInfo sel _k)]};
		_objName = toLower(toString(_objName));
		_objName
	};
	dze_isnearest_player = {
		private ["_notClosest","_playerDistance","_nearPlayers","_obj","_playerNear"];
		if (!izn _this) then {
			_nearPlayers = _this nearEntities ["CAManBase", 12];
			_playerNear = ({isPlayer _x} count _nearPlayers) > 1;
			_notClosest = false;
			if (_playerNear) then {
				_playerDistance = player distance _this;
				{if (_playerDistance > (_x distance _this)) exw {_notClosest = true}} count _nearPlayers;
			};
		} else {_notClosest = false};
		_notClosest
	};
	if (hasInterface) then {
		[] swx {
			private["_timeOut","_display","_control1","_control2"];
			disableSerialization;
			_timeOut = 0;
			dayz_loadScreenMsg = "";
			diag_log "DEBUG: loadscreen guard started.";
			_display = uiNameSpace xgv "BIS_loadingScreen";
			if (!isNil "_display") then {_control1 = _display displayctrl 8400;_control2 = _display displayctrl 102;};
			if (!isNil "dayz_DisplayGenderSelect") then {waitUntil {!dayz_DisplayGenderSelect}};
			while { _timeOut < 12000 } do {
				if (dayz_clientPreload && dayz_authed) exw {endLoadingScreen};
				if (!isNil "_display") then {
					if ( izn _display ) then {
						waitUntil {!dialog};
						startLoadingScreen ["","RscDisplayLoadCustom"];
						_display = uiNameSpace xgv "BIS_loadingScreen";
						_control1 = _display displayctrl 8400;
						_control2 = _display displayctrl 102;
					};
					if ( dayz_loadScreenMsg != "" ) then {
						_control1 ctrlSetText dayz_loadScreenMsg;
						dayz_loadScreenMsg = "";
					};
					_control2 ctrlSetText fmt ["%1",round(_timeOut*0.01)];
				};
				_timeOut = _timeOut + 1;
				if (_timeOut >= 12000) then {
					1 cutText [lzl "str_player_login_timeout", "PLAIN DOWN"];
					uiSleep 3;
					endLoadingScreen;
					endMission "END1";
				};
				uiSleep 0.01;
			};
			endLoadingScreen;
		};
	};
	dayz_meleeMagazineCheck = {private["_meleeNum","_magType"];_magType = ([] + getArray (xcf >> "CfgWeapons" >> _wpnType >> "magazines")) sel 0;_meleeNum = ({_x == _magType} count magazines player);if (_meleeNum < 1) then {player addMagazine _magType};};
	dayz_originalPlayer = player;
	if (hasInterface) then {
		[] spawn {
			waitUntil {((!isNil 'dayz_medicalH') || (!isNil 'dayz_gui') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_monitor1'))};
			call compile ("
				waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_spawnCheck') || (!isNil 'dayz_locationCheck') || (!isNil 'dayz_slowCheck'))};
				server_intro = {
					WT_dis = 131300;
					{
						WT_dis = (WT_dis + 1);
						_text = format ['<t size=''"+GG_HeaderSize+"'' color=''#"+GG_HeaderColor+"'' align=''left''>%1<br/></t><t size=''0.1''><br /></t>',_x select 0];
						_text = _text + '<t size=''"+GG_BodySize+"'' color=''#"+GG_BodyColor+"'' align=''left''>';
						{_text=(_text+format['%1<br/>',_x])} forEach (_x select 1);
						_text = _text + ""</t>"";
						_time = (3+((count (_x select 1)) * 1.2));
						[_text,[safezoneX  + safezoneW - 0.8,0.7],[safezoneY + safezoneH - 1.6,2],_time + 2,0.5,0,WT_dis] spawn AH_fnc_dynamictext;
						sleep (_time + 1);
						[_text,WT_dis] spawn {[(_this select 0),[safezoneX  + safezoneW - 0.8,0.7],[safezoneY + safezoneH - 1.6,2],3,0,4,(_this select 1)] spawn AH_fnc_dynamictext};
						sleep 1;
					} forEach [
						["+str GG_features_header+", "+str GG_features_body+"],
						["+str GG_website_header+", "+str GG_website_body+"],
						["+str GG_srvrrules_header+", "+str GG_srvrrules_body+"], 
						["+str GG_stafflist__header+", "+str GG_stafflist__body+"]
					];
				};
				spawn_intro = {
					if (profileNamespace getVariable ['AH_introSong',true]) then {playSound 'bonfIntro'};
					if (isNil 'freshSpawn') then {freshSpawn = 0};
					if (((player getVariable ['freshSpawn',0]) == 1)||(freshSpawn == 2)) then {
						['WELCOME TO "+GG_serverName+"!',0,safezoneY+1.04,10,0,0,3037] spawn AH_fnc_dynamictext;
						call server_intro;
					} else {
						['WELCOME BACK TO "+GG_serverName+"!',0,safezoneY+1.04,10,0,0,3037] spawn AH_fnc_dynamictext;
					};
				};
				call spawn_intro;
			");
		};
		dayz_resetSelfActions = {
			s_player_garage = -1;
			s_clothes = -1;
			s_player_dance = -1;
			s_player_teabag = -1;
			s_player_suicide = -1;
			s_player_packobj = -1;
			s_player_hookahhit = -1;
			s_player_remove_build = -1;
			r_player_gunactions = [];
			s_givemoney_dialog = -1;
			s_bank_dialog = -1;
			s_bank_dialog2 = -1;
			s_bank_dialog3 = -1;
			s_player_door_ckc = -1;
			s_player_vault_ckc = -1;
			s_player_autorefuel = -1;
			s_player_checkWallet = -1;
			s_player_fire =			-1;
			s_player_cook =			-1;
			s_player_boil =			-1;
			s_player_fireout =		-1;
			s_player_butcher =		-1;
			s_player_packtent = 	-1;
			s_player_packvault = 	-1;
			s_player_lockvault = 	-1;
			s_player_unlockvault = 	-1;
			s_player_fillwater =	-1;
			s_player_fillwater2 = 	-1;
			s_player_fillfuel = 	-1;
			s_player_grabflare = 	-1;
			s_player_callzombies = 	-1;
			s_player_showname = 	-1;
			s_player_debuglootpos = 	-1;
			s_player_pzombiesattack = 	-1;
			s_player_pzombiesvision =	-1;
			s_player_pzombiesfeed = 	-1;
			s_player_removeflare = 	-1;
			s_player_painkiller =	-1;
			s_player_studybody = 	-1;
			s_player_tamedog =		-1;
			s_player_madsci_crtl =	-1;
			s_player_parts_crtl =	-1;
			s_build_Sandbag1_DZ = 	-1;
			s_build_Hedgehog_DZ =	-1;
			s_build_Wire_cat1 =		-1;
			s_player_deleteBuild =	-1;
			s_player_forceSave = 	-1;
			s_player_checkGear = 	-1;
			s_player_flipveh = 		-1;
			s_player_stats =		-1;
			s_player_sleep =		-1;
			s_player_movedog =		-1;
			s_player_speeddog =		-1;
			s_player_calldog = 		-1;
			s_player_feeddog = 		-1;
			s_player_waterdog = 	-1;
			s_player_staydog = 		-1;
			s_player_trackdog = 	-1;
			s_player_barkdog = 		-1;
			s_player_warndog = 		-1;
			s_player_followdog = 	-1;
			s_player_repair_crtl =  -1;
			s_player_information =  -1;
			s_player_fuelauto    =  -1;
			s_player_fuelauto2    =  -1;
			s_player_fillgen	 =  -1;
			s_player_upgrade_build	 =  -1;
			s_player_maint_build	 =  -1;
			s_player_downgrade_build	 =  -1;
			s_player_towing		 =  -1;
			s_halo_action =         -1;
			s_player_SurrenderedGear = -1;
			s_player_maintain_area = -1;
			s_player_maintain_area_preview = -1;
			s_player_heli_lift = -1;
			s_player_heli_detach = -1;
			s_player_lockUnlock_crtl = -1;
			mv22_fold = -1;
			mv22_unfold = -1;
			mv22_open = -1;
			mv22_close = -1;
		};
		call dayz_resetSelfActions;
		rn "GG\Epoch\Trader\player_traderMenu.sqf";
		rn "GG\Lift\init.sqf";
	};
	rn "\z\addons\dayz_code\system\BIS_Effects\init.sqf";
	rn "GG\Epoch\GG_MMT.sqf";
	diag_log ("GG: Loaded client init!");
};
if (isServer) then {
	"PVOZ_EPOCH_SAFEZONE" addPublicVariableEventHandler {
		_msg = toString(_this sel 1);
		"misclog" callExtension (_msg);
		[nil, nil, rspawn, [_msg], {systemChat (_this sel 0)}] call RE;
	};
	"PVDZE_bank_Save" addPublicVariableEventHandler {
		_playerObj = ((_this sel 1) sel 0);
		_playerID = gpd _playerObj;
		_bankMoney = _playerObj xgv ["GGBank",0];
		
		if (_playerID != "") then {
			_key = fmt ["CHILD:299:%1:%2:",_playerID,_bankMoney];
			_key call server_hiveReadWrite;
		};
	};
};
[] spawn {
	waitUntil{!isNil "BIS_Effects_Init"};
	uiSleep 1;
	BIS_Effects_AirDestructionStage2 = {
		private ["_dr","_pos","_xv","_yv","_dir","_Crater","_speed","_velz","_tv","_zv","_i","_smoke","_fire","_dirt","_v","_int","_t"];
		_v = _this sel 0;
		_int = _this sel 1;
		_t = _this sel 2;
		_pos = getPosATL _v;
		if ((_v getvariable ["Deployed",false])||(typeOf _v in ["C130J_US_EP1","MV22_DZ","AN2_DZ","GNT_C185U","GNT_C185","GNT_C185R","GNT_C185C","AH6J_EP1","AH6J_EP1_DZ","pook_h13_gunship","pook_h13_transport","Mi17_Civilian_DZ","MH6J_DZ","AH6X_DZ","pook_h13_medevac","pook_H13_civ","pook_H13_civ_black","pook_H13_civ_ru_white","pook_H13_civ_ru_yellow","pook_H13_civ_ru_slate","CSJ_GyroC","CSJ_GyroCover","CSJ_GyroP"]))exitWith {};
		if (!isDedicated) then {
			_smoke = "#particlesource" createVehicleLocal _pos;
			_smoke attachto [_v,[0,0,0],"destructionEffect1"];
			_smoke setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal",16,7,48],"", "Billboard", 1, 15, [0, 0, 0], [0, 0, 0], 1, 1.275, 1, 0, [8,14],[[0.1,0.1,0.1,1],[0.1,0.1,0.1,0]], [0.5], 0.1, 0.1, "", "", _v];
			_smoke setParticleRandom [4, [2, 2, 2], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_smoke setDropInterval 0.02;
			
			_fire = "#particlesource" createVehicleLocal _pos;
			_fire attachto [_v,[0,0,0],"destructionEffect2"];
			_fire setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal",16,2,80],"", "Billboard", 1, 2, [0, 1, 0], [0, 0, 0], 1, 1.275, 1, 0, [7,13],[[1,1,1,-1],[1,1,1,0]], [0.5], 0.01, 0.01, "", "", _v,360];
			_fire setParticleRandom [0.5, [0.5, 0.5, 0.5], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_fire setDropInterval 0.01;
			_dirt = "#particlesource" createVehicleLocal _pos;
			_dirt attachto [_v,[0,0,0],"destructionEffect1"];
			_dirt setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal",16,12,9,0], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 5], 0, 5, 1, 0, [10,20],[[0.1,0.1,0.1,1],[0.1,0.1,0.1,0.7],[0.1,0.1,0.1,0]], [1000], 0, 0, "", "", _v,360];
			_dirt setParticleRandom [0, [1, 1, 1], [1, 1, 2.5], 0, 0, [0, 0, 0, 0.5], 0, 0];
			_dirt setDropInterval 0.05;
			_i=0;
			while {(speed _v) > 0.1} do {
				_pos=getPosATL _v;
				_xv=velocity _v sel 0;
				_yv=velocity _v sel 1;
				_zv=velocity _v sel 2;
				_dir = abs(_xv atan2 _yv);
				
				_Crater= "CraterLong" createvehiclelocal [_pos sel 0, _pos sel 1, 0];
				_Crater setdir (_dir + (180 * _i));
				_Crater setpos [_pos sel 0, _pos sel 1, 0];
				_Crater setPos [_pos sel 0, _pos sel 1, ((0 - _i)/13)];
				_speed = (speed _v);
				_velz=velocity _v sel 2;
				
				if (_velz>1) then {_v setvelocity [_xv/1.3,_yv/1.3,0]}
				else {_v setvelocity [_xv/1.2,_yv/1.2,velocity _v sel 2]};
				
				_tv=abs(_xv)+abs(_yv)+abs(_zv);
				if (_tv>2) then {_dr=1/_tv} else {_dr=1};
				_smoke setDropInterval _dr*1.5;
				_fire setDropInterval _dr*1.5;
				_dirt setDropInterval _dr;
				
				sleep (0.25 - (_speed / 1000));
				_i = _i + 1;
			};
			deleteVehicle _smoke;
			deleteVehicle _fire;
			deleteVehicle _dirt;
		};
		_v setvelocity [0,0,-0.1];
		if (local _v) then {["Burn", _v, _int, _t] call BIS_Effects_globalEvent};
		sleep 0.5;
		_v setvelocity [0,0,-0.01];
	};
	BIS_Effects_AirDestruction = {
		private ["_fl","_sm","_expl","_dr","_tv","_i","_wave","_splash","_velz","_v","_int","_t","_pos"];
		_v=_this sel 0;
		_int = (fuel _v)*(8+random 2);
		_t=time;
		if ((_v getvariable ["Deployed",false])||(inSafeZone)) exitWith {removeallweapons _v;clearVehicleInit _v;if (local _v) then {["Burn", _v, _int, _t] call BIS_Effects_globalEvent}};
		
		if (!isDedicated) then {
			_fl = "#particlesource" createVehicleLocal getPosATL _v;
			_fl attachto [_v,[0,0,0],"destructionEffect2"];
			_fl setParticleRandom [0.3, [1, 1, 0], [0, 0, 0], 0, 0.3, [0, 0, 0, 0], 0, 0];
			_fl setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard", 1, 2, "destructionEffect2",[0, 0, 5], 0, 10, 7.9, 0.075, [4,7,9,10], [[1, 1, 1, -1], [1, 1, 1, -1],[1, 1, 1, -1], [1, 1, 1, -0.5], [1, 1, 1, -0]], [1,0.5], 1, 0, "", "", _v];
			_fl setDropInterval 1;
			_sm = "#particlesource" createVehicleLocal getPosATL _v;
			_sm attachto [_v,[0,0,0],"destructionEffect1"];
			_sm setParticleRandom [2, [2, 2, 0], [0, 0, 0], 0, 0.3, [0, 0, 0, 0.1], 0, 0];
			_sm setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 5, "destructionEffect1",[0, 0, 5], 0, 10, 7.9, 0.075, [4,8,12,14], [[0.3, 0.3, 0.3, 1],[0.45, 0.45, 0.45, 1],[0.6, 0.6, 0.6, 0.6], [0.7, 0.7, 0.7, 0.25], [1, 1, 1, 0]], [0.8,0.3,0.25], 1, 0, "", "", _v];
			_sm setDropInterval 1;
		};
		_i=0;
		_dr=0.2;
		_tv=11;
		removeallweapons _v;
		if (local _v) then {_expl=createVehicle ["HelicopterExploSmall", (getPosATL _v), [], 0, "CAN_COLLIDE"];};
		if (!isDedicated) then {
			while {_i <1200 && ((velocity _v sel 2)<-20 || (getPosATL _v sel 2)>8) && !(alive _v) && !(isnull _v) && (getPosATL _v sel 2)>1} do {
				_tv=abs(velocity _v sel 0)+abs(velocity _v sel 1)+abs(velocity _v sel 2);
				if (_tv>2) then {_dr=1/_tv} else {_dr=1};
				_fl setDropInterval _dr;
				_sm setDropInterval _dr;
				_i=_i+1;
				sleep 0.2;
			};
		};
		_pos=getPosATL _v;
		clearVehicleInit _v;
		if (!isDedicated) then {deletevehicle _fl;deletevehicle _sm};
		if (surfaceiswater(_pos) && (_pos sel 2)<9 ) then {
			if (!isDedicated) then {
				_wave = "#particlesource" createVehicleLocal getPosATL _v;
				_wave attachto [_v,[0,0,0],"destructionEffect1"];
				_wave setParticleRandom [0.3, [1, 1, 0], [0.5, 0.5, 0], 0, 0.3, [0, 0, 0, 0], 0, 0];
				_wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0], "", "Billboard", 1, 1.6, "destructionEffect1",[0, 0, 0], 0, 10, 7.9, 0.075, [3,8],[[0.7,0.8,1,0.6],[0.85,0.9,1,0.0]], [1000], 1, 0, "", "", _v];
				_wave setparticlecircle [2,[0,16,0]];
				_wave setDropInterval 0.0015;
				
				_splash = "#particlesource" createVehicleLocal getPosATL _v;
				_splash attachto [_v,[0,0,0],"destructionEffect1"];
				_splash setParticleRandom [2, [2, 2, 0], [2, 2, 7], 0, 0.5, [0, 0, 0, 0], 0, 0];
				_splash setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 13, 6, 0], "", "Billboard", 1, 4, "destructionEffect1",[0, 0, 0], 0, 30, 7.9, 0.075, [8,15],[[0.7,0.7,0.7,1],[1,1,1,0]], [1000], 1, 0, "", "", _v];
				_splash setparticlecircle [2,[0,3,15]];
				_splash setDropInterval 0.002;
				
				sleep 0.2;
				deletevehicle _wave;deletevehicle _splash;
			};
		} else {
			if (local _v) then {
				_velz=velocity _v sel 2;
				if (_velz>1) then {_v setvelocity [velocity _v sel 0,velocity _v sel 1,0]};
				_expl = createVehicle ["HelicopterExploBig", [_pos sel 0,_pos sel 1,(_pos sel 2) + 1], [], 0, "CAN_COLLIDE"];
				sleep 0.05;
				["AirDestructionStage2", _v, _int, _t] call BIS_Effects_globalEvent;
			};
		};
	};
};
fnc_usec_damageHandler 	= {
	private ["_unit","_humanityHit","_myKills","_hit","_damage","_isPlayer","_unconscious","_wound","_isHit","_isInjured","_type","_hitPain","_isCardiac","_isHeadHit","_isMinor","_scale","_canHitFree","_rndPain","_rndInfection","_hitInfection","_lowBlood","_isPZombie","_source","_ammo","_unitIsPlayer","_isBandit"];
	_unit = _this sel 0;
	_hit = _this sel 1;
	_damage = _this sel 2;
	_unconscious = _unit xgv ["NORRN_unconscious", false];
	_isPZombie = player iko "PZombie_VB";
	_source = _this sel 3;
	_ammo = _this sel 4;
	_type = [_damage,_ammo] call fnc_usec_damageType;
	_isMinor = (_hit in USEC_MinorWounds);
	_isHeadHit = (_hit == "head_hit");
	_isPlayer = (isPlayer _source);
	_humanityHit = 0;
	_myKills = 0;
	_unitIsPlayer = _unit == player;
	_scale = 200;
	_isCardiac = _unit xgv["USEC_isCardiac",false];
	if ((_unitIsPlayer)&&(_hit == "")&&((_source != player) && _isPlayer)&&(_source iko "CAManBase")) then {_source xsv["startcombattimer",1]};
	if (_damage > 0.4) then {
		if (_ammo != "zombie") then {_scale = _scale + 50};
		if (_isHeadHit) then {_scale = _scale + 500};
		if ((isPlayer _source) && !(player == _source)) then {
			_scale = _scale + 800;
			if (_isHeadHit) then {_scale = _scale + 500};
		};
		switch (_type) do {
			case 1: {_scale = _scale + 200};
			case 2: {_scale = _scale + 200};
		};
		if (_unitIsPlayer) then {r_player_blood = r_player_blood - (_damage * _scale)};
	};
	if (_hit in USEC_MinorWounds) then {
		if (_ammo == "zombie") then [{if (_hit != "legs") then {[_unit,_hit,(_damage / 4)] call object_processHit}},{[_unit,_hit,(_damage / 2)] call object_processHit}];
		if (_ammo == "") then {[_unit,_hit,(_damage / 2)] call object_processHit};
	};
	if (_unitIsPlayer) then {_unit xsv["startcombattimer", 1]};
	if (_damage > 0.1) then {
		if (_unitIsPlayer) then {1 call fnc_usec_bulletHit};
		if (local _unit) then {_unit xsv["medForceUpdate",true,true]};
	};
	if (_damage > 0.4) then {
		_wound = _hit call fnc_usec_damageGetWound;
		_isHit = _unit xgv[_wound,false];
		if (_unitIsPlayer) then {
			_rndPain 		= (random 10);
			_rndInfection 	= (random 500);
			_hitPain 		= (_rndPain < _damage);
			if ((_isHeadHit) || (_damage > 1.2 && _hitPain)) then {_hitPain = true};
			_hitInfection = (_rndInfection < 1);
			if ((_isHit)&&(_unitIsPlayer)) then {r_player_blood = r_player_blood - 50};
			if (_hitInfection) then {if (_unitIsPlayer && !_isPZombie) then {r_player_infected = true;player xsv["USEC_infected",true,true];};};
			if ((_hitPain)&&(_unitIsPlayer)) then {
				r_player_inpain = true;
				player xsv["USEC_inPain",true,true];
			};
			if ((_damage > 1.5) && _isHeadHit) then {[_source,"shothead"] swx player_death};
		};
		if ((!_isHit)&&(!_isPZombie)) then {
			_unit xsv[_wound,true,true];
			[_unit,_wound,_hit] swx fnc_usec_damageBleed;
			{if (isPlayer _x && _x != player) then {PVDZE_send = [_x,"Bleed",[_unit,_wound,_hit]];publicVariableServer "PVDZE_send";};} count ((getPosATL _unit) nearEntities ["CAManBase",1000]);
			if (!(_unit xgv["USEC_injured",false])) then {
				_unit xsv["USEC_injured",true,true];
				if ((_unitIsPlayer) && (_ammo != "zombie")) then {dayz_sourceBleeding = _source};
			};
			if (!(_unit xgv["USEC_lowBlood",false])) then {_unit xsv["USEC_lowBlood",true,true]};
			if (_unitIsPlayer) then {r_player_injured = true};
		};
	};
	if (_type == 1) then {
		if ((_damage > 0.01) && (_unitIsPlayer)) then {[20,45] call fnc_usec_pitchWhine};
		if (_damage > 4) then {if (_unitIsPlayer) then {[_source,"explosion"] swx player_death;};} else {if (_damage > 2) then {if (!_isCardiac) then {_unit xsv["USEC_isCardiac",true,true];r_player_cardiac = true;};};};
	};
	if (_type == 2) then {
		if (_damage > 4) then {
			if (_unitIsPlayer) then {[_source,"shotheavy"] swx player_death;};
		} else {
			if (_damage > 2) then {if (!_isCardiac) then {_unit xsv["USEC_isCardiac",true,true];r_player_cardiac = true;};};
		};
	};
	if (!_unconscious && !_isMinor && ((_damage > 2) || ((_damage > 0.5) && _isHeadHit))) then {[_unit,_damage] call fnc_usec_damageUnconscious};
};
fnc_usec_damageHandle = {
	private ["_unit"];
	_unit = _this sel 0;
	mydamage_eh1 = _unit aeh ["HandleDamage",{_this call fnc_usec_damageHandler}];
	mydamage_eh2 = _unit aeh ["Fired",{_this call player_fired}];
	mydamage_eh3 = _unit aeh ["Killed",{_id = _this swx player_death}];
};
fnc_veh_ResetEH = {
	_this reh "HandleDamage";
	_this reh "Killed";
	_this aeh ["HandleDamage",{ _this call vehicle_handleDamage } ];
	_this aeh ["Killed",{ _this call vehicle_handleKilled } ];
	if (isServer) then {
		_this reh "GetOut";
		_this reh "GetIn";
		_this aeh ["GetOut", {[(_this sel 0),"all"] call server_updateObject}];
		_this aeh ["GetIn", {[(_this sel 0),"all"] call server_updateObject;_this call server_checkIfTowed}];
	};
};
vehicle_handleDamage = {
	private["_unit","_selection","_strH","_total","_damage","_needUpdate"];
	_unit 		= _this sel 0;
	_selection 	= _this sel 1;
	_total 		= _this sel 2;
	_source 	= _this sel 3;
	_project 	= _this sel 4; 
	if ((count(nearestObjects [_unit, ["Plastic_Pole_EP1_DZ"],80]) > 0) && (locked _unit) && ((count(crew _unit)) == 0)) exitWith {_total = 0;_total};
	if (_selection != "") then [{_strH = "hit_" + _selection},{_strH = "totalDmg"}];
	if (typeOf _unit in ["F35B","AV8B","A10","Su39","Su34","L39_TK_EP1","Mi24_V","AH64D","Ka52","AH1Z","Ka52Black","AAV","ZSU_CDF","LAV25","LAV25_HQ_DZE"]) then {
		_hdsel = _unit getVariable ["lastsel",[]];
		_hdhit = _unit getVariable ["lasthit",[]];
		
		if !(_selection in _hdsel) then {
			_hdsel set [count _hdsel, _selection];
			_hdhit set [count _hdhit, 0];
		};
		_indx = _hdsel find _selection;
		_oldd = _hdhit sel _indx;
		_newd = _total - _oldd;
		_hdhit set [_indx, _total];
		
		_unit setVariable ["lastsel",_hdsel];
		_unit setVariable ["lasthit",_hdhit];
		_total = (_total - _newd);
		_newd = (if (_unit isKindOf "AIR") then [{if (_source isKindOf "AIR") then [{_newd},{(_newd * 2)}]},{_newd / 4}]);
		_total = (_total + _newd);
	};
	if (_total >= 0.98) then {_total = 1.0};
	if (local _unit) then {
		if (_total > 0) then {
			_unit setVariable [_strH, _total, true];
			_unit setHit [_selection, _total];
			if (isServer) then [{[_unit, "damage"] call server_updateObject},{PVDZE_veh_Update = [_unit,"damage"];publicVariableServer "PVDZE_veh_Update";}];
		};
	} else {
		PVDZE_send = [_unit,"VehHandleDam",[_unit,_selection,_total]];
		publicVariableServer "PVDZE_send";
	};
	_total
};
local_lockUnlock = {
	private ["_vehicle","_status"];
	_vehicle = _this sel 0;
	_status = _this sel 1;
	if (local _vehicle) then {
		_vehicle swx {
			_allPlayers = playableUnits;
			{_x xac ["LightOn", _this]} forEach _allPlayers;
			[objNull, _this, rSAY, "carBeep", 200] call RE;
			sleep 0.5;
			{_x xac ["LightOff", _this]} forEach _allPlayers;
		};
		if (_status) then {
			_vehicle setVehicleLock "LOCKED";
			_vehicle xsv ["Tow_settings_disabled",true,true];
		} else {
			_vehicle setVehicleLock "UNLOCKED";
			_vehicle xsv ["Tow_settings_disabled",false,true];
		};
	};
};
GG_bohandleDamage = {
	_unit 	= _this sel 0;
	_total 	= _this sel 2;
	_source = _this sel 3;
	if ((_source != (vehicle _source))||(_source isKindOf "LandVehicle")||(_source isKindOf "Air")) then {
		diag_log ((typeOf _source)+" attempted to deal "+str _total+" damage to "+(typeOf _unit));
		_total = 0
	};
	_total
};
player_humanityChange 		= {
	private ["_object","_change","_humanity" ];
	_object = _this sel 0;
	_change = _this sel 1;
	_humanity = 0;
	if (_object == player) then {
		_humanity = player xgv["humanity",0];
		_humanity = _humanity + _change;
		if (_change < 0) then [{player xsv["humanity",_humanity,true]},{player xsv["humanity",_humanity,true]}];
	};
};
FNC_GetPlayerUID = {
	private ["_object","_version","_PID"];
	_object = _this sel 0;
	_version = productVersion sel 3;
	if (DayZ_UseSteamID) then {_PID = gpd _object} else {
		if (_version >= 125548) then {_PID = call (xcm "GetPlayerUIDOld _object");
		} else {
			_PID = gpd _object;
			diag_log fmt ["Your game version, %1, is less than the required for the old UID system. using Steam ID system instead. Update to 1.63.125548 (or latest steam beta)", _version];
		};
	};
	_PID;
};
FNC_GetSetPos = {
	private "_pos";
	_thingy = _this sel 0;
	_pos = getPosASL _thingy;
	if (surfaceIsWater _pos) then [{_thingy setPosASL _pos},{_thingy setPosATL (ASLToATL _pos)}];
};
FNC_GetPos = {
	private "_pos";
	if (isNil {_this sel 0}) exw {[0,0,0]};
	_thingy = _this sel 0;
	_pos = getPosASL _thingy;
	if !(surfaceIsWater _pos) then {_pos =  ASLToATL _pos};
	_pos
};
local_setFuel =	{
	private["_qty","_vehicle"];
	_vehicle = _this sel 0;
	_qty = _this sel 1;
	_vehicle setFuel _qty;
};
zombie_initialize = {
	private ["_unit","_position"];
	_unit = _this sel 0;
	if (isServer) then {_unit aeh ["local", {_this call zombie_findOwner}]};
	_id = _unit aeh["HandleDamage", { _this call local_zombieDamage }];
	_id = _unit aeh["Killed", { [_this, "zombieKills"] call local_eventKill }];
};
dayz_EjectPlayer = {
	private ["_vehicle","_inVehicle"];
	_vehicle = vehicle player;
	_inVehicle = (_vehicle != player);
	if (_inVehicle) then {
		if (((_vehicle emptyPositions "driver") > 0) && (speed _vehicle) != 0) then {player xac [ "eject", _vehicle]};
	};
};
player_sumMedical = {
	private["_character","_wounds","_legs","_arms","_medical"];
	_character = _this;
	_wounds = [];
	if (_character xgv["USEC_injured",false]) then {{if (_character xgv[_x,false]) then {_wounds set [count _wounds,_x]}} count USEC_typeOfWounds};
	_legs = _character xgv ["hit_legs",0];
	_arms = _character xgv ["hit_arms",0];
	_medical = [_character xgv["USEC_isDead",false],_character xgv["NORRN_unconscious", false],_character xgv["USEC_infected",false],_character xgv["USEC_injured",false],_character xgv["USEC_inPain",false],_character xgv["USEC_isCardiac",false],_character xgv["USEC_lowBlood",false],_character xgv["USEC_BloodQty",12000],_wounds,[_legs,_arms],_character xgv["unconsciousTime",0],_character xgv["messing",[0,0]]];
	_medical
};
BIS_fnc_selectRandom 		= xcm xlx "\z\addons\dayz_code\compile\BIS_fnc\fn_selectRandom.sqf";
BIS_fnc_vectorAdd 			= xcm xlx "\z\addons\dayz_code\compile\BIS_fnc\fn_vectorAdd.sqf";
BIS_fnc_halo 				= xcm xlx "\z\addons\dayz_code\compile\BIS_fnc\fn_halo.sqf";
BIS_fnc_findNestedElement 	= xcm xlx "\z\addons\dayz_code\compile\BIS_fnc\fn_findNestedElement.sqf";
BIS_fnc_param 				= xcm xlx "\z\addons\dayz_code\compile\BIS_fnc\fn_param.sqf";
fnc_buildWeightedArray 		= xcm xlx "\z\addons\dayz_code\compile\fn_buildWeightedArray.sqf";
fnc_usec_damageVehicle 		= xcm xlx "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
object_setHitServer 		= xcm xlx "\z\addons\dayz_code\compile\object_setHitServer.sqf";
object_setFixServer 		= xcm xlx "\z\addons\dayz_code\compile\object_setFixServer.sqf";
object_getHit 				= xcm xlx "\z\addons\dayz_code\compile\object_getHit.sqf";
object_setHit 				= xcm xlx "\z\addons\dayz_code\compile\object_setHit.sqf";
object_processHit 			= xcm xlx "\z\addons\dayz_code\compile\object_processHit.sqf";
object_delLocal 			= xcm xlx "\z\addons\dayz_code\compile\object_delLocal.sqf";
BIS_fnc_numberDigits 		= xcm xlx "GG\Epoch\Trader\numberDigits.sqf";
BIS_fnc_numberText 			= xcm xlx "GG\Epoch\Trader\numberText.sqf";
vehicle_handleKilled 		= xcm xlx "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
fnc_inString 				= xcm xlx "\z\addons\dayz_code\compile\fn_inString.sqf";
fnc_isInsideBuilding 		= xcm xlx "\z\addons\dayz_code\compile\fn_isInsideBuilding.sqf";
fnc_isInsideBuilding2 		= xcm xlx "\z\addons\dayz_code\compile\fn_isInsideBuilding2.sqf";
fnc_isInsideBuilding3 		= xcm xlx "\z\addons\dayz_code\compile\fn_isInsideBuilding3.sqf";
dayz_zombieSpeak 			= xcm xlx "\z\addons\dayz_code\compile\object_speak.sqf";
vehicle_getHitpoints 		= xcm xlx "\z\addons\dayz_code\compile\vehicle_getHitpoints.sqf";
local_gutObject 			= xcm xlx "\z\addons\dayz_code\compile\local_gutObject.sqf";
ckc_button 					= xcm xlx "GG\DoorLock\ckc_button.sqf";
ckc_upddoor 				= xcm xlx "GG\DoorLock\ckc_upddoor.sqf";
ckc_updSafe 				= xcm xlx "GG\DoorLock\ckc_updSafe.sqf";
mv22_pack 					= xcm xlx "\ca\air2\mv22\scripts\pack.sqf";
local_gutObjectZ 			= xcm xlx "\z\addons\dayz_code\compile\local_gutObjectZ.sqf";
local_zombieDamage 			= xcm xlx "\z\addons\dayz_code\compile\fn_damageHandlerZ.sqf";
local_eventKill 			= xcm xlx "\z\addons\dayz_code\compile\local_eventKill.sqf";
curTimeStr 					= xcm xlx "\z\addons\dayz_code\compile\fn_curTimeStr.sqf";
player_medBandage 			= xcm xlx "\z\addons\dayz_code\medical\publicEH\medBandaged.sqf";
player_medInject 			= xcm xlx "\z\addons\dayz_code\medical\publicEH\medInject.sqf";
player_medEpi 				= xcm xlx "\z\addons\dayz_code\medical\publicEH\medEpi.sqf";
player_medTransfuse 		= xcm xlx "\z\addons\dayz_code\medical\publicEH\medTransfuse.sqf";
player_medMorphine 			= xcm xlx "\z\addons\dayz_code\medical\publicEH\medMorphine.sqf";
player_breaklegs 			= xcm xlx "\z\addons\dayz_code\medical\publicEH\medBreakLegs.sqf";
player_medPainkiller 		= xcm xlx "\z\addons\dayz_code\medical\publicEH\medPainkiller.sqf";
world_isDay 				= {if ((daytime < (24 - dayz_sunRise)) && (daytime > dayz_sunRise)) then [{true},{false}]};
spawn_loot 					= xcm xlx "\z\addons\dayz_code\compile\spawn_loot.sqf";
spawn_loot_small 			= xcm xlx "\z\addons\dayz_code\compile\spawn_loot_small.sqf";

if (isServer) then [{xcc xlx "\z\addons\dayz_server\init\server_functions.sqf"},{eh_localCleanup = {}}];
dayz_allowedObjects = dayz_allowedObjects + ["Land_MBG_Garage_Single_C","HeliH","HeliHRescue","BAF_GPMG_Minitripod_W","MMT_USMC","DSHKM_Ins","MetalFloor_Preview_DZ"];
dayz_fuelsources = dayz_fuelsources + ["Land_Ind_TankSmall2","Land_Fuel_tank_big","Land_smd_fuelstation_army"];
initialized = true;
diag_log ("GG: Loaded server/client init!");
if (!hasInterface && !isServer) exitWith {};
rn "GG\Epoch\Trader\init.sqf";
__ccp("traders.sqf");
__ccp("GG\v.sqf");
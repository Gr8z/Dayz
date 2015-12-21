dami_ammovehicle = {
	_type = (typeOf _this);
	if (DZE_removeweps) then {{_this removeWeapon _x} forEach (weapons _this)};
	if ((DZE_removeammo) && !(_type in DZE_removewlist)) then {
		if (_type in ["AH64D","AH1Z","Ka52","Ka52Black","Mi24_V"]) then [{
			{if (_x in ["8Rnd_Hellfire","2Rnd_Sidewinder_AH1Z"]) then {_this removeMagazine _x}} forEach (magazines _this);
			{_tur = _x;{_this removeMagazinesTurret [_x,_tur]} forEach (_this magazinesTurret _tur)} forEach [[-1]];
		},{
			{_this removeMagazine _x} forEach (magazines _this);
			{_tur = _x;{_this removeMagazinesTurret [_x,_tur]} forEach (_this magazinesTurret _tur)} forEach [[-1],[0],[1],[2],[3]];
		}];
	};
	if ((DZE_usedamiammo)&&((_this isKindOf "Ship")||(_this isKindOf "Plane"))&&!(_type in ["fishingboat"])) then {_this addWeapon "M134"};
	_this disableTIEquipment true;
};
if (!hasInterface && !isServer) then {
	'NO_CU_EXPLOIT' addPublicVariableEventHandler {
		_unitGroup = createGroup EAST;
		{
			_unit = _x;
			[_unit] joinSilent _unitGroup;
			if ((getPlayerUID _unit == '')&&(_unit isKindOf 'Man')) then {
				if (vehicle _unit == _unit) then {
					_unit enableAI 'TARGET';
					_unit enableAI 'AUTOTARGET';
					_unit enableAI 'ANIM';
					_unit enableAI 'FSM';
					_unit enableAI 'MOVE';
					{_unit setSkill [(_x select 0),(_x select 1)]} forEach [["aimingAccuracy",0.60],["aimingShake",0.40],["aimingSpeed",0.60],["endurance",1.00],["spotDistance",0.65],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];
					_unit removeAllEventHandlers 'Killed';
					_unit addEventHandler ["Killed",{[_this select 0, _this select 1, "ground"] call on_kill}];
					_unitGroup setFormation "ECH LEFT";
					_unitGroup selectLeader ((units _unitGroup) select 0);
				} else {
					_unitVehicle = (vehicle _unit);
					_unit addEventHandler ["Killed",{[_this select 0, _this select 1, "vehicle"] call on_kill}];
					if (driver _unitVehicle == _unit) then {
						_unit assignAsDriver _unitVehicle;
						{_unit setSkill [_x,1]} count ["aimingAccuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
					} else {
						_unit assignAsGunner _unitVehicle;
					};
					_unitGroup allowFleeing 0;
					_unitGroup setBehaviour "AWARE";
					_unitGroup setCombatMode "RED";
				};
			};
			_allPlayers = playableUnits;
			{_unit reveal _x} forEach _allPlayers;
		} forEach (_this select 1);
	};
	diag_log ("Dami_HC: Loading WAI\init.sqf...");
	PVOZ_HeadlessUnit = player;publicVariable "PVOZ_HeadlessUnit";
	PVOZ_HCISALIVE = true;publicVariable "PVOZ_HCISALIVE";
	execVM "\GG_HC\WAI\init.sqf";
	execVM "\GG_HC\GG\traders.sqf";
	execVM "\GG_HC\GG\markers.sqf";
};
if (isServer) then {
	"PVOZ_damiHCaddtomonitor" addPublicVariableEventHandler {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,((_this select 1) select 0)]};
	"PVOZ_damiHCmsgsrvr" addPublicVariableEventHandler {
		[nil, nil, rspawn, [((_this select 1) select 0)], {
			if !(isServer) then {
				_msg = _this select 0;
				systemChat ("(AI MISSION): "+str _msg+"");
				hint parseText format ["<t align='center' color='#52bf90' shadow='2' size='1.75'>AI MISSION</t><br/><t align='center' color='#ffffff'>%1</t>",_msg];
			};
		}] call RE;
	};
	"PVOZ_damiHCpublish" addPublicVariableEventHandler {
		_arr = _this select 1;
		_vehicle = _arr select 0;
		
		_vehicle addEventHandler ["GetIn", {
			_vehicle 		= _this select 0;
			if (debug_mode) then {diag_log ("PUBLISH: Attempt " + str(_vehicle))};
			_class 			= typeOf _vehicle;
			_characterID 	= _vehicle getVariable ["CharacterID", "0"];
			_worldspace		= [getDir _vehicle, getPosATL _vehicle];
			_hitpoints 		= _vehicle call vehicle_getHitpoints;
			_damage 		= damage _vehicle;
			_array 			= [];
			{
				_hit = [_vehicle,_x] call object_getHit;
				_selection = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> _x >> "name");
				if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
			} count _hitpoints;
			_fuel 	= fuel _vehicle;
			_uid 	= _worldspace call dayz_objectUID2;
			_key 	= format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance,_class,_damage,_characterID,_worldspace,[],_array,_fuel,_uid];
			if (debug_mode) then {diag_log ("HIVE: WRITE: "+ str(_key))};
			_key call server_hiveWrite;
			
			[_vehicle,_uid,_fuel,_damage,_array,_characterID,_class] call {
				private["_vehicle","_uid","_fuel","_damage","_array","_characterID","_done","_retry","_key","_result","_outcome","_oid","_class"];
				_vehicle 		= _this select 0;
				_uid 			= _this select 1;
				_fuel 			= _this select 2;
				_damage 		= _this select 3;
				_array 			= _this select 4;
				_characterID	= _this select 5;
				_class 			= _this select 6;
				_done 			= false;
				while {!_done} do {
					_key 		= format["CHILD:388:%1:",_uid];
					_result 	= _key call server_hiveReadWrite;
					_outcome 	= _result select 0;

					waitUntil {!isNil "_outcome"};

					if (debug_mode) then {diag_log ("HIVE: WRITE: "+ str(_key))};

					if (_outcome == "PASS") then {
						_oid = _result select 1;
						_vehicle setVariable ["ObjectID", _oid, true];
						if (debug_mode) then {diag_log("CUSTOM: Selected " + str(_oid))};
						_done  = true;
					} else {
						if (debug_mode) then {diag_log("CUSTOM: trying again to get id for: " + str(_uid))};
						_done = false;
					};
				};
				if (!_done) then {
					deleteVehicle _vehicle;
					if (debug_mode) then {diag_log("CUSTOM: failed to get id for : " + str(_uid))};
				} else {
					_vehicle setVariable ["lastUpdate",time];
				};
			};
			_vehicle call fnc_veh_ResetEH;
			_vehicle call dami_ammovehicle;
			PVDZE_veh_Init = _vehicle;
			publicVariable "PVDZE_veh_Init";
			if (debug_mode) then {diag_log ("PUBLISH: Created " + (_class) + " with ID " + str(_uid))};
		}];
	};
};
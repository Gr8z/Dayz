#include "shortcuts.h"
private["_corpseGG","_type","_isBuried","_mound","_cross","_gun"];
_corpseGG = _this sel 3;
_type = typeOf _corpseGG;
_isBuried = _corpseGG xgv["isBuried",false];
_hasHarvested = _corpseGG xgv["meatHarvested",false];
_namec = _corpseGG xgv["bodyName","unknown"];
_namep = name player;
_hasETool = "ItemEtool" in items player;
_playerNear = {isPlayer _x} count (player nearEntities ["CAManBase", 10]) > 1;

if (izn cursorTarget || (player distance cursorTarget > 4)) ewx { cutText ["Aim directly to the body!","PLAIN"]; };
if (!_hasETool) ewx {cutText ["You don't have an Etool", "PLAIN DOWN"];};
if (_playerNear) ewx { cutText ["Cannot do this while another player is nearby!","PLAIN"]; };

DZE_ActionInProgress = true;

player rac s_player_bury_human;
s_player_bury_human = -1;

player rac s_player_studybody;
s_player_studybody = -1;

if (!_isBuried) then {
    if (!_hasHarvested) then {

        _corpseGG xsv["isBuried",true,true];
        player playActionNow "Medic";
        sleep 10;

        _position = getPos _corpseGG;
        _dir = getDir _corpseGG;
		private ["_newBackpackType","_backpackWpn","_backpackMag"];
        dayz_myBackpack = unitBackpack _corpseGG;
		_newBackpackType = (typeOf dayz_myBackpack);
        _corpseGG; private ["_weapons","_magazines","_primweapon","_secweapon"];
        _weapons = weapons _corpseGG;
        _magazines = magazines _corpseGG;
        if(_newBackpackType != "") then {
			_backpackWpn = getWeaponCargo unitBackpack _corpseGG;
			_backpackMag = getMagazineCargo unitBackpack _corpseGG;
		};
		_box = createVehicle ["USBasicAmmunitionBox", _position, [], 0, "CAN_COLLIDE"];
        _box setpos [(getposATL _box sel 0),(getposATL _box sel 1)+1.2, 0];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        { _box addWeaponCargoGlobal [_x, 1] } forEach weapons _corpseGG;
        { _box addMagazineCargoGlobal [_x ,1] } forEach magazines _corpseGG;
		_box xsv["GGCoins",0 ,true];
		deleteVehicle _corpseGG;

        _mound = createVehicle ["Grave", _position, [], 0, "CAN_COLLIDE"];
        _mound setpos [(getposATL _mound sel 0),(getposATL _mound sel 1), 0];
        _crosstype = ["GraveCross1","GraveCross2","GraveCrossHelmet"]  call BIS_fnc_selectRandom;
        _cross = createVehicle [_crosstype, _position, [], 0, "CAN_COLLIDE"];
        _cross setpos [(getposATL _cross sel 0),(getposATL _cross sel 1)-1.2, 0];

        if(_newBackpackType != "") then {
            _backpackWpnTypes = [];
            _backpackWpnQtys = [];
            if (count _backpackWpn > 0) then {
                _backpackWpnTypes = _backpackWpn sel 0;
                _backpackWpnQtys = _backpackWpn sel 1;
            };
            _countrGG = 0;
            { _box addWeaponCargoGlobal [_x,(_backpackWpnQtys sel _countrGG)];
            _countrGG = _countrGG + 1;
            } forEach _backpackWpnTypes;
            _backpackmagTypes = [];
            _backpackmagQtys = [];
            if (count _backpackmag > 0) then {
                _backpackmagTypes = _backpackMag sel 0;
                _backpackmagQtys = _backpackMag sel 1;
            };
            _countrGG = 0; { _box addMagazineCargoGlobal [_x,(_backpackmagQtys sel _countrGG)];
            _countrGG = _countrGG + 1;
            } forEach _backpackmagTypes;
            _box addBackpackCargoGlobal [_newBackpackType, 1];
        };

        _box xsv ["permaLoot", true];
		
		if (_namec == _namep) then {
			cutText [fmt["Did you just bury yourself %1? Huh.. No humanity gained!",_namep],"PLAIN"];
		} else {
			_deathMessage = fmt["Rest in Peace, %1...",_namec];
			cutText [_deathMessage, "PLAIN DOWN"];
			[player,100] call player_humanityChange;
			_id = [player,10,true,(getPosATL player)] swx player_alertZombies;
			player playMove "AmovPercMstpSlowWrflDnon_Salute";
		};
    } else {
        cutText ["The poor bastards been eaten, there's not much left to bury", "PLAIN DOWN"];
    };
};

DZE_ActionInProgress = false;

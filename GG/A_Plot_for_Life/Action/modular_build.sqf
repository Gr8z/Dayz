if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

private ["_itemConfig","_classname","_classnametmp","_require","_text","_ghost","_lockable","_requireplot","_isAllowedUnderGround","_offset","_isPole","_isLandFireDZ","_hasRequired","_hasrequireditem","_reason","_buildObject","_location1","_object","_objectHelper","_position","_controls","_cancel","_dir","_vector"];

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_F = false;

DZE_cancelBuilding = false;

DZE_updateVec = false;
DZE_memDir = 0;
DZE_memForBack = 0;
DZE_memLeftRight = 0;

call gear_ui_init;
closeDialog 1;

DZE_buildItem = _this;

[] call player_build_countNearby;
[] call player_build_states;
[] call player_build_needNearby;
_itemConfig = [] call player_build_getConfig;
_classname = _itemConfig select 0;
_classnametmp = _itemConfig select 1;
_require = _itemConfig select 2;
_text = _itemConfig select 3;
_ghost = _itemConfig select 4;
_lockable = _itemConfig select 5;
_requireplot = _itemConfig select 6;
_isAllowedUnderGround = _itemConfig select 7;
_offset = _itemConfig select 8;
_isPole = _itemConfig select 9;
_isLandFireDZ = _itemConfig select 10;

[_isPole, _requireplot, _isLandFireDZ] call player_build_plotCheck;

if (DZE_ActionInProgress) then {

_hasRequired = [_require, _text, true, true] call player_build_buildReq;

_hasrequireditem = _hasRequired select 0;

	if (_hasrequireditem) then {
		
		_buildObject = [_classname, _ghost, _offset, true] call player_build_create;
		
		_location1 = _buildObject select 0;
		_object = _buildObject select 1;
		_objectHelper = _buildObject select 2;
		
		_controls = [_object, _isAllowedUnderGround, _location1, _objectHelper] call player_build_controls;

		_cancel = _controls select 0; //bool
		_reason = _controls select 1; //string
		_position = _controls select 2; //array
		_dir = _controls select 3; //int
		_vector = _controls select 4; //array
		
		[_cancel, _position, _classnametmp,_isAllowedUnderGround, _text, _isPole, _lockable,_dir, _reason, _vector] call player_build_publish;
	};
};

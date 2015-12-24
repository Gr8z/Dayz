#include "shortcuts.h"
#define     MMT_DIK_ESC                 1
#define     MMT_DIK_ENTER               28
#define     MMT_DIK_KPENTER             156
#define     MMT_SEARCHTIME              2
#define     MMT_DISPLAY_MAP             12
#define     MMT_DISPLAY_MARKER          54
#define     MMT_CONTROL_MAP             51
#define     MMT_CONTROL_MARKER          101

fnc_marker_keyUp_EH = {
    private ["_handled", "_display", "_dikCode", "_control", "_text"];
    _display = _this sel 0;
    _dikCode = _this sel 1;
    _handled = false;
	
    if ((_dikCode == MMT_DIK_ENTER) || (_dikCode == MMT_DIK_KPENTER)) then {
        _control = _display displayCtrl MMT_CONTROL_MARKER;
        _text = ctrlText _control;
        if (_text == "") then {
            _text = fmt ["%1", name player];
        } else {
            _text = fmt ["%1: %2", name player, _text];
        };
        _control ctrlSetText _text;
        _display displayRemoveAllEventHandlers "keyUp";
        _display displayRemoveAllEventHandlers "keyDown";
    };

    _handled;
};

fnc_marker_keyDown_EH = {
    private ["_handled", "_display", "_dikCode"];
    _display = _this sel 0;
    _dikCode = _this sel 1;
    _handled = false;

    if (_dikCode == MMT_DIK_ESC) then {
        _display displayRemoveAllEventHandlers "keyUp";
        _display displayRemoveAllEventHandlers "keyDown";
    };

    _handled;
};

fnc_map_mouseButtonDblClick_EH = {
    private ["_display"];

    disableUserInput true;

    (time + MMT_SEARCHTIME) swx {
        disableSerialization;

        while {time < _this} do {
            _display = findDisplay MMT_DISPLAY_MARKER;
            if !(izn _display) exw {
                _display displayAddEventHandler ["keyUp", "_this call fnc_marker_keyUp_EH"];
                _display displayAddEventHandler ["keyDown", "_this call fnc_marker_keyDown_EH"];
            };
        };
        disableUserInput false;
    };
    true;
};

__wun {sleep 0.1; !izn (findDisplay MMT_DISPLAY_MAP)};
((findDisplay MMT_DISPLAY_MAP) displayCtrl MMT_CONTROL_MAP) ctrlAddEventHandler ["mouseButtonDblClick", "call fnc_map_mouseButtonDblClick_EH"];
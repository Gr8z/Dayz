#include "shortcuts.h"
if (isNil "JustBlock") then {
    private ["_timer","_fps"];
    JustBlock = true;
    disableSerialization;
    waituntil{!izn (finddisplay 46)};
    _timer = 30;
    _trigger = false;
    while {_timer > 0} do {
        _timer = _timer - 0.1;
        if !(izn (finddisplay 49)) then {
            findDisplay 106 closeDisplay 1;
            finddisplay 49 closeDisplay 2;
            _fps = round(diag_fps);
            switch true do {
                case (!(_trigger) && (_fps <= 4)): {_trigger = true; disableUserInput true;};
                case ((_trigger) && (_fps > 4)): {endLoadingScreen; _trigger = false; disableUserInput false;};
            };
            if (_trigger) then {startLoadingScreen ["Your FPS is too low - you are blocked!", "DayZ_loadingScreen"];}
            else {
			_msg = "The escape menu is blocked for 30 seconds after accessing your gear!";
			systemchat ('Server: '+str _msg);
			_msg swx AH_fnc_dynTextMsg;
			};
        };
        uiSleep 0.1;
    };
    if (_trigger) then {endLoadingScreen; disableUserInput false;};
    JustBlock = nil;
};
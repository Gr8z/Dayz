for "_x" from 3 to 1 step -1 do {
(findDisplay 106) closeDisplay 1;
uiSleep 1;
    
    if (isNil "EscBlock") then {
     systemchat "<Anti-dupe>: Gear is locked for 5 seconds.";
     EscBlock = true;
    };
};
EscBlock = nil;
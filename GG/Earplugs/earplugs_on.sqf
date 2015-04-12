Earplugs = true;
1 fadeSound 0.2;
titleText [format["Earplugs are on"], "PLAIN DOWN"];
enableEnvironment false;

waituntil {vehicle player == player};

if (true) then {
    Earplugs = false;
    1 fadeSound 1;
	enableEnvironment true;
};
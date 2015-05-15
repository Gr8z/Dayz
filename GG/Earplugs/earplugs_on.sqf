Earplugs = true;
1 fadeSound 0.2;
systemChat "Earplugs Activated";
enableEnvironment false;

waituntil {vehicle player == player};

if (true) then {
    Earplugs = false;
    1 fadeSound 1;
	enableEnvironment true;
};
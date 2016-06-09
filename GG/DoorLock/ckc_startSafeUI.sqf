dayz_combination = "";
_object = _this select 3;
_first = _object getVariable ["CharacterID", "0"];
_msg = "*IMPORTANT* Do not have codes less then 4 numbers. Changing your Safe Codes can wipe your safe after restart. Do it with caution. You will not be refunded!";
systemChat ("Server: "+str _msg+"");
_msg call AH_fnc_dynTextMsg;

_msg = "Your safe code: "+str _first;
systemChat ("Server: "+str _msg+"");
cutText [_msg,"PLAIN"];

player setVariable ["CurrentSafe", _object];
createDialog "ckc_SafeUI";
findDisplay 118338;
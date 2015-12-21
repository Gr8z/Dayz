dayz_combination = "";
_object = _this select 3;
_first = _object getVariable ["CharacterID", "0"];
_msg = "*IMPORTANT* Safe wipes were fixed;however, it's best not to change your code close to restart when the server has high poulation!";
systemChat ("(ArmA-AH): "+str _msg+"");
_msg call AH_fnc_dynTextMsg;

_msg = "Your safe code: "+str _first;
systemChat ("(ArmA-AH): "+str _msg+"");
cutText [_msg,"PLAIN"];

player setVariable ["CurrentSafe", _object];
createDialog "ckc_SafeUI";
findDisplay 118338;
private ["_date","_key","_result","_outcome","_datestr","_event"];
diag_log("MANUAL EPOCH EVENT INIT");
_event = _this select 0;
_key = "CHILD:307:";
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;
if(_outcome == "PASS") then {
    _date = _result select 1;
    _datestr  = str(_date);
    diag_log ("RUNNING EVENT: " + (_event) + " on " + _datestr);
    [] execVM "\z\addons\dayz_server\modules\" + (_event) + ".sqf";
};
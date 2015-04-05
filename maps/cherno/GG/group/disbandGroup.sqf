private ["_callerUID","_targetUID","_friendlies","_myGroup","_rfriendlies"];

_myGroup = group player;
{[_x] join grpNull;} count units _myGroup;
deleteGroup _myGroup;

systemChat "The group has been disbanded";
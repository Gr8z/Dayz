GGpurge = {
 if(!isNull(_this)) then {
  _this enableSimulation false;
  _this removeAllMPEventHandlers "mpkilled";
  _this removeAllMPEventHandlers "mphit";
  _this removeAllMPEventHandlers "mprespawn";
  _this removeAllEventHandlers "FiredNear";
  _this removeAllEventHandlers "HandleDamage";
  _this removeAllEventHandlers "Killed";
  _this removeAllEventHandlers "Fired";
  _this removeAllEventHandlers "GetOut";
  _this removeAllEventHandlers "GetIn";
  _this removeAllEventHandlers "Local";
  clearVehicleInit _this;
  deleteVehicle _this;
  deleteGroup (group _this);
  _this = nil;
 };
};

objectDelete = {
	_objectID 	= _this getVariable ['ObjectID','0'];
	_objectUID 	= _this getVariable ['ObjectUID','0'];
	if (isNil '_objectID') exitWith {
		diag_log ["GG Cleanup: Error deleting object!"];
	};
	if (isNil '_objectUID') exitWith {
		diag_log ["GG Cleanup: Error deleting object!"];
	};
	PVDZE_obj_Delete = [_objectID,_objectUID,player];
	publicVariableServer 'PVDZE_obj_Delete';
	if !(isNull _this) then {deleteVehicle _this};
};

if (isServer) then {
	[] spawn
	{
		waitUntil {!(isNil "sm_done")};
		diag_log ["GG Cleanup initialized"];

		_lastservercleancheck = diag_tickTime;
		_lastvehiclecleanup = diag_tickTime;
		
		while {true} do {			
			if (((diag_tickTime - _lastservercleancheck) > 300)) then
			{
			_lastservercleancheck = diag_tickTime;
			private ["_itemclasses","_itemlist","_itemCount"];
			_itemclasses =
				[
					"GraveCrossHelmet_EP1","GraveCrossHelmet_DZ","wreck","crater","craterlong","PartWoodPile",
					"SeaGull","Rabbit","WildBoar","Cow","Goat","Sheep","Bird","wire_cat1",
					"CAAnimalBase","Sound_Flies"
				];
				{
					_itemlist 	= allMissionObjects _x;
					_itemCount 	= (count _itemlist);
					{
						if ((typeOf _x != "DZ_fin")||(typeOf _x != "DZ_pastor")||(typeOf _x != "SHEEP")) then {
							_x spawn objectDelete;
						};
					} forEach (allMissionObjects _x);
					diag_log (format["GG Cleanup: Deleted %1 %2(s)",_itemCount,_x]);
				} forEach _itemclasses;
			};
			
			if (((diag_tickTime - _lastvehiclecleanup) > 300)) then
			{
			_lastvehiclecleanup = diag_tickTime;
			private ["_GGVC","_vehs","_garage"];
				_GGVC = 0;
				_vehs = [];
				{
					_garage = (getPosATL _x) nearObjects ["Land_sara_hasic_zbroj",7];
					if !((count _garage) > 1) then {
						if (((damage _x)>0.90)&&!(_x isKindOf "MAN")&&!(_x isKindOf "CAAnimalBase")&&!(_x isKindOf "zZombie_Base")&&!(_x isKindOf "static")&&!(_x isKindOf "building")) then {
							if (typeOf _x != "SHEEP") then {
								_x spawn objectDelete;
								_GGVC = _GGVC + 1;
								_vehs = _vehs + [typeOf _x];
							};
						};
					};
				} forEach (vehicles);
				diag_log (format["GG Cleanup: %1 blown up vehicles were deleted: %2",_GGVC,_vehs]);
			};
		};
	};
};
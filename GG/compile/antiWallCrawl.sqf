private ["_isSmkProne","_ogPos","_nearObjects"]; //privatise variables in memory to prevent error...
_isSmkProne = false; _ogPos = []; _nearObjects = []; //create variables we will use later as empty to prevent error...
if (isNil 'AntiWallCrawl') then { AntiWallCrawl = diag_tickTime; }; //if global var doesnt exist then create it(ie first run)
_isSmkProne = [(_this select 1),"smk_urbanprone"] call KRON_strInStr; //check if anim is an urbanprone anim, players current anim = (_this select 1)
//if player is in urban prone anim, exit with the below code
if (_isSmkProne) exitWith {
	_ogPos = position (_this select 0); //get player position at time of entering urbanprone anim and store it as ogPos (original position)
	_nearObjects = nearestObjects [_ogPos, ["All"], 2.5]; //check how many objects are near the player
	//if player is near any objects set them prone with a message and exit early with a message, unless that message was sent already in the last few seconds in which case just exit
	if (count _nearObjects > 1) exitWith { player switchMove "amovppnemstpsraswrfldnon"; if ((diag_tickTime - AntiWallCrawl) > 10) exitWith { AntiWallCrawl = diag_tickTime; systemChat("[ZombZ] Anti-Wall-Crawl: You cannot use this stance near objects."); }; }; 
	//open a new thread if it didnt just exit, give the new thread the ogPos and player object ((_this select 0)) as input
	0 = [_ogPos,(_this select 0)] spawn {
		private["_ogPos","_isSmkProne","_newPos","_newAnim","_plyr"]; //privatise variables in memory for new thread to prevent error...
		_isSmkProne = false; _ogPos = []; _newPos = []; _newAnim = ""; _plyr = objNull; //create variables we will use later as empty to prevent error...
   		_ogPos = _this select 0; //grab the ogPos from the thread input
   		_plyr = _this select 1; //grab player from the thread input
   		//wait until: player has moved more than 0.00545 meters OR player is no longer in urban prone
		waitUntil{ 
			_newAnim = animationState _plyr; _isSmkProne = [_newAnim,"smk_urbanprone"] call KRON_strInStr; _newPos = position _plyr; _posDist = _newPos distance _ogPos;
			(((_isSmkProne) && (_posDist > 0.00545)) || (!_isSmkProne))
		};
		
		if (!_isSmkProne) exitWith { }; //if player got out of urban prone without moving, exit without doing below code
		//player moved while in urban prone...
		(_this select 1) switchMove "amovppnemstpsraswrfldnon"; //switch player back to normal prone
		systemChat("Anti-Wall-Crawl: You cannot move in this stance."); //send a message & exit
	};
};	
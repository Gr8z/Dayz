 /******************************************************************************
 *
 *  This file starts the Drop Cargo Script.
 *
 *  To disable the script at all put a // in front of the line.
 *  
 *  Example:
 *  // execVM "GG\CargoDrop\Init.sqf";
 *
 ******************************************************************************/


//// Wait until player ready, exit if server
waitUntil {!isNull player};
if (!local player) exitWith {};


///// Launch the init once
execVM "GG\CargoDrop\Init.sqf";
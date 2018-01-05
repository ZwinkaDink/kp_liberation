/*
	KPLIB_fnc_core_getNearestSector
	
	File: fn_core_getNearestSector.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-11-26
	Last Update: 2017-12-30

	Description:
	Get the nearest capturable sector from the given position inside the given range.

	Parameter(s):
		0: NUMBER - Range to search for sectors.
		1: POSITION - Center position from where to start searching for sectors. (Default: Position of the player)

	Returns:
	STRING
*/

params ["_range", ["_centerPos", getPos player]];

private _return = "";
private _foundSectors = KPLIB_sectors_all select {((markerPos _x) distance _centerPos) < _range};
private _sortedSectors = [_foundSectors, [_centerPos], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy;
if !(_sortedSectors isEqualTo []) then {_return = _sortedSectors select 0;};

_return

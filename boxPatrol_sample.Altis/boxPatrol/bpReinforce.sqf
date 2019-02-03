//////////////////////////////////
// Blackbox's rad patrol script //
// v1   Reinforcement           //
//////////////////////////////////

// [this,radius,side,faction,unitCount,groupSize,light/medium/heavy,vehicleCount] execVM "boxPatrol\bpReinforce.sqf";
// Factions listed in boxPatrol\bpInit.sqf

if (!isServer) exitWith {};

bpReinforce = [];
sleep 0.5;

_reinforceLogic = _this select 0;
_reinforcePos = getPos _reinforceLogic;
_reinforceRadius = _this select 1;
_reinforceSide = _this select 2;
_reinforceFaction = (_this select 3) - 1;
_unitCount = _this select 4;
_groupCount = _this select 5;
_armament = (_this select 6) - 1;
_vehicleCount = _this select 7;

_activeUnits = 0; // Initialize unit cap and unit spawning stuff
_activeUnitsArr = [];
_activeGroupsArr = [];
_infantrySide = allInfantry select _reinforceFaction;

while {_activeUnits < _unitCount} do { // Infantry spawning to unit cap
	_spawnSite = selectRandom bpReinforce;
	_spawnPos = _spawnSite select 0; // Get radius and position from a random reinforcement-enabled site
	_spawnRadius = _spawnSite select 1;
	_spawnPos = _spawnPos getPos [(random _spawnRadius),(random 360)]; // Get random pos around that site
	_reinforceGroup = createGroup [_reinforceSide, true];
	_activeGroupsArr pushBack _reinforceGroup;
	for "_i" from 1 to _groupCount do { // Fill group with x units
		_infantryUnit = selectRandom (_infantrySide select _armament);
		_reinforceUnit = _reinforceGroup createUnit [_infantryUnit, _spawnPos, [], 0, "FORM"];
		_activeUnits = _activeUnits + 1;
		_activeUnitsArr pushBack _reinforceUnit;
	};
	_reinforceGroup setBehaviour "SAFE"; // Waypoint stuff
	_reinforceGroup setSpeedMode "LIMITED";
	for "_i" from 1 to 10 do { // 10 waypoints because ¯\_(ツ)_/¯
		_wpSite = selectRandom bpReinforce; // Select random site to set waypoint to
		_wpPos = _wpSite select 0;
		_wpRadius = _wpSite select 1;
		_wpPos = _wpPos getPos [(random _wpRadius),(random 360)]; // Get random pos around that site
		_wp =_reinforceGroup addWaypoint [_wpPos, 0];
	};
	_wp =_reinforceGroup addWaypoint [_spawnPos, 0]; // Add cycle waypoint to keep the AI things moving around
	_wp setWaypointType "CYCLE";
	sleep 0.1;
};

if (_vehicleCount > 0) then { // Vehicle spawning stuff
	_activeVehicles = 0;
	_activeVehiclesArr = [];
	while {_activeVehicles < _vehicleCount} do {
		_vehicleArr = _infantrySide select (_armament + 3); // Select random vehicle
		_vehicleUnit = selectRandom _vehicleArr;
		_spawnSite = selectRandom bpReinforce; // Get random site to spawn vehicle at
		_spawnPos = _spawnSite select 0;
		_spawnRadius = _spawnSite select 1;
		_spawnPos = _spawnPos getPos [(random _spawnRadius),(random 360)]; // Get random pos
		_nearRoad = [_spawnPos, _reinforceRadius] call BIS_fnc_nearestRoad; // Get nearest road to pos
		_vehicleSpawnPos = getPos _nearRoad;
		_vehicleGroup = createGroup [_reinforceSide, true];
		[_vehicleSpawnPos, (random 360), _vehicleUnit, _vehicleGroup] call bis_fnc_spawnvehicle; // Spawn vehicle with complete crew
		_vehicleGroup setBehaviour "SAFE"; // Waypoint stuff
		_vehicleGroup setSpeedMode "LIMITED";
		_activeVehicles = _activeVehicles + 1;
		for "_i" from 1 to 10 do {
			_wpSite = selectRandom bpReinforce; // Get random site
			_wpPos = _wpSite select 0;
			_wpRadius = _wpSite select 1;
			_wpPos = _wpPos getPos [(random _wpRadius),(random 360)]; // Get random pos
			_wp =_vehicleGroup addWaypoint [_wpPos, 0];
		};
		_wp =_vehicleGroup addWaypoint [_vehicleSpawnPos, 0]; // Cycle the thing
		_wp setWaypointType "CYCLE";
	};
};
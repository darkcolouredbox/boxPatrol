//////////////////////////////////
// Blackbox's rad patrol script //
// v1   Initial calls           //
//////////////////////////////////

// Syntax
// [this,radius,side,faction,unitCount,groupSize,garrison,garrisonCoverage,garrisonGroupSize,reinforce,light/medium/heavy,vehicleCount] execVM "boxPatrol\bpInit.sqf";

// EX
// [this,125,west,1,40,4,1,12,0,2,0] execVM "box_Patrol\bpInit.sqf";

// Factions
// BLUFOR
// 1 = NATO
// 2 = NATO (Pacific)
// 3 = FIA (Blufor)
// OPFOR
// 4 = CSAT
// 5 = CSAT (Pacific)
// 6 = FIA (Opfor)
// INDEPENDENT
// 7 = AAF
// 8 = FIA (Independent)
// 9 = Syndikat
// MOD
// 10 = Russia (MSV)
// 11 = Russia (VDV)
// 12 = USA (Army - D)
// 13 = USA (Army - W)

if (!isServer) exitWith {};

sleep 0.5;

_patrolLogic = _this select 0;
_patrolPos = getPos _patrolLogic;
_patrolRadius = _this select 1;
_patrolSide = _this select 2;
_patrolFaction = (_this select 3) - 1;
_unitCount = _this select 4;
_groupCount = _this select 5;
_garrison = _this select 6;
_garrisonCoverage = _this select 7;
_garrisonGroupSize = _this select 8;
_reinforce = _this select 9;
_armament = (_this select 10) - 1;
_vehicleCount = _this select 11;

_activeUnits = 0; // Initialize unit cap and unit spawning stuff
_activeUnitsArr = [];
_activeGroupsArr = [];
_infantrySide = allInfantry select _patrolFaction;

if (_reinforce > 0) then { // If reinforcement enabled, add logic's pos and radius to bpReinforce array (initialized in bpReinforce.sqf)
	_reinforceArr = [_patrolPos,_patrolRadius];
	bpReinforce pushBack _reinforceArr;
};

while {_activeUnits < _unitCount} do { // Infantry spawning to unit cap
	_spawnPos = _patrolPos getPos [(random _patrolRadius),(random 360)]; // Get random pos within _patrolRadius distance and random direction
	_patrolGroup = createGroup [_patrolSide, true]; // Group creation and unit spawning starts
	_activeGroupsArr pushBack _patrolGroup;
	for "_i" from 1 to _groupCount do { // Fill group with x units
		_infantryUnit = selectRandom (_infantrySide select _armament);
		_patrolUnit = _patrolGroup createUnit [_infantryUnit, _spawnPos, [], 0, "FORM"];
		_activeUnits = _activeUnits + 1; // Increment active units by 1
		_activeUnitsArr pushBack _patrolUnit;
	};
	_patrolGroup setBehaviour "SAFE"; // Handle group waypoints
	_patrolGroup setSpeedMode "LIMITED";
	[_patrolGroup, _patrolPos, _patrolRadius] call bis_fnc_taskPatrol;
	sleep 0.1; // Slow the fuck down, script
};

if (_vehicleCount > 0) then { // If vehicle spawning enabled, do
	_activeVehicles = 0;
	_activeVehiclesArr = [];
	while {_activeVehicles < _vehicleCount} do {
		_vehicleArr = _infantrySide select (_armament + 3); // Pick random vehicle
		_vehicleUnit = selectRandom _vehicleArr;
		_spawnPos = _patrolPos getPos [(random _patrolRadius),(random 360)]; // Select random point within _patrolRadius
		_nearRoad = [_spawnPos, _patrolRadius] call BIS_fnc_nearestRoad; // Get nearest road to random point
		_vehicleSpawnPos = getPos _nearRoad;
		_vehicleGroup = createGroup [_patrolSide, true];
		[_vehicleSpawnPos, (random 360), _vehicleUnit, _vehicleGroup] call bis_fnc_spawnvehicle; // Spawn vehicle with complete crew
		_vehicleGroup setBehaviour "SAFE"; // Handle group waypoints
		_vehicleGroup setSpeedMode "LIMITED";
		[_vehicleGroup, _patrolPos, _patrolRadius] call bis_fnc_taskPatrol;
		_activeVehicles = _activeVehicles + 1; // Increment active vehicles by 1
	};
};

if (_garrison == 1) then { // If garrisons enabled, do
	_buildingArr = [];
	garrisonPosArr = [];
	_allBuildings = _patrolPos nearObjects ["Building", _patrolRadius]; // Call all buildings within _patrolRadius of _patrolPos (buildings in Arma's context means a house with an internal pathing mesh)
	{
		_buildingPosArr = _x buildingPos -1; // Create an array of all the internal positions of _x building
		_buildingArr pushBack _buildingPosArr; // Add building position array to site position array
	} forEach _allBuildings; // Repeat for every found building within _patrolRadius
	{
		_buildingSelection = floor(random 100);
		if (_buildingSelection <= _garrisonCoverage) then {
			garrisonPosArr pushback _x;
		};
	} forEach _buildingArr;
	while {count garrisonPosArr > 0} do { // Garrison unit spawning
		_garrisonGroup = createGroup [_patrolSide, true]; // Group creation and spawn handling
		_garrisonBuilding = selectRandom garrisonPosArr;
		garrisonPosArr = garrisonPosArr - [_garrisonBuilding];
		_patrolGroup = createGroup [_patrolSide, true]; // Group creation and unit spawning starts
		_garrisonBuildingCount = count _garrisonBuilding;
		_garrisonFill = _garrisonGroupSize;
		if (_garrisonBuildingCount < _garrisonGroupSize) then { // If building has enough space for all garrison group, rad. If not, spawn only as many units as there are positions
			_garrisonFill = _garrisonBuildingCount;
		};
		for "_i" from 1 to _garrisonFill do {
			_garrisonPos = selectRandom _garrisonBuilding;
			_garrisonBuilding = _garrisonBuilding - [_garrisonPos];
			_infantryUnit = selectRandom (_infantrySide select _armament); // Garrison unit spawning
			_garrisonUnit = _garrisonGroup createUnit [_infantryUnit, _garrisonPos, [], 0, "FORM"];
			_dir = random 360; // Random facing
			_garrisonUnit setDir _dir;
			_garrisonUnit setFormDir _dir;
			_garrisonUnit disableAI "PATH"; // Disable their moving around
		};
	};
};
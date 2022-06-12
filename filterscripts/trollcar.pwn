#include <a_samp>
new playerEnteringVehicle[MAX_PLAYERS];

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
playerEnteringVehicle[playerid] = vehicleid;
return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
{
if(playerEnteringVehicle[playerid] == INVALID_VEHICLE_ID || playerEnteringVehicle[playerid] != GetPlayerVehicleID(playerid)) {
return 1;
}

playerEnteringVehicle[playerid] = INVALID_VEHICLE_ID;
return 1;
}

return 1;
}

public OnPlayerDisconnect(playerid, reason) {
playerEnteringVehicle[playerid] = INVALID_PLAYER_ID;
return 1;
}

stock PutPlayerInVehicleEx(playerid, vehicleid, seatid)
{
if(vehicleid != INVALID_VEHICLE_ID && seatid != 128)
{
playerEnteringVehicle[playerid] = vehicleid;
}

PutPlayerInVehicle(playerid, vehicleid, seatid);

return 1;
}

#if defined _ALS_PutPlayerInVehicle
#undef PutPlayerInVehicle
#else
#define _ALS_PutPlayerInVehicle
#endif
#define PutPlayerInVehicle PutPlayerInVehicleEx

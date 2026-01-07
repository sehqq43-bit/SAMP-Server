// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>
#include <streamer>
#include <sscanf2>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else
public OnGameModeInit()
{
    AddStaticVehicle(411, 1958.3, 1343.1, 15.3, 0.0, 1, 1);
    AddStaticVehicle(451, 1960.3, 1345.1, 15.3, 90.0, 3, 3);
    return 1;
}

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
CMD:car(playerid, params[])
{
    new model;
    if(sscanf(params, "d", model))
        return SendClientMessage(playerid, -1, "Koristenje: /car [modelid]");

    new Float:x, Float:y, Float:z, Float:a;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);

    CreateVehicle(model, x+2, y, z, a, -1, -1, 0);
    SendClientMessage(playerid, -1, "Auto stvoren!");
    return 1;
}
CMD:veh(playerid, params[])
{
    new model;
    if(sscanf(params, "d", model))
        return SendClientMessage(playerid, -1, "Koristenje: /veh [modelid]");

    new Float:x, Float:y, Float:z, Float:a;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);

    new veh = CreateVehicle(model, x+2, y, z, a, -1, -1, 0);
    PutPlayerInVehicle(playerid, veh, 0);
    SendClientMessage(playerid, -1, "Auto stvoren i sjedas u njega!");
    return 1;
}
#define OWNER_LEVEL 10
new PlayerAdminLevel[MAX_PLAYERS];
public OnPlayerConnect(playerid)
{
    if(IsPlayerAdmin(playerid))
        PlayerAdminLevel[playerid] = OWNER_LEVEL;
    else
        PlayerAdminLevel[playerid] = 0;
    return 1;
}
CMD:ocar(playerid, params[])
{
    if(PlayerAdminLevel[playerid] != OWNER_LEVEL)
        return SendClientMessage(playerid, -1, "Samo OWNER moze koristiti ovu komandu!");

    new model;
    if(sscanf(params, "d", model))
        return SendClientMessage(playerid, -1, "Koristenje: /ocar [modelid]");

    new Float:x, Float:y, Float:z, Float:a;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);

    new veh = CreateVehicle(model, x+2, y, z, a, -1, -1, 0);
    PutPlayerInVehicle(playerid, veh, 0);

    SendClientMessage(playerid, -1, "OWNER auto stvoren!");
    return 1;
}
CMD:ovdel(playerid, params[])
{
    if(PlayerAdminLevel[playerid] != OWNER_LEVEL)
        return SendClientMessage(playerid, -1, "Samo OWNER!");

    if(!IsPlayerInAnyVehicle(playerid))
        return SendClientMessage(playerid, -1, "Nisi u autu!");

    DestroyVehicle(GetPlayerVehicleID(playerid));
    SendClientMessage(playerid, -1, "Auto obrisano!");
    return 1;
}
CMD:ogoto(playerid, params[])
{
    if(PlayerAdminLevel[playerid] != OWNER_LEVEL)
        return SendClientMessage(playerid, -1, "Samo OWNER!");

    new targetid;
    if(sscanf(params, "u", targetid))
        return SendClientMessage(playerid, -1, "Koristenje: /ogoto [playerid]");

    new Float:x, Float:y, Float:z;
    GetPlayerPos(targetid, x, y, z);
    SetPlayerPos(playerid, x+1, y, z);

    SendClientMessage(playerid, -1, "Teleportovan!");
    return 1;
}
CMD:okick(playerid, params[])
{
    if(PlayerAdminLevel[playerid] != OWNER_LEVEL)
        return SendClientMessage(playerid, -1, "Samo OWNER!");

    new targetid, reason[64];
    if(sscanf(params, "uS()[64]", targetid, reason))
        return SendClientMessage(playerid, -1, "Koristenje: /okick [playerid] [razlog]");

    Kick(targetid);
    SendClientMessage(playerid, -1, "Igrac kickovan!");
    return 1;
}
/rcon login TVOJA_RCON_SIFRA   
	

#include <a_samp>
#pragma tabsize 0
#include <zcmd>
#include <streamer>
#define COLOR_ROPE 0x33CCFFAA
main(){}

new rope[59];

CMD:duday(playerid,params[])
{
       if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_ROPE, "Ban khong the du day o trong mot chiec xe!");
       if(GetPlayerSkin(playerid)!= 285) return SendClientMessage(playerid, COLOR_ROPE,"Ban Khong The Du Day!");
       if(GetPVarInt(playerid,"rappelling") == 1) return SendClientMessage(playerid, COLOR_ROPE, "Ban dang du day khong the thuc hien lai thao tac nay!");
       new Float:X, Float:Y, Float:Z,Float:Angle;
       GetPlayerPos(playerid, X, Y, Z);
       GetXYInFrontOfPlayer(playerid, X, Y, 5.0);
       SetPlayerPos(playerid, X, Y, Z);
       SetPlayerHealth(playerid, 1000);
       SetPVarInt(playerid,"rappelling",1);
       GameTextForPlayer(playerid, "~B~Ban Dang ~R~Du day", 5000, 1);
       rope[1] = CreateDynamicObject(19089, X, Y, Z+5, 0, 0, Angle);
       rope[2] = CreateDynamicObject(19089, X, Y, Z+3, 0, 0, Angle);
       rope[3] = CreateDynamicObject(19089, X, Y, Z+1, 0, 0, Angle);
       rope[4] = CreateDynamicObject(19089, X, Y, Z-2, 0, 0, Angle);
       rope[5] = CreateDynamicObject(19089, X, Y, Z-5, 0, 0, Angle);
       rope[6] = CreateDynamicObject(19089, X, Y, Z-7, 0, 0, Angle);
       rope[7] = CreateDynamicObject(19089, X, Y, Z-9, 0, 0, Angle);
       rope[8] = CreateDynamicObject(19089, X, Y, Z-10, 0, 0, Angle);
       rope[9] = CreateDynamicObject(19089, X, Y, Z-12, 0, 0, Angle);
       rope[10] = CreateDynamicObject(19089, X, Y, Z-17, 0, 0, Angle);
       rope[11] = CreateDynamicObject(19089, X, Y, Z-25, 0, 0, Angle);
       rope[12] = CreateDynamicObject(19089, X, Y, Z-28, 0, 0, Angle);
       rope[13] = CreateDynamicObject(19089, X, Y, Z-31, 0, 0, Angle);
       rope[14] = CreateDynamicObject(19089, X, Y, Z-34, 0, 0, Angle);
       rope[15] = CreateDynamicObject(19089, X, Y, Z-38, 0, 0, Angle);
       rope[16] = CreateDynamicObject(19089, X, Y, Z-41, 0, 0, Angle);
       rope[17] = CreateDynamicObject(19089, X, Y, Z-45, 0, 0, Angle);
       rope[18] = CreateDynamicObject(19089, X, Y, Z-49, 0, 0, Angle);
       rope[19] = CreateDynamicObject(19089, X, Y, Z-51, 0, 0, Angle);
       rope[20] = CreateDynamicObject(19089, X, Y, Z-57, 0, 0, Angle);
       rope[21] = CreateDynamicObject(19089, X, Y, Z-61, 0, 0, Angle);
       rope[22] = CreateDynamicObject(19089, X, Y, Z-65, 0, 0, Angle);
       rope[23] = CreateDynamicObject(19089, X, Y, Z-69, 0, 0, Angle);
       rope[24] = CreateDynamicObject(19089, X, Y, Z-73, 0, 0, Angle);
       rope[25] = CreateDynamicObject(19089, X, Y, Z-77, 0, 0, Angle);
       rope[26] = CreateDynamicObject(19089, X, Y, Z-80, 0, 0, Angle);
       rope[27] = CreateDynamicObject(19089, X, Y, Z-85, 0, 0, Angle);
       rope[28] = CreateDynamicObject(19089, X, Y, Z-89, 0, 0, Angle);
       rope[29] = CreateDynamicObject(19089, X, Y, Z-90, 0, 0, Angle);
       rope[30] = CreateDynamicObject(19089, X, Y, Z-95, 0, 0, Angle);
       rope[31] = CreateDynamicObject(19089, X, Y, Z-87, 0, 0, Angle);
       rope[32] = CreateDynamicObject(19089, X, Y, Z-100, 0, 0, Angle);
       rope[33] = CreateDynamicObject(19089, X, Y, Z-105, 0, 0, Angle);
       rope[34] = CreateDynamicObject(19089, X, Y, Z-110, 0, 0, Angle);
       rope[35] = CreateDynamicObject(19089, X, Y, Z-115, 0, 0, Angle);
       rope[36] = CreateDynamicObject(19089, X, Y, Z-120, 0, 0, Angle);
       rope[37] = CreateDynamicObject(19089, X, Y, Z-125, 0, 0, Angle);
       rope[38] = CreateDynamicObject(19089, X, Y, Z-130, 0, 0, Angle);
       rope[39] = CreateDynamicObject(19089, X, Y, Z-135, 0, 0, Angle);
       rope[40] = CreateDynamicObject(19089, X, Y, Z-140, 0, 0, Angle);
       rope[41] = CreateDynamicObject(19089, X, Y, Z-145, 0, 0, Angle);
       rope[42] = CreateDynamicObject(19089, X, Y, Z-150, 0, 0, Angle);
       rope[43] = CreateDynamicObject(19089, X, Y, Z-155, 0, 0, Angle);
       rope[45] = CreateDynamicObject(19089, X, Y, Z-160, 0, 0, Angle);
       rope[46] = CreateDynamicObject(19089, X, Y, Z-165, 0, 0, Angle);
       rope[47] = CreateDynamicObject(19089, X, Y, Z-170, 0, 0, Angle);
       rope[48] = CreateDynamicObject(19089, X, Y, Z-175, 0, 0, Angle);
       rope[49] = CreateDynamicObject(19089, X, Y, Z-180, 0, 0, Angle);
       rope[50] = CreateDynamicObject(19089, X, Y, Z-185, 0, 0, Angle);
       rope[51] = CreateDynamicObject(19089, X, Y, Z-190, 0, 0, Angle);
       rope[52] = CreateDynamicObject(19089, X, Y, Z-195, 0, 0, Angle);
       rope[53] = CreateDynamicObject(19089, X, Y, Z-200, 0, 0, Angle);
       rope[54] = CreateDynamicObject(19089, X, Y, Z-205, 0, 0, Angle);
       rope[55] = CreateDynamicObject(19089, X, Y, Z-210, 0, 0, Angle);
       rope[56] = CreateDynamicObject(19089, X, Y, Z-215, 0, 0, Angle);
       rope[57] = CreateDynamicObject(19089, X, Y, Z-220, 0, 0, Angle);
       ApplyAnimation(playerid,"ped","abseil",4.0,0,0,0,1,0);
           return 1;
}
CMD:duday2(playerid,params[])
{
       new vehicleid = GetPlayerVehicleID(playerid);
       if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
       {
             SendClientMessage(playerid, COLOR_ROPE, "Ban khong the lam viec nay khi dang lai may bay!");
             return 1;
       }
       if(GetVehicleModel(vehicleid) != 497) return SendClientMessage(playerid, COLOR_ROPE,"Ban khong o trong mot chiec may bay canh sat(Maverick Police)!");
       if(GetPlayerSkin(playerid)!= 285) return SendClientMessage(playerid, COLOR_ROPE,"Ban khong the du day!");
       if(GetPVarInt(playerid,"rappelling") == 1) return SendClientMessage(playerid, COLOR_ROPE, "Ban da du day roi!");
       {
               RemovePlayerFromVehicle(playerid);
               new Float:X, Float:Y, Float:Z,Float:Angle;
               GetPlayerPos(playerid, X, Y, Z);
               SetPlayerPos(playerid, X, Y, Z-5);
               GetPlayerFacingAngle(playerid, Angle);
               GameTextForPlayer(playerid, "~B~Ban Dang ~R~Du day", 5000, 1);
               SetPlayerHealth(playerid, 1000);
               SetPVarInt(playerid,"rappelling",1);
               rope[1] = CreateDynamicObject(19089, X, Y, Z+5, 0, 0, Angle);
               rope[2] = CreateDynamicObject(19089, X, Y, Z+3, 0, 0, Angle);
               rope[3] = CreateDynamicObject(19089, X, Y, Z+1, 0, 0, Angle);
               rope[4] = CreateDynamicObject(19089, X, Y, Z-2, 0, 0, Angle);
               rope[5] = CreateDynamicObject(19089, X, Y, Z-5, 0, 0, Angle);
               rope[6] = CreateDynamicObject(19089, X, Y, Z-7, 0, 0, Angle);
               rope[7] = CreateDynamicObject(19089, X, Y, Z-9, 0, 0, Angle);
               rope[8] = CreateDynamicObject(19089, X, Y, Z-10, 0, 0, Angle);
               rope[9] = CreateDynamicObject(19089, X, Y, Z-12, 0, 0, Angle);
               rope[10] = CreateDynamicObject(19089, X, Y, Z-17, 0, 0, Angle);
               rope[11] = CreateDynamicObject(19089, X, Y, Z-25, 0, 0, Angle);
               rope[12] = CreateDynamicObject(19089, X, Y, Z-28, 0, 0, Angle);
               rope[13] = CreateDynamicObject(19089, X, Y, Z-31, 0, 0, Angle);
               rope[14] = CreateDynamicObject(19089, X, Y, Z-34, 0, 0, Angle);
               rope[15] = CreateDynamicObject(19089, X, Y, Z-38, 0, 0, Angle);
               rope[16] = CreateDynamicObject(19089, X, Y, Z-41, 0, 0, Angle);
               rope[17] = CreateDynamicObject(19089, X, Y, Z-45, 0, 0, Angle);
               rope[18] = CreateDynamicObject(19089, X, Y, Z-49, 0, 0, Angle);
               rope[19] = CreateDynamicObject(19089, X, Y, Z-51, 0, 0, Angle);
               rope[20] = CreateDynamicObject(19089, X, Y, Z-57, 0, 0, Angle);
               rope[21] = CreateDynamicObject(19089, X, Y, Z-61, 0, 0, Angle);
               rope[22] = CreateDynamicObject(19089, X, Y, Z-65, 0, 0, Angle);
               rope[23] = CreateDynamicObject(19089, X, Y, Z-69, 0, 0, Angle);
               rope[24] = CreateDynamicObject(19089, X, Y, Z-73, 0, 0, Angle);
               rope[25] = CreateDynamicObject(19089, X, Y, Z-77, 0, 0, Angle);
               rope[26] = CreateDynamicObject(19089, X, Y, Z-80, 0, 0, Angle);
               rope[27] = CreateDynamicObject(19089, X, Y, Z-85, 0, 0, Angle);
               rope[28] = CreateDynamicObject(19089, X, Y, Z-89, 0, 0, Angle);
               rope[29] = CreateDynamicObject(19089, X, Y, Z-90, 0, 0, Angle);
               rope[30] = CreateDynamicObject(19089, X, Y, Z-95, 0, 0, Angle);
               rope[31] = CreateDynamicObject(19089, X, Y, Z-87, 0, 0, Angle);
               rope[32] = CreateDynamicObject(19089, X, Y, Z-100, 0, 0, Angle);
               rope[33] = CreateDynamicObject(19089, X, Y, Z-105, 0, 0, Angle);
               rope[34] = CreateDynamicObject(19089, X, Y, Z-110, 0, 0, Angle);
               rope[35] = CreateDynamicObject(19089, X, Y, Z-115, 0, 0, Angle);
               rope[36] = CreateDynamicObject(19089, X, Y, Z-120, 0, 0, Angle);
               rope[37] = CreateDynamicObject(19089, X, Y, Z-125, 0, 0, Angle);
               rope[38] = CreateDynamicObject(19089, X, Y, Z-130, 0, 0, Angle);
               rope[39] = CreateDynamicObject(19089, X, Y, Z-135, 0, 0, Angle);
               rope[40] = CreateDynamicObject(19089, X, Y, Z-140, 0, 0, Angle);
               rope[41] = CreateDynamicObject(19089, X, Y, Z-145, 0, 0, Angle);
               rope[42] = CreateDynamicObject(19089, X, Y, Z-150, 0, 0, Angle);
               rope[43] = CreateDynamicObject(19089, X, Y, Z-155, 0, 0, Angle);
               rope[45] = CreateDynamicObject(19089, X, Y, Z-160, 0, 0, Angle);
               rope[46] = CreateDynamicObject(19089, X, Y, Z-165, 0, 0, Angle);
               rope[47] = CreateDynamicObject(19089, X, Y, Z-170, 0, 0, Angle);
               rope[48] = CreateDynamicObject(19089, X, Y, Z-175, 0, 0, Angle);
               rope[49] = CreateDynamicObject(19089, X, Y, Z-180, 0, 0, Angle);
               rope[50] = CreateDynamicObject(19089, X, Y, Z-185, 0, 0, Angle);
               rope[51] = CreateDynamicObject(19089, X, Y, Z-190, 0, 0, Angle);
               rope[52] = CreateDynamicObject(19089, X, Y, Z-195, 0, 0, Angle);
               rope[53] = CreateDynamicObject(19089, X, Y, Z-200, 0, 0, Angle);
               rope[54] = CreateDynamicObject(19089, X, Y, Z-205, 0, 0, Angle);
               rope[55] = CreateDynamicObject(19089, X, Y, Z-210, 0, 0, Angle);
               rope[56] = CreateDynamicObject(19089, X, Y, Z-215, 0, 0, Angle);
               rope[57] = CreateDynamicObject(19089, X, Y, Z-220, 0, 0, Angle);
               ApplyAnimation(playerid,"ped","abseil",4.0,0,0,0,1,0);
       }
        return 1;
}

GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
        new Float:a;
        GetPlayerPos(playerid, x, y, a);
        GetPlayerFacingAngle(playerid, a);
        if (GetPlayerVehicleID(playerid))
        {
            GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
        }
        x += (distance * floatsin(-a, degrees));
        y += (distance * floatcos(-a, degrees));
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if((newkeys && KEY_SPRINT) && GetPVarInt(playerid, "rappelling") == 1)
        {
            for(new i = 0 ;i <58; i++)
                {
                DestroyDynamicObject (0);
                }
        		SetPVarInt(playerid,"rappelling",0);
                ClearAnimations(playerid);
                SetPlayerHealth(playerid, 100);
                return 1;
        }
        return 1;
}

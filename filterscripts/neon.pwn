//---------Redreaper666's and Aston482UK's advanced Neon4Cars Filerscript---------
#include <a_samp>
#include <zcmd>
#include <core>
#include <float>
//------------------------------------------------------------------------------
#define DIALOG_NEONTYPES 150
#define DIALOG_SOLID 151
#define DIALOG_SIMULTANEOUS 152
#define DIALOG_ALTERNATING 153
//------------------------------------------------------------------------------
new SolidNeon[MAX_VEHICLES],BlinkTimerT[MAX_VEHICLES],AltFlash[MAX_VEHICLES];
new Blue1[MAX_VEHICLES],Blue2[MAX_VEHICLES],Green1[MAX_VEHICLES],Green2[MAX_VEHICLES],Pink1[MAX_VEHICLES],Pink2[MAX_VEHICLES],Red1[MAX_VEHICLES],Red2[MAX_VEHICLES],White1[MAX_VEHICLES],White2[MAX_VEHICLES],Yellow1[MAX_VEHICLES],Yellow2[MAX_VEHICLES];
new BlinkTimer[MAX_VEHICLES];
new AltSide1[MAX_VEHICLES];
//------------------------------------------------------------------------------
stock IsNeonActive(vehicleid)
{
        if(BlinkTimer[vehicleid] == 1) return 1;
        if(SolidNeon[vehicleid] == 1) return 1;
        if(AltFlash[vehicleid] == 1) return 1;
        else return 0;
}
stock IsVehicleValid(v)
{
        if(v==403||v==406||v==407||v==408||v==416||v==417||v==424||v==425||v==430||v==432||v==433||v==435||v==437||v==441||v==443||v==444||v==446||v==447||v==448||v==449||v==450||v==452||v==453||v==454||v==455||v==456||v==457||v==460||v==461||v==462) return 0;
        if(v==463||v==464||v==465||v==468||v==469||v==470||v==471||v==472||v==473||v==476||v==481||v==484||v==485||v==486||v==487||v==488||v==493||v==497||v==500||v==501||v==509||v==510||v==511||v==512||v==513||v==514||v==515||v==519||v==520||v==521) return 0;
        if(v==522||v==523||v==524||v==530||v==532||v==537||v==538||v==539||v==544||v==548||v==553||v==556||v==557||v==563||v==564||v==568||v==569||v==570||v==571||v==572||v==573||v==574||v==577||v==578||v==581||v==582||v==584||v==583||v==586||v==590) return 0;
        if(v==591||v==592||v==593||v==594||v==595||v==601||v==606||v==607||v==608||v==610||v==11) return 0;
        else return 1;
}
//------------------------------------------------------------------------------
public OnVehicleDeath(vehicleid, killerid)
{
        StopBlinkNeons(vehicleid);
        return 1;
}
public OnVehicleSpawn(vehicleid)
{
        StopBlinkNeons(vehicleid);
        return 1;
}
//------------------------------------------------------------------------------
CMD:neon(playerid,params[])
{
        if(!IsVehicleValid(GetVehicleModel(GetPlayerVehicleID(playerid)))) return SendClientMessage(playerid, -1, "{FFFFFF}Ban khong the su dung lenh tren chiec xe nay.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "{F81414}Luu y: {FFFFFF}Ban phai o tren xe moi co the su dung lenh nay.");
        ShowPlayerDialog(playerid, DIALOG_NEONTYPES, DIALOG_STYLE_LIST, "Neon Settings", "The ran den/Khong co den\nChuyen Dong Den Neon/Lien Tuc\nChuyen dong Den Neon\nXoa tat ca neon", "Chon", "Huy bo");
        return 1;
}
//----------------------------------------------------------
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
        if(dialogid == DIALOG_NEONTYPES)
        {
            if(response == 1)
            {
                switch(listitem)
                {
                    case 0: ShowPlayerDialog(playerid, DIALOG_SOLID, DIALOG_STYLE_LIST, "Solid Vehicle Neon", "Blue\nGreen\nPink\nRed\nWhite\nYellow", "Chon", "Huy Bo");
                                case 1: ShowPlayerDialog(playerid, DIALOG_SIMULTANEOUS, DIALOG_STYLE_LIST, "Mau mau Neon", "Yellow\nBlue\nGreen\nPink\nRed\nWhite\nTat ca mau(Xe Dap)", "Chon", "Quay lai");
                                case 2: ShowPlayerDialog(playerid, DIALOG_ALTERNATING, DIALOG_STYLE_LIST, "Mau mau Neon", "Yellow\nBlue\nGreen\nPink\nRed\nWhite", "Chon", "Quay lai");
                                case 3: StopBlinkNeons(GetPlayerVehicleID(playerid));
                        }
                }
        }
        if(dialogid == DIALOG_SOLID)
        {
        if(response == 1)
        {
            if(IsNeonActive(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, -1, "{F81414}Luu y: {FFFFFF}Hay huy bo tat ca neon hien dau tien.");
            switch(listitem)
                {
                    case 0: SetBlueNeons(GetPlayerVehicleID(playerid));
                                case 1: SetGreenNeons(GetPlayerVehicleID(playerid));
                                case 2: SetPinkNeons(GetPlayerVehicleID(playerid));
                                case 3: SetRedNeons(GetPlayerVehicleID(playerid));
                                case 4: SetWhiteNeons(GetPlayerVehicleID(playerid));
                                case 5: SetYellowNeons(GetPlayerVehicleID(playerid));
                        }
                }
                else ShowPlayerDialog(playerid, DIALOG_NEONTYPES, DIALOG_STYLE_LIST, "Neon Settings", "The ran den/Khong co den\nChuyen Dong Den Neon/Lien Tuc\nChuyen dong Den Neon\nXoa tat ca neon", "Chon", "Huy Bo");
        }
        if(dialogid == DIALOG_SIMULTANEOUS)
        {
                if(response == 1)
                {
                    if(IsNeonActive(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, -1, "{F81414}Luu y: {FFFFFF}Hay huy bo tat ca neon hien dau tien.");
                    switch(listitem)
                    {
                                case 0: SetBlinkYellowNeons(GetPlayerVehicleID(playerid));
                                case 1: SetBlinkBlueNeons(GetPlayerVehicleID(playerid));
                                case 2: SetBlinkGreenNeons(GetPlayerVehicleID(playerid));
                                case 3: SetBlinkPinkNeons(GetPlayerVehicleID(playerid));
                                case 4: SetBlinkRedNeons(GetPlayerVehicleID(playerid));
                                case 5: SetBlinkWhiteNeons(GetPlayerVehicleID(playerid));
                                case 6: SetBlinkALLNeons(GetPlayerVehicleID(playerid));
                        }
                }
                else ShowPlayerDialog(playerid, DIALOG_NEONTYPES, DIALOG_STYLE_LIST, "Neon Settings", "The ran den/Khong co den\nChuyen Dong Den Neon/Lien Tuc\nChuyen dong Den Neon\nXoa tat ca neon", "Chon", "Huy Bo");
        }
        if(dialogid == DIALOG_ALTERNATING)
        {
                if(response == 1)
                {
                    if(IsNeonActive(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, -1, "{F81414}Luu y: {FFFFFF}Hay huy bo tat ca neon hien dau tien.");
                    switch(listitem)
                    {
                                case 0: SetAltYellow(GetPlayerVehicleID(playerid));
                                case 1: SetAltBlue(GetPlayerVehicleID(playerid));
                                case 2: SetAltGreen(GetPlayerVehicleID(playerid));
                                case 3: SetAltPink(GetPlayerVehicleID(playerid));
                                case 4: SetAltRed(GetPlayerVehicleID(playerid));
                                case 5: SetAltWhite(GetPlayerVehicleID(playerid));
                        }
                }
                else ShowPlayerDialog(playerid, DIALOG_NEONTYPES, DIALOG_STYLE_LIST, "Neon Settings", "The ran den/Khong co den\nChuyen Dong Den Neon/Lien Tuc\nChuyen dong Den Neon\nXoa tat ca neon", "Chon", "Huy Bo");

        }
        return 1;
}
//------------------------------------------------------------------------------
new ColorNumber = 18647;
new ALLCOLOR1[MAX_VEHICLES],ALLCOLOR2[MAX_VEHICLES];

forward SetBALLNeons(vehicleid);
public SetBALLNeons(vehicleid)
{
        ALLCOLOR1[vehicleid] = CreateObject(ColorNumber, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        ALLCOLOR2[vehicleid] = CreateObject(ColorNumber, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(ALLCOLOR1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(ALLCOLOR2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        SetTimerEx("DeleteNeons",500,0,"i",vehicleid);
        ColorNumber ++;
        if(ColorNumber == 18653)
    {
    ColorNumber --;
    ColorNumber --;
    ColorNumber --;
    ColorNumber --;
    ColorNumber --;
    ColorNumber --;
    }
        return 1;
}
forward SetBlinkALLNeons(vehicleid);
public SetBlinkALLNeons(vehicleid)
{
    if(BlinkTimer[vehicleid] == 0)
    {
        BlinkTimerT[vehicleid] = SetTimerEx("SetBALLNeons",1000,1, "i",vehicleid);
        BlinkTimer[vehicleid] = 1;
        }
    return 1;
}
//----------------------------------------------------------
forward SetBlueNeons(vehicleid);
public SetBlueNeons(vehicleid)
{
        StopBlinkNeons(vehicleid);
        SolidNeon[vehicleid] = 1;
        Blue1[vehicleid] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        Blue2[vehicleid] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Blue1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Blue2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        return 1;
}
forward SetBBlueNeons(vehicleid);
public SetBBlueNeons(vehicleid)
{
        Blue1[vehicleid] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        Blue2[vehicleid] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Blue1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Blue2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        SetTimerEx("DeleteNeons",500,0,"i",vehicleid);
        return 1;
}
forward SetBlinkBlueNeons(vehicleid);
public SetBlinkBlueNeons(vehicleid)
{
        BlinkTimerT[vehicleid] = SetTimerEx("SetBBlueNeons",1000,1, "i",vehicleid);
        BlinkTimer[vehicleid] = 1;
        return 1;
}
//----------------------------------------------------------
forward SetGreenNeons(vehicleid);
public SetGreenNeons(vehicleid)
{
    StopBlinkNeons(vehicleid);
    SolidNeon[vehicleid] = 1;
    Green1[vehicleid] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    Green2[vehicleid] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Green1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Green2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward SetBGreenNeons(vehicleid);
public SetBGreenNeons(vehicleid)
{
        Green1[vehicleid] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        Green2[vehicleid] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Green1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Green2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        SetTimerEx("DeleteNeons",500,0,"i",vehicleid);
        return 1;
}
forward SetBlinkGreenNeons(vehicleid);
public SetBlinkGreenNeons(vehicleid)
{
        BlinkTimerT[vehicleid] = SetTimerEx("SetBGreenNeons",1000,1, "i",vehicleid);
        BlinkTimer[vehicleid] = 1;
        return 1;
}
//----------------------------------------------------------
forward SetPinkNeons(vehicleid);
public SetPinkNeons(vehicleid)
{
    StopBlinkNeons(vehicleid);
    SolidNeon[vehicleid] = 1;
    Pink1[vehicleid] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    Pink2[vehicleid] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Pink1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Pink2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward SetBPinkNeons(vehicleid);
public SetBPinkNeons(vehicleid)
{
        Pink1[vehicleid] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        Pink2[vehicleid] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Pink1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Pink2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        SetTimerEx("DeleteNeons",500,0,"i",vehicleid);
        return 1;
}
forward SetBlinkPinkNeons(vehicleid);
public SetBlinkPinkNeons(vehicleid)
{
        BlinkTimerT[vehicleid] = SetTimerEx("SetBPinkNeons",1000,1, "i",vehicleid);
        BlinkTimer[vehicleid] = 1;
        return 1;
}
//----------------------------------------------------------
forward SetRedNeons(vehicleid);
public SetRedNeons(vehicleid)
{
    StopBlinkNeons(vehicleid);
    SolidNeon[vehicleid] = 1;
    Red1[vehicleid] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    Red2[vehicleid] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Red1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Red2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward SetBRedNeons(vehicleid);
public SetBRedNeons(vehicleid)
{
        Red1[vehicleid] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        Red2[vehicleid] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Red1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Red2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        SetTimerEx("DeleteNeons",500,0,"i",vehicleid);
        return 1;
}
forward SetBlinkRedNeons(vehicleid);
public SetBlinkRedNeons(vehicleid)
{
        BlinkTimerT[vehicleid] = SetTimerEx("SetBRedNeons",1000,1, "i",vehicleid);
        BlinkTimer[vehicleid] = 1;
        return 1;
}
//----------------------------------------------------------
forward SetWhiteNeons(vehicleid);
public SetWhiteNeons(vehicleid)
{
    StopBlinkNeons(vehicleid);
    SolidNeon[vehicleid] = 1;
    White1[vehicleid] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    White2[vehicleid] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(White1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(White2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward SetBWhiteNeons(vehicleid);
public SetBWhiteNeons(vehicleid)
{
    White1[vehicleid] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    White2[vehicleid] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(White1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(White2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    SetTimerEx("DeleteNeons",500,0,"i",vehicleid);
    return 1;
}
forward SetBlinkWhiteNeons(vehicleid);
public SetBlinkWhiteNeons(vehicleid)
{
        BlinkTimerT[vehicleid] = SetTimerEx("SetBWhiteNeons",1000,1, "i",vehicleid);
        BlinkTimer[vehicleid] = 1;
        return 1;
}
//----------------------------------------------------------
forward SetYellowNeons(vehicleid);
public SetYellowNeons(vehicleid)
{
    StopBlinkNeons(vehicleid);
    SolidNeon[vehicleid] = 1;
    Yellow1[vehicleid] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    Yellow2[vehicleid] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Yellow1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Yellow2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward SetBYellowNeons(vehicleid);
public SetBYellowNeons(vehicleid)
{
        Yellow1[vehicleid] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        Yellow2[vehicleid] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Yellow1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Yellow2[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        SetTimerEx("DeleteNeons",500,0,"i",vehicleid);
        return 1;
}
forward SetBlinkYellowNeons(vehicleid);
public SetBlinkYellowNeons(vehicleid)
{
        BlinkTimerT[vehicleid] = SetTimerEx("SetBYellowNeons",1000,1, "i",vehicleid);
        BlinkTimer[vehicleid] = 1;
        return 1;
}
//----------------------------------------------------------
forward SetAltYellow(vehicleid);
public SetAltYellow(vehicleid)
{
    BlinkTimerT[vehicleid] = SetTimerEx("AltYellow",500,1,"i",vehicleid);
    AltFlash[vehicleid] = 1;
    AltSide1[vehicleid] = 0;
    Yellow1[vehicleid] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Yellow1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward AltYellow(vehicleid);
public AltYellow(vehicleid)
{
        if(AltSide1[vehicleid] == 0)
        {
        DestroyObject(Yellow1[vehicleid]);
        Yellow1[vehicleid] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Yellow1[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 1;
    }
        else if(AltSide1[vehicleid] == 1)
        {
        DestroyObject(Yellow1[vehicleid]);
        Yellow1[vehicleid] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Yellow1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 0;
    }
        return 1;
}
//----------------------------------------------------------
forward SetAltBlue(vehicleid);
public SetAltBlue(vehicleid)
{
    BlinkTimerT[vehicleid] = SetTimerEx("AltBlue",500,1,"i",vehicleid);
    AltFlash[vehicleid] = 1;
    AltSide1[vehicleid] = 0;
    Blue1[vehicleid] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Blue1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
 }
forward AltBlue(vehicleid);
public AltBlue(vehicleid)
{
        if(AltSide1[vehicleid] == 0)
        {
        DestroyObject(Blue1[vehicleid]);
        Blue1[vehicleid] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Blue1[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 1;
    }
        else if(AltSide1[vehicleid] == 1)
        {
        DestroyObject(Blue1[vehicleid]);
        Blue1[vehicleid] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Blue1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 0;
    }
        return 1;
}
//----------------------------------------------------------
forward SetAltGreen(vehicleid);
public SetAltGreen(vehicleid)
{
    BlinkTimerT[vehicleid] = SetTimerEx("AltGreen",500,1,"i",vehicleid);
    AltFlash[vehicleid] = 1;
    AltSide1[vehicleid] = 0;
    Green1[vehicleid] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Green1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward AltGreen(vehicleid);
public AltGreen(vehicleid)
{
        if(AltSide1[vehicleid] == 0)
        {
        DestroyObject(Green1[vehicleid]);
        Green1[vehicleid] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Green1[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 1;
    }
        else if(AltSide1[vehicleid] == 1)
        {
        DestroyObject(Green1[vehicleid]);
        Green1[vehicleid] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Green1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 0;
    }
        return 1;
}
//----------------------------------------------------------
forward SetAltPink(vehicleid);
public SetAltPink(vehicleid)
{
     BlinkTimerT[vehicleid] = SetTimerEx("AltPink",500,1,"i",vehicleid);
     AltFlash[vehicleid] = 1;
     AltSide1[vehicleid] = 0;
     Pink1[vehicleid] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
     AttachObjectToVehicle(Pink1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
     return 1;
 }
forward AltPink(vehicleid);
public AltPink(vehicleid)
{
        if(AltSide1[vehicleid] == 0)
        {
        DestroyObject(Pink1[vehicleid]);
        Pink1[vehicleid] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Pink1[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 1;
    }
        else if(AltSide1[vehicleid] == 1)
        {
        DestroyObject(Pink1[vehicleid]);
        Pink1[vehicleid] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Pink1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 0;
    }
        return 1;
}
//----------------------------------------------------------
forward SetAltRed(vehicleid);
public SetAltRed(vehicleid)
{
    BlinkTimerT[vehicleid] = SetTimerEx("AltRed",500,1,"i",vehicleid);
    AltFlash[vehicleid] = 1;
    AltSide1[vehicleid] = 0;
    Red1[vehicleid] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(Red1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
 }
forward AltRed(vehicleid);
public AltRed(vehicleid)
{
        if(AltSide1[vehicleid] == 0)
        {
        DestroyObject(Red1[vehicleid]);
        Red1[vehicleid] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Red1[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 1;
    }
        else if(AltSide1[vehicleid] == 1)
        {
        DestroyObject(Red1[vehicleid]);
        Red1[vehicleid] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(Red1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 0;
    }
        return 1;
}
//----------------------------------------------------------
forward SetAltWhite(vehicleid);
public SetAltWhite(vehicleid)
{
    BlinkTimerT[vehicleid] = SetTimerEx("AltWhite",500,1,"i",vehicleid);
    AltFlash[vehicleid] = 1;
    AltSide1[vehicleid] = 0;
    White1[vehicleid] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToVehicle(White1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
    return 1;
}
forward AltWhite(vehicleid);
public AltWhite(vehicleid)
{
        if(AltSide1[vehicleid] == 0)
        {
        DestroyObject(White1[vehicleid]);
        White1[vehicleid] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(White1[vehicleid], vehicleid, 0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 1;
    }
        else if(AltSide1[vehicleid] == 1)
        {
        DestroyObject(White1[vehicleid]);
        White1[vehicleid] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        AttachObjectToVehicle(White1[vehicleid], vehicleid, -0.8, 0.0, -0.55, 0.0, 0.0, 0.0);
        AltSide1[vehicleid] = 0;
    }
        return 1;
}
//----------------------------------------------------------
forward StopBlinkNeons(vehicleid);
public StopBlinkNeons(vehicleid)
{
        KillTimer(BlinkTimerT[vehicleid]);
        DeleteNeons(vehicleid);
        BlinkTimer[vehicleid] = 0;
        AltFlash[vehicleid] = 0;
        return 1;
}
//----------------------------------------------------------
forward Hydraulics(playerid, vehicleid);
public Hydraulics(playerid, vehicleid)
{
        AddVehicleComponent(vehicleid,1087);
        return 1;
}
//----------------------------------------------------------
forward DeleteNeons(vehicleid);
public DeleteNeons(vehicleid)
{
        SolidNeon[vehicleid] = 0;
        DestroyObject(Blue1[vehicleid]);
        DestroyObject(Blue2[vehicleid]);
        DestroyObject(Green1[vehicleid]);
        DestroyObject(Green2[vehicleid]);
        DestroyObject(Pink1[vehicleid]);
        DestroyObject(Pink2[vehicleid]);
        DestroyObject(Red1[vehicleid]);
        DestroyObject(Red2[vehicleid]);
        DestroyObject(Yellow1[vehicleid]);
        DestroyObject(Yellow2[vehicleid]);
        DestroyObject(White1[vehicleid]);
        DestroyObject(White2[vehicleid]);
        DestroyObject(ALLCOLOR1[vehicleid]);
        DestroyObject(ALLCOLOR2[vehicleid]);
        return 1;
}
//------------------------------------------------------------------------------

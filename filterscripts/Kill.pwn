#include <a_samp> // SA:MP Team

new
    PlayerText:tComb[MAX_PLAYERS],
    pKills[MAX_PLAYERS],
    TempTD[MAX_PLAYERS]
;

public OnPlayerConnect(playerid)
    return CreateTextDraw(playerid), KillTimer(KillTimer(TempTD[playerid])), 0;

public OnPlayerDisconnect(playerid)
    return DeleteTD(playerid), 0;

public OnPlayerDeath(playerid, killerid, reason)
{
    pKills[playerid] = 0;
    pKills[killerid] += 1;
    KillTimer(TempTD[playerid]);
    if(pKills[killerid] == 2)
    {
        PlayAudioStreamForPlayer(killerid, "http://mobcup.net/dl/5EF93AFFF68379F428545AAD29B30F88A3D7783683171306B472466129917047F71EE55549FEBFF2DB4D457BFC8F429D0C0D29E1BA817C1BD1C505184F2BEB8CD70160F0BA3D7146B67E712E6D707140BA0D0685CFA0EFA8A40BA2623A01C2914F.mp3");
        PlayerTextDrawSetString(killerid, tComb[killerid], "Double Kill");
        PlayerTextDrawColor(killerid, tComb[killerid], -2686721);
        PlayerTextDrawShow(killerid, tComb[killerid]);
        if(TempTD[killerid]) KillTimer(TempTD[killerid]);
        TempTD[killerid] = SetTimerEx("DeleteTD", 3500, false, "d", killerid);
    }
    if(pKills[killerid] == 3)
    {
        PlayAudioStreamForPlayer(killerid, "http://e-nautia.com/henri.locatelli/disk/steam/FastDL/csgo/sound/quake/standard/multikill.mp3.bz2");
        PlayerTextDrawSetString(killerid, tComb[killerid], "Multi Kill");
        PlayerTextDrawColor(killerid, tComb[killerid], -65281);
        PlayerTextDrawShow(killerid, tComb[killerid]);
        if(TempTD[killerid]) KillTimer(TempTD[killerid]);
        TempTD[killerid] = SetTimerEx("DeleteTD", 3500, false, "d", killerid);
    }
    if(pKills[killerid] == 4)
    {
        PlayAudioStreamForPlayer(killerid, "http://dc544.4shared.com/img/4281406970/455d029a/dlink__2Fdownload_2FuEXYbOPa_3Ftsid_3D20131230-195405-a92b5017_26dsid_3D17lvwy.422e3569f7f7c0759c738343eb9123a5/preview.mp3");
        PlayerTextDrawSetString(killerid, tComb[killerid], "Ultra Kill");
        PlayerTextDrawColor(killerid, tComb[killerid], -7601921);
        PlayerTextDrawShow(killerid, tComb[killerid]);
        if(TempTD[killerid]) KillTimer(TempTD[killerid]);
        TempTD[killerid] = SetTimerEx("DeleteTD", 3500, false, "d", killerid);
    }
    if(pKills[killerid] == 5)
    {
        PlayAudioStreamForPlayer(killerid, "http://dc691.4shared.com/img/4281408708/ee864656/dlink__2Fdownload_2FAi2HfzLr_3Ftsid_3D20131230-195502-c130ba15_26dsid_3D17lvwy.d3fc5874202c8fa5ceae74c73d5367a2/preview.mp3");
        PlayerTextDrawSetString(killerid, tComb[killerid], "Fantastic");
        PlayerTextDrawColor(killerid, tComb[killerid], -16776961);
        PlayerTextDrawShow(killerid, tComb[killerid]);
        if(TempTD[killerid]) KillTimer(TempTD[killerid]);
        TempTD[killerid] = SetTimerEx("DeleteTD", 3500, false, "d", killerid);
    }
    if(pKills[killerid] >= 6)
    {
        PlayAudioStreamForPlayer(killerid, "http://dc591.4shared.com/img/4281409982/74a86f2f/dlink__2Fdownload_2FTdjyU9YB_3Ftsid_3D20131230-195543-b2bd8d_26dsid_3D17lvwy.97833465d64208589bc1343e8fd85951/preview.mp3");
        if(pKills[killerid] == 6) PlayerTextDrawSetString(killerid, tComb[killerid], "Unbelievable");
        if(pKills[killerid] > 6) PlayerTextDrawSetString(killerid, tComb[killerid], "Unbelievable+");
        if(pKills[killerid] == 6) PlayerTextDrawColor(killerid, tComb[killerid], -855637761);
        if(pKills[killerid] > 6) PlayerTextDrawColor(killerid, tComb[killerid], -1962934017);
        PlayerTextDrawShow(killerid, tComb[killerid]);
        if(TempTD[killerid]) KillTimer(TempTD[killerid]);
        TempTD[killerid] = SetTimerEx("DeleteTD", 3500, false, "d", killerid);
    }
    return 0;
}


// ================================================= //
forward DeleteTD(playerid);
public DeleteTD(playerid)
    return PlayerTextDrawHide(playerid, tComb[playerid]), pKills[playerid] = 0, KillTimer(KillTimer(TempTD[playerid]));

forward CreateTextDraw(playerid);
public CreateTextDraw(playerid)
{
    tComb[playerid] = CreatePlayerTextDraw(playerid, 261.000000, 121.000000, "");
    PlayerTextDrawFont(playerid, tComb[playerid], 1);
    PlayerTextDrawColor(playerid, tComb[playerid], -2686721);
    PlayerTextDrawSetOutline(playerid, tComb[playerid], 1);
    PlayerTextDrawSetProportional(playerid, tComb[playerid], 1);
    PlayerTextDrawSetShadow(playerid, tComb[playerid], 1);
    PlayerTextDrawLetterSize(playerid, tComb[playerid], 0.680000, 2.500000);
    pKills[playerid] = 0;
    return 1;
}

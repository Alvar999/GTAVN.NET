#include <a_samp>

new
    Text: text_Top5[2]
;

enum rankingEnum
{
    player_Score,
    player_ID
}

public OnFilterScriptInit()
{
    text_Top5[0] = TextDrawCreate(79.000000, 135.000000, "Bang Xep Hang Top 5 Level");
    TextDrawAlignment(text_Top5[0], 2);
    TextDrawBackgroundColor(text_Top5[0], 255);
    TextDrawFont(text_Top5[0], 1);
    TextDrawLetterSize(text_Top5[0], 0.280000, 1.499999);
    TextDrawColor(text_Top5[0], -1);
    TextDrawSetOutline(text_Top5[0], 0);
    TextDrawSetProportional(text_Top5[0], 1);
    TextDrawSetShadow(text_Top5[0], 0);

    text_Top5[1] = TextDrawCreate(16.000000, 135.000000, " ");
    TextDrawBackgroundColor(text_Top5[1], 255);
    TextDrawFont(text_Top5[1], 1);
    TextDrawLetterSize(text_Top5[1], 0.200000, 0.999999);
    TextDrawColor(text_Top5[1], -1);
    TextDrawSetOutline(text_Top5[1], 0);
    TextDrawSetProportional(text_Top5[1], 1);
    TextDrawSetShadow(text_Top5[1], 0);
    TextDrawUseBox(text_Top5[1], 1);
    TextDrawBoxColor(text_Top5[1], 150);
    TextDrawTextSize(text_Top5[1], 143.000000, 20.000000);
    return 1;
}

public OnFilterScriptExit()
{
    TextDrawDestroy(text_Top5[0]);
    TextDrawDestroy(text_Top5[1]);
    return 1;
}

stock GetPlayerHighestScores(array[][rankingEnum], left, right)
{
    new
        tempLeft = left,
        tempRight = right,
        pivot = array[(left + right) / 2][player_Score],
        tempVar
    ;
    while(tempLeft <= tempRight)
    {
        while(array[tempLeft][player_Score] > pivot) tempLeft++;
        while(array[tempRight][player_Score] < pivot) tempRight--;

        if(tempLeft <= tempRight)
        {
            tempVar = array[tempLeft][player_Score], array[tempLeft][player_Score] = array[tempRight][player_Score], array[tempRight][player_Score] = tempVar;
            tempVar = array[tempLeft][player_ID], array[tempLeft][player_ID] = array[tempRight][player_ID], array[tempRight][player_ID] = tempVar;
            tempLeft++, tempRight--;
        }
    }
    if(left < tempRight) GetPlayerHighestScores(array, left, tempRight);
    if(tempLeft < right) GetPlayerHighestScores(array, tempLeft, right);
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/bangxephang", true))
    {
        new
            playerScores[MAX_PLAYERS][rankingEnum],
            index
        ;
        for(new i; i != MAX_PLAYERS; ++i)
        {
            if(IsPlayerConnected(i) && !IsPlayerNPC(i))
            {
                playerScores[index][player_Score] = GetPlayerScore(i);
                playerScores[index++][player_ID] = i;
            }
        }
        GetPlayerHighestScores(playerScores, 0, index);

        new
            score_Text[256] = "~n~",
            player_Name[20]
        ;
        for(new i; i < 5; ++i)
        {
            if(i < index)
            {
                GetPlayerName(playerScores[i][player_ID], player_Name, sizeof(player_Name));
                format(score_Text, sizeof(score_Text), "%s~n~~b~%d. ~w~%s - ~r~%d", score_Text, i + 1, player_Name, playerScores[i][player_Score]);
            }
            else
                format(score_Text, sizeof(score_Text), "%s~n~~b~%d. ~r~Khong Co", score_Text, i + 1);
        }
        TextDrawSetString(text_Top5[1], score_Text);
        TextDrawShowForPlayer(playerid, text_Top5[0]);
        TextDrawShowForPlayer(playerid, text_Top5[1]);
        return 1;
    }
    return 0;
}

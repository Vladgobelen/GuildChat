local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
    local nik=sender
    local str = string.gsub(message, "%s+", "")
    if (nik ~= "Двацветок" and nik ~= "Витинари" and nik ~= "Железобетонс" and nik ~= "Детрит") then
        if str == "ВОЖДЬ" then
            SendChatMessage(nik .. ", простой или сложный?", "guild", nil, 1)
        elseif string.find (message, "ВОЖДЬ сдать") then
            SendChatMessage(nik .. ", опыт или деньги?", "guild", nil, 1)
        elseif string.find (message, "ВОЖДЬ опыт") then
            SendChatMessage(nik .. " получает 2 опыта." .. " До лвлапа осталось [заглушка сделаю позже]", "guild", nil, 1)
        elseif string.find (message, "ВОЖДЬ деньги") then
            SendChatMessage(nik .. " получит [стандартная награда для gildLvl_nik] реализую позже", "guild", nil, 1)
            SendChatMessage(nik .. " получает 1 опыта." .. " До лвлапа осталось [заглушка сделаю позже]", "guild", nil, 1)
        else
        end
    end

    local str2 = string.gsub(message, "%s+", "")
    if string.find (str2, "mostrareID") then
        for i=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(i)

            if name == sender then
                print (i)
                print (name)
                print (publicNote)
                GuildRosterSetPublicNote(i, publicNote .. "+1")
            else
            end
        end
    else
    end

    --local str1 = string.gsub(message, "%s+", "")
    --local str2 = tonumber (str1)

    --if completed == GetAchievementInfo(str2) then
     --   SendChatMessage(GetAchievementLink(str2) .. "ачивка есть", "guild", nil, 1);
      --  print (GetAchievementLink(str2) .. "ачивка есть")
    --else
      --  SendChatMessage(GetAchievementLink(str2) .. "ачивки нету", "guild", nil, 1);
      --  print (GetAchievementLink(str2) .. "ачивки нету")
    --end
end

)

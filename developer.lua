local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)

--команды для управления квестами
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
    --возможность игроку писать свою заметку
    if string.find (message, "@заметка") then
        local vz = (message):gsub("@заметка ", "");
        for z=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(z)
            if name == sender then
                GuildRosterSetPublicNote(z, vz)
            else
            end
        end
    else
    end
    --справка
    if string.find (message, "ВОЖДЬ инфо") then
        SendChatMessage("Подробности о квестах и командах: https://t.me/AnkMorporkInfo", "WHISPER", Nil, sender);
        SendChatMessage("Получить квест:     ВОЖДЬ", "WHISPER", Nil, sender);
        SendChatMessage("Сдать квест:        ВОЖДЬ сдать", "WHISPER", Nil, sender);
        SendChatMessage("Заполнить заметку:  @заметка Текст заметки", "WHISPER", Nil, sender);
    else
    end
end

    --запись о прогрессе в информацию о персонаже (заготовка)
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



end

)

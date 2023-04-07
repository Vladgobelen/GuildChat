local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local str = string.gsub(message, "%s+", "")
function all_trim(s)
        return s:match( "^%s*(.-)%s*$" )
end
function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end
if pQuests == nil then
    pQuests={}
end
if pQuests[1] == nil then
   pQuests[1]={}
end
if pQuests[2] == nil then
    pQuests[2]={}
end
if pQuests[3] == nil then
    pQuests[3]={}
end
local nachalo = string.sub(message, 1, 1)
    if str == "ВОЖДЬ" and nachalo~="*" then
        for guokZ=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
            if name == sender then
                local denT = string.sub(officerNote, 6, 7)
                local qN = string.sub(officerNote, 8, 8)
                local gildLvl = string.sub(officerNote, 1, 1)
                qN = tonumber (qN)
                denn = {}
                denn = date("%d")
                denn = tonumber(denn)
                denT = tonumber(denT)

                gildLvl = tonumber (gildLvl)
                if denn == denT then
                   if qN >= gildLvl then
                        SendChatMessage("*" .. name .. ", следущий квест на твоем гильдлвле доступен завтра, но тебе доступен дополнительный квест с повышенным опытом.", "guild", nil, 1)
                   else
                        SendChatMessage("*" .. nik .. ", простой или сложный?", "guild", nil, 1)
                   end
                else
                    SendChatMessage("*" .. nik .. ", простой или сложный?", "guild", nil, 1)
                end
            else
            end
        end
    elseif str == "ВОЖДЬ сдать" and nachalo~="*" then
        SendChatMessage("*" .. nik .. ", опыт или деньги?", "guild", nil, 1)
    elseif string.find (message, "ВОЖДЬ опыт") and nachalo~="*" then
        SendChatMessage("*" .. nik .. " получает 2 опыта." .. " До лвлапа осталось [заглушка сделаю позже]", "guild", nil, 1)
    elseif string.find (message, "ВОЖДЬ, хочу больше квестов и опыта!!!") and nachalo~="*" then
        if TDG[sender]["доп_квест"]==nil or TDG[sender]["доп_квест"]=="9999" then
            local kol=0

                for guokZ=1,GetNumGuildMembers(true) do
                    local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
                        kol=kol+1
                end
                local kol1=kol+30
                SendChatMessage("*" .. sender .. ", сейчас в гильдии " .. kol .. " игроков. Должно стать " .. kol1, "guild", nil, 1);
                TDG[sender]["доп_квест"]=kol1
        else
            poluchenoKolichestvo=TDG[sender]["доп_квест"]
            SendChatMessage("*" .. sender .. ", у тебя уже есть квест. Для выполнения в гильдии должно стать " .. poluchenoKolichestvo .. " игроков.", "guild", nil, 1);
        end
    elseif string.find (message, "!удалить") and sender=="Витинари" and nachalo~="*" then
        msg = all_trim(message)
        msg = (msg):gsub(nik, "");
        msg = all_trim(msg)
        msg = (msg):gsub("!удалить ", "")

        for key, val in pairs(pQuests[1]) do
            if val==msg then
                table.remove(pQuests[1], key)
                print("*Квест " .. val .. " " .. GetAchievementLink(val) .. " был удален.")
            else
            end
        end
    elseif string.find (message, "ВОЖДЬ, сдать доп квест!!!") and nachalo~="*" then
        if TDG[sender]["доп_квест"]~=nil and TDG[sender]["доп_квест"]~="9999" then
            local kol=0
            for guokZ=1,GetNumGuildMembers(true) do
                local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
                kol=kol+1
            end
            rezDopQuest=TDG[sender]["доп_квест"]
            if rezDopQuest>kol then

            SendChatMessage("*" .. sender .. ", сейчас в гильдии " .. kol .. " игроков. Должно стать " .. rezDopQuest, "guild", nil, 1);
            else
                SendChatMessage("*" .. sender .. " !получает 3 опыта и кусок карты (за куском карты обращаться отдельно)", "guild", nil, 1);
                if TDG[sender]["кусков_карты"]==nil then
                    TDG[sender]["кусков_карты"]=1
                else
                    dopKus=TDG[sender]["кусков_карты"]
                    dopKus=tonumber(dopKus)
                    dopKus=dopKus+1
                    TDG[sender]["кусков_карты"]=dopKus
                end
                TDG[sender]["доп_квест"]="9999"
            end
        else
            SendChatMessage("*" .. sender .. ", сначала нужно взять квест", "guild", nil, 1);
        end
    elseif string.find (sender, "Витинари") or string.find (sender, "Хэвлок") or string.find (sender, "Железобетонс") or string.find (sender, "Детрит") or string.find (sender, "Двацветок") then
        if string.find (message, "!добавить квест") and nachalo~="*" then
            msg = all_trim(message)
            msg = (msg):gsub(nik, "");
            msg = all_trim(msg)
            msg = (msg):gsub("!добавить квест ", "");
            for key, val in pairs(pQuests[1]) do
                if val==msg then
                    print("*Квест " .. val .. " " .. GetAchievementLink(val) .. " уже был добавлен.")
                    testID=1
                else
                end
            end
            if testID~=1 then
                table.insert(pQuests[1], msg)
                print("*Квест " .. msg .. " " .. GetAchievementLink(msg) .. " был добавлен.")
            end
        end
    elseif string.find (message, "ВОЖДЬ простой") and nachalo~="*" then
            function tablelength(T)
                local count = 0
                for _ in pairs(T) do count = count + 1 end
                    return count
            end
            countQ=tablelength(pQuests[1])
            local x = math.random(1, countQ)
            ach=pQuests[1][x]
            SendChatMessage("*" .. nik .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "guild", nil, 1)
    elseif string.find (message, "ВОЖДЬ деньги") and nachalo~="*" then
        SendChatMessage("*" .. nik .. " получит [стандартная награда для gildLvl_nik] реализую позже", "guild", nil, 1)
        SendChatMessage("*" .. nik .. " получает 1 опыта." .. " До лвлапа осталось [заглушка сделаю позже]", "guild", nil, 1)
    else
    end
    --возможность игроку писать свою заметку
    testHis=mysplit(message)
    testHis[1]=all_trim(testHis[1])
    if string.find (message, "!заметка") and testHis[1] == "!заметка" and nachalo~="*" then
        local vz = (message):gsub("!заметка ", "");
        for z=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(z)
            if name == sender then
                GuildRosterSetPublicNote(z, vz)
                SendChatMessage("*" .. name .. ", заметка добавлена", "guild", nil, 1)
            else
            end
        end
    end
    if string.find (message, "!заметка+") and testHis[1] == "!заметка+" and nachalo~="*" then
        for z=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(z)
            if name == sender then
                local vzP = (message):gsub("!заметка%+", "");
                vzP=all_trim(vzP)
                local zamDop = publicNote .. " " .. vzP
                GuildRosterSetPublicNote(z, zamDop)
                SendChatMessage("*" .. name .. ", заметка дополнена", "guild", nil, 1)
            end
        end
    end
    --справка
    if string.find (message, "ВОЖДЬ инфо") and nachalo~="*" then
        SendChatMessage("*Получить квест:     ВОЖДЬ", "guild", nil, 1)
        SendChatMessage("*Получить дополнительный квест вне лимита:     ВОЖДЬ, хочу больше квестов и опыта!!!", "guild", nil, 1)
        SendChatMessage("*Сдать дополнительный квест вне лимита:     ВОЖДЬ, сдать доп квест!!!", "guild", nil, 1)
        SendChatMessage("*Сдать квест:        ВОЖДЬ сдать", "guild", nil, 1)
        SendChatMessage("*Заполнить заметку:  !заметка Текст заметки" , "guild", nil, 1)
        SendChatMessage("*Дополнить существующую заметку:  !заметка+ Текст заметки" , "guild", nil, 1)
        SendChatMessage("*Еще больше команд хороших и разных тут: https://t.me/AnkMorporkInfo", "guild", nil, 1)
    else
    end
    --показать инфу об игроке
    local guokInf = string.gsub(message, "%s+", "")
    if string.find (guokInf, "!гильдлвл") and nachalo~="*" then
        for guok=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guok)
            if name == sender then
                local gildLvl = string.sub(officerNote, 1, 1)
                local gildExp = string.sub(officerNote, 2, 5)
                SendChatMessage("*" .. sender .. ": " .. gildLvl .. " гильдлвл" .. " и " .. gildExp .. " опыта", "guild", nil, 1)
                local gildLvlN = tonumber (gildLvl)
                local gildExpN = tonumber (gildExp)
                if gildLvl == "0" then
                    local gildExpN = 4 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "1" then
                    local gildExpN = 8 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "2" then
                    local gildExpN = 16 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "3" then
                    local gildExpN = 32 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "4" then
                    local gildExpN = 64 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "5" then
                    local gildExpN = 128 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "6" then
                    local gildExpN = 256 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "7" then
                    local gildExpN = 512 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "8" then
                    local gildExpN = 1024 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                elseif gildLvl == "9" then
                    local gildExpN = 2048 - gildExpN
                    SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "guild", nil, 1)
                end
            else
            end
        end
    else
    end







    --запись о прогрессе в информацию о персонаже (заготовка)
    local str2 = string.gsub(message, "%s+", "")
    if string.find (str2, "mostrareID") and nachalo~="*" then
        for i=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(i)

            if name == sender then
                GuildRosterSetPublicNote(i, publicNote .. "+1")
            else
            end
        end
    else
    end



end
)

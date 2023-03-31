local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--добавление опыта персонажу командой
local nik = sender
if (nik == "Двацветок" or nik == "Витинари" or nik == "Железобетонс" or nik == "Детрит") then
    function all_trim(s)
        return s:match( "^%s*(.-)%s*$" )
    end

    function rez1(r1)
        r1 = all_trim (r1)
        r1 = (r1):match("^(%S+)")
        return r1
    end

    function rez2(r2)
        local r21 = rez1 (r2)
        r2 = all_trim (r2)
        r2 = string.gsub(r2, r21, "")
        r2 = all_trim (r2)
        r2 = (r2):match("^(%S+)")
        r2 = all_trim (r2)
        return r2
    end

    function rez3(r3)
        local r31 = rez1 (r3)
        local r32 = rez2 (r3)
        r3 = all_trim (r3)
        r3 = string.gsub(r3, r31, "")
        r3 = all_trim (r3)
        r3 = string.gsub(r3, r32, "")
        r3 = all_trim (r3)
        r3 = (r3):match("^(%S+)")
        r3 = all_trim (r3)
        return r3
    end

    local msgZ = all_trim (message);
    local msgZ1 = rez1 (msgZ);
    local msgZ2 =rez2 (msgZ);
    local msgZ3 = rez3 (msgZ)

    --local str = string.gsub(msgZ, "%s+", "")

    if string.find (message, "получает") and string.find (message, msgZ1) then
        for Zc=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
            local msgZ3n = tonumber (msgZ3)
            if name == msgZ1 then
                local gildLvl = string.sub(officerNote, 1, 1)
                local gildExp = string.sub(officerNote, 2, 5)
                local gildExpN = tonumber (gildExp)
                local gildLvlN = tonumber (gildLvl)
                local gildExpN1 = tonumber (gildExp)    --переводим опыт в число
                if msgZ3n <= 8 then                       --нельзя прибавлять заодин раз больше 8 опыта
                    if gildLvl == "0" then              --если текущий лвл нулевой, то
                        local gildExpN = 4 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ1 .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 8            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        w2 = rez2(stroka)
                        w3 = rez3(stroka)

                        stroka = gildLvlN .. "00" .. gildExpN1 .. " " .. w2 .. " " .. w3
                        GuildRosterSetOfficerNote(Zc, stroka)

                        print (w2)
                        print (w3)
                        print (stroka)
                        print (gildLvlN)
                        print (gildExpN1)
                        print (gildExpN)
                    else
                    end
                else
                    print ("За один раз не больше 8 опыта")
                end
            else--конец проверки ника
            end--конец проверки ника
        end--конец чтения данных из гильдии
    else--конец проверки ключевого слова ник получает
    end--конец проверки ключевого слова  ник получает
else---конец проверки ника на совпадение со мной
end---конец проверки ника на совпадение со мной
--конец добавления опыта нику командой

end
)

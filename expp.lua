local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--добавление опыта персонажу командой
local nik = sender
if (nik == "Двацветок" or nik == "Витинари" or nik == "Железобетонс" or nik == "Детрит") then
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

    function lvlAgg (expPp, gExpN, gExpN1, gLvl, gNik, zT, gExpf)
    local gExpN = gExpf - gExpN   ---получаем количество оставшегося лвла на уровне
        for i = 1,expPp do               --прибавляем опыт по единичке
            gExpN1 = gExpN1 + 1     --единичку прибавили к опыту на уровне
            gExpN = gExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
            if gExpN == 0 then       --если опыта на уровне не осталось, то
                gLvl = gLvl + 1  --прибавляем к лвлу единицу
                SendChatMessage("Поздравляем " .. gNik .. " c лвлапом!!!", "guild", nil, 1)
                gExpN = gExpNfN            --оставшийся опыт назначаем равным 8
                gExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
            else
            end
        end
    end
    local stroka = officerNote
    local strokaSplit = mysplit (stroka)
    gildExpN13 = string.format("%03d",gExpN1)
    stroka = gLvl .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
    GuildRosterSetOfficerNote(zT, stroka)
    end

    local msgZ = all_trim (message);
    msgZ = mysplit (msgZ)

    if string.find (message, "!получает") and string.find (message, msgZ[1]) and string.find (message, "опыта") then
        for Zc=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
            local msgZ3n = tonumber (msgZ[3])
            if name == msgZ[1] then
                local gildLvl = string.sub(officerNote, 1, 1)
                local gildExp = string.sub(officerNote, 2, 5)
                local gildExpN = tonumber (gildExp)
                local gildLvlN = tonumber (gildLvl)
                local gildExpN1 = tonumber (gildExp)    --переводим опыт в число
                if msgZ3n <= 8 then                       --нельзя прибавлять заодин раз больше 8 опыта
                    local gildExpf0 = 8
                    local gildExpf1 = 16
                    local gildExpf2 = 32
                    local gildExpf3 = 64
                    local gildExpf4 = 128
                    local gildExpf5 = 256
                    local gildExpf6 = 512
                    local gildExpf7 = 1024
                    local gildExpf8 = 2048
                    if gildLvl == "0" then              --если текущий лвл нулевой, то
                        lvlAgg (msgZ3n,gildExpN,gildExpN1,gildLvlN,msgZ[1],Zc,gildExpf0,)
                    elseif gildLvl == "1" then
                        local gildExpN = 8 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 16            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%03d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    elseif gildLvl == "2" then
                        local gildExpN = 16 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 32            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%03d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    elseif gildLvl == "3" then
                        local gildExpN = 32 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 64            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%03d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    elseif gildLvl == "4" then
                        local gildExpN = 64 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 128            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%03d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    elseif gildLvl == "5" then
                        local gildExpN = 128 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 256            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%03d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    elseif gildLvl == "6" then
                        local gildExpN = 256 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 512            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%03d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    elseif gildLvl == "7" then
                        local gildExpN = 512 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. " c лвлапом!!!", "guild", nil, 1)
                                gildExpN = 1024            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%04d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    elseif gildLvl == "8" then
                        local gildExpN = 1024 - gildExpN   ---получаем количество оставшегося лвла на уровне
                        for i = 1,msgZ3n do               --прибавляем опыт по единичке
                            gildExpN1 = gildExpN1 + 1     --единичку прибавили к опыту на уровне
                            gildExpN = gildExpN - 1      -- от оставшегося опыта на уровне отнимаем единичку
                            if gildExpN == 0 then       --если опыта на уровне не осталось, то
                                gildLvlN = gildLvlN + 1  --прибавляем к лвлу единицу
                                SendChatMessage("Поздравляем " .. msgZ[1] .. ". Он может получить квест на повышение до офицера", "guild", nil, 1)
                                gildExpN = 2048            --оставшийся опыт назначаем равным 8
                                gildExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
                            else
                            end
                        end
                        local stroka = officerNote
                        local strokaSplit = mysplit (stroka)
                        gildExpN13 = string.format("%04d",gildExpN1)

                        stroka = gildLvlN .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3]
                        GuildRosterSetOfficerNote(Zc, stroka)
                    end---конец проверки какой гильдлвл обрабатываем
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

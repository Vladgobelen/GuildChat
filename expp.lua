local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--добавление опыта персонажу командой
local TDG = "nuovoStr1";
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
    function lvlAgg (expPp, gExpN1, gLvl, gNik,strokaFn)
    local gExpNo = 2 ^ (gLvl + 2) - gExpN1   ---получаем количество оставшегося лвла на уровне
        for i = 1,expPp do               --прибавляем опыт по единичке
            gExpN1 = gExpN1 + 1     --единичку прибавили к опыту на уровне
            gExpNo = gExpNo - 1      -- от оставшегося опыта на уровне отнимаем единичку
            if gExpNo == 0 then       --если опыта на уровне не осталось, то
                gLvl = gLvl + 1  --прибавляем к лвлу единицу
                SendChatMessage("Поздравляем " .. gNik .. " c лвлапом!!!", "guild", nil, 1)
                gExpNo = 2 ^ (gLvl + 1) - gExpN1            --оставшийся опыт назначаем равным 8
                gExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
            else
            end
        end
        local strokaSplit = mysplit (strokaFn)
        if gLvl == 9 then
            SendChatMessage("Красочные спецэффекты вжу-вжу-пиу!фрррр! " .. gNik .. " получает доступ к квесту на получение офицерского звания", "guild", nil, 1)
            gExpN1 = 0
        else
        end
        gildExpN13 = string.format("%03d",gExpN1)
        return (gLvl .. gildExpN13 .. " " .. strokaSplit[2] .. " " .. strokaSplit[3])
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
                if msgZ3n <= 2 ^ (gildLvlN + 3) then                       --нельзя прибавлять заодин раз больше 8 опыта
                    local strokaF = officerNote
                    nuovoStr = lvlAgg (msgZ3n,gildExpN1,gildLvlN,msgZ[1],strokaF)
                    GuildRosterSetOfficerNote(Zc, nuovoStr)
                    local TDG = "nuovoStr";
                else
                    local ahtung = 2 ^ (gildLvlN + 3)
                    SendChatMessage("Можно не больше, чем " .. ahtung .. " опыта за один раз!!!" , "guild", nil, 1)
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

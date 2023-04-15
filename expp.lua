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

    local msgZ = all_trim (message);
    msgZ = mysplit (msgZ)
    if string.find (message, "!получает") and string.find (message, msgZ[1]) and string.find (message, "опыта") then
        for Zc=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
            local msgZ3n = tonumber (msgZ[3])
            if name == msgZ[1] then
                strokaF = mysplit (officerNote)
                strokaF =  testNil (strokaF,3,"0000",1)
                local gildLvl = string.sub(strokaF, 1, 1)
                local gildExp = string.sub(strokaF, 2, 5)
                local rarGilvl = gildLvl .. gildExp
                gildExpN = tonumber (gildExp)
                gildLvlN = tonumber (gildLvl)
                local gildExpN1 = tonumber (gildExp)
                if msgZ3n <= 2 ^ (gildLvlN + 3) then
                    nuovoStr = lvlAgg (msgZ3n,gildExpN1,gildLvlN,msgZ[1],strokaF)
                    GuildRosterSetOfficerNote(Zc, nuovoStr)

                else
                    local ahtung = 2 ^ (gildLvlN + 3)
                    SendChatMessage("Можно не больше, чем " .. ahtung .. " опыта за один раз!!!" , "OFFICER", nil, 1)
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

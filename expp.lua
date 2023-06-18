local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--добавление опыта персонажу командой
local nik = sender
testGM=gmTest(sender)
if testGM~=nil then
    msgExpPP = mysplit (message)
    msgZ1=msgExpPP[1]
    msgZ2=msgExpPP[2]
    msgZ3=msgExpPP[3]
    msgZ4=msgExpPP[4]
    if msgZ2=="!получает" and msgZ4=="опыта" then
        for Zc=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
            local msgZ3n = tonumber (msgZ3)
            if name == msgZ1 then
                strokaF = mysplit (officerNote)
                strokaF =  testNil (strokaF,3,"0000",1)
                local gildLvl = string.sub(strokaF, 1, 1)
                local gildExp = string.sub(strokaF, 2, 5)
                local rarGilvl = gildLvl .. gildExp
                gildExpN = tonumber (gildExp)
                gildLvlN = tonumber (gildLvl)
                local gildExpN1 = tonumber (gildExp)
                if msgZ3n <= 2 ^ (gildLvlN + 3) then
                    nuovoStr = lvlAgg (msgZ3n,gildExpN1,gildLvlN,msgZ1,strokaF)
                    GuildRosterSetOfficerNote(Zc, nuovoStr)

                else
                    local ahtung = 2 ^ (gildLvlN + 3)
                    SendChatMessage("Можно не больше, чем " .. ahtung .. " опыта за один раз!!!" , "OFFICER", nil, 1)
                end
            else--конец проверки ника
            end--конец проверки ника
        end--конец чтения данных из гильдии
    elseif msgZ2=="получает" and msgZ4=="опыта" then
        for Zc=1,GetNumGuildMembers(true) do
            local sExp
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
            local msgZ3n = tonumber (msgZ3)
            if name == msgZ1 then
                strokaF = mysplit (officerNote)
                if strokaF[1] ~= nil then
                    sExp = string.sub(strokaF[2],3,3)
                else
                    sExp = 0
                end
                sExp = tonumber(sExp)
                strokaF =  testNil (strokaF,3,"0000",1)
                local gildLvl = string.sub(strokaF, 1, 1)
                local gildExp = string.sub(strokaF, 2, 5)
                local rarGilvl = gildLvl .. gildExp
                gildExpN = tonumber (gildExp)
                gildLvlN = tonumber (gildLvl)
                local gildExpN1 = tonumber (gildExp)
                if msgZ3n <= 2 ^ (gildLvlN + 3) then
                    nuovoStr = lvlAgg (msgZ3n,gildExpN1,gildLvlN,msgZ1,strokaF)
                    GuildRosterSetOfficerNote(Zc, nuovoStr)
                otmenaDaty=mysplit(nuovoStr)
                otmenaDaty1=otmenaDaty[1]
                otmenaDaty2=otmenaDaty[2]
                otmenaDaty3=otmenaDaty[3]
                otmenaDaty4=string.sub(otmenaDaty2,1,2)
                otmenaDaty5=string.sub(otmenaDaty2,3,3)
                print(otmenaDaty5)
                otmenaDaty5 = tonumber(otmenaDaty5)
                if otmenaDaty5 == 0 then
                    otmenaDaty5 = sExp
                else
                    otmenaDaty5 = sExp
                end
                otmenaDaty6=otmenaDaty1 .. " " .. otmenaDaty4 .. otmenaDaty5 .. " " .. otmenaDaty3
                GuildRosterSetOfficerNote(Zc, otmenaDaty6)
                else
                    local ahtung = 2 ^ (gildLvlN + 3)
                    SendChatMessage("Можно не больше, чем " .. ahtung .. " опыта за один раз!!!" , "OFFICER", nil, 1)
                end

            else--конец проверки ника
            end--конец проверки ника

        end

    end--конец проверки ключевого слова  ник получает
else---конец проверки ника на совпадение со мной
end---конец проверки ника на совпадение со мной
--конец добавления опыта нику командой
end
)

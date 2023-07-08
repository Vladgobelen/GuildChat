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
    if msgZ2 ~= nil then
    local testNach = string.sub(msgZ2,1,1)
    print (testNach)
    if testNach == "!" then
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
        end
    end
    if testNach ~= "!" then
        if msgZ2=="получает" and msgZ4=="опыта" then
            for Zc=1,GetNumGuildMembers(true) do
                local sExp
                local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
                local msg = mysplit(message)
                if name == msg[1] then
                    strokaF = mysplit (officerNote)
                    strokaF1 =  testNil (strokaF,3,"0000",1)
                    strokaF = mysplit(strokaF1)
                    local rarLvl = string.sub(strokaF[1],1,1)
                    rarLvl = tonumber(rarLvl)
                    local rarExp = string.sub(strokaF[1],2,5)
                    rarExp = tonumber(rarExp)
                    local rarDate = string.sub(strokaF[2],1,2)
                    local rarNq = string.sub(strokaF[2],3,3)
                    msg[3] = tonumber(msg[3])
                    if msg[3] <= 2 ^ (rarLvl + 3) then
                        nuovoStr = lvlAgg (msg[3],rarExp,rarLvl,msg[1],strokaF1)
                        GuildRosterSetOfficerNote(Zc, nuovoStr)
                    local NovaStroka = mysplit(nuovoStr)
                    otmenaDaty6=NovaStroka[1] .. " " .. rarDate .. rarNq .. " " .. NovaStroka[3]
                    GuildRosterSetOfficerNote(Zc, otmenaDaty6)
                    else
                        local ahtung = 2 ^ (rarLvl + 3)
                        SendChatMessage("Можно не больше, чем " .. ahtung .. " опыта за один раз!!!" , "OFFICER", nil, 1)
                    end

                else--конец проверки ника
                end--конец проверки ника

            end

        end--конец проверки ключевого слова  ник получает
    end
    end
else---конец проверки ника на совпадение со мной
end---конец проверки ника на совпадение со мной
--конец добавления опыта нику командой
end
)

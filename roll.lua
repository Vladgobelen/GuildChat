local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)

--local msg = string.gsub(message, "%s+", "")

--    if string.find (message, "выбрасывает") then
--       SendChatMessage(message, "OFFICER", nil, 1);
--    else
--    end

if string.find (message, "Кусяо исключает из гильдии") then
    for Zc=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
            local msgZ3n = tonumber (msgZ3)
            if name == "Кусяо" then
                local backMSG = officerNote
                revMSG = string.utf8reverse(backMSG)
                for iKus=1,#backMSG do
                    local testB = string.utf8sub(revMSG,iKus,iKus)
                    if testB == "М" then
                        iKus1 = iKus
                        break
                    end
                    iKus = iKus + 1
                end
                iKus1=iKus1-1
                mnMsg = string.sub(revMSG,1,iKus1)
                mnMsgOst = string.utf8sub(revMSG,iKus1+1,#revMSG)
                mnMsg = string.reverse(mnMsg)
                mnMsg =tonumber(mnMsg)
                mnMsg = mnMsg + 3
                mnMsgOst= string.utf8reverse(mnMsgOst)
                local rezultat = mnMsgOst .. mnMsg
                GuildRosterSetOfficerNote(Zc, rezultat)


            else--конец проверки ника
            end--конец проверки ника

        end
end
end
)

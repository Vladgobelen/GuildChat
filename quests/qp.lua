local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)


local msg = all_trim(message)
local nachalo = string.sub(message, 1, 1)
if testGM~=nil and nachalo~="*" then
	if string.find (msg, "!святость в созидание") then
        msg=mysplit(msg)
        if msg[4]~=nil and msg[5]~=nil then
            for guokZ=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
                if msg[4] == name then
                    local sv=string.sub(officerNote, 11, 13)
                    sv = tonumber(sv)
                    sv1= tonumber(msg[5])
                    TDG[name]["доступно_квестов"]=sv1/10
                else
                end
            end
    --TDG[sender]["доступно_квестов"]=TDG[sender]["доступно_квестов"]+1
      --  SendChatMessage(myNik .. ", камень, ты проиграл", "OFFICER", nil, 1)
        end
    end

end

if string.find(message, "ВОЖДЬ") and string.find (message, "из") and string.find(message, hsh)  then
        msgRez = mysplit(message)
        print (msgRez[3] .. "f" .. msgRez[5])
end



end
)



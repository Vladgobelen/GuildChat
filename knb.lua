local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)


if string.find (message, "тестник") then
msgTestnik=mysplit(message)
msgTestnik1=msgTestnik[1]
msgTestnik2=msgTestnik[2]
--for guokZ1=1,GetNumGuildMembers(true) do
--		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ1)
--		if name == msgTestnik2 then
--        name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName, achievementPoints, achievementRank, isMobile, isSoREligible, standingID = GetGuildRosterInfo(guokZ1)
        print (online)


--        end
--end

end













local myNik=sender
local msg = string.gsub(message, "%s+", "")
    if string.find (msg, "!камень") then
        local x = math.random(1, 100)
        if x>=25 then
            SendChatMessage("*" .. myNik .. ", бумага, ты проиграл", "OFFICER", nil, 1)
        else
            SendChatMessage("*" .. myNik .. ", ножницы, ты выиграл", "OFFICER", nil, 1)
        end
    elseif string.find (msg, "!ножницы") then
        local x = math.random(1, 100)
        if x>=25 then
            SendChatMessage("*" .. myNik .. ", камень, ты проиграл", "OFFICER", nil, 1)
        else
            SendChatMessage("*" .. myNik .. ", бумага, ты выиграл", "OFFICER", nil, 1)
        end
    elseif string.find (msg, "!бумага") then
        local x = math.random(1, 100)
        if x>=25 then
            SendChatMessage("*" .. myNik .. ", ножницы, ты проиграл", "OFFICER", nil, 1)
        else
            SendChatMessage("*" .. myNik .. ", камень, ты выиграл", "OFFICER", nil, 1)
        end
    end

    if string.find (message, "!рулетка") then
        local x = math.random(1, 37)
        local str=mysplit(message)
        if str[2]=="0" then
            str[2]="ноль"
        end
        if str[2]==nil then
            if x<=18 then
                SendChatMessage("*" .. x .. " красное", "OFFICER", nil, 1)
            elseif x>18 and x~=37 then
                SendChatMessage("*" .. x .. " черное", "OFFICER", nil, 1)
            elseif x==37 then
                SendChatMessage("*зеро", "OFFICER", nil, 1)
            end
        end
        if str[2]=="красное" or str[2]=="черное" or str[2]=="ноль" and str[2]~=nil then
            if x<=18 and str[2]=="красное" then
                SendChatMessage("*" .. myNik .. ", " .. x .. " красное, ты выиграл!", "OFFICER", nil, 1)
            elseif x<=18 and str[2]=="черное" then
                SendChatMessage("*" .. myNik .. ", " .. x .. " красное, ты проиграл.", "OFFICER", nil, 1)
            elseif x>18 and x~=37 and str[2]=="красное" then
                SendChatMessage("*" .. myNik .. ", " .. x .. " черное, ты проиграл.", "OFFICER", nil, 1)
            elseif x>18 and x~=37 and str[2]=="черное" then
                SendChatMessage("*" .. myNik .. ", " .. x .. " черное, ты выиграл.", "OFFICER", nil, 1)
            elseif x==37 and str[2]=="ноль" then
                SendChatMessage("*" .. myNik .. ", зеро, ты выиграл.", "OFFICER", nil, 1)
            elseif x<=18 and str[2]=="ноль" then
                SendChatMessage("*" .. myNik .. ", " .. x .. " красное, ты проиграл.", "OFFICER", nil, 1)
            elseif x>18 and x~=37 and str[2]=="ноль" then
                SendChatMessage("*" .. myNik .. ", " .. x .. " черное, ты проиграл.", "OFFICER", nil, 1)
            elseif x==37 and str[2]~="ноль" then
                SendChatMessage("*" .. myNik .. ", " .. ", зеро, ты проиграл.", "OFFICER", nil, 1)
            end
        end
    end
end
)


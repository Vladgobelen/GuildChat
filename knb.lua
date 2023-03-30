local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)

local myNik=sender
local msg = string.gsub(message, "%s+", "")
if (myNik ~= "Двацветок" and myNik ~= "Витинари" and myNik ~= "Железобетонс" and myNik ~= "Детрит") then
    if string.find (msg, "!камень") then
        SendChatMessage(myNik .. ", бумага, ты проиграл", "guild", nil, 1)
    elseif string.find (msg, "!ножницы") then
        SendChatMessage(myNik .. ", камень, ты проиграл", "guild", nil, 1)
    elseif string.find (msg, "!бумага") then
        SendChatMessage(myNik .. ", ножницы, ты проиграл", "guild", nil, 1)
    end

else
end

end
)


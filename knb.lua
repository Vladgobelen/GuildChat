local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)

local myNik=sender
local msg = string.gsub(message, "%s+", "")
    if string.find (msg, "!камень") then
        SendChatMessage("*" .. myNik .. ", бумага, ты проиграл", "OFFICER", nil, 1)
    elseif string.find (msg, "!ножницы") then
        SendChatMessage("*" .. myNik .. ", камень, ты проиграл", "OFFICER", nil, 1)
    elseif string.find (msg, "!бумага") then
        SendChatMessage("*" .. myNik .. ", ножницы, ты проиграл", "OFFICER", nil, 1)
    end
end
)


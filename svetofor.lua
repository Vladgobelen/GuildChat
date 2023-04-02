local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)

local yo=sender
local msg = string.gsub(message, "%s+", "")
if (yo ~= "Двацветок" and yo ~= "Витинари" and yo ~= "Железобетонс" and yo ~= "Детрит") then
    if string.find (message, "!светофор") then
        local questNik = yo
        SendChatMessage(yo .. ", ты подходишь к пешеходному переходу, светофор горит красным, а еще тебе ну оооочень нужно в туалет. Твои !действия", "guild", nil, 1)
    elseif string.find (message, "!действия") then
        SendChatMessage(yo .. ", !осмотреться, !идти !объект, !ударить !объект, !съесть !объект", "guild", nil, 1)
    elseif string.find (message, "!объект") then
        SendChatMessage(yo .. ", дорога, светофор, кусты", "guild", nil, 1)
    end

else
end

end
)

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
    local nik=sender
    local str
    str = string.gsub(message, "%s+", "")
    if str == "ВОЖДЬ") then
        SendChatMessage(nik .. ", простой или сложный?", "guild", nil, 1)
    elseif string.find (message, "ВОЖДЬ сдать") then
        SendChatMessage(nik .. ", опыт или деньги?", "guild", nil, 1)
    elseif string.find (message, "ВОЖДЬ опыт") then
        SendChatMessage(nik .. " получает 2 опыта." .. " До лвлапа осталось [заглушка сделаю позже]", "guild", nil, 1)
    elseif string.find (message, "ВОЖДЬ деньги") then
        SendChatMessage(nik .. " получит [стандартная награда для gildLvl_nik] реализую позже", "guild", nil, 1)
        SendChatMessage(nik .. " получает 1 опыта." .. " До лвлапа осталось [заглушка сделаю позже]", "guild", nil, 1)
    else
    end

end

)

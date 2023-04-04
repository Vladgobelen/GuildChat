local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local yo=sender
local nik=yo
local object
local quest
function all_trim(s)
        return s:match( "^%s*(.-)%s*$" )
end

message=all_trim(message)
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

local testHis = string.sub(message, 1, 1)

if string.find (message, "!старт квест") and testHis~="*" then
	msg = mysplit(message)

	quest = msg[3] 	
	if TDGq==nil then
		TDGq={}
	end
	if TDGq[quest]==nil then
		TDGq[quest]={}
	end
	if TDGq[quest]["создатель"]==nil then
		TDGq[quest]["создатель"]=nik
	end	
	if TDG[nik]==nil then
		TDG[nik]={}
	end
	TDG[nik]["текущий_квест"]=quest
	if TDGq[quest]["стартовая_локация"]==nil or TDGq[quest]["стартовая_локация"]==0 and TDGq[quest]["создатель"]==nik then
		TDGq[quest]["стартовая_локация"]=0
		SendChatMessage("*Вселенная была пуста и безвидна. И увидел " .. nik .. ", что нужно !создать Мир.", "guild", nil, 1);
	elseif TDGq[quest]["стартовая_локация"]==nil or TDGq[quest]["стартовая_локация"]==0 and TDGq[quest]["создатель"]~=nik then
		SendChatMessage("*" .. nik .. ", как то пусто тут. Лучше подождать пока что то будет создано или создать свое.. ", "guild", nil, 1)
	elseif TDGq[quest]["стартовая_локация"]~=nil or TDGq[quest]["стартовая_локация"]~=0 and TDGq[quest]["создатель"]==nik then
			
		SendChatMessage("*" .. nik .. ", тут старт квеста. ", "guild", nil, 1)		
	end


end
quest=TDG[nik]["текущий_квест"]
if string.find (message, "!создать")  and TDGq[quest]["создатель"]==nik and testHis~="*" then
	print (TDG[nik][quest])
	print ("6")
	print (TDG[nik]["текущий_квест"])
	print ("7")
	print (TDGq[quest]["создатель"])
	print ("8")
	--local strSoz = mysplit(message)
	--if strSoz[3] ~= nil then
	--	print ("создать заглушка")
	--else
	--	print ("Формат команды: !создать [тип объекта] объект")
	--end


else
	if string.find (message, "!создать") and testHis~="*"  then
		SendChatMessage("*" .. nik .. ", в этом мире у тебя нет силы....", "guild", nil, 1);
	end
end

	



end
)

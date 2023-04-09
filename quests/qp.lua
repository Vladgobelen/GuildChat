local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
function all_trim(s)
	return s:match( "^%s*(.-)%s*$" )
end
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
function hashStr (nome)
	hours, minutes = GetGameTime()
	count1=hours* 3,1415926535
	count2=minutes* 3,1415926535
	count3=count1*count2
	count3=string.sub(count3, 1, 3)
	count3=string.format("%03d",count3)
	hNik=string.byte(nome,1)
	hNik2=string.byte(nome,2)
	hNome=hNik*hNik2
	hNome=string.sub(hNome, 1, 3)
	hNome=string.format("%03d",hNome)
	r1=string.sub(count3, 1, 1)
	r2=string.sub(hNome, 1, 1)
	r3=string.sub(count3, 2, 2)
	r4=string.sub(hNome, 2, 2)
	r5=string.sub(count3, 3, 3)
	r6=string.sub(hNome, 3, 3)
	r=r1 .. r2 .. r3 .. r4 .. r5 .. r6
	return r
end
local msg = all_trim(message)
local nachalo = string.sub(message, 1, 1)
if sender == "Двацветок" or sender == "Витинари" or sender == "Железобетонс" or sender == "Детрfит" and nachalo~="*" then
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

hsh=hashStr(sender)
if string.find(message, "ВОЖДЬ") and string.find (message, "из") and string.find(message, hsh)  then
        msgRez = mysplit(message)
        print (msgRez[3] .. "f" .. msgRez[5])
end



end
)



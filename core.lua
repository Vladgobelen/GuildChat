local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local endQuests="простые_квесты"
local qAchiv="взят_ли_квест_простая_ачивка"
nachaloStr = string.utf8sub(message, 1, 1)
hsh=hashStr(sender)
if TDG[sender]==nil then
	TDG[sender]={}
end
local nachalo = string.utf8sub(message, 1, 1)
if message == "ВОЖДЬ" or string.find (message, "#zzx") and nachalo~="*" then
	for guokZ=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
		if name == sender then
			local denT = string.utf8sub(officerNote, 6, 7)
			local qN = string.utf8sub(officerNote, 8, 8)
			local gildLvl = string.utf8sub(officerNote, 1, 1)
			qN = tonumber (qN)
			denn = {}
			denn = date("%d")
			denn = tonumber(denn)
			denT = tonumber(denT)
			gildLvl = tonumber (gildLvl)
			if denn == denT then
				if qN >= gildLvl then
					SendChatMessage("*" .. name .. ", следущий квест на твоем гильдлвле доступен завтра, но тебе доступен дополнительный квест с повышенным опытом: #zzz", "officer", nil, 1)
				else
					SendChatMessage("*" .. nik .. ", простой или сложный?", "officer", nil, 1)
				end
			else
				SendChatMessage("*" .. nik .. ", простой или сложный?", "officer", nil, 1)
			end
		else
		end
	end
end
--показать инфу об игроке
local guokInf = string.gsub(message, "%s+", "")
if string.find (guokInf, "!гильдлвл") or string.find (message, "#zzt") and nachalo~="*" then
	for guok=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guok)
		if name == sender then
			local gildLvl = string.utf8sub(officerNote, 1, 1)
			local gildExp = string.utf8sub(officerNote, 2, 5)
			SendChatMessage("*" .. sender .. ": " .. gildLvl .. " гильдлвл" .. " и " .. gildExp .. " опыта", "officer", nil, 1)
			local gildLvlN = tonumber (gildLvl)
			local gildExpN = tonumber (gildExp)
			if gildLvl == "0" then
				local gildExpN = 4 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "1" then
				local gildExpN = 8 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "2" then
				local gildExpN = 16 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "3" then
				local gildExpN = 32 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "4" then
				local gildExpN = 64 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "5" then
				local gildExpN = 128 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "6" then
				local gildExpN = 256 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "7" then
				local gildExpN = 512 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "8" then
				local gildExpN = 1024 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "9" then
				local gildExpN = 2048 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			end
		else
		end
	end
else
end

if string.find (message, "ВОЖДЬ, хочу больше квестов и опыта!!!") or string.find (message, "#zzz") and nachalo~="*" then
	if TDG[sender]["доп_квест"]==nil or TDG[sender]["доп_квест"]==9999 then
		local kol=0
		for guokZ=1,GetNumGuildMembers(true) do
			local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
			kol=kol+1
		end
		local kol1=kol+30
		SendChatMessage(hsh .. " " .. "#zzl " .. sender .. ", сейчас в гильдии " .. kol .. " игроков. Должно стать " .. kol1, "officer", nil, 1);
		TDG[sender]["доп_квест"]=kol1
	else
	poluchenoKolichestvo=TDG[sender]["доп_квест"]
	SendChatMessage("*" .. sender .. ", у тебя уже есть квест. Для выполнения в гильдии должно стать " .. poluchenoKolichestvo .. " игроков.", "officer", nil, 1);
	end
end

if string.find (message, "ВОЖДЬ, сдать доп квест!!!") or string.find (message, "#zzy") and nachalo~="*" then
	if TDG[sender]["доп_квест"]~=nil and TDG[sender]["доп_квест"]~="9999" then
		local kol=0
		for guokZ=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
		kol=kol+1
		end
		rezDopQuest=TDG[sender]["доп_квест"]
		if rezDopQuest>kol then
			SendChatMessage("*" .. sender .. ", сейчас в гильдии " .. kol .. " игроков. Должно стать " .. rezDopQuest, "officer", nil, 1);
		else
			SendChatMessage(sender .. " !получает 3 опыта", "guild", nil, 1);
			SendChatMessage("*" .. sender .. " получает кусок карты (за куском обращаться отдельно.", "officer", nil, 1);
			if TDG[sender]["кусков_карты"]==nil then
				TDG[sender]["кусков_карты"]=1
			else
				dopKus=TDG[sender]["кусков_карты"]
				dopKus=tonumber(dopKus)
				dopKus=dopKus+1
				TDG[sender]["кусков_карты"]=dopKus
			end
			TDG[sender]["доп_квест"]="9999"
		end
	else
		SendChatMessage("*" .. sender .. ", сначала нужно взять квест", "officer", nil, 1);
	end
end
--справка
    if string.find (message, "ВОЖДЬ инфо") or string.find (message, "#info")  and nachalo~="*" then
		SendChatMessage("*Получить квест: #zzx или     ВОЖДЬ", "officer", nil, 1)
		SendChatMessage("*Получить дополнительный квест вне лимита:     #zzz или: ВОЖДЬ, хочу больше квестов и опыта!!! ", "officer", nil, 1)
		SendChatMessage("*Сдать дополнительный квест вне лимита: #zzy или:     ВОЖДЬ, сдать доп квест!!!", "officer", nil, 1)
		SendChatMessage("*Сдать квест:  #zzw      ВОЖДЬ, сдать", "officer", nil, 1)
		SendChatMessage("*Заполнить заметку: #zzv Текст заметки ИЛИ  !заметка Текст заметки" , "officer", nil, 1)
		SendChatMessage("*Дополнить существующую заметку: #zzu Текст заметки ИЛИ !заметка+ Текст заметки" , "officer", nil, 1)
		SendChatMessage("*Еще больше команд хороших и разных тут: https://t.me/AnkMorporkInfo", "officer", nil, 1)
	else
	end
--возможность игроку писать свою заметку
testHis=mysplit(message)
testHis[1]=all_trim(testHis[1])
if testHis[1] == "!заметка" or string.find (message, "#zzv") and nachalo~="*" then
	local vz = (message):gsub("!заметка ", "");
	for z=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(z)
		if name == sender then
			GuildRosterSetPublicNote(z, vz)
			SendChatMessage("*" .. name .. ", заметка добавлена", "officer", nil, 1)
		else
		end
	end
end

if testHis[1] == "!заметка+" or string.find (message, "#zzu") and nachalo~="*" then
	for z=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(z)
		if name == sender then
			local vzP = (message):gsub("!заметка%+", "");
			vzP=all_trim(vzP)
			local zamDop = publicNote .. " " .. vzP
			GuildRosterSetPublicNote(z, zamDop)
			SendChatMessage("*" .. name .. ", заметка дополнена", "officer", nil, 1)
		end
	end
end

if sender == "Витинари" or sender == "Двацветок" or sender == "Хэвлок" or sender == "Железобетонс" or sender == "Детрит" then
if message=="#zzo" then

	posX, posY = GetPlayerMapPosition("player");
	X={}
	Y={}
	print (posX)
	print (posY)
	for iX=3,10 do
		X[iX]=string.sub(posX,iX,iX)
		Y[iX]=string.sub(posY,iX,iX)
	end
	mioXY=X[3]..Y[3]..X[4]..Y[4]..X[5]..Y[5]..X[6]..Y[6]..X[7]..Y[7]..X[8]..Y[8]..X[9]..Y[9]..X[10]..Y[10]
	SendChatMessage("#zzn " .. mioXY, "officer", nil, 1)
end
end
end
)

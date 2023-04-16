local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local endQuests="простые_квесты"
local qAchiv="взят_ли_квест_простая_ачивка"
local timeLimit="время_последнего_обращения"
local str = string.gsub(message, "%s+", "")
hsh=hashStr(sender)
nachaloStr = string.utf8sub(message, 1, 1)

if TDG[sender]==nil then
	TDG[sender]={}
end
if TDG[nik][endQuests] == nil then
	TDG[nik][endQuests]={}
end
if pQuests == nil then
	pQuests={}
end
if pQuests[1] == nil then
	pQuests[1]={}
end
if pQuests[2] == nil then
	pQuests[2]={}
end
if pQuests[3] == nil then
	pQuests[3]={}
end
local nachalo = string.utf8sub(message, 1, 1)
if string.find (message, hsh) and string.find (message, "#aab") then
	msg1=mysplit(message)
	msg2=msg1[6]
	TDG[sender][endQuests][msg2]="1"
	testQLVL=TDG[sender]["уровень_квестов"]
	testQLVL=tonumber(testQLVL)
	countQ=tablelength(pQuests[testQLVL])
	chisloProstyhQComplit=0
	chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
	for testQ=1, countQ do
		x = math.random(1, countQ)
		ach=pQuests[testQLVL][x]
		if TDG[sender][endQuests][ach]~="1" then
			SendChatMessage(hsh .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
			break
		else
			chisloProstyhQComplit=chisloProstyhQComplit + 1
			if chisloProstyhQComplit==countQ then
				testQLVL=TDG[sender]["уровень_квестов"]
				testQLVL=tonumber(testQLVL)
				testQLVL=testQLVL+1
				TDG[sender]["уровень_квестов"]=testQLVL
				SendChatMessage("*" .. sender .. ", сложность квестов повышена.", "OFFICER", nil, 1)
			end
		end
	end
end
if string.find (message,hsh) and string.find (message, "#aac") then
	vydat_q=mysplit(message)
	if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
		SendChatMessage(hsh .. " #aae " .. sender .. ", получи ачивку " .. vydat_q[5] .. " " .. GetAchievementLink(vydat_q[5]), "OFFICER", nil, 1)
		prostye_q=vydat_q[5]
		TDG[sender][endQuests][prostye_q]="0"
		TDG[sender][qAchiv]=prostye_q
	else
		SendChatMessage(hsh .. " #aad " .. sender .. ", у тебя уже взят квест: " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
	end
end

if string.find (message,hsh) and string.find(message, "#aag") then
	msg=mysplit(message)
	msg1=msg[4]
	TDG[sender][endQuests][msg1]="1"
	TDG[sender][qAchiv]="9999"
	SendChatMessage(sender .. " !получает 3 опыта", "GUILD", nil, 1);
end

if string.find (sender, "Витинари") or string.find (sender, "Хэвлок") or string.find (sender, "Железобетонс") or string.find (sender, "Детрит") or string.find (sender, "Двацветок") then
	if string.find (message, "!удалить ачивку") and nachalo~="*" then
		msg=mysplit(message)
		q=msg[3]
		q=tonumber(q)
		msg=msg[4]
		for key, val in pairs(pQuests[q]) do
			if val==msg then
				table.remove(pQuests[q], key)
				print("*Квест " .. val .. " " .. GetAchievementLink(val) .. " был удален.")
			else
			end
		end
	end
end
if sender=="Витинари" or sender=="Хэвлок" or sender=="Железобетонс" or sender=="Детрит" or sender=="Двацветок" then
    if string.find (message, "!добавить ачивку") and nachalo~="*" then
		msg=mysplit(message)
		q=msg[3]
		q=tonumber(q)
		msg=msg[4]
		for key, val in pairs(pQuests[q]) do
			if val==msg then
				print("*Ачивка " .. val .. " " .. GetAchievementLink(val) .. " уже была добавлена.")
				testID=1
			else
			end
		end
		if testID~=1 then
			table.insert(pQuests[q], msg)
			print("*Ачивка " .. msg .. " " .. GetAchievementLink(msg) .. " была добавлена.")
		end
	end
end

if string.find (message,hsh) and string.find (message, "#aai") then
	msg1=mysplit(message)
	msg2=msg[6]
	TDG[sender][endQuests][msg2]="1"
	testQLVL=TDG[sender]["уровень_квестов"]
	testQLVL=tonumber(testQLVL)
	countQ=tablelength(pQuests[testQLVL])
	local chisloProstyhQComplit=0
	chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
	for testQ=1, countQ do
		local x = math.random(1, countQ)
		ach=pQuests[testQLVL][x]
		if TDG[sender][endQuests][ach]~="1" then
			SendChatMessage(hsh .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
			break
		else
			chisloProstyhQComplit=chisloProstyhQComplit + 1
			if chisloProstyhQComplit==countQ then
				achCmplt="6584"
				SendChatMessage(hsh .. " #aah " .. sender .. ", все стартовые квесты уже выполнены. Теперь покажи мне ачивку" .. achCmplt .. GetAchievementLink(achCmplt), "OFFICER", nil, 1)
			end
		end
	end
end

if message == "ВОЖДЬ, простой!" or string.find (message, "#zzs") and nachalo~="*" then
	if TDG[sender]==nil then
		TDG[sender]={}
	end
	if TDG[sender][endQuests]==nil then
		TDG[sender][endQuests]={}
	end
	local guokTimerStart=pQuests[1][1]
	if TDG[sender]["уровень_квестов"]==nil then
		TDG[sender]["уровень_квестов"]=1
	end

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
					testQLim="1"
				else
					testQLim="0"
				end
			else
				testQLim="0"
			end
		else
		end
	end
	if testQLim=="0" then
		testQLVL=TDG[sender]["уровень_квестов"]
		testQLVL=tonumber(testQLVL)
		if TDG[sender][endQuests][guokTimerStart]~=nil then
			if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
				countQ=tablelength(pQuests[testQLVL])
				local chisloProstyhQComplit=0
				chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
				for testQ=1, countQ do
					local x = math.random(1, countQ)
					ach=pQuests[testQLVL][x]
					if TDG[sender][endQuests][ach]~="1" then
						SendChatMessage(hsh .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
						break
					else
						chisloProstyhQComplit=chisloProstyhQComplit + 1
						if chisloProstyhQComplit==countQ then
							testQLVL=TDG[sender]["уровень_квестов"]
							testQLVL=tonumber(testQLVL)
							testQLVL=testQLVL+1
							TDG[sender]["уровень_квестов"]=testQLVL
							SendChatMessage("*" .. sender .. ", сложность квестов повышена.", "OFFICER", nil, 1)
						end
					end
				end
			else
				ach=TDG[sender][qAchiv]
				SendChatMessage(hsh .. " #aad " .. sender .. ", у тебя уже взят квест: " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
			end
		else
			countQ=tablelength(pQuests[testQLVL])
				local chisloProstyhQComplit=0
				chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
				for testQ=1, countQ do
					local x = math.random(1, countQ)
					ach=pQuests[testQLVL][x]
					if TDG[sender][endQuests][ach]~="1" then
						SendChatMessage(hsh .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
						break
					else
						chisloProstyhQComplit=chisloProstyhQComplit + 1
						if chisloProstyhQComplit==countQ then
							testQLVL=TDG[sender]["уровень_квестов"]
							testQLVL=tonumber(testQLVL)
							testQLVL=testQLVL+1
							TDG[sender]["уровень_квестов"]=testQLVL
							SendChatMessage("*" .. sender .. ", сложность квестов повышена.", "OFFICER", nil, 1)
						end
					end
				end




		end
	else
		SendChatMessage("*" .. sender .. ", следущий квест на твоем гильдлвле доступен завтра, но тебе доступен дополнительный квест с повышенным опытом: #zzz", "officer", nil, 1)
	end
end

if message == "ВОЖДЬ, сдать" or string.find (message, "#zzr") and nachalo~="*" then
	hours, minutes = GetGameTime()
	timeProvMin=minutes
	timeProvMin1=timeProvMin+1
	if TDG[sender][timeLimit]~=timeProvMin and TDG[sender][timeLimit]~=timeProvMin1 then
		if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
			SendChatMessage(hsh .. " #aae " .. sender .. ", у тебя нет взятых квестов.", "OFFICER", nil, 1);
		else
			proverkaVypolneniya=TDG[sender][qAchiv]
			SendChatMessage(hsh .. " #aaf " .. sender .. ", а сделал ли ты " .. proverkaVypolneniya .. " " .. GetAchievementLink(proverkaVypolneniya) .. "?", "OFFICER", nil, 1)
		end
		TDG[sender][timeLimit]=minutes
	else
		SendChatMessage("*" .. sender .. ", попробуй через минуту.", "OFFICER", nil, 1)
	end
end

if string.find (message, "#zzp") then
	if TDG[sender]["взят_ли_квест_простая_ачивка"]==nil then
		SendChatMessage(sender .. ", тебе нечего отменять.", "OFFICER", nil, 1)
	else
		testQuest=TDG[sender]["взят_ли_квест_простая_ачивка"]
		if TDG[sender]["взят_ли_квест_простая_ачивка"]~="9999" then
			SendChatMessage(sender .. ", квест " .. testQuest .. " " .. GetAchievementLink(testQuest) .. " отменен.", "OFFICER", nil, 1)
			TDG[sender]["взят_ли_квест_простая_ачивка"]="9999"
		else
			SendChatMessage(sender .. ", тебе нечего отменять.", "OFFICER", nil, 1)
		end
	end

end
end
)

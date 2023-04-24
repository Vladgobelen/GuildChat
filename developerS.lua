local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local endQuests="простые_квесты"
local qAchiv="взят_ли_квест_простая_ачивка"
local timeLimit="время_последнего_обращения"
local str = string.gsub(message, "%s+", "")
local hshStran3S
local hshStranMsgS
local hshStranMsgS2
local hshStranS1
local hshStranS2
local hshStranMsgS1
nachaloStr=mysplit(message)
nachaloStr = string.utf8sub(nachaloStr[1], 1, 1)
hshStranMsgS=mysplit(message)
testGM=gmTest(sender)
hshStranMsgS2=string.sub(message,7,7)
if string.find (message, "#") and hshStranMsgS[2]~= nil and nachaloStr~="*" then
	hshStranMsgS1=hshStranMsgS[1]
	hshStranS1,hshStranS2=hshStrNuovoServ(hshStranMsgS1,sender)

end
hshStran3S=hshSenderNomeServ(sender)


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
if hshStranS1==hshStranS2 and string.find (message, "#aab") then
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
			SendChatMessage(hshStran3S .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
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
if hshStranS1==hshStranS2 and string.find (message, "#aac") then
	vydat_q=mysplit(message)
	if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
		SendChatMessage(hshStran3S .. " #aae " .. sender .. ", получи ачивку " .. vydat_q[5] .. " " .. GetAchievementLink(vydat_q[5]), "OFFICER", nil, 1)
		prostye_q=vydat_q[5]
		TDG[sender][endQuests][prostye_q]="0"
		TDG[sender][qAchiv]=prostye_q
	else
		SendChatMessage(hshStran3S .. " #aad " .. sender .. ", у тебя уже взят квест: " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
	end
end

if hshStranS1==hshStranS2 and string.find(message, "#aag") then
	msg=mysplit(message)
	msg1=msg[4]
	TDG[sender][endQuests][msg1]="1"
	TDG[sender][qAchiv]="9999"
	SendChatMessage(sender .. " !получает 2 опыта", "GUILD", nil, 1);
end

if testGM~=nil then
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
if testGM~=nil then
    if string.find (message, "!добавить ачивку") and nachalo~="*" then
		soobshenie=mysplit(message)
		urovenQuestov=soobshenie[3]
		urovenQuestov=tonumber(urovenQuestov)
		nomerQuesta=soobshenie[4]
		for key, val in pairs(pQuests[urovenQuestov]) do
			if val==nomerQuesta then
				print("*Ачивка " .. val .. " " .. GetAchievementLink(val) .. " уже была добавлена.")
				testIDqq=1
			else
			end
		end
		if testIDqq~=1 then
			table.insert(pQuests[urovenQuestov], nomerQuesta)
			print("*Ачивка " .. nomerQuesta .. " " .. GetAchievementLink(nomerQuesta) .. " была добавлена.")
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
		if testQLVL==1 then
			if TDG[sender][endQuests][guokTimerStart]~=nil then
				if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
					countQ=tablelength(pQuests[testQLVL])
					local chisloProstyhQComplit=0
					chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
					for testQ=1, countQ do
						local x = math.random(1, countQ)
						ach=pQuests[testQLVL][x]
						if TDG[sender][endQuests][ach]~="1" then
							SendChatMessage(hshStran3S .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
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
					SendChatMessage(hshStran3S .. " #aad " .. sender .. ", у тебя уже взят квест: " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
				end
			else
				countQ=tablelength(pQuests[testQLVL])
					local chisloProstyhQComplit=0
					chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
					for testQ=1, countQ do
						local x = math.random(1, countQ)
						ach=pQuests[testQLVL][x]
						if TDG[sender][endQuests][ach]~="1" then
							SendChatMessage(hshStran3S .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
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
		elseif testQLVL==2 then
			SendChatMessage("*" .. sender .. ", ты на втором лвле квестов.", "OFFICER", nil, 1)
			if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
				countQ=tablelength(pQuests[testQLVL])
				local chisloProstyhQComplit=0
				chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
				j=0
				k=0
				for testQ=1, countQ do
					local x = math.random(1, countQ)
					ach=pQuests[testQLVL][x]



					if TDG[sender][endQuests][ach]~="9999" then
							SendChatMessage(hshStran3S .. " #aah " .. sender .. ", покажи ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
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
				SendChatMessage(hshStran3S .. " #aad " .. sender .. ", у тебя уже взят квест: " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
			end
		end
	else
		SendChatMessage("*" .. sender .. ", следущий квест на твоем гильдлвле доступен завтра, но тебе доступен дополнительный квест с повышенным опытом: #zzz", "officer", nil, 1)
	end
end

ltrO=mysplit(message)
if string.find (message, "333") and string.find (message, "выбрасывает") then
	if TDG[sender]["лотерея"]>=3 then
		SendChatMessage(hshStran3S .. " #ltr333 " .. sender .. " получает " ..  ltrO[3], "OFFICER", nil, 1)
		minusLotereya=TDG[sender]["лотерея"]
		minusLotereya=minusLotereya-3
		TDG[sender]["лотерея"]=minusLotereya
	else
		SendChatMessage(hshStran3S .. sender .. ", у тебя нет билетов", "OFFICER", nil, 1)
	end
end

if string.find (message, "111") and string.find (message, "выбрасывает") then
	if TDG[sender]["лотерея"]>=1 then
		if TDG[sender]["лотерея111"]==nil then
			ltrRez1=ltrO[3]
			ltrRez1=tonumber(ltrRez1)
			print (ltrRez1)
			SendChatMessage(hshStran3S .. " #ltr111 " .. sender .. " получает " ..ltrRez1 , "OFFICER", nil, 1)
			minusLotereya=TDG[sender]["лотерея"]
			minusLotereya=minusLotereya-1
			TDG[sender]["лотерея"]=minusLotereya
			TDG[sender]["лотерея111"]=1
		elseif TDG[sender]["лотерея111"]==1 then
			ltrRez2=ltrO[3]
			ltrRez2=tonumber(ltrRez2)
			ltrRez2=ltrRez1+ltrRez2
			minusLotereya=TDG[sender]["лотерея"]
			minusLotereya=minusLotereya-1
			TDG[sender]["лотерея"]=minusLotereya
			TDG[sender]["лотерея111"]=2
			SendChatMessage(hshStran3S .. " #ltr111 " .. sender .. " получает " ..ltrRez2 , "OFFICER", nil, 1)
		elseif TDG[sender]["лотерея111"]==2 then
			ltrRez3=ltrO[3]
			ltrRez3=tonumber(ltrRez3)
			ltrRez3=ltrRez2+ltrRez3
			minusLotereya=TDG[sender]["лотерея"]
			minusLotereya=minusLotereya-1
			TDG[sender]["лотерея"]=minusLotereya
			TDG[sender]["лотерея111"]=nil
			SendChatMessage(hshStran3S .. " #ltr111 " .. sender .. " получает " ..ltrRez3 , "OFFICER", nil, 1)
		end
	else
		SendChatMessage(hshStran3S .. sender .. ", у тебя нет билетов", "OFFICER", nil, 1)
	end
end











if hshStranS1==hshStranS2 and string.find (message, "#aaj") and nachalo~="*" then
	msgQLVL2Vydat=mysplit(message)
	msgQLVL2Vydat2=msgQLVL2Vydat[8]
	msgQLVL2Vydat2=tonumber(msgQLVL2Vydat2)
	msgQLVL2Vydat3=msgQLVL2Vydat[9]
	msgQLVL2Vydat3=tonumber(msgQLVL2Vydat3)
	msgQLVL2Vydat4=msgQLVL2Vydat[6]
	msgQLVL2Vydat4=tonumber(msgQLVL2Vydat4)
	skolko_dolzhno_stat=msgQLVL2Vydat2-msgQLVL2Vydat4+3
	if msgQLVL2Vydat4<=3 then
		SendChatMessage(hshStran3S .. " #aak " .. sender .. ", получи полностью ачивку " .. msgQLVL2Vydat3 .. " " .. GetAchievementLink(msgQLVL2Vydat3), "officer", nil, 1)
		TDG[sender]["взят_ли_квест_простая_ачивка"]=msgQLVL2Vydat3
		TDG[sender][endQuests][msgQLVL2Vydat3]=msgQLVL2Vydat2
	else
		SendChatMessage(hshStran3S .. " #aal " .. sender .. ", получи еще три пункта ачивки " .. msgQLVL2Vydat3 .. " " .. GetAchievementLink(msgQLVL2Vydat3), "officer", nil, 1)
		TDG[sender]["взят_ли_квест_простая_ачивка"]=msgQLVL2Vydat3
		TDG[sender][endQuests][msgQLVL2Vydat3]=skolko_dolzhno_stat
	end
end



if hshStranS1==hshStranS2 and string.find (message, "#zzk") and nachalo~="*" then
	schitaemSlova=mysplit(message)
	schitaemSlova=schitaemSlova[8]
	TDG[sender][endQuests][schitaemSlova]="9999"
	TDG[sender][qAchiv]="9999"
	SendChatMessage(sender .. " !получает 2 опыта", "GUILD", nil, 1);


end


















if message == "ВОЖДЬ, сдать" or string.find (message, "#zzr") or string.find (message, "#aam") then
	hours, minutes = GetGameTime()
	timeProvMin=minutes
	timeProvMin1=timeProvMin+1
	if TDG[sender][timeLimit]~=timeProvMin and TDG[sender][timeLimit]~=timeProvMin1 then
		if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
			SendChatMessage(hshStran3S .. " #aae " .. sender .. ", у тебя нет взятых квестов.", "OFFICER", nil, 1);
		else
			proverkaVypolneniya=TDG[sender][qAchiv]
			SendChatMessage(hshStran3S .. " #aaf " .. sender .. ", а сделал ли ты " .. proverkaVypolneniya .. " " .. GetAchievementLink(proverkaVypolneniya) .. "?", "OFFICER", nil, 1)
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
			SendChatMessage(hshStran3S .." #xxx" .. " " .. sender .. ", квест " .. testQuest .. " " .. GetAchievementLink(testQuest) .. " отменен.", "OFFICER", nil, 1)
			TDG[sender]["взят_ли_квест_простая_ачивка"]="9999"
		else
			SendChatMessage(sender .. ", тебе нечего отменять.", "OFFICER", nil, 1)
		end
	end

end
end
)

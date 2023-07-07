local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
--команды для управления квестами
local nik=sender
local endQuests="простые_квесты"
local qAchiv="взят_ли_квест_простая_ачивка"
local timeLimit="время_последнего_обращения"
testGM=gmTest(sender)
if kod=="NSGadd" then
hshStran3S=hshSenderNomeServ(sender)
print (arg1 .. " " .. message .. " " .. sender)
--print (arg2) сообщение
--print (arg3) херня
--print (arg4) сендер
--print (kod)

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
if string.find (message, "#aab") then
	msg1=mysplit(message)
	msg2=msg1[2]
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
			SendAddonMessage("NSGadd", "#aaa " .. sender .. " " .. ach, "guild")
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
if string.find (message, "#aac") or string.find (message, "#aaq")  then
	vydat_q=mysplit(message)
	vydat_q=vydat_q[2]
	if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
		SendAddonMessage("NSGadd", "#aae " .. sender .. " " .. vydat_q, "guild")
		SendChatMessage(sender .. ", получи ачивку " .. GetAchievementLink(vydat_q), "OFFICER", nil, 1)
		prostye_q=vydat_q
		TDG[sender][endQuests][prostye_q]="0"
		TDG[sender][qAchiv]=prostye_q
		TDG[sender]["третий_лвл_квестов_2"]=vydat_q
	else
		SendChatMessage(sender .. ", у тебя уже взят квест: " .. GetAchievementLink(vydat_q), "OFFICER", nil, 1)
	end
end

if string.find(message, "#aag") then
	msg=mysplit(message)
	msg1=msg[2]
	TDG[sender][endQuests][msg1]="1"
	TDG[sender][qAchiv]="9999"
	SendChatMessage(sender .. " !получает 2 опыта", "GUILD", nil, 1);
end





if string.find (message, "#zzs") or string.find (message, "#aai") or string.find (message, "#aar") or string.find (message, "#aap") then
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
	msgPovtor=mysplit(message)
	msgPovtor=msgPovtor[2]
	if string.find (message, "#aai") then
		TDG[sender][endQuests][msgPovtor]="9999"
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
				if gildLvl ~= 0 then
					if qN >= gildLvl then
						testQLim="1"
					else
						testQLim="0"
					end
				else
					if qN >= 1 then
						testQLim="1"
					else
						testQLim="0"
					end
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
							SendAddonMessage("NSGadd", "#aaa " .. sender .. " " .. ach, "guild")
							break
						else
							chisloProstyhQComplit=chisloProstyhQComplit + 1
							if chisloProstyhQComplit==countQ then
								testQLVL=TDG[sender]["уровень_квестов"]
								testQLVL=tonumber(testQLVL)
								testQLVL=testQLVL+1
								TDG[sender]["уровень_квестов"]=testQLVL
								SendChatMessage(sender .. ", сложность квестов повышена.", "OFFICER", nil, 1)
							end
						end
					end
				else
					ach=TDG[sender][qAchiv]
					SendChatMessage(sender .. ", у тебя уже взят квест: " .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
				end
			else
				countQ=tablelength(pQuests[testQLVL])
					local chisloProstyhQComplit=0
					chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
					for testQ=1, countQ do
						local x = math.random(1, countQ)
						ach=pQuests[testQLVL][x]
						if TDG[sender][endQuests][ach]~="1" then
							SendAddonMessage("NSGadd", "#aaa " .. sender .. " " .. ach, "guild")
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
						SendAddonMessage("NSGadd", "#aah " .. sender .. " " .. ach, "guild")
						break
					else
						chisloProstyhQComplit=chisloProstyhQComplit + 1
						if chisloProstyhQComplit==countQ then
							testQLVL=TDG[sender]["уровень_квестов"]
							testQLVL=tonumber(testQLVL)
							testQLVL=testQLVL+1
							TDG[sender]["уровень_квестов"]=testQLVL
							SendAddonMessage("NSGadd", "#aa3 " .. sender, "guild")
							SendChatMessage(sender .. ", сложность квестов повышена.", "OFFICER", nil, 1)
						end
					end
				end
			else
				ach=TDG[sender][qAchiv]
				SendChatMessage(sender .. ", у тебя уже взят квест: " .. GetAchievementLink(ach), "OFFICER", nil, 1)
			end
		elseif testQLVL==3 then
			if TDG[sender]["третий_лвл_квестов_1"]==nil then
				TDG[sender]["третий_лвл_квестов_1"]=pQuests[testQLVL][1][1]
			end
			if TDG[sender]["третий_лвл_квестов_2"]==nil then
				TDG[sender]["третий_лвл_квестов_2"]=pQuests[testQLVL][2][1]
			end
			if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then

				local xQ = math.random(1, 2)

				if xQ==1 and TDG[sender]["третий_лвл_квестов_1"]~="9999" then
					questLvl3_1(testQLVL,sender)
				elseif xQ==2 and TDG[sender]["третий_лвл_квестов_2"]~="9999" then
					questLvl3_2(testQLVL,sender)
				elseif TDG[sender]["третий_лвл_квестов_2"]=="9999" and TDG[sender]["третий_лвл_квестов_1"]=="9999" then
					SendChatMessage(sender .. ", все квесты закончились", "OFFICER", nil, 1)
				end
			else
				ach=TDG[sender][qAchiv]
				SendChatMessage(sender .. ", у тебя уже взят квест: " .. GetAchievementLink(ach), "OFFICER", nil, 1)
			end
		end
	else
		SendChatMessage(sender .. ", следущий квест на твоем гильдлвле доступен завтра, но тебе доступен дополнительный квест с повышенным опытом: #zzz", "officer", nil, 1)
	end
end




if string.find (message, "#aaj") or string.find (message, "#aas") then
	msgQLVL2Vydat=mysplit(message)
	msgQLVL2Vydat2=msgQLVL2Vydat[3]
	msgQLVL2Vydat2=tonumber(msgQLVL2Vydat2)
	msgQLVL2Vydat3=msgQLVL2Vydat[4]
	msgQLVL2Vydat4=msgQLVL2Vydat[2]
	msgQLVL2Vydat4=tonumber(msgQLVL2Vydat4)
	skolko_dolzhno_stat=msgQLVL2Vydat2-msgQLVL2Vydat4+3
	if msgQLVL2Vydat4<=3 then
		SendAddonMessage("NSGadd", "#aak " .. sender .. " " .. msgQLVL2Vydat3 .. " " .. msgQLVL2Vydat4, "guild")
		SendChatMessage(sender .. ", получи ачивку " .. " " .. GetAchievementLink(msgQLVL2Vydat3), "officer", nil, 1)
		TDG[sender]["взят_ли_квест_простая_ачивка"]=msgQLVL2Vydat3
		TDG[sender][endQuests][msgQLVL2Vydat3]=msgQLVL2Vydat2
	else
		SendAddonMessage("NSGadd", "#aal " .. sender .. " " .. msgQLVL2Vydat3, "guild")
		SendChatMessage(sender .. ", получи еще три пункта ачивки " .. " " .. GetAchievementLink(msgQLVL2Vydat3), "officer", nil, 1)
		TDG[sender]["взят_ли_квест_простая_ачивка"]=msgQLVL2Vydat3
		TDG[sender][endQuests][msgQLVL2Vydat3]=skolko_dolzhno_stat
	end
end



if string.find (message, "#zzk")then
	schitaemSlova=mysplit(message)
	schitaemSlova=schitaemSlova[3]
	TDG[sender][endQuests][schitaemSlova]="9999"
	TDG[sender][qAchiv]="9999"
	SendChatMessage(sender .. " !получает 2 опыта", "GUILD", nil, 1);


end


if string.find (message, "#zzr") or string.find (message, "#aam") or string.find (message, "#aat") then
	if TDG[sender][qAchiv]==nil or TDG[sender][qAchiv]=="9999" then
		SendChatMessage(sender .. ", у тебя нет взятых квестов.", "OFFICER", nil, 1);
	else
		proverkaVypolneniya=TDG[sender][qAchiv]
		SendAddonMessage("NSGadd", "#aaf " .. sender .. " " .. proverkaVypolneniya, "guild")
	end
end



if string.find (message, "#zzp") then
	if TDG[sender]["взят_ли_квест_простая_ачивка"]==nil then
		SendChatMessage(sender .. ", тебе нечего отменять.", "OFFICER", nil, 1)
	else
		testQuest=TDG[sender]["взят_ли_квест_простая_ачивка"]
		if TDG[sender]["взят_ли_квест_простая_ачивка"]~="9999" then
			SendAddonMessage("NSGadd", "#xxx " .. sender, "guild")
			SendChatMessage(sender .. ", квест " .. GetAchievementLink(testQuest) .. " отменен.", "OFFICER", nil, 1)
			TDG[sender]["взят_ли_квест_простая_ачивка"]="9999"
			for guok=1,GetNumGuildMembers(true) do
				local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guok)
				if name == sender then
					local ofN = mysplit(officerNote)
					if ofN[1] ~= nil then
						local plusKol=string.sub(ofN[2],1,2)
						local plusKol1=string.sub(ofN[2],3,3)
						local plusKol2 = date("%d")
						plusKol = tonumber(plusKol)
						plusKol2 = tonumber(plusKol2)
						if plusKol == plusKol2 then
							plusKol1 = plusKol1 + 1
							local plusRez = ofN[1] .. " " .. plusKol2 ..  plusKol1 .. " " .. ofN[3]
							GuildRosterSetOfficerNote(guok, plusRez)
						else
							plusKol1 = 1
							local plusRez = ofN[1] .. " " .. plusKol2 .. plusKol1 .. " " .. ofN[3]
							GuildRosterSetOfficerNote(guok, plusRez)
						end
					else
						local nuovoDate = date("%d")
						plusRez = "0000" .. " " .. nuovoDate .. "1" .. " " .. "0000"
						GuildRosterSetOfficerNote(guok, plusRez)
					end
				end
			end
		else
			SendChatMessage(sender .. ", тебе нечего отменять.", "OFFICER", nil, 1)
		end
	end

end

local guokInf = string.gsub(message, "%s+", "")
if string.find (message, "#zzt") then
	for guok=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guok)
		if name == sender then
			local test=string.sub(officerNote,2,2)
			if test~="" then
			local gildLvl = string.utf8sub(officerNote, 1, 1)
			local gildExp = string.utf8sub(officerNote, 2, 5)
			SendChatMessage("*" .. sender .. ": " .. gildLvl .. " гильдлвл" .. " и " .. gildExp .. " опыта", "officer", nil, 1)
			local gildLvlN = tonumber (gildLvl)
			local gildExpN = tonumber (gildExp)
			if gildLvl == "0" then
				local gildExpN = 4 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Сейчас награда 50 золота за квест и доступен 1 квест в сутки. При лвлапе: 4 сумки из ткани пустоты или лотерейный билет. " , "officer", nil, 1)
			elseif gildLvl == "1" then
				local gildExpN = 8 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Сейчас награда 60 золота за квест и доступен 1 квест в сутки. При лвлапе: 4 сумки ледяной ткани или лотерейный билет. " , "officer", nil, 1)
			elseif gildLvl == "2" then
				local gildExpN = 16 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Сейчас награда 70 золота за квест и доступны 2 квеста в сутки. " , "officer", nil, 1)
				SendChatMessage("*При лвлапе: повышение до Констебля. Что то одно из пятой ячейки ГБ, кроме серой кошки, письма и маунтов ИЛИ лотерейный билет. " , "officer", nil, 1)
			elseif gildLvl == "3" then
				local gildExpN = 32 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Сейчас награда 80 золота за квест и доступны 3 квеста в сутки. При лвлапе: повышение до Мл. Капрала. 2 ледовые сумки или три лотерейных билета. " , "officer", nil, 1)
			elseif gildLvl == "4" then
				local gildExpN = 64 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Сейчас награда 90 золота за квест и доступны 4 квеста в сутки. При лвлапе: Повышение до Капрала. 4 ледовые сумки или четыре лотерейных билета. " , "officer", nil, 1)
			elseif gildLvl == "5" then
				local gildExpN = 128 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Сейчас награда 100 золота за квест и доступны 5 квестов в сутки. При лвлапе: повышение до Сержанта. 4 ледовые сумки или 5 лотерейных билетов." , "officer", nil, 1)
			elseif gildLvl == "6" then
				local gildExpN = 256 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Сейчас награда 110 золота за квест и доступны 6 квестов в сутки. При лвлапе: 7500 золота или шесть лотерейных билетов. " , "officer", nil, 1)
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
				SendChatMessage("*" .. sender .. ", ты еще не делал квестов", "officer", nil, 1)
			end
		else
		end
	end
else
end

if string.find (message, "#zzz") then
	if TDG[sender]["доп_квест"]~=nil then
		testDopQ=TDG[sender]["доп_квест"]
		testDopQ=tonumber(testDopQ)
	end
		local kol=0
		for guokZ=1,GetNumGuildMembers(true) do
			local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guokZ)
			kol=kol+1
		end
		local kol1=kol+20
		if kol <= 980 then
			SendChatMessage("* #zzl " .. sender .. ", прими 20 новых игроков в гильдию.", "officer", nil, 1);
			TDG[sender]["доп_квест"]=kol1
		else
			SendChatMessage("Дополнительный квест временно недоступен. Ждите Кусяо.", "officer", nil, 1);
		end



end

if string.find (message, "#zzy") then
	local zzyF = mysplit(message)
	zzyF[2] = tonumber(zzyF[2])
		if zzyF[2] < 20 then
			SendChatMessage("*" .. sender .. ", ты принял " .. zzyF[2] .. " игроков из 20. ", "officer", nil, 1);
		else
			SendChatMessage(sender .. " получает 3 опыта", "guild", nil, 1);
			SendChatMessage(sender .. " получает кусок карты", "guild", nil, 1);
			SendAddonMessage("NSGadd", "#zz_x " .. sender, "guild")
			if TDG[sender]["кусков_карты"]==nil then
				TDG[sender]["кусков_карты"]=1
			else
				dopKus=TDG[sender]["кусков_карты"]
				dopKus=tonumber(dopKus)
				dopKus=dopKus+1
				TDG[sender]["кусков_карты"]=dopKus
			end
			TDG[sender]["доп_квест"]=9999
		end
end


end

end
)


local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local endQuests="простые_квесты"
local qAchiv="взят_ли_квест_простая_ачивка"
local timeLimit="время_последнего_обращения"
local str = string.gsub(message, "%s+", "")
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
function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end
function alfabet (bookv)
shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	myB=string.find(shablon,bookv)
	return myB
end

function hashStr (nome)
	i = time()
	i = string.sub(i, 8, 9)
	i = i * i
	i = i * 3.1415926535
	i = string.sub(i, 3, 5)
	i = string.format("%03d",i)
	nome1=string.sub(nome, 1, 1)
	nome2=string.sub(nome, 2, 2)
	nome1=alfabet(nome1)
	nome2=alfabet(nome2)
	hNome=nome1*nome2
	hNome=string.sub(hNome, 1, 3)
	hNome=string.format("%03d",hNome)
	r1=string.sub(i, 1, 1)
	r2=string.sub(hNome, 1, 1)
	r3=string.sub(i, 2, 2)
	r4=string.sub(hNome, 2, 2)
	r5=string.sub(i, 3, 3)
	r6=string.sub(hNome, 3, 3)
	r=r1 .. r2 .. r3 .. r4 .. r5 .. r6
	return r
end

hsh=hashStr(sender)

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
local nachalo = string.sub(message, 1, 1)
if string.find (message, hsh) and string.find (message, "#aab") then
	msg1=mysplit(message)
	msg1=msg[6]
	TDG[sender][endQuests][msg1]="1"
	countQ=tablelength(pQuests[1])
	local chisloProstyhQComplit=0
	chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
	for testQ=1, countQ do
		local x = math.random(1, countQ)
		ach=pQuests[1][x]
		if TDG[sender][endQuests][x]~="1" then
			SendChatMessage(hsh .. " #aaa " .. sender .. ", покажи мне ачивку " .. ach .. " " .. GetAchievementLink(ach), "OFFICER", nil, 1)
			break
		else
			chisloProstyhQComplit=chisloProstyhQComplit + 1
			if chisloProstyhQComplit==countQ then
				SendChatMessage("*" .. sender .. ", все простые квесты уже выполнены. Добавить переход на следущий уровень квестов.", "OFFICER", nil, 1)
			end
		end
	end
end

if string.find(message, hsh) and string.find (message, "#aac") then
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

if string.find (message, hsh) and string.find(message, "#aag") then
	SendChatMessage(sender .. " !получает 2 опыта", "OFFICER", nil, 1);
end

if string.find (message, "!удалить") and sender=="Витинари" and nachalo~="*" then
	msg = all_trim(message)
	msg = (msg):gsub(nik, "");
	msg = all_trim(msg)
	msg = (msg):gsub("!удалить ", "")
	for key, val in pairs(pQuests[1]) do
		if val==msg then
			table.remove(pQuests[1], key)
				print("*Квест " .. val .. " " .. GetAchievementLink(val) .. " был удален.")
        else
		end
	end
end

if string.find (sender, "Витинари") or string.find (sender, "Хэвлок") or string.find (sender, "Железобетонс") or string.find (sender, "Детрит") or string.find (sender, "Двацветок") then
    if string.find (message, "!добавить квест") and nachalo~="*" then
		msg = all_trim(message)
		msg = (msg):gsub(nik, "");
		msg = all_trim(msg)
		msg = (msg):gsub("!добавить квест ", "");
		for key, val in pairs(pQuests[1]) do
			if val==msg then
				print("*Квест " .. val .. " " .. GetAchievementLink(val) .. " уже был добавлен.")
                    testID=1
			else
			end
		end
		if testID~=1 then
			table.insert(pQuests[1], msg)
			print("*Квест " .. msg .. " " .. GetAchievementLink(msg) .. " был добавлен.")
		end
	end
end

end
)

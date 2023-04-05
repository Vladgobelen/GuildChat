local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--переменные
local yo=sender --передаем ник в первую переменую на всякий случай
local nik=yo --передаем ник в используемую переменную
local objec_t="объекты" --это таблица
local quest --это слово
local startLoc="стартовая_локация" --это слово
local att_Q="текущий_квест" --это слово
local disp_Q="доступно_квестов" --это (число)
local creatore="создатель" --это слово
local xY="текущая_локация" --это слово
local inf_o="описание" --это строка. Нужно объявить при создании объекта.
--конец блока переменных
--функция для удаления пробелов на концах строк
function all_trim(s)
	return s:match( "^%s*(.-)%s*$" )
end
--конец функции для удаления пробелов на концах строк
--функция для разделения строки на слова (слова добавляются в переменную массив)
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
--конец функции для разделения строки на слова
local testHis = string.sub(message, 1, 1) --получить первый символ строки для определения системных сообщений
if string.find (message, "!старт квест") and testHis~="*" then --проверить сообщение игрока на ключевые слова
--проверка на существование всех таблиц
	msg = all_trim(message) --удалить пробелы на концах команды игрока
	msg = mysplit(message) --разбить команду игрока на слова

	if msg[3]==nil then --проверяем, что игрок правильно ввел команду, иначе предупреждаем
		SendChatMessage("*" .. nik .. ", в какой мир ты хочешь попасть? Ау, не вижу названия мира!", "guild", nil, 1)
	end

	quest = msg[3] --текущий квест это третье слово в команде игрока (команда: !старт квест [слово])

	print (quest) --отладка

	if TDG==nil then --проверка, что существует таблица с параметрами игроков
		TDG={}
	end
	if TDG[nik]==nil then --проверка, что в таблице с параметрами игроков есть подтаблица с никами
		TDG[nik]={}
	end
	if TDG[nik][disp_Q]==nil then --проверка, что в таблице с параметрами игроков есть строка "доступно_квестов"
		TDG[nik][disp_Q]=0
	end
	if TDG[nik][att_Q]==nil then --проверка что в таблице с параметрами игроков есть строка "текущий_квест"
		TDG[nik][att_Q]="0"
	end
	if TDG[nik][quest][xY]==nil then --проверка, что в таблице с параметрами игроков в разделе текущего квеста есть координаты игрока, если нет - назначить их как "0"
		TDG[nik][quest][xY]="0"
	end
	if TDGq==nil then --поверка, что существует таблица с квестами
		TDGq={}
	end
	if TDGq[quest]==nil then --если запрошенный квест не существует
		if TDG[nik][disp_Q]~=0 --если игроку доступно создание квестов
			TDGq[quest]={} --создаем квест
			TDGq[quest][creatore]=nik --назначаем создателем квеста игрока

			if TDGq[quest][objec_t]==nil then --проверка, что в таблице с квестами в разделе текущего квеста существует таблица с объектами
				TDGq[quest][objec_t]={}
			end
			if TDGq[quest][startLoc]==nil then --проверка что в таблице с квестами в текущем квесте есть строка "стартовая_локация"
				TDGq[quest][startLoc]="0"
			end
			SendChatMessage("*Вселенная была пуста и безвидна. И увидел " .. nik .. ", что нужно !создать Мир.", "guild", nil, 1);
 		else --если игроку недоступно создание квестов
			SendChatMessage("*Недостаточно маны для создания нового Мира.", "guild", nil, 1)
		end
	else --если запрошенный квест существует
		if TDGq[quest][creatore]==nik then --если игрок создатель квеста
			if TDGq[quest][startLoc]=="0" then --если стартовой локации не существует
				SendChatMessage("*" .. nik .. " , возможно стоит !создать стартовую локацию.", "guild", nil, 1);
			else
				if TDGq[quest][startLoc][inf_o]~=nil then --проверяем, что существует описание стартовой локации
					SendChatMessage(TDGq[quest][startLoc][inf_o], "guild", nil, 1); --выводим описание стартовой локации
				else --если описания стартовой локации не существует
					SendChatMessage("*" .. nik .. ", попробуй !cоздать !описание стартовой локации.", "guild", nil, 1);
				end
			end
		else
			if TDGq[quest][startLoc]=="0" then --если стартовой локации не существует
				SendChatMessage("*А тут пока " .. TDGq[quest][creatore] .. " ничего не создал", "guild", nil, 1);
			else
				if TDGq[quest][startLoc][inf_o]~=nil then --проверяем, что существует описание стартовой локации
					SendChatMessage(TDGq[quest][startLoc][inf_o], "guild", nil, 1); --выводим описание стартовой локации
				else --если описания стартовой локации не существует
					SendChatMessage(TDGq[quest][creatore] .. " сам особо не понимает где ты находишься, а ведь он это создал..", "guild", nil, 1);
				end
			end
		end
	end
	--конец проверки на существование всех таблиц

	TDG[nik][att_Q]=quest --назначаем игроку текущий квест
end


--[[
quest=TDG[nik][att_Q]

if string.find (message, "!создать") and TDGq[quest][creatore]==nik and testHis~="*" then
	print (TDG[nik][quest])
	print ("6")
	print (TDG[nik][att_Q])
	print ("7")
	print (TDGq[quest][creatore])
	print ("8")
	local strSoz = mysplit(message)
	if strSoz[2] == nil then
		SendChatMessage("*" .. nik .. ", сложно создать ничто, особенно если его нет...", "guild", nil, 1)
	else
		if TDGq[quest][startLoc]==nil or TDGq[quest][startLoc] == "0" then
			TDGq[quest][startLoc]=strSoz[2]
		end
	end


else
	if string.find (message, "!создать") and testHis~="*"  then
		SendChatMessage("*" .. nik .. ", в этом мире у тебя нет силы....", "guild", nil, 1);
	end
end

local messageOsm=all_trim(message)
local messageOsm=mysplit(messageOsm)
local messageOsm1=messageOsm[1]
local messageOsm2=messageOsm[2]
if string.find (message, "!осмотреть") and messageOsm[2]==nil and testHis~="*" then
	SendChatMessage("*" .. nik .. ", ты находишься в локации" .. TDG[nik][quest][xY], "guild", nil, 1)
elseif string.find (message, "!осмотреть") and messageOsm[2]~=nil and testHis~="*" then
	if TDGq[quest][objec_t][messageOsm2]==nil then
		SendChatMessage("*" .. nik .. ", здесь нету " .. messageOsm2, "guild", nil, 1)
	else
		if TDGq[quest][objec_t][inf_o]==nil then
			SendChatMessage("*" .. nik .. ", да хрен знает, что это такое...", "guild", nil, 1)
		else
			SendChatMessage("*" .. nik .. ", это " .. TDGq[quest][objec_t][messageOsm2][inf_o], "guild", nil, 1)
		end
	end
end
--]]



end
)

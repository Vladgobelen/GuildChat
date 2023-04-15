local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--переменные
local yo=sender --передаем ник в первую переменую на всякий случай
local nik=yo --передаем ник в используемую переменную
local objec_t="объекты" --это таблица
local quest --это слово
local startLoc="стартовая_локация" -- название объекта --это слово
local att_Q="текущий_квест" --это слово
local disp_Q="доступно_квестов" --это (число)
local disp_O="доступно_объектов"
local creatore="создатель" --это слово
local xY="текущая_локация" --это слово
local objec_t_name --имя объекта
local attenzioni="внимательность"
local forza="сила"
local santita="святость"
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
		SendChatMessage("*" .. nik .. ", в какой мир ты хочешь попасть? Ау, не вижу названия мира!", "OFFICER", nil, 1)
	else

	quest = msg[3] --текущий квест это третье слово в команде игрока (команда: !старт квест [слово])

	if TDG==nil then --проверка, что существует таблица с параметрами игроков
		TDG={}
	end
	if TDG[nik]==nil then --проверка, что в таблице с параметрами игроков есть подтаблица с никами
		TDG[nik]={}
		TDG[nik][disp_O]=0
		TDG[nik][attenzioni]=1
		TDG[nik][forza]=1
		TDG[nik][santita]=1
	else
		if TDG[nik][disp_O]==nil then
			TDG[nik][disp_O]=0
		end
		if TDG[nik][attenzioni]==nil then
			TDG[nik][attenzioni]=1
		end
		if TDG[nik][forza]==nil then
			TDG[nik][forza]=1
		end
		if TDG[nik][santita]==nil then
			TDG[nik][santita]=1
		end

	end
	if TDG[nik][quest]==nil then
		TDG[nik][quest]={}
	end
	if TDG[nik][disp_Q]==nil then --проверка, что в таблице с параметрами игроков есть строка "доступно_квестов"
		TDG[nik][disp_Q]=1
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
		if TDG[nik][disp_Q]~=0 then --если игроку доступно создание квестов
			TDGq[quest]={} --создаем квест
			TDGq[quest][creatore]=nik --назначаем создателем квеста игрока
			TDG[nik][disp_Q]=TDG[nik][disp_Q]-1
			if TDGq[quest][objec_t]==nil then --проверка, что в таблице с квестами в разделе текущего квеста существует таблица с объектами
				TDGq[quest][objec_t]={}
			end
			if TDGq[quest][startLoc]==nil then --проверка что в таблице с квестами в текущем квесте есть строка "стартовая_локация"
				TDGq[quest][startLoc]="0"
			end
			SendChatMessage("*Вселенная была пуста и безвидна. И увидел " .. nik .. ", что нужно !создать Мир.", "OFFICER", nil, 1);
			TDG[nik][att_Q]=quest
 		else --если игроку недоступно создание квестов
			SendChatMessage("*Недостаточно маны для создания нового Мира.", "OFFICER", nil, 1)
		end
	else --если запрошенный квест существует
		TDG[nik][att_Q]=quest
		if TDGq[quest][creatore]==nik then --если игрок создатель квеста
			if TDGq[quest][startLoc]=="0" then --если стартовой локации не существует
				SendChatMessage("*" .. nik .. " , возможно стоит !создать стартовую локацию.", "OFFICER", nil, 1);
			else
				objec_t_name=TDGq[quest][startLoc]
				if TDGq[quest][objec_t][objec_t_name]["описание"][1]~=nil then --проверяем, что существует описание стартовой локации
					SendChatMessage(TDGq[quest][objec_t][objec_t_name]["описание"][1], "OFFICER", nil, 1); --выводим описание стартовой локации
				else --если описания стартовой локации не существует
					SendChatMessage("*" .. nik .. ", попробуй !cоздать описание стартовой локации.", "OFFICER", nil, 1);
				end
			end
		else
			if TDGq[quest][startLoc]=="0" then --если стартовой локации не существует
				SendChatMessage("*А тут пока " .. TDGq[quest][creatore] .. " ничего не создал", "OFFICER", nil, 1);
			else
				objec_t_name=TDGq[quest][startLoc]


				if TDGq[quest][objec_t][objec_t_name]["описание"][1]~=nil then --проверяем, что существует описание стартовой локации
					TDG[nik][quest][xY]=objec_t_name


					opisanie=TDGq[quest][objec_t][objec_t_name]["описание"][1]
					print (opisanie)
					--SendChatMessage(TDGq[quest][objec_t][objec_t_name]["описание"][1], "OFFICER", nil, 1); --выводим описание стартовой локации
				else --если описания стартовой локации не существует
					SendChatMessage(TDGq[quest][creatore] .. " сам особо не понимает где ты находишься, а ведь он это создал..", "OFFICER", nil, 1);
				end
			end
		end
	end
	--конец проверки на существование всех таблиц
end
end


quest=TDG[nik][att_Q]

if string.find (message, "!создать") and TDGq[quest][creatore]==nik and testHis~="*" then
	strSoz = mysplit(message)
	objec_t_name=strSoz[2]
	if strSoz[2] == nil then
		SendChatMessage("*" .. nik .. ", сложно создать ничто, особенно если его нет...", "OFFICER", nil, 1)
	else
		if objec_t_name=="объект" then
			if TDGq[quest][startLoc]==nil or TDGq[quest][startLoc] == "0" then
				TDGq[quest][objec_t][objec_t_name]={}
				TDGq[quest][objec_t][objec_t_name]["название"]=objec_t_name
				TDGq[quest][startLoc]=strSoz[2]
				TDGq[quest][objec_t][objec_t_name]["координаты"]=quest
				SendChatMessage("*" .. nik .. ", созданный объект " .. strSoz[2] .. " назначен стартовой локацией", "OFFICER", nil, 1)
				TDG[sender][quest][xY]=strSoz[2]
			else
				if TDGq[quest][objec_t][objec_t_name]~=nil then
					SendChatMessage("*" .. nik .. " " .. strSoz[2] .. " уже существует", "OFFICER", nil, 1)
				else
					TDGq[quest][objec_t][objec_t_name]={}
					TDGq[quest][objec_t][objec_t_name]["название"]=objec_t_name
					TDGq[quest][objec_t][objec_t_name]["координаты"]=TDG[sender][quest][xY]
					SendChatMessage("*" .. nik .. " " .. strSoz[2] .. " создано внутри " .. TDGq[quest][objec_t][objec_t_name]["координаты"], "OFFICER", nil, 1)
				end
			end
		elseif strSoz[2]=="описание" then
			if strSoz[3]==nil then
				SendChatMessage("*" .. nik .. ", описание чего ты хочешь создать?", "OFFICER", nil, 1)
			else
				if strSoz[4]==nil then
					SendChatMessage("*" .. nik .. ", а где собственно описание??", "OFFICER", nil, 1)
				else
					tblLens=tablelength(strSoz)
					opisanie=table.concat(strSoz, " ", 4,tblLens)
					objec_t_name=strSoz[3]
					TDGq[quest][objec_t][objec_t_name]["описание"]={}
					table.insert(TDGq[quest][objec_t][objec_t_name]["описание"], opisanie)
				end
			end
		end




	end



else
	if string.find (message, "!создать") and testHis~="*"  then
		SendChatMessage("*" .. nik .. ", в этом мире у тебя нет силы....", "OFFICER", nil, 1);
	end
end


--переменные для блока !осмотреть
local messageOsm=all_trim(message)
local messageOsm=mysplit(messageOsm)
local messageOsm1=messageOsm[1]
local messageOsm2=messageOsm[2]
--конец блока переменных
if string.find (message, "!осмотреть") and messageOsm[2]==nil and testHis~="*" then --если команда введена одним словом
	if TDG==nil or TDGq==nil then
		SendChatMessage("*Не существует даже вселенной.", "OFFICER", nil, 1)
	else
		if TDG[nik][att_Q] ~= nil then ---если текущий квест есть в таблице игрока
			quest=TDG[nik][att_Q]
			if TDG[nik][quest][xY] ~= nil then --если в таблице игрока есть координаты
				if TDG[nik][quest][xY] ~= "0" then --если координаты игрока в текущем квесте не нулевые
					XY=TDG[nik][quest][xY]

					opisanie=TDGq[quest][objec_t][XY]["описание"][1]

					if TDGq[quest][objec_t][XY]["описание"][1]~=nil then
						print (opisanie)
					else
						SendChatMessage("*" .. sender .. " попробуй !создать " .. " описание " .. XY .. " текст_описания", "OFFICER", nil, 1)
					end
				else
					SendChatMessage("*" .. nik .. ", попробуй зайти в мир, где создано хоть что нибудь.", "OFFICER", nil, 1)
				end
			else
				SendChatMessage("*" .. nik .. ", для начала нужно зайти в любой мир, где что то есть.", "OFFICER", nil, 1)
			end
		else
			SendChatMessage("*" .. nik .. ", для начала нужно зайти в любой мир: !старт квест [название квеста]", "OFFICER", nil, 1)
		end
	end
elseif string.find (message, "!осмотреть") and messageOsm[2]~=nil and testHis~="*" then --если к команде добавлен объекта
	if TDG==nil or TDGq==nil then
		SendChatMessage("*Не существует даже вселенной.", "OFFICER", nil, 1)
	else
		if TDG[nik][att_Q] ~= nil then ---если текущий квест есть в таблице игрока
			quest=TDG[nik][att_Q]
			if TDG[nik][quest][xY] ~= nil then --если в таблице игрока есть координаты
				if TDG[nik][quest][xY] ~="0" then --есл координаты игрока в текущем квесте не нулевые
					if TDGq[quest][objec_t][messageOsm2] ~= nil then
						SendChatMessage("*" .. TDGq[quest][objec_t][xY]["описание"][1], "OFFICER", nil, 1)
					else
						SendChatMessage("*" .. TDGq[quest][objec_t][xY][objec_t_name] .. " не существует", "OFFICER", nil, 1)
					end
				else
					SendChatMessage("*" .. nik .. ", попробуй зайти в мир, где создано хоть что нибудь.", "OFFICER", nil, 1)
				end
			else
				SendChatMessage("*" .. nik .. ", попробуй зайти в мир, где создано хоть что нибудь.", "OFFICER", nil, 1)
			end
		else
			SendChatMessage("*" .. nik .. ", для начала нужно зайти в любой мир: !старт квест [название квеста]", "OFFICER", nil, 1)
		end
	end
end

if message == "!показать текущий квест" then
	print (TDG[nik][att_Q])
end

local messageOsm=all_trim(message)
local messageOsm=mysplit(messageOsm)
local messageOsm1=messageOsm[1]
local messageOsm2=messageOsm[2]
local messageOsm3=messageOsm[3]
if string.find (message, "!удалить") and testHis~="*" then
	print ("1")
	if messageOsm2==nil then
		print ("2")
		SendChatMessage("*" .. sender .. ", укажи что удалять.", "OFFICER", nil, 1)
	else
		print ("3")
		if messageOsm2=="мир" then
			print ("4")
			if messageOsm3==nil then
				SendChatMessage("*" .. sender .. ", укажи какой мир ты хочешь удалить.", "OFFICER", nil, 1);
			else
				if TDGq[messageOsm3][creatore]~=sender then
				print ("5")
					SendChatMessage("*" .. sender .. ", в этом мире у тебя нет силы....", "OFFICER", nil, 1);
				else
					print ("8")
					if TDG[sender]["текущий_квест"]==messageOsm3 then
						TDG[sender]["текущий_квест"]="0"
					end
					print (TDGq[messageOsm3])
					TDGq[messageOsm3]=nil
					print ("удалено")
					print (TDGq[messageOsm3])
					SendChatMessage("*" .. sender .. ", мир " .. messageOsm3 .. " был удален", "OFFICER", nil, 1);

					print ("9")

				end
				print ("10")

			end

		else
			print ("11")
		end
		print ("12")
	end


end


end
)

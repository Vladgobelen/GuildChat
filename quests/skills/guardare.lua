function guardare(message,sender)
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
--переменные для блока !осмотреть
print("второй " .. message)
local messageOsm=all_trim(message)
local messageOsm=mysplit(messageOsm)
local messageOsm1=messageOsm[1]
local messageOsm2=messageOsm[2]
--конец блока переменных
if messageOsm[2]==nil then --если команда введена одним словом
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
elseif messageOsm[2]~=nil then --если к команде добавлен объекта
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
end

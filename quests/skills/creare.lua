function creare()
quest=TDG[nik][att_Q]

if TDGq[quest][creatore]==nik then
	strSoz = mysplit(message)
	objec_t_name=strSoz[3]
	if strSoz[2] == nil then
		SendChatMessage("*" .. nik .. ", сложно создать ничто, особенно если его нет...", "OFFICER", nil, 1)
	else
		if strSoz[2]=="объект" then
			if TDGq[quest][startLoc]==nil or TDGq[quest][startLoc] == "0" then
				TDGq[quest][objec_t][objec_t_name]={}
				TDGq[quest][objec_t][objec_t_name]["название"]=objec_t_name
				TDGq[quest][startLoc]=strSoz[3]
				TDGq[quest][objec_t][objec_t_name]["координаты"]=quest
				SendChatMessage("*" .. nik .. ", созданный объект " .. strSoz[3] .. " назначен стартовой локацией", "OFFICER", nil, 1)
				TDG[sender][quest][xY]=strSoz[2]
			else
				if TDGq[quest][objec_t][objec_t_name]~=nil then
					SendChatMessage("*" .. nik .. " " .. strSoz[3] .. " уже существует", "OFFICER", nil, 1)
				else
					TDGq[quest][objec_t][objec_t_name]={}
					TDGq[quest][objec_t][objec_t_name]["название"]=objec_t_name
					TDGq[quest][objec_t][objec_t_name]["координаты"]=TDG[sender][quest][xY]
					SendChatMessage("*" .. nik .. " " .. strSoz[3] .. " создано внутри " .. TDGq[quest][objec_t][objec_t_name]["координаты"], "OFFICER", nil, 1)
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
					if TDGq[quest][objec_t][objec_t_name]["описание"]==nil then
						TDGq[quest][objec_t][objec_t_name]["описание"]={}
						table.insert(TDGq[quest][objec_t][objec_t_name]["описание"], opisanie)
						SendChatMessage("*" .. nik .. ", описание добавлено.", "OFFICER", nil, 1)
					else
						table.insert(TDGq[quest][objec_t][objec_t_name]["описание"], opisanie)
						SendChatMessage("*" .. nik .. ", описание добавлено.", "OFFICER", nil, 1)
					end
				end
			end
		end




	end



else
	if string.find (message, "!создать") and testHis~="*"  then
		SendChatMessage("*" .. nik .. ", в этом мире у тебя нет силы....", "OFFICER", nil, 1);
	end
end
end


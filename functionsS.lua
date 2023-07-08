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

function all_trim(s)
	return s:match( "^%s*(.-)%s*$" )
end

function kirTest(b,n1)
test1=b:sub(n1,n1)
testN=b:byte(7)
testN=tonumber(testN)
if testN == 208 then
	r=b:sub(n1*2-1,n1*2)
else
	r=test1
end
return r
end

function alfabet (bookv)
shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	myB=string.find(shablon,bookv)
	return myB
end

function hashStr (nome)
	local i = time()
	i = i % 10000
	i=tostring(i)
	i=string.utf8sub(i,2,3)
	i=string.format("%03d", i)
	nomeLen=string.utf8len(nome)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(nome, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	iN=tostring(i)
	r1=string.utf8sub(iN, 1, 1)
	r2=string.utf8sub(hNome, 1, 1)
	r3=string.utf8sub(iN, 2, 2)
	r4=string.utf8sub(hNome, 2, 2)
	r5=string.utf8sub(iN, 3, 3)
	r6=string.utf8sub(hNome, 3, 3)
	r=r1 .. r2 .. r3 .. r4 .. r5 .. r6
	return r
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function lvlAgg (expPp, gExpN1, gLvl, gNik,strokaFn)
    local gExpNo = 2 ^ (gLvl + 2) - gExpN1   ---получаем количество оставшегося лвла на уровне
        rarExp=gExpN1
        rarLvl=gLvl
        rarExp=string.format("%03d",rarExp)
        for i = 1,expPp do               --прибавляем опыт по единичке
            gExpN1 = gExpN1 + 1     --единичку прибавили к опыту на уровне
            gExpNo = gExpNo - 1      -- от оставшегося опыта на уровне отнимаем единичку
            if gExpNo == 0 then       --если опыта на уровне не осталось, то
                gLvl = gLvl + 1  --прибавляем к лвлу единицу
                SendChatMessage("Поздравляем " .. gNik .. " c лвлапом!!!", "OFFICER", nil, 1)
                gExpNo = 2 ^ (gLvl + 2)            --оставшийся опыт назначаем равным 8
                gExpN1 = 0           --текущий опыт на уровне назначаем равным нулю
            else
            end

        end
        gExpN1Nuovo=string.format("%03d",gExpN1)
        SendChatMessage(rarLvl .. rarExp .. " >> " .. gLvl .. gExpN1Nuovo .." До лвлапа осталось: " .. gExpNo .. " опыта", "OFFICER", nil, 1)
        local strokaSplit = mysplit (strokaFn)
        if gLvl == 9 then
            SendChatMessage("Красочные спецэффекты вжу-вжу-пиу!фрррр! " .. gNik .. " получает доступ к квесту на получение офицерского звания", "OFFICER", nil, 1)
            gExpN1 = 0
        else
        end
        gildExpN13 = string.format("%03d",gExpN1)

        local denT = string.sub(strokaSplit[2], 1, 2)
        local qN = string.sub(strokaSplit[2], 3, 3)
        denn ={}
        denn=date("%d")
        qN = tonumber (qN)
        if denn ~= denT then
            strDen = denn .. 1
        else
            if qN < gLvl then
                qN = qN + 1
                strDen = denn .. qN
            else
                SendChatMessage(gNik .. ", следущий квест на твоем гильдлвле доступен завтра.", "OFFICER", nil, 1)
                strDen = denn .. qN
            end
        end
        return (gLvl .. gildExpN13 .. " " .. strDen .. " " .. strokaSplit[3])
    end
    function testNil (msg,count,str,f)
        for i=1, count do
                if msg[i] == nil then
                        table.insert(msg, i, str)
                end
        end
        if f ~= 0 then
                msg = (table.concat(msg, " "))
                msg = all_trim (msg)
        end
        return msg
    end

function hshStrNuovoServ(hshRarS,mioNomeS)
	if hshRarS ~= nil or hshRarS ~= "#q33" then
	local nomeLen
	local tmNome
	local nome11
	local hNome
	local hshMioNomeS1
	local hshMioNomeS2
	local hshMioNomeS3
	local qioS
	local hshRarS1
	local hshRarS2
	local hshRarS3
	local hshRarSMshRezult
	local hshMioNomeSRezult
	print (mioNomeS)
	if TDG[mioNomeS]["rarHSH"]==nil then
		TDG[mioNomeS]["rarHSH"]={}
	end
	if TDG[mioNomeS]["rarHSH1"]==nil then
		TDG[mioNomeS]["rarHSH1"]={}
	end

	testDateServ=date("%d")
	testDateServ=tonumber(testDateServ)
	if testDateServ % 2 == 0 then
		tableHSHserv="rarHSH"
		TDG[mioNomeS]["rarHSH1"]=nil
	else
		tableHSHserv="rarHSH1"
		TDG[mioNomeS]["rarHSH"]=nil
	end
	testTableHshLensServ=#TDG[mioNomeS][tableHSHserv]
	testTableHshLensServ=tonumber(testTableHshLensServ)
	if testTableHshLensServ~=0 then
		funCheatTest=0
		for funHSHservCount=1,#TDG[mioNomeS][tableHSHserv] do
			if hshRarS==TDG[mioNomeS][tableHSHserv][funHSHservCount] then
				funCheatTest=1
				break
			end

			funHSHservCount=funHSHservCount+1
		end
		if funCheatTest==0 then
			table.insert(TDG[mioNomeS][tableHSHserv],hshRarS)
		end
	else
		funCheatTest=0
		table.insert(TDG[mioNomeS][tableHSHserv],hshRarS)
	end
	if funCheatTest==0 then
		table.insert(TDG[mioNomeS][tableHSHserv], hshRarS)
		nomeLen=string.utf8len(mioNomeS)
		local nome1={}
		for startLen=1,nomeLen do
			nome1[startLen]=string.utf8sub(mioNomeS, startLen, startLen)
			tmNome=nome1[startLen]
			nome1[startLen]=alfabet(tmNome)
		end
		nome11=0
		for startLen=1,nomeLen do
			nome11=nome11+nome1[startLen]
		end
		nome11=nome11 % 1000
		hNomeS=string.format("%03d",nome11)
		hshMioNomeS1=string.sub(hNomeS,1,1)
		hshMioNomeS2=string.sub(hNomeS,2,2)
		hshMioNomeS3=string.sub(hNomeS,3,3)
		qioS=string.sub(hshRarS,2,2)
		qioS=tonumber(qioS)
		if qioS==0 then
			hshRarS1=string.sub(hshRarS, 3,3)
			hshRarS2=string.sub(hshRarS, 4,4)
			hshRarS3=string.sub(hshRarS, 6,6)
		elseif qioS==1 then
			hshRarS1=string.sub(hshRarS, 4,4)
			hshRarS2=string.sub(hshRarS, 3,3)
			hshRarS3=string.sub(hshRarS, 6,6)
		elseif qioS==2 then
			hshRarS1=string.sub(hshRarS, 4,4)
			hshRarS2=string.sub(hshRarS, 6,6)
			hshRarS3=string.sub(hshRarS, 3,3)
		elseif qioS==3 then
			hshRarS1=string.sub(hshRarS, 3,3)
			hshRarS2=string.sub(hshRarS, 6,6)
			hshRarS3=string.sub(hshRarS, 4,4)
		elseif qioS==4 then
			hshRarS1=string.sub(hshRarS, 1,1)
			hshRarS2=string.sub(hshRarS, 6,6)
			hshRarS3=string.sub(hshRarS, 4,4)
		elseif qioS==5 then
			hshRarS1=string.sub(hshRarS, 1,1)
			hshRarS2=string.sub(hshRarS, 6,6)
			hshRarS3=string.sub(hshRarS, 3,3)
		elseif qioS==6 then
			hshRarS1=string.sub(hshRarS, 6,6)
			hshRarS2=string.sub(hshRarS, 1,1)
			hshRarS3=string.sub(hshRarS, 3,3)
		elseif qioS==7 then
			hshRarS1=string.sub(hshRarS, 6,6)
			hshRarS2=string.sub(hshRarS, 3,3)
			hshRarS3=string.sub(hshRarS, 1,1)
		elseif qioS==8 then
			hshRarS1=string.sub(hshRarS, 4,4)
			hshRarS2=string.sub(hshRarS, 5,5)
			hshRarS3=string.sub(hshRarS, 6,6)
		elseif qioS==9 then
			hshRarS1=string.sub(hshRarS, 5,5)
			hshRarS2=string.sub(hshRarS, 1,1)
			hshRarS3=string.sub(hshRarS, 3,3)
		end
		hshRarSMshRezult=hshRarS1 .. hshRarS2 .. hshRarS3
		hshMioNomeSRezult=hshMioNomeS1 .. hshMioNomeS2 .. hshMioNomeS3
	else
		hshRarSMshRezult=1
		hshMioNomeSRezult=2
	end
	return hshRarSMshRezult, hshMioNomeSRezult
end
end


function hshSenderNomeServ(senderNomeServ)
	local nomeLen
	local nome1
	local nome11
	local hNome
	local hsSenderNomeServ1
	local hsSenderNomeServ2
	local hsSenderNomeServ3
	local hshSenderRServ1
	local hshSenderRServ2
	local hshSenderRServ3
	local hsSenderNomeRezult
	nomeLen=string.utf8len(senderNomeServ)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(senderNomeServ, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNomeServ=string.format("%03d",nome11)
	hsSenderNomeServ1=string.sub(hNomeServ,1,1)
	hsSenderNomeServ2=string.sub(hNomeServ,2,2)
	hsSenderNomeServ3=string.sub(hNomeServ,3,3)
	hshSenderRServ1 = math.random(0, 9)
	hshSenderRServ2 = math.random(0, 9)
	hshSenderRServ3 = math.random(0, 9)
	if hshSenderRServ2==0 then
	hsSenderNomeServRezult=hshSenderRServ1 .. hshSenderRServ2 .. hsSenderNomeServ1 .. hsSenderNomeServ2 .. hshSenderRServ3 .. hsSenderNomeServ3
	elseif hshSenderRServ2==1 then
		hsSenderNomeServRezult=hshSenderRServ1 .. hshSenderRServ2 .. hsSenderNomeServ2 .. hsSenderNomeServ1 .. hshSenderRServ3 .. hsSenderNomeServ3
	elseif hshSenderRServ2==2 then
		hsSenderNomeServRezult=hshSenderRServ1 .. hshSenderRServ2 .. hsSenderNomeServ3 .. hsSenderNomeServ1 .. hshSenderRServ3 .. hsSenderNomeServ2
	elseif hshSenderRServ2==3 then
		hsSenderNomeServRezult=hshSenderRServ1 .. hshSenderRServ2 .. hsSenderNomeServ1 .. hsSenderNomeServ3 .. hshSenderRServ3 .. hsSenderNomeServ2
	elseif hshSenderRServ2==4 then
		hsSenderNomeServRezult=hsSenderNomeServ1 .. hshSenderRServ2 .. hshSenderRServ1 .. hsSenderNomeServ3 .. hshSenderRServ3 .. hsSenderNomeServ2
	elseif hshSenderRServ2==5 then
		hsSenderNomeServRezult=hsSenderNomeServ1 .. hshSenderRServ2 .. hsSenderNomeServ3 .. hshSenderRServ1 .. hshSenderRServ3 .. hsSenderNomeServ2
	elseif hshSenderRServ2==6 then
		hsSenderNomeServRezult=hsSenderNomeServ2 .. hshSenderRServ2 .. hsSenderNomeServ3 .. hshSenderRServ1 .. hshSenderRServ3 .. hsSenderNomeServ1
	elseif hshSenderRServ2==7 then
		hsSenderNomeServRezult=hsSenderNomeServ3 .. hshSenderRServ2 .. hsSenderNomeServ2 .. hshSenderRServ3 .. hshSenderRServ1 .. hsSenderNomeServ1
	elseif hshSenderRServ2==8 then
		hsSenderNomeServRezult=hshSenderRServ1 .. hshSenderRServ2 .. hshSenderRServ3 .. hsSenderNomeServ1 .. hsSenderNomeServ2 .. hsSenderNomeServ3
	elseif hshSenderRServ2==8 then
		hsSenderNomeServRezult=hsSenderNomeServ1 .. hshSenderRServ2 .. hsSenderNomeServ3 .. hshSenderRServ1 .. hsSenderNomeServ2 .. hshSenderRServ3
	elseif hshSenderRServ2==9 then
		hsSenderNomeServRezult=hsSenderNomeServ2 .. hshSenderRServ2 .. hsSenderNomeServ3 .. hshSenderRServ1 .. hsSenderNomeServ1 .. hshSenderRServ3
	end
	return hsSenderNomeServRezult
end

function gmTest (gmTestNome)
	local gmTestRez
	for i=1,#gmList do
		if gmTestNome==gmList[i] then
			gmTestRez = "гм"
			break
		end
		i=i+1
	end
	return gmTestRez
end

function questLvl3_1(qLvl,nikSender)
	local countQ
	local ach
	countQ=tablelength(pQuests[qLvl][1])
	local chisloProstyhQComplit=0
	chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
	j=0
	k=0
	for testQ=1, countQ do
		local x = math.random(1, countQ)
		ach=pQuests[qLvl][1][x]
		if TDG[nikSender]["простые_квесты"][ach]~="9999" then
			SendAddonMessage("NSGadd", "#aan " .. nikSender .. " " .. ach, "guild")
			break
		else
			chisloProstyhQComplit=chisloProstyhQComplit + 1
			if chisloProstyhQComplit==countQ then
				TDG[nikSender]["третий_лвл_квестов_1"]="9999"
				SendAddonMessage("NSGadd", "#aap " .. nikSender, "guild")
			end
		end
	end
end

function questLvl3_2(qLvl,nikSender)
	local countQ
	local ach
	countQ=tablelength(pQuests[qLvl][2])
	local chisloProstyhQComplit=0
	chisloProstyhQComplit=tonumber(chisloProstyhQComplit)
	for testQ=1, countQ do
		local x = math.random(1, countQ)
		print (x)
		ach=pQuests[qLvl][2][x]
		if TDG[nikSender]["простые_квесты"][ach]~="1" then
			SendAddonMessage("NSGadd", "#aao " .. nikSender .. " " .. ach, "guild")
			break
		else
			chisloProstyhQComplit=chisloProstyhQComplit + 1
			if chisloProstyhQComplit==countQ then
				TDG[nikSender]["третий_лвл_квестов_2"]="9999"
				SendAddonMessage("NSGadd", "#aap " .. nikSender, "guild")
			end
		end
	end
end

function qLvl33(nik)
	local R
	local x
	local x1
	local x2
	local x3
	local nome1
	local nome2
	local nome3
	x = math.random(1, #eMot)
	x1 = math.random(1, #npcList)
	while true do
		x2 = math.random(1, #npcList)
		if x2 == x1  then
		else
			break
		end
	end
	while true do
		x3 = math.random(1, #npcList)
		if x3 == x1 or x3 == x2  then
		else
			break
		end
	end
	nome1 = npcList[x1]
	nome2 = npcList[x2]
	nome3 = npcList[x3]
	emoz = eMot[x]
	R = "#q33 " .. nik .. ", ".. emoz .. " " .. nome1 .. ", " .. nome2 .. ", " .. nome3
	return R
end

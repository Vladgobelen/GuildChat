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

function hshStrNuovoServ(hshRar,mioNome)
	nomeLen=string.utf8len(mioNome)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(mioNome, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	local hshMioNome1=string.sub(hNome,1,1)
	local hshMioNome2=string.sub(hNome,2,2)
	local hshMioNome3=string.sub(hNome,3,3)
	qio=string.sub(hshRar,2,2)
	if qio==0 then
		hshRar1=string.sub(hshRar, 3,3)
		hshRar2=string.sub(hshRar, 4,4)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qio==1 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 3,3)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qio==2 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qio==3 then
		hshRar1=string.sub(hshRar, 3,3)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 4,4)
	elseif qio==4 then
		hshRar1=string.sub(hshRar, 1,1)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 4,4)
	elseif qio==5 then
		hshRar1=string.sub(hshRar, 1,1)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qio==6 then
		hshRar1=string.sub(hshRar, 6,6)
		hshRar2=string.sub(hshRar, 1,1)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qio==7 then
		hshRar1=string.sub(hshRar, 6,6)
		hshRar2=string.sub(hshRar, 3,3)
		hshRar3=string.sub(hshRar, 1,1)
	elseif qio==8 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 5,5)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qio==9 then
		hshRar1=string.sub(hshRar, 5,5)
		hshRar2=string.sub(hshRar, 1,1)
		hshRar3=string.sub(hshRar, 3,3)
	end
	local hshRarMshRezult=hshRar1 .. hshRar2 .. hshRar3
	local hshMioNomeRezult=hshMioNome1 .. hshMioNome2 .. hshMioNome3
	return hshRarMshRezult, hshMioNomeRezult
end


function hshSenderNomeServ(senderNome)
	nomeLen=string.utf8len(senderNome)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(senderNome, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	local hsSenderNome1=string.sub(hNome,1,1)
	local hsSenderNome2=string.sub(hNome,2,2)
	local hsSenderNome3=string.sub(hNome,3,3)
	local hshSenderR1 = math.random(0, 9)
	local hshSenderR2 = math.random(0, 9)
	local hshSenderR3 = math.random(0, 9)
	local hsSenderNomeRezult
	if hshSenderR2==0 then
	hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome1 .. hsSenderNome2 .. hshSenderR3 .. hsSenderNome3
	elseif hshSenderR2==1 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome2 .. hsSenderNome1 .. hshSenderR3 .. hsSenderNome3
	elseif hshSenderR2==2 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome3 .. hsSenderNome1 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==3 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome1 .. hsSenderNome3 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==4 then
		hsSenderNomeRezult=hsSenderNome1 .. hshSenderR2 .. hshSenderR1 .. hsSenderNome3 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==5 then
		hsSenderNomeRezult=hsSenderNome1 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==6 then
		hsSenderNomeRezult=hsSenderNome2 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hshSenderR3 .. hsSenderNome1
	elseif hshSenderR2==7 then
		hsSenderNomeRezult=hsSenderNome3 .. hshSenderR2 .. hsSenderNome2 .. hshSenderR3 .. hshSenderR1 .. hsSenderNome1
	elseif hshSenderR2==8 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hshSenderR3 .. hsSenderNome1 .. hsSenderNome2 .. hsSenderNome3
	elseif hshSenderR2==8 then
		hsSenderNomeRezult=hsSenderNome1 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hsSenderNome2 .. hshSenderR3
	elseif hshSenderR2==9 then
		hsSenderNomeRezult=hsSenderNome2 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hsSenderNome1 .. hshSenderR3
	end
	return hsSenderNomeRezult
end

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
print (testN)
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
                print ("тест" .. gExpNo)
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

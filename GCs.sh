#!/bin/bash
rm -f /home/diver/Скрипты/scr/GC/0.png;
scrot -a 0,750,500,230 -q 100 /home/diver/Скрипты/scr/GC/0.png;
tesseract /home/diver/Скрипты/scr/GC/0.png /home/diver/Скрипты/mods/tesseract/rus.traineddata -l rus+eng;
cat /home/diver/Скрипты/mods/tesseract/rus.traineddata.txt |grep ВОЖДЬ | awk '{print $2}' |tr -d \[]: |awk -v RS="\0" '{print $NF}' > /home/diver/Скрипты/temp/GC/res;
echo " опыт или деньги?" >>/home/diver/Скрипты/temp/GC/res;
cat /home/diver/Скрипты/temp/GC/res | tr "\n" "," | rev | cut -c2- | rev | xclip -sel clip;
kdialog --msgbox "готово"
xdotool getmouselocation --shell | grep WINDOW | awk -F "=" '{print $2}' > /home/diver/Скрипты/temp/win;
i=$(cat /home/diver/Скрипты/temp/win);
xdotool windowfocus $i;

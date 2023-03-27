#!/bin/bash
rm -f /home/diver/Скрипты/scr/GC/0.png;
scrot -a 0,750,500,230 -q 100 /home/diver/Скрипты/scr/GC/0.png;
tesseract /home/diver/Скрипты/scr/GC/0.png /home/diver/Скрипты/mods/tesseract/rus.traineddata -l rus+eng;
cat /home/diver/Скрипты/mods/tesseract/rus.traineddata.txt |grep ВОЖДЬ | awk '{print $2}' |tr -d \[]: > /home/diver/Скрипты/temp/GC/res;
echo " простой или сложный?" >>/home/diver/Скрипты/temp/GC/res;
cat /home/diver/Скрипты/temp/GC/res | tr "\n" "," | rev | cut -c2- | rev | xclip -sel clip;

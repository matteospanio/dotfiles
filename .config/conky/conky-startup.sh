#!/usr/bin/sh
killall conky
sleep 5
conky -p 5 -c "/home/benny/.config/conky/Titus.conkyrc" &
conky -p 5 -c "/home/benny/.config/conky/conky_weather"

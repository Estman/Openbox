#!/bin/bash

#lemonbar feed
curwin(){
	xtitle 
}

battery() {
    batpercent=`acpi -b | awk '{print $4}' | sed 's/%//g' | sed 's/,//g'`
    chgstate=`acpi -b | awk '{print $3}' | sed 's/,//g'`
    if [ $chgstate == "Charging" ]
      then
        baticon=""
    elif [ $batpercent -le 5 ]
      then
        baticon=""
    elif [ $batpercent -gt 5 ] && [ $batpercent -le 25 ]
      then
        baticon=""
    elif [ $batpercent -gt 25 ] && [ $batpercent -le 50 ]
      then
        baticon=""
    elif [ $batpercent -gt 50 ] && [ $batpercent -le 75 ]
      then
        baticon=""
    elif [ $batpercent -gt 75 ]
      then
        baticon=""
    else
      baticon=""
    fi
echo "%{T2}$baticon %{T1}$batpercent %"
}

clock() {
    curtime=`date '+%I:%M'` 
    curdate=`date '+%d %b'`
    echo "%{A:/usr/bin/gsimplecal:}%{T2}  %{T1}$curdate%{A}  %{T2} %{T1}$curtime"
}

ircnotify() {
    if [ -a /tmp/dingnotify ]
      then
        echo "%{T2} "
    fi
}
volume() {
    curvol=`amixer get Master | grep "Mono: Playback" | awk '{print $4}' | sed 's/\[//g;s/\]//g;s/%//g'`
    ismute=`amixer get Master | grep "Mono: Playback" | awk '{print $6}' | sed 's/\[//g;s/\]//g;s/%//g'`

    if [ $curvol -lt 1 ] || [ "$ismute" = "off" ]
      then
        volicon=""
    elif [[ $curvol -gt 0 && $curvol -lt 10 ]]
      then
        volicon=""
    elif [[ $curvol -gt 9 && $curvol -lt 50 ]]
      then
        volicon=""
    else
        volicon="%{T2} "
    fi
    echo "%{T2} %{A3:"amixer -q sset Master 3%+":}%{A1:"amixer -q sset Master 3%-":}%{A2:"amixer -q sset Master toggle":}$volicon %{T1}$curvol % %{A}%{A}%{A}"
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 1))`; do line="${line} "; done
    line="${line} "
    for w in `seq $((cur + 2)) $tot`; do line="${line} "; done
    echo $line
}

netstatus() {
    curethstat=`cat /sys/class/net/enp0s25/operstate`
    curwifistat=`cat /sys/class/net/wls1/operstate`
    if [ "$curethstat" = "down" ] && [ "$curwifistat" = "down" ]	
      then
        echo "%{T2}"
      elif [ "$curethstat" = "up" ] && [ "$curwifistat" = "down" ]
        then
	  echo "%{T2}"
      elif [ "$curethstat" = "down" ] && [ "$curwifistat" = "up" ]
        then
	  echo "%{T2}"
      else
	echo "%{T2}  "
    fi
}

#mpd() {
#    nowplaying=`mpc | head -n 1`
#    if [[ "$nowplaying" != volume* ]]
#      then
#        echo "%{A1:"mpc toggle":}%{A2:"mpc stop":}%{A3:"mpc random":}%{A4:"mpc next":}%{A5:"mpc prev":}%{T2} %{T1}$nowplaying%{A}%{A}%{A}%{A}%{A}  "
#    fi
#}
# This loop will fill a buffer with our infos, and output it to stdout.

while :; do

    echo "%{B#DDecf0f1}%{F#2c2c2c}%{T2}%{l}    $(groups)    %{T1}$(curwin) %{r}%{F#2C2C2C}$(ircnotify) $(netstatus) $(volume)  $(battery)  $(clock)  "
    sleep .2

done

#!/bin/sh

while true; do

    DATE=`date +"%a %d %b - %I:%M%p"`

    RAM=`free -h | grep Mem | awk '{print $3}'`

    AUDIO=`amixer sget Master`
    AUDIO_DEVICE=`echo $AUDIO | awk -F"[][]" '/dB/ {print $6}'`
    if [ $AUDIO_DEVICE = "off" ]; then
        VOLUME="婢"
    else
        VOLUME_PERC=`echo $AUDIO | awk -F"[][]" '/dB/ {print $2}'`
        VOLUME=" $VOLUME_PERC"
    fi

    STATUS=" $VOLUME | ☰ $RAM |  $DATE "

    xsetroot -name "$STATUS"

    sleep 2s

done &

compton -b &

~/.fehbg &

exec /usr/local/bin/dwm

#!/bin/sh

state=`cat /sys/class/rfkill/rfkill0/state`
echo "[BPI] bt rfkill state is $state"

#if [ $state -eq 0 ]; then
        echo "[BPI] bluetooth poweroff now, start poweron"
        rfkill block bluetooth
        rfkill unblock bluetooth
        sleep 1
#fi

/usr/bin/hciattach /dev/ttyS1 bcm43xx 1500000 noflow -
#/usr/bin/hciattach /dev/ttyS1 bcm43xx 1500000 flow - b8:27:3b:bf:21:00

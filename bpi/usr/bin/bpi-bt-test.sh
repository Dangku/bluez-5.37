#!/bin/sh

LOOP=0
while true; do
        ret=`hcitool dev | grep hci0`
        if [ -n "${ret}" ]; then
                echo "[BPI] got hci0, next loop" > /dev/console
                break;
        else
                echo "[BPI][$LOOP] no hci0, continue" > /dev/console
                sleep 1
		let LOOP++
        fi
done

echo "[BPI] Reboot" > /dev/console
sync
shutdown -r 1

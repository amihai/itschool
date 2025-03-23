#!/bin/bash

script="hello.sh"
logfile="watchdog.log"

echo "Watchdog pornit la $(date)" >> "$logfile"

while true; do
    if ! pgrep -f "$script" > /dev/null; then
        echo "[$(date)] Procesul $script nu rulează! Încerc să-l repornesc..." | tee -a "$logfile"
        nohup ./"$script" > hello.log 2>&1 &
        
        if pgrep -f "$script" > /dev/null; then
            echo "[$(date)] Procesul $script a fost repornit cu succes." | tee -a "$logfile"
        else
            echo "[$(date)] Eșec la repornire! Verifică manual." | tee -a "$logfile"
        fi
    fi
    sleep 10
done


#!/bin/bash

DISK=$(df -h /|tail -1|awk '{print $5}' | sed 's/%//')
DATE=$(date)

echo "DATE: $DATE"
echo "DISK USAGE :$DISK"

if [ "$DISK" -ge 80 ]
then 
    echo "Mission ABOrt!!"
fi
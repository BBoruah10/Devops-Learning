#!/bin/bash

if [ "$#" -eq 0 ]
then
    PROCESSES="bash ssh docker"
else
    PROCESSES=$@
fi

LOG_DIR="../logs"
LOG_PATH="$LOG_DIR/process_health.log"

mkdir -p "$LOG_DIR"

DATE=$(date)

echo "-------------HEALTH CHECK: $DATE-----------------"

for p in $PROCESSES
do
  pgrep $p > /dev/null
  if [ $? -eq 0 ]
  then
      echo "Running"
      echo "Running" >> $LOG_PATH
  else
      echo "Not Running"
      echo "not running" >> $LOG_PATH
  fi
done     


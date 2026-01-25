#!/bin/bash

PROCESSES="bash ssh docker"

for p in PROCESSES
do
   pgrep "$p" > /dev/null

   if [ "$?" -eq 0 ]
   then
        echo "$p is Running"
   else
        echo "$p is not running"
   fi
done
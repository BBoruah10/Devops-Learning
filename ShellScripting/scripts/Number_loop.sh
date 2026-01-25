#!/bin/bash

FILENAME=/numLog.log
FILEPATH=../logs/$FILENAME

NUMBERS="1 2 3 4 5 6 7 8 9"

for i in NUMBERS
do
  echo i >> "$FILEPATH"
done

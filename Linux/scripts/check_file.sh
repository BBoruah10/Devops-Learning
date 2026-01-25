#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage:<File>"
    exit 1
fi

FILE=$1

if [ -f "$FILE" ]
then
    echo "$FILE exists"
else
    echo "$FILE does not exist"
fi
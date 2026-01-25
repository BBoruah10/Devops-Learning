#!/bin/bash

if [ "$#" -ne 2 ]
then
    echo "Usage:<num1><num2"
    exit 1
fi

num1=$1
num2=$2

if [ "$num1" -gt "$num2"]
then  
    echo "$num1 is greater than $num2"
else
    echo "$num1 is smaller than $num2"
fi

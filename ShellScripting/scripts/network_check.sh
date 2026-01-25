#!/bin/bash

ping -c 1 www.google.com > /dev/null

if [ "$?" -eq 0 ]
then 
    echo "Network Established"
else
    echo "Network is not established"
fi


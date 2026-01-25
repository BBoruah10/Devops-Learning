#!/bin/bash

DATE=$(date)

disk_usage(){
        df -h
}
running_containers(){
        docker ps
}
while true
do
        echo "------------Menu :$DATE--------------"
        echo "1.Show Disk Usage"
        echo "2.Show running containers"
        echo "3.Show running pods"
        echo "4.Exit"

        echo "Enter what u want:"
        read CHOICE

        if [ "$CHOICE" -eq 1 ]
        then
                disk=$(disk_usage)
                echo "Disk usage is: $disk"

        elif [ "$CHOICE" -eq 2 ]
        then
                containers=$(running_containers)
                        echo "Containers:"
                echo "$containers"

        elif [ "$CHOICE" -eq 3 ]
        then
                pods=$(kubectl get pods)
                echo "$pods"


        elif [ "$CHOICE" -eq 4 ]
        then
                echo "exiting...."
                break
        else
                echo "Select valid choice!"
        fi
done
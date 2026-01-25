#!/bin/bash

LOG_DIR="../logs"
LOG_PATH="$LOG_DIR/nginx_logs.log"

mkdir -p "$LOG_DIR"

docker ps --format "{{.Names}}" | grep -w nginx > /dev/null

if [ $? -eq 0 ]; then
    echo "$(date) - Nginx container is running" >> "$LOG_PATH"
else
    echo "$(date) - Nginx is not running" >> "$LOG_PATH"
    echo "$(date) - Starting nginx..." >> "$LOG_PATH"

    docker run -d --name nginx nginx > /dev/null

    if [ $? -eq 0 ]; then
        echo "$(date) - Nginx started successfully" >> "$LOG_PATH"
    else
        echo "$(date) - Failed to start nginx" >> "$LOG_PATH"
    fi
fi

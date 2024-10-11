#!/bin/bash

# Find the PID (Process ID) of the infinite.sh script
PID=$(ps aux | grep "[i]nfinite.sh" | awk '{print $2}')

# Check if PID exists and kill the process
if [ -n "$PID" ]; then
    kill -9 $PID
    echo "Killed process infinite.sh with PID: $PID"
else
    echo "infinite.sh is not running."
fi

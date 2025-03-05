#!/bin/bash

# Define the file containing the list of servers
SERVERS_FILE="servers.txt"
LOG_FILE="server_status.log"

# Function to check server health
check_server() {
    local server=$1
    echo "Checking server: $server" | tee -a $LOG_FILE
    
    # Check if server is reachable
    ping -c 2 $server &> /dev/null
    if [ $? -ne 0 ]; then
        echo "❌ $server is unreachable." | tee -a $LOG_FILE
        return
    fi
    
    # Get system uptime
    UPTIME=$(ssh $server "uptime -p" 2>/dev/null)
    echo "🔹 Uptime: $UPTIME" | tee -a $LOG_FILE
    
    # Get CPU Load
    CPU_LOAD=$(ssh $server "uptime | awk -F'load average:' '{ print \$2 }'" 2>/dev/null)
    echo "🔹 CPU Load: $CPU_LOAD" | tee -a $LOG_FILE
    
    # Get Disk Usage
    DISK_USAGE=$(ssh $server "df -h / | tail -1 | awk '{print \$5}'" 2>/dev/null)
    echo "🔹 Disk Usage: $DISK_USAGE" | tee -a $LOG_FILE
    
    echo "--------------------------------" | tee -a $LOG_FILE
}

# Read server list and check each server
if [ ! -f "$SERVERS_FILE" ]; then
    echo "Error: $SERVERS_FILE not found!" | tee -a $LOG_FILE
    exit 1
fi

while IFS= read -r server; do
    check_server "$server"
done < "$SERVERS_FILE"

echo "✅ Server checks completed! Logs saved in $LOG_FILE"

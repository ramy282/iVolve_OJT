#!/bin/bash

# Set the precentage of the threshold for disk usage 
threshold=1

email="ramyanwar282@gmail.com"

# Get the disk usage percentage
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

# Check if disk usage exceeds the threshold
if [ "$disk_usage" -gt "$threshold" ]; then
    # Compose email message
    subject="Disk Space Alert: Usage Exceeded Threshold"
    message="Disk space usage on server $(hostname) has exceeded the threshold. Current usage is $disk_usage%."

    # Send email alert
    echo "$message" | mail -s "$subject" "$email"
fi


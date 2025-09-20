#!/bin/bash

echo "===== CPU & Memory Usage ====="
# CPU
top -bn1 | grep "Cpu(s)"
# Memory
free -h
echo

echo "===== Disk Usage ====="
df -h
echo

echo "===== Log Monitoring (last 10 lines of /var/log/syslog) ====="
tail -n 10 /var/log/syslog 2>/dev/null || echo "Syslog not found"
echo

echo "===== Cleaning Log Files (/var/log/*.log) ====="
for file in /var/log/*.log; do
    [ -f "$file" ] && > "$file"
done
echo "All log files cleaned."
echo

echo "===== Script Completed ====="
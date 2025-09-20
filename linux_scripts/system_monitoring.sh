#CPU Utilization
echo "CPU & Memory Usage"
top -bn1 | grep "Cpu(s)"

# Memory
free -h

# Disk usage
echo "Disk Usage"
df -h


echo "Log Monitoring"
tail -n 10 /var/log/syslog 2>/dev/null || echo "Syslog not found"


echo "Cleaning Log Files"
find /var/log/ -name "*.log" -type f -mtime +30 -exec rm -f {} \;

echo "Script Completed "
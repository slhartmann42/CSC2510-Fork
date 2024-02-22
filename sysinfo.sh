#!/bin/bash
git checkout -b Lab06
mkdir -p system_info
cd system_info
touch system_info.txt
echo "System Info has been gathered. Here's the summary:" > system_info.txt
echo $(date +"Date and Time: %d/%m/%Y %I:%m:%S CST") >> system_info.txt
echo "User: $(whoami)" >> system_info.txt
echo "Current Working Directory: $(pwd)" >> system_info.txt
top -b -n 1 | head -n 5 >> system_info.txt
echo "Disk Usage:" >> system_info.txt
df -h >> system_info.txt
cat system_info.txt

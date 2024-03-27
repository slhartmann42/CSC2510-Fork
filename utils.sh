#!/bin/bash
echo "Finding files beginning with C:"
find /usr/bin -name 'c*' -print
echo "Finding files that contain sh:"
find /usr/bin -name '*sh*' -type l -print
echo "printing first 10 lines of usr hierarchy:"
find /usr | head -n 10
grep -h "model name" /proc/cpuinfo
echo "Lines not containing sudo in etc/group"
grep -v "sudo" /etc/group
echo "Lines containing sudo:"
grep -n "sudo" /etc/group
export LC_ALL=C
sort food
sort -r food
sort --key=2 food
sort -b -n --key=4 --key=3 food >> "calo"

#!/bin/bash


echo "--INFO-- Updating slaves file"

cat /dev/null > /mnt/raid/hadoop/etc/hadoop/slaves


cat slavesinput.txt >> /mnt/raid/hadoop/etc/hadoop/slaves

echo ""
echo "--INFO slaves file updated"

echo ""

echo "DONE" 

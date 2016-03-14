#!/bin/bash


echo "--INFO-- Updating slaves file"

cat /dev/null > /usr/local/hadoop/etc/hadoop/slaves


cat slavesinput.txt >> /usr/local/hadoop/etc/hadoop/slaves

echo ""
echo "--INFO slaves file updated"

echo ""

echo "DONE" 

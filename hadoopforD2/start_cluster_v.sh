#!/bin/bash


echo "--INFO-- Starting dfs script"
echo ""

/mnt/raid/hadoop/sbin/start-dfs.sh

echo "--INFO-- dfs script started"
echo ""

echo "--INFO-- Starting yarn script"
echo ""

/mnt/raid/hadoop/sbin/start-yarn.sh

echo "--INFO-- yarn script started"
echo ""

echo "--INFO-- Creating proper directory in hdfs"

echo "DONE"


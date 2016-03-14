#!/bin/bash



echo "--INFO-- Stopping yarn script"
echo ""

/mnt/raid/hadoop/sbin/stop-yarn.sh

echo "--INFO-- yarn script stopped"
echo ""

echo "--INFO-- Stopping dfs script"
echo ""

/mnt/raid/hadoop/sbin/stop-dfs.sh

echo "--INFO-- dfs script stopped"
echo ""

echo "DONE"


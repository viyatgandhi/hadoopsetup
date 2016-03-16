#!/bin/bash


echo "--INFO-- Updating current xmldata files with new master ip"

newmaster=`head -1 masterinput.txt`
oldmaster=`head -1 oldmaster.txt`

echo "--INFO new master is $newmaster"
echo "--INFO old master is $oldmaster"


`sed -i -- "s/$oldmaster/$newmaster/g" *xmldata.txt`


echo $newmaster > oldmaster.txt

echo ""
echo "--INFO-- xmldata files updated"
echo "--INFO-- Updating original xml files"


echo ""
echo "--INFO-- Updating core-site.xml"

cat /dev/null > /usr/local/hadoop/etc/hadoop/core-site.xml

cat coresitexmldata.txt >> /usr/local/hadoop/etc/hadoop/core-site.xml

echo ""
echo "--INFO core-site.xml updated"

echo ""
echo "--INFO-- Updating hdfs-site.xml"

cat /dev/null > /usr/local/hadoop/etc/hadoop/hdfs-site.xml

cat hdfssitexmldata.txt >> /usr/local/hadoop/etc/hadoop/hdfs-site.xml

echo ""
echo "--INFO hdfs-site.xml updated"

echo ""
echo "--INFO-- Updating yarn-site.xml"

cat /dev/null > /usr/local/hadoop/etc/hadoop/yarn-site.xml

cat yarnsitexmldata.txt >> /usr/local/hadoop/etc/hadoop/yarn-site.xml

echo ""
echo "--INFO yarn-site.xml updated"

echo ""
echo "--INFO-- Updating mapred-site.xml"

cp  /usr/local/hadoop/etc/hadoop/mapred-site.xml.template  /usr/local/hadoop/etc/hadoop/mapred-site.xml

cat /dev/null > /usr/local/hadoop/etc/hadoop/mapred-site.xml

cat mapredsitexmldata.txt >> /usr/local/hadoop/etc/hadoop/mapred-site.xml

echo ""
echo "--INFO mapred-site.xml updated"


echo ""
echo "DONE"
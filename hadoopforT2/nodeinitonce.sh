#!/bin/bash

echo "--INFO-- Script is used for deployment of hadoop cluster"
echo "--WARN-- Are you sure you want to continue ? [Y/N]"
read answer

if [ "$answer" == "N" ] || [ "$answer" != "Y" ]
then
echo "--INFO-- Exisiting..."
exit 0
fi

if [ "$answer" == "Y" ]
then
echo "--INFO-- procedding with deployment"
fi


# prepare directories we need
cd ~
mkdir -p ~/build
mkdir -p ~/work


cd ~/build

echo "--INFO-- Preparing terasort folder"
echo ""
wget "http://www.ordinal.com/try.cgi/gensort-linux-1.5.tar.gz"
tar -zxf gensort-linux-1.5.tar.gz
mv 64 terasort
rm gensort-linux-1.5.tar.gz
rm -r 32

echo "--INFO-- terasort folder is done"

echo ""
echo "--INFO-- Prearing hadoop folder"
wget "https://archive.apache.org/dist/hadoop/core/hadoop-2.7.2/hadoop-2.7.2.tar.gz"
tar -zxf hadoop-2.7.2.tar.gz
mv hadoop-2.7.2 hadoop
rm hadoop-2.7.2.tar.gz
sudo mv hadoop /usr/local/

echo "--INFO-- hadoop folder is ready in /usr/local"

echo ""
echo "--INFO-- Updating java"

sudo yum install java-devel

echo "--INFO-- java updated"


cd ~/hadoopsetup
echo ""
echo "--INFO-- updating bashrc file" 

cat basharcdata.txt >> ~/.bashrc

export CONF=/usr/local/hadoop/etc/hadoop
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.95.x86_64
export HADOOP_PREFIX=/usr/local/hadoop
export HADOOP_INSTALL=/usr/local/hadoop
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar

echo "--INFO-- bashrc file updated"

echo "--INFO-- PLEASE RELOAD bashrc file using command source ~/.bashrc before starting hadoop"

echo "--INFO-- After that fromat the name node using command hadoop namenode -format"

echo "--INFO-- Make sure pem file is added before starting hadoop cluster"

echo "DONE"



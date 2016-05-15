# hadoopsetup
Hadoop Setup Files and Initialization Script for AWS node

Script are used to setup Hadoop env on 16 nodes to run the hadoop expriement of Teragen

o run script prepareraid.sh - create raid0 mount in master

o run nodeinitonce.sh - update node, install gensort, install hadoop and java and update bashrc file

o run command to reload config parameters --> source ~/.bashrc

o edit runclusterscript.sh and copynewslave.sh with your pem file

o edit masterinput.txt with your master ip

o run updatexml.sh to update xml with new master ip and with other required parameter for xml in master

o Now create AMI of this master and start another 16 nodes from this saved image of master. (No reboot option checked)

o update slavesinput.txt with all the other slave ip

o run updateslaves.sh - update slaves in master

o runclusterscript.sh - transfer slave file to all slaves and do raid0 mount in each slave and start ssh agent

o run command to format namenode and it will create dfs of name node on /mnt/raid location --> hadoop namenode -format

o run start_cluster_v.sh to start the cluster

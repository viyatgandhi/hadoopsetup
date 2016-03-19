#!/bin/bash

user="ec2-user@"
folder=":/home/ec2-user"

for rec in `cat slavesinput.txt`

do

ip="$user$rec$folder"

#echo $ip

scp -i vCloud.pem slaves $ip

done

for rec in `cat slavesinput.txt`
do

ip="$user$rec"

echo ""
echo "Running raid script and copy slave file on slave $ip"
echo ""

ssh -i  vCloud.pem $ip '/home/ec2-user/hadoopsetup/hadoopforD2/prepareraid.sh'

ssh -i  vCloud.pem $ip '/home/ec2-user/hadoopsetup/hadoopforD2/copynewslave.sh'

done

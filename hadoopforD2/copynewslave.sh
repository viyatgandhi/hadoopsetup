#!/bin/bash

cd /home/ec2-user

cp /home/ec2-user/slaves /usr/local/hadoop/etc/hadoop/

eval `ssh-agent -s`

ssh-add krPA2Cloud.pem

echo "Copy done"

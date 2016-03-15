echo "--INFO-- Preparing RAID0 for hadoop installation"

echo "--INFO-- Creating raidext with /dev/md0 mount "

sudo mdadm --create --verbose /dev/md0 --level=0 --name=raidext --raid-devices=3 /dev/xvdb /dev/xvdc /dev/xvdd

echo "--INFO-- RAID0 created"
echo "--INFO-- formatting with ext4 file system"

sudo mkfs.ext4 -L raidext /dev/md0

echo "--INFO-- Creating mount point "
sudo mkdir -p /mnt/raid


echo "--INFO-- mounting the /dev/md0"
sudo mount LABEL=raidext /mnt/raid

echo "--INFO-- Giving proper rights to ec2-user to new mount point and directory"
sudo chown -R ec2-user:ec2-user /mnt/raid

mkdir /mnt/raid/tmp
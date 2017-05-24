#!/bin/bash

echo "Updating partitions..."
(echo t; echo 4; echo 8e; echo p; echo w) | fdisk /dev/sda
(echo n; echo p; echo 1; echo; echo; echo t; echo 8e; echo p; echo w) | fdisk /dev/sdb
(echo o; echo n; echo p; echo 1; echo; echo; echo t; echo 8e; echo p; echo w) | fdisk /dev/sdc
partprobe

echo "Creating logical volume..."
pvcreate /dev/sda4
pvcreate /dev/sdb1
#vgcreate vginstances /dev/sda4 /dev/sdb1
pvcreate /dev/sdc1
vgcreate vginstances /dev/sda4 /dev/sdb1 /dev/sdc1
lvcreate -L 2.0T -n lvinstances vginstances

echo "Formatting logical volume..."
mkfs.ext3 /dev/vginstances/lvinstances

echo "Mounting logical volume..."
mount /dev/vginstances/lvinstances /media
#rmdir /var/lib/nova/instances/lost+found
#cp -r /tmp/instances/* /var/lib/nova/instances/

echo "SUCCESS"

# Moving temp to media
mkdir /media/tmp
chmod 777 /media/tmp
rm -rf /tmp
ln -s /media/tmp /tmp

# Moving cache to media
mkdir /media/cache
chmod 777 /media/cache
rm -rf /users/raajay86/.cache
ln -s /media/cache /users/raajay86/.cache

# Move location of maven cache
mkdir -p /media/share/maven_repo
chown -R raajay86 /media/share
chmod 777 /media/share/maven_repo

mkdir -p /users/raajay86/.m2
rm -f /users/raajay86/.m2/settings.xml
mkdir -p /users/raajay86/.m2
ln -s /local/repository/scripts/mvn_settings.xml /users/raajay86/.m2/settings.xml
chown -R raajay86 /users/raajay86/.m2

# Create a dir for ivy cache
mkdir -p /media/share/ivy2_repo
chmod 777 /media/share/ivy2_repo

# Setup work environment
mkdir /media/raajay
chown -R raajay86 /media/raajay

echo "Successful set up simlinks for tmp files to newly created disk"

df -H > /users/raajay86/disk_settings.txt

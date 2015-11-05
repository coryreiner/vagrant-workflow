#!/bin/bash

#Bombs out on any error
set +e

#Shows you each command and the result
set +x

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" \
--force-yes -fuy dist-upgrade

sudo apt-get install redis-server -y
sudo apt-get install unison -y
sudo apt-get install curl -y
sudo apt-get install git-core -y
sudo apt-get install unzip -y
sudo apt-get install tmux -y
sudo apt-get install htop -y
sudo apt-get install sysstat -y
debconf-set-selections <<< 'mysql-server mysql-server/root_password password qqq111'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password qqq111'
sudo apt-get install mysql-server

#  * update and dist-upgrade to latest for all packages
#  * install ```redis-server``` and start it
#  * configure hostname to firstname-lastname substituting your first and last names
#  * set domain name to hack.local
#  * add 3 users, larry, moe, and curly -- disabled passwords for interactive login
#  * moe is a sysadmin, and should be able to sudo without a password
#  * larry is a system account, and should have a shell of /bin/false
#  * install ```nginx``` webserver and make it serve up the default web site
#  * set ```vim``` as the default editor for the system
#  * add the PPA for WebUpd8 team, and install the oracle version of java8
#  * install ntpd in a client mode
#  * install dnsmasq as a dns cache client, make sure it respects the hosts file
#  * configure system to use the dns cache
#  * add 3 entries to the hosts file
#    * 127.0.1.1 ironman
#    * 127.0.1.2 hawkeye
#    * 127.0.1.3 hulk
#  * make sure dns is configured with a default search domain of hack.local
#  * install mysql server with a root password of ```qqq111```
#  * install ufw with a default deny policy, allowing port 22/TCP from anywhere
#  * Set the system timezone to UTC
#  * write a list of the installed packages on the system to /root/inventory, file permissions 644
#  * create a cron job for the root user that runs the command ```touch /root/hi``` every minute
#  * Install the following packages
#    * unison
#    * curl
#    * git-core
#    * unzip
#    * tmux
#    * htop
#    * sysstat
#  * Create a 1GB sparse ext3 formatted block file and mount it via fstab to /mnt/VOL1, should mount on boot
#  * Create 3 1GB sparse block files, format them as physical volumes, add all to volume group named ```vg-awesome``` and create a logical volume using all space in group named ```lv-awesomer```, format as ext4, mounted on /mnt/VOL2 via fstab
#  * Create 2 1GB sparse block files, create a Linux software raid device, mirrored over the files at md0
#  * RAID device should be mounted automatically at /mnt/VOL3
#  * set ```nofile``` system limit (ulimit) to unlimited for the root user

touch /root/test

#!/bin/bash
# Copyright (c) 2019 Mats Estensen <matshes@stud.ntnu.no>
# Distributed under the MIT software license: https://opensource.org/licenses/MIT

# configuration variables
uid=1000                       # user id for user to get r/w permissions to mount
gid=1000                       # group id for user to get r/w permissions to mount
workdir=/tmp/hpc-work          # mount point for work dir (lustre share on idun)
homedir=/tmp/hpc-home          # mount point for home dir (home dir on idun)
server=idun-samba1.hpc.ntnu.no # samba server
ntnusubn='129.241'             # subnet for ntnu ip addresses

if [ -n "$1" -a ! "$1" = "-u" ]; then
    echo "Usage: `basename $0` [option]"
    echo
    echo 'Options:'
    echo "    -u,   unmount shares"
    echo
    echo Description:
    echo '     This script mounts the home and work directories from Idun to your computer.'
    echo '     To change permissions, mount points or samba server, please change the'
    echo '     configuration variables in the script.'
    echo 
    echo '     You need to be at NTNU campus or use VPN to mount the shares.'
    echo 
    echo 'More information about transferring files:'
    echo '     https://www.hpc.ntnu.no/display/hpc/Transferring+Data'
    exit
fi

# create mount points if they do not exist
if [ ! -d "$workdir" -a ! -d "$homedir" ]; then
    echo Mount point directories does not exist!
    mkdir $workdir
    mkdir $homedir
    echo Created dirs $workdir and $homedir...
fi

# check for root
if [ `whoami` != root ]; then
    echo Please run this script with sudo privileges!
    exit
fi

# unmount
if [ "$1" = "-u" ]; then
    echo "Unmounting work directory: $workdir"
    umount $workdir
    echo "Unmounting home directory: $homedir"
    umount $homedir
    exit
fi

# check for ntnu ip
myip=`curl -4 ifconfig.co -s`

if [ ! `echo $myip | grep $ntnusubn` ]; then
        echo "Error: Your IP address is currently not identified as NTNU-based"
        echo "You need to be at NTNU campus or use VPN to mount the shares."
        echo
        echo "Please try again after establishing a valid network connection. Exiting..."
        exit
fi

read -p "Enter your NTNU username: " user
read -s -p "Enter your NTNU password: " pw
echo

# mount
echo "Mounting work directory: $workdir"
mount.cifs "//$server/work" $workdir -w -o username=$user,domain=WIN-NTNU-NO,password=$pw,uid=$uid,gid=$gid
echo "Mounting home directory: $homedir"
mount.cifs "//$server/$user" $homedir -w -o username=$user,domain=WIN-NTNU-NO,password=$pw,uid=$uid,gid=$gid

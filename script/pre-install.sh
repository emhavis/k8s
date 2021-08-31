#! /bin/bash
#
# Parameters
# $1 ->> Hostname
clear
echo '----------------------------------------------------------------------------------'
echo 'This script will prepare your cloud server to enable kubernetes installation'
echo '1. apt update and upgrade'
echo '2. turn swap off permanently'
echo '3. install net tools'
echo "4. set hostname to $1"
echo '----------------------------------------------------------------------------------'
read -p "Please review the parameter and Press any key to continue or ctrl-C to cancel"
echo ""
echo ""
# Update the installation
sudo apt update && sudo apt upgrade
#
# turn off swap
sudo swapoff -a
#
#
# disable the file swap permanently
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
#
#
# install net tools
sudo apt install net-tools
#
# 
# rename hostname, you might need to input password
sudo hostnamectl set-hostname $1
hostname -F /etc/hostname
#
#

#!/bin/bash
  echo "==================================CREATE SWAP============================================\n"
if sudo swapon --show | grep -q '/dev/'; then
  echo "==========================you have swap have anice day!!!================================\n"
  exit 0
else
  echo "create swap file=========================================================================\n"
  cd /
  read -p "Enter memmory range: 1G 2G or 8G .... "  rangem
  echo $rangem
  sudo fallocate -l $rangem /swapfile
  sudo chmod 600 /swapfile
  echo "set up swap area to file=================================================================\n"
  sudo mkswap /swapfile
  echo "turn on swap=============================================================================\n"
  sudo swapon /swapfile
  echo "=========================================================================================\n"
  sudo free -h
  echo "how often the system will use the swap:" && cat /proc/sys/vm/swappiness
  echo "=========================================================================================\n"
  echo "change permanent open the /etc/fstab file and to add this line \n"
  echo "/swapfile swap swap defaults 0 0 \n"
  echo "or use this command :) lazy admin: echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab \n"
  echo "/etc/sysctl.conf To change how often the system will use the swap space you need to add \n"
  echo "this line to file /etc/sysctl.conf --->         vm.swappiness=10"
  echo "deactivate swap : sudo swapoff -v /swapfile    and remove swap file: sudo rm /swapfile"
fi
exit 0

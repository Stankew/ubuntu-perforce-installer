#!/bin/sh

distro=$(cat /etc/os-release | grep VERSION_CODENAME | awk -F= '{print $2}')
wget -qO - https://package.perforce.com/perforce.pubkey | sudo apt-key add -
echo "deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/ubuntu  $distro  release" > /etc/apt/sources.list.d/perforce.list
apt-get update
apt install helix-p4d -y
/opt/perforce/sbin/configure-helix-p4d.sh

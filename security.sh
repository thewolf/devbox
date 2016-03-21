#!/bin/sh
set -e
set -u

#enabling the automatic security updates:
sudo dpkg-reconfigure --priority=low unattended-upgrades

sudo apt-get install -y fail2ban

sudo apt-get update && sudo apt-get dist-upgrade -y && sudo reboot


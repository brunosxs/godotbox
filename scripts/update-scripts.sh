#!/bin/bash
#########################################
# Downloads and runs initial-setup.sh
# © 2016 BrunoSXS
# Licensed under MIT
#########################################
if [ ! -d "/home/ubuntu/scripts" ]; then
  mkdir $HOME/scripts
fi
# Install needed dependencies
sudo apt-get install git dialog unzip zip -y
echo "Checking for update of the main script..."
wget https://github.com/brunosxs/godotbox/raw/master/scripts/initial-setup.sh -O $HOME/scripts/initial-setup.sh
echo "making the script executable"
chmod 0755 $HOME/scripts/initial-setup.sh
echo "ALL SET, LET'S A GO!"

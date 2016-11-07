#!/bin/bash
#########################################
# Script to install all dependencies
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

# For now, with little to no error handling...


# Setting some variables
# If needed, just change the ndk version here:
android_ndk_version="android-ndk-r13b"
android_ndk_url="https://dl.google.com/android/repository/${android_ndk_version}-linux-x86_64.zip"
android_sdk_url="https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz"
openjdk_url="http://security.ubuntu.com/ubuntu/pool/main/o/openjdk-8/openjdk-8-jdk-headless_8u111-b14-2ubuntu0.16.04.2_amd64.deb"
now=$(date +"%T")
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
log_file=$HOME/godot/log.txt
##

# Make scripts executable
chmod 0755 $HOME/scripts/*.sh
# Include all the scripts

# Show the command to update and an important message!
dialog --title "Hello" --msgbox "You can download the latest version of this script by running 'update-scripts.sh'. Don't run this script in your host machine!" 0 0
# Don't forget the licenses!
dialog --title "Hey listen!" --yesno "Do you agree with the licenses of all the softwares being used? In doubt, say no and check the README" 0 0
#If the user doesn't agree... better not use it
if (($? == 1));
then
  clear
  echo "execute 'initial-setup.sh' to run this again"
  exit 1;
fi
  clear
  echo "OK, Let's go!"
  # Remove both folders and its contents
  echo "$now - Cleaning folders in home " >> $log_file

  dialog --title "Hey listen!" --yesno "Gonna clear any *jdk*.deb files in /Downloads and the entire Android folder so we can start the process clean, Ok?" 0 0

  if (($? == 0));
  then
    echo "Removing files"
    sudo rm -R "$HOME/Downloads/*jdk*.deb" "$HOME/Android" -f
fi
  sudo apt-get update
  # Getting the required tools to build Godot and its templates on linux
  if ! sudo apt-get install build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libfreetype6-dev libssl-dev libudev-dev libxrandr-dev -y;
  then
    # Error with the initial packages
    echo "$now - $? " >> $log_file
    exit 1
  else
    echo "$now - Installed initial dependencies " >> $log_file
    echo "$now - Starting the menu " >> $log_file
    source $DIR/main-menu.sh
  fi

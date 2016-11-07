#!/bin/bash
if [$DIR =""]
then
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi
#########################################
# Android related tools
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

# For now, with little to no error handling...
if [ $android_ndk_version = "" ]; then
source $DIR/initial-setup.sh
return 1
fi

# Cleaning the Android folder
mkdir $HOME/Android
# Java
source $DIR/install-openjdk.sh

#Android related stuff

if ! sudo apt-get install adb -y;
then
  exit "Error downloading or installing adb"
fi
#Get android NDK
mkdir $HOME/Android
if ! wget ${android_ndk_url} -O ~/Android/android-ndk.zip;
then
  exit "Problem downloading android-ndk... check internet connection"
 fi

if ! unzip ~/Android/android-ndk.zip -d ~/Android && mv -R ~/Android/android-ndk/$android_ndk_version/* ~/Android/android-ndk/;
then
  echo "Problem extracting android-ndk. Corrupted download? Try starting the script again by running 'initial-setup.sh'"
  exit 1
fi
#Android SDK
if ! wget ${android_sdk_url} -O ~/Android/android-sdk.tgz;
then
  echo "Problem downloading android-sdk... check internet connection"
  exit 1
fi
if ! tar -zxvf ~/Android/android-sdk.tgz -C ~/Android --skip-old-files;
then
  echo "Problem extracting android-ndk. Corrupted download? Try starting the script again by running 'initial-setup.sh'"
  exit 1
 fi
#Download the needed SDK tools
    if ! $ANDROID_HOME/tools/android update sdk --no-ui --filter 1,2,3,170,128;
then
  echo "Problem downloading or installing the sdk APIs run 'initial-setup.sh'to try again"
  exit 1
  fi
# Downloading dependencies
sudo apt-get -f install
echo "Looks like everything went fine!"
echo "Removing uneeded files..."
rm ~/Android/*.zip ~/Android/*.tgz

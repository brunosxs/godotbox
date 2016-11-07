#!/bin/bash
#########################################
# HTML5 install build dependencies script
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

# For now, with little to no error handling...
if [$DIR =""]
then
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi
#installing dependencies
sudo apt-get install nodejs -y
sudo apt-get -f install

if ! wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz -O $HOME/emsdk-portable.tar.gz
then
  echo $?
  echo "$now - Problem extracting emsdk" >> $log_file
  exit 1
  fi
# Downloading dependencies
if ! tar -zxvf $HOME/emsdk-portable.tar.gz -C $HOME --skip-old-files;
then
  echo "$now - $?" >> $log_file
  echo $?
  exit 1
fi
cd $HOME/emsdk_portable
echo "$now - updating emsdk install script" >> $log_file
if ! ./emsdk update
then
  echo "$now - Problem updating emsdk" >> $log_file
  exit 1
echo "$now - Installing emsdk" >> $log_file
if ! ./emsdk install latest
then
  echo "$now - Problem extracting emsdk" >> $log_file
  exit 1
fi
echo "$now - Activating emsdk" >> $log_file
if ! ./emsdk activate latest
then
  echo "$now - Problem activating emsdk" >> $log_file
  exit 1
fi
echo "Looks like everything went fine!"
echo "Removing uneeded files..."
echo "$now - Removing compacted files" >> $log_file
# rm $HOME/emsdk-portable.tar.gz

#!/bin/bash
#########################################
# windows install build dependencies script
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

# For now, with little to no error handling...
if [$DIR =""]
then
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi


echo "$now - Installing mignw-w64" >> $log_file
if ! sudo apt-get install mingw-w64 -y
then
  echo "$now - $? " >> $log_file
else
  echo "$now - Success" >> $log_file
fi

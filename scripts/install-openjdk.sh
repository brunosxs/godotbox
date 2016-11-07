#!/bin/bash
#########################################
# Install openjdk-8-headless
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

# Check if openjdk is installed
if ! $( source ./utils/check-openjdk.sh )
then

  if ! sudo apt-get install openjdk-8-jdk-headless -y;
    then
    # Try to download a deb package and install by itself
    echo "Something went wrong with the java installation from ubuntu repositories, gonna try through a direct link"
    if [ ! -d "$HOME/Downloads" ]; then
      mkdir "$HOME/Downloads"
    fi
    if ! wget -N ${openjdk_url} -O "$HOME/Downloads/openjdk-8-headless.deb";
    then
      echo "Error downloading openjdk"
      exit 1
    fi

    if ! sudo dpkg -i "$HOME/Downloads/openjdk-8-headless.deb";
    then
      echo "Error installing openjdk"
      exit 1
    else
      rm openjdk-8-headless.deb
    fi

  fi
else
  echo "openjdk already installed. Skipping..."
  fi

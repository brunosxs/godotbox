#!/bin/bash
#########################################
# godotbox
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

##
# Removes files generated while developing the VM
#
#
#

dialog --title "Hey listen!" --yesno "This will delete all files and folders and make the VM back to its initial state. It is mostly used to clean up things before building a new image. You'll be presented with a menu to select what to clean. Continue?" 0 0
#If the user doesn't agree... better not use it
if (($? == 1));
then
  clear
  echo "Nothing was done"
  exit 1;
fi
CHOICES=$(dialog --stdout --checklist 'What to clean?' \
       0 0 0 apt-get 'Cleans apt-get cache' on \
             bash 'Removes bash history files' off \
             optimize-image 'Only usefull if you plan to redistribute the image.' off \
             home 'Cleans the home folder by removing Downloads, and Android folder' off \
             dummy 'Just for testing purposes' on )

echo "$CHOICES"
if [[ "$CHOICES" =~ apt-get ]];
then
  echo "Cleaning apt packages"
  sudo apt-get clean
fi
if [[ "$CHOICES" =~ bash ]];
  then
    echo "Removing bas_history and history"
    cat /dev/null > ~/.bash_history && history -c && exit
fi
if [[ "$CHOICES" =~ home ]];
  then

  echo "Removing files..."
  sudo rm -R $HOME/Downloads $HOME/Android $HOME/godot/* -f
  #Restoring bashrc
  cp /etc/skel/.bashrc ~/
fi

if [[ "$CHOICES" =~ dummy ]];
  then

  echo "TEST OK!"
fi

  if [[ "$CHOICES" =~ optimize-image ]];
    then
      echo "Optimizing the image..."
      sudo dd if=/dev/zero of=/EMPTY bs=1M
      sudo rm -f /EMPTY
  fi

# echo "Removing folders"|
# # sudo rm -R $HOME/Downloads $HOME/Android $HOME/godot/* -f
# sudo apt-get clean
# echo "Optimizing image size..."
# sudo dd if=/dev/zero of=/EMPTY bs=1M
# sudo rm -f /EMPTY
# echo "Removing bas_history and history"
# cat /dev/null > ~/.bash_history && history -c && exit
# echo

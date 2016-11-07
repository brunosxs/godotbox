#!/bin/bash
#########################################
# godotbox
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

##
# Generates a menu to grab different versions of godot sources
# Optionaly, it can grab modules
#
#
GODOT_REPO="https://github.com/godotengine/godot.git"
CHOICE=$(dialog --stdout --menu 'Select a godot version' \
       0 0 0 1 '2.1 Stable' \
             2 '2.0.4.1 Stable' \
             3 'Latest from master branch(not recomended)')

sudo rm -R -f ~/godot/godot-source
case $CHOICE in
  1)  git clone $GODOT_REPO ~/godot/godot-source
      cd ~/godot/godot-source
      git checkout c5e2c83dcd6f3e1be295149c2b2e3d048dbab4c5
    ;;
  2)  git clone $GODOT_REPO ~/godot/godot-source
      cd ~/godot/godot-source
      git checkout 820dd1d0016763cda6177104e66e09c8634150be
    ;;
  3)  git clone $GODOT_REPO ~/godot/godot-source

  esac

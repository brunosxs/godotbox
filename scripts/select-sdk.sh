#!/bin/bash
#########################################
# Script to grab the android sdk tools and create a list for the user to get
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

# For now, with little to no error handling...

# Check if a parameter was passed
#to do

## Creating the menu to select which platforms to download
CHOICES=$(dialog --stdout --checklist 'Select other APIs you wish to install(Godot exported games only work with android 4.0(API 14) and newer)' \
       0 0 3 131 'Google APIs, Android API 21, revision 1' on \
             132 'Google APIs, Android API 19, revision 20' off \
             138 "Google APIs, Android API 14, revision 2" off)

#Call android cli to download the selected options
c=${CHOICES// /,}
$ANDROID_HOME/tools/android update sdk --no-ui --filter ${c}

exit 0

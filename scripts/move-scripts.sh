#!/bin/bash
#########################################
# godotbox
# © 2016 BrunoSXS
# Licensed under MIT
#########################################

##
# This script copies the content of a folder called scripts inside the shared folder of the vm, to the scripts folder
#Todo:
#Create optional argument to add those to $PATH or make their own variable
#

/bin/cp -rf /vagrant/scripts/ ~/
chmod 0755 $HOME/scripts/*
echo "Scripts updated from the host machine."

#BUILD SCRIPTS

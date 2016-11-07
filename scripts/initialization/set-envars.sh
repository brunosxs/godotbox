#!/bin/bash
#########################################
# godotbox
# © 2016 BrunoSXS
# Licensed under MIT
#########################################
##
# This script just sets some enviroment variables and adds the important ones to .bashrc so they'll be
# automatically available on subsequent boots...
# As such, it should not run more than one time during a install or you could have duplicate vars in your .bashrc file.

echo "Setting enviroment variables..."
echo $HOME
bashrc_file=$HOME/.bashrc
android_ndk_version="android-ndk-r13b"
android_ndk_url="https://dl.google.com/android/repository/${android_ndk_version}.zip"
android_ndk_path="~/Android/android-ndk"
android_sdk_path="~/Android/android-sdk-linux"
openjdk_path="/usr/lib/jvm/java-8-openjdk-amd64"
ANDROID_HOME=$android_sdk_path
ANDROID_NDK_ROOT=$android_ndk_path
JAVA_HOME=$openjdk_path
EMSCRIPTEN_ROOT=$HOME/emsdk_portable

# Writing the envars to bashrc
echo "export ANDROID_HOME=${android_sdk_path}" >> $bashrc_file
echo "export ANDROID_NDK_ROOT=${android_ndk_path}" >> $bashrc_file
echo "export JAVA_HOME=${openjdk_path}" >> $bashrc_file
echo "export PATH=\$PATH:JAVA_HOME=\$JAVA_HOME/bin:\$ANDROID_HOME/tools:$HOME/scripts"  >> $bashrc_file

#HTML5 exporter related tools
echo "export EMSCRIPTEN_ROOT=$HOME/emsdk_portable" >> $bashrc_file

echo "Done!"

# Reloading .bashrc
bash
#BUILD SCRIPTS

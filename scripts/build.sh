#!/bin/bash
cd $HOME/godot/godot-source
scons platform=windows tools=no target=release bits=32

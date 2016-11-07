A vagrant box for ~~close to~~ painless godot development

## What is godotbox?

A vm based-off the official ubuntu/xenial64 box, dedicated to compile godot from source, including export templates for multiple platforms.

It has a collection of scripts to fetch the source code, download dependencies and do most of the heavy-lift for you.


## Get it running:

* Install [Vagrant](https://www.vagrantup.com/downloads.html)
* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Clone this repository
* Go to the project's root
* Do `vagrant up`

##   Todo
* Script to fetch usefull godot modules to compile with the source of the engine.
* Lots of things and testing
* Upload the final version to vagrantcloud so it will be even simpler to create one.
* Create a docker provider(my original intention, postponed as it would make this linux only)

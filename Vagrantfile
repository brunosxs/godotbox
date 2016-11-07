# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian/jessie64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "godotbox"
  config.vm.synced_folder "./data", "/home/ubuntu/godot", :mount_options => ["dmode=777", "fmode=666"]
  config.vm.provision "shell", path: "scripts/initialization/set-envars.sh", privileged: false, keep_color: true
  config.vm.provision "shell", path: "scripts/move-scripts.sh", privileged: false, keep_color: true
  config.vm.provision "shell", path: "scripts/update-scripts.sh", privileged: false, keep_color: true


# VBox specific:
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
     vb.gui = false
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "2048"
   end


end

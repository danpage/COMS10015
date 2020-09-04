#!/bin/bash

# Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
#
# Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
# which can be found via http://creativecommons.org (and should be included as 
# LICENSE.txt within the associated archive or repository).

# package manager: update
sudo apt-get --quiet --assume-yes update
sudo apt-get --quiet --assume-yes upgrade
        
# software install: packaged software
sudo apt-get --quiet --assume-yes install gcc 
sudo apt-get --quiet --assume-yes install git
sudo apt-get --quiet --assume-yes install git-lfs
sudo apt-get --quiet --assume-yes install linux-image-extra-virtual
sudo apt-get --quiet --assume-yes install make
sudo apt-get --quiet --assume-yes install wget
sudo apt-get --quiet --assume-yes install xauth

# system configuration: group membership
sudo usermod --append --groups vboxsf  vagrant
sudo usermod --append --groups dialout vagrant
sudo usermod --append --groups plugdev vagrant

# system configuration: file system structure
sudo mkdir --parents /opt/software

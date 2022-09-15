#!/bin/bash

# Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
#
# Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
# which can be found via http://creativecommons.org (and should be included as 
# LICENSE.txt within the associated archive or repository).

# package manager: update
sudo apt --quiet --assume-yes update
sudo apt --quiet --assume-yes upgrade
        
# software install: packaged software
sudo apt --quiet --assume-yes install gcc 
sudo apt --quiet --assume-yes install git
sudo apt --quiet --assume-yes install git-lfs
sudo apt --quiet --assume-yes install linux-image-extra-virtual
sudo apt --quiet --assume-yes install make
sudo apt --quiet --assume-yes install ntp
sudo apt --quiet --assume-yes install wget
sudo apt --quiet --assume-yes install xauth

# system configuration: group membership
sudo usermod --append --groups vboxsf  vagrant
sudo usermod --append --groups dialout vagrant
sudo usermod --append --groups plugdev vagrant

# system configuration: ntp
sudo systemctl enable  ntp 
sudo systemctl restart ntp

# system configuration: file system structure
sudo mkdir --parents /opt/software

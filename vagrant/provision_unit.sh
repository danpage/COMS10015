#!/bin/bash

# Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
#
# Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
# which can be found via http://creativecommons.org (and should be included as 
# LICENSE.txt within the associated archive or repository).

# software install: packaged software
sudo dnf --assumeyes install java

# software install:   Logisim
wget --quiet --output-document="logisim-generic-2.7.1.jar" https://sourceforge.net/projects/circuit/files/2.7.x/2.7.1/logisim-generic-2.7.1.jar
sudo install -D --target-directory="/opt/logisim/2.7.1" ./logisim-generic-2.7.1.jar  
rm --force ./logisim-generic-2.7.1.jar

# software install: ModuleSim
wget --quiet --output-document="modulesim-0.4.jar" http://github.com/TeachingTechnologistBeth/ModuleSim/releases/download/0.4/ModuleSim.jar
sudo install -D --target-directory="/opt/modulesim" ./modulesim-0.4.jar
rm --force ./modulesim-0.4.jar

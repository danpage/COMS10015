#!/bin/bash

# Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
#
# Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
# which can be found via http://creativecommons.org (and should be included as 
# LICENSE.txt within the associated archive or repository).

# software install: packaged software
sudo apt-get --quiet --assume-yes install default-jre 
sudo apt-get --quiet --assume-yes install openjfx

# software install: Logisim
wget --quiet --output-document="logisim-generic-2.7.1.jar" https://sourceforge.net/projects/circuit/files/2.7.x/2.7.1/logisim-generic-2.7.1.jar
sudo install -D --target-directory=/opt/logisim logisim-generic-2.7.1.jar  
rm --force logisim-generic-2.7.1.jar

# software install: VisUAL
wget --quiet --output-document="visual_1.27-1_amd64.deb" http://bit.ly/visuallinux_127_amd64
sudo dpkg-deb -x visual_1.27-1_amd64.deb /opt/software/visual
rm --force visual_1.27-1_amd64.deb

# software install: ModuleSim
wget --quiet --output-document="modulesim-0.4.jar" http://github.com/TeachingTechnologistBeth/ModuleSim/releases/download/0.4/ModuleSim.jar
sudo install -D --target-directory=/opt/modulesim modulesim-0.4.jar
rm --force modulesim-0.4.jar

sudo mv /opt/software/visual/usr/local/bin/visual /opt/software/visual/bin
sudo mv /opt/software/visual/usr/share            /opt/software/visual/share
sudo rm --force --recursive /opt/software/visual/usr

# teaching material: download
for SHEET in 1 2 3 4 5 ; do
  wget --quiet --directory-prefix /home/vagrant/${UNIT_CODE} http://assets.phoo.org/${UNIT_PATH}/csdsp/sheet/lab-${SHEET}_q.pdf
  wget --quiet --directory-prefix /home/vagrant/${UNIT_CODE} http://assets.phoo.org/${UNIT_PATH}/csdsp/sheet/lab-${SHEET}_q.tar.gz
done

# teaching material: unarchive 
for SHEET in 1 2 3 4 5 ; do
  tar --extract --gunzip --directory /home/vagrant/${UNIT_CODE} --file /home/vagrant/${UNIT_CODE}/lab-${SHEET}_q.tar.gz
done
    
# teaching material: permissions
sudo chown --recursive vagrant:vagrant /home/vagrant/${UNIT_CODE}

#!/bin/bash
set -e

# PX4 Clone
git clone https://github.com/PX4/PX4-Autopilot.git --recursive


#uXRCE
cd ~
git clone -b v2.4.3 https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig /usr/local/lib/

# Build PX4
cd PX4-Autopilot
make px4_sitl gz_x500_gimbal

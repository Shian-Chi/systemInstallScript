#!/bin/bash
set -e

# 一開始就請求 sudo 權限，並在背景保持授權狀態
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# PX4 Clone
git clone https://github.com/PX4/PX4-Autopilot.git --recursive


# uXRCE
cd ~
git clone -b v2.4.3 https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig /usr/local/lib/

# 安裝 PX4 依賴工具
# PX4 官方提供的 ubuntu.sh 腳本會幫你裝齊所有編譯所需的套件
cd ~/PX4-Autopilot/Tools/setup
bash ubuntu.sh

# Build PX4
cd ~/PX4-Autopilot
# [優化] 第一次編譯建議先編入所有相關模組
make px4_sitl gz_x500_gimbal

#!/bin/bash
set -e

# 更新系統並安裝基礎工具
sudo apt update && sudo apt upgrade -y 
sudo apt install -y git vim terminator python3-pip software-properties-common 
pip3 install pipenv

# 清理可能存在的舊驅動 
sudo apt autoremove --purge nvidia-* -y

# 安裝 NVIDIA 驅動 
sudo ubuntu-drivers install 

# 切換至 NVIDIA 顯卡模式 
sudo prime-select nvidia 

# 更新開機設置
sudo update-initramfs -u

echo "安裝完成，請重新啟動電腦以套用變更。"

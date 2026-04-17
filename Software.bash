#!/bin/bash
set -e

# 安裝基礎工具
sudo apt update
sudo apt install -y vlc wget curl

# 安裝網路工具
sudo apt install gnome-nettool

# 下載 VS Code (加上 -L 處理重導向)
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o vscode.deb

# 下載 Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb

# 使用 apt 安裝本地 deb (會自動處理依賴問題)
sudo dpkg -i ./vscode.deb ./chrome.deb

# 清理下載的安裝包
rm vscode.deb chrome.deb

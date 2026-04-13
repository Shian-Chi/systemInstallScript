sudo apt install vlc wget

wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O vscode.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb

sudo dpkg -i vscode.deb chrome.deb

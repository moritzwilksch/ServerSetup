#!/bin/sh
sudo apt-get install update
sudo apt-get install htop git zsh wget make
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
sudo chmod +x Miniforge3-Linux-x86_64.sh
./Miniforge3-Linux-x86_64.sh

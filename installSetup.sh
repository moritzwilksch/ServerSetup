#!/bin/sh

# General systems update
sudo apt-get install update

# Install needed software
sudo apt-get install htop git zsh wget make

# Setup zshell and oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo chsh -s /usr/bin/zsh $USER

# Install miniconda
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
sudo chmod +x Miniforge3-Linux-x86_64.sh
./Miniforge3-Linux-x86_64.sh

source miniforge3/bin/activate
conda init zsh

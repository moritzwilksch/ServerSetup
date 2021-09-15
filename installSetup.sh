#!/bin/sh
sudo apt-get install update
sudo apt-get install htop git zsh wget make
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

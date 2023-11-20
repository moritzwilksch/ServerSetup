#!/bin/bash


packages=("git" "htop" "zsh" "wget" "make" "tmux" "util-linux-user")


# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if yum is available
if command_exists yum; then
  echo "Using yum to install packages"
  sudo yum install -y "${packages[@]}"
# Check if apt is available
elif command_exists apt; then
  echo "Using apt to install packages"
  sudo apt-get update
  sudo apt-get install -y "${packages[@]}"
else
  echo "Error: Neither yum nor apt package manager found."
  exit 1
fi

# Setup Zsh and Oh-My-Zsh
echo "Setting up Zsh and Oh-My-Zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo chsh -s /usr/bin/zsh $USER


# Install micromamba
echo "Installing micromamba"
/usr/bin/zsh <(curl -L micro.mamba.pm/install.sh)
source ~/.zshrc

# create mambarc
wget -P ~/ https://github.com/moritzwilksch/dotfiles/raw/main/.mambarc

# Download dotfiles
echo "Downloading dotfiles"
wget -P ~/ https://raw.githubusercontent.com/moritzwilksch/dotfiles/main/.tmux.conf


# Define aliases
echo "Defining aliases"
echo "alias ll='ls -al'" >> ~/.zshrc
echo "alias la='ls -al'" >> ~/.zshrc
echo "alias mm='micromamba'" >> ~/.zshrc
echo "alias ipy='ipython'" >> ~/.zshrc
echo "alias ipyi='ipython -i'" >> ~/.zshrc
source ~/.zshrc

#!/bin/bash

packages=("git" "htop" "zsh" "wget" "curl" "make" "tmux" "fish" "ripgrep" "fzf" "gcc")

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to check if sudo is available
sudo_exists() {
  command -v "sudo" >/dev/null 2>&1
}

# Use sudo if available
if sudo_exists; then
  SUDO="sudo"
else
  SUDO=""
fi

# Check if yum is available
if command_exists yum; then
  echo "Using yum to install packages"
  $SUDO yum install -y "${packages[@]}"
# Check if apt is available
elif command_exists apt; then
  echo "Using apt to install packages"
  $SUDO apt-add-repository ppa:fish-shell/release-3
  $SUDO apt-get update
  $SUDO apt-get install -y "${packages[@]}"
else
  echo "Error: Neither yum nor apt package manager found."
  exit 1
fi

# Setup Zsh and Oh-My-Zsh
# install nvim
echo "Setting up Zsh and Oh-My-Zsh"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo chsh -s /usr/bin/zsh $USER

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz && sudo mv nvim-linux64/bin/nvim /usr/bin/ && rm -rf nvim-linux64 nvim-linux64.tar.gz
cd ~/.config/ && git clone https://github.com/moritzwilksch/nvim.git && cd

# Download dotfiles
echo "Downloading dotfiles"
mkdir -p ~/.config/fish
wget -P ~/ https://raw.githubusercontent.com/moritzwilksch/dotfiles/main/.tmux.conf
wget -P ~/.config/fish/ https://github.com/moritzwilksch/dotfiles/raw/main/.config/fish/config.fish

# Define aliases
echo "Defining aliases"
echo "alias ll='ls -al'" >> ~/.zshrc
echo "alias la='ls -al'" >> ~/.zshrc
echo "alias mm='micromamba'" >> ~/.zshrc
echo "alias ipy='ipython'" >> ~/.zshrc
echo "alias ipyi='ipython -i'" >> ~/.zshrc
source ~/.zshrc

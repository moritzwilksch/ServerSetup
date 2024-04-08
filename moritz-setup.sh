#!/bin/bash
cd ~
packages=("git" "htop" "zsh" "wget" "curl" "make" "tmux" "fish" "ripgrep" "fzf" "gcc" "software-properties-common")

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


$SUDO apt-add-repository -y ppa:fish-shell/release-3
$SUDO apt-get update
$SUDO apt-get install -y "${packages[@]}"

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz && $SUDO mv nvim-linux64/ /usr/bin/ && rm -rf nvim-linux64.tar.gz
mkdir -p ~/.config/
cd ~/.config/ && git clone https://github.com/moritzwilksch/nvim.git && cd

# Download dotfiles
echo "Downloading dotfiles"
mkdir -p ~/.config/fish
wget -P ~/ https://raw.githubusercontent.com/moritzwilksch/dotfiles/main/.tmux.conf
wget -P ~/.config/fish/ https://github.com/moritzwilksch/dotfiles/raw/main/.config/fish/config.fish

# install pixi
curl -fsSL https://pixi.sh/install.sh | bash
echo 'pixi completion --shell fish | source' >> ~/.config/fish/config.fish

# Define aliases
echo "Defining aliases"
echo "alias ll='ls -al'" >> ~/.config/fish/config.fish
echo "alias la='ls -al'" >> ~/.config/fish/config.fish
echo "alias mm='micromamba'" >> ~/.config/fish/config.fish
echo "alias ipy='ipython'" >> ~/.config/fish/config.fish
echo "alias ipyi='ipython -i'" >> ~/.config/fish/config.fish
echo "alias nvim=/usr/bin/nvim-linux64/bin/nvim" >> ~/.config/fish/config.fish

# change login shell
chsh -s /usr/bin/fish $USER

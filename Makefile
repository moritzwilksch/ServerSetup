system:
	sudo apt-get update
	sudo apt-get install htop git zsh wget make tmux

zsh:
	zsh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	sudo chsh -s /usr/bin/zsh ${USER}
	
conda:
	wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
	sudo chmod +x Miniforge3-Linux-x86_64.sh
	./Miniforge3-Linux-x86_64.sh
	source miniforge3/bin/activate
	conda init zsh


# Neovim configuration and installation

## Installation
	#Compiling neovim from source
	sudo apt-get install ninja-build gettext cmake unzip curl
	cd neovim
	git clone https://github.com/neovim/neovim
	git checkout stable
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	ln -s /usr/local/bin/nvim /usr/bin/nvim

    #Installing deps for LSP and Telescope
    sudo apt-get install python3-venv ripgrep


## Configuration
Copy entirety of nvim folder to `~/.config/`.

Adding `alias vim='nvim'` is preferable as well.

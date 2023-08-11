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

* [Vanilla VIM options](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/config/options.lua)
* [:T for terminal](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/config/commands.lua)
* [Plugin Installation](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/plugins.lua)

### Plugins
* Fuzzy Finder (Telescope)
  * [Source](https://github.com/nvim-telescope/telescope.nvim)
  * [Config](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/plugin/telescope.lua)
  * Binds
    * \<space\>pf **__>__** find_files
    * \<space\>fg **__>__** live_grep
    * \<space\>ps **__>__** ripgrep
    * ctrl+p **__>__** find_files (limited to local git repo)
* Code Highlighting (Treesitter)
    * [Source](https://github.com/nvim-treesitter/nvim-treesitter)
    * [Config](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/plugin/treesitter.lua)
* File Pinning (Harpoon)
    * [Source](https://github.com/ThePrimeagen/harpoon)
    * [Config](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/plugin/harpoon.lua)
    * Binds
        * \<space\>a **__>__** Add file to pins
        * ctrl + e **__>__** Open Harpoon UI
        * ctrl + h 1 **__>__** Quick swap to Pin 1
        * ctrl + h 2 **__>__** Quick swap to Pin 2
        * ctrl + h 3 **__>__** Quick swap to Pin 3
        * ctrl + h 4 **__>__** Quick swap to Pin 4

* Git Integration (Fugitive)
    * [Source](https://github.com/tpope/vim-fugitive)
    * [Config](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/plugin/fugitive.lua)
    * Binds
        * \<space\>gs **__>__** Show Git Status
* Color Scheme (Rose Pine)
    * [Source](https://github.com/rose-pine/neovim)
    * [Config](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/plugin/colorscheme.lua)
* LSP (LSP-Zero)
    * [Source](https://github.com/VonHeikemen/lsp-zero.nvim)
    * [Config](https://github.com/Kareth-io/homedir/blob/main/nvim/lua/plugin/lsp.lua)

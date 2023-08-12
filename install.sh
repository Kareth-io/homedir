#!/bin/bash
#Script presumes deb based system.

BASHRC=${HOME}/.bashrc
CFGDIR=${HOME}/.config
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


shopt -s nocasematch

run () {
    mkdir ${CFGDIR}
    echo "Installation Targets: $@"
    for target in "${@}"; do
        case ${target} in
            starship)
                install_starship
                ;;
            neovim|nvim)
                echo "Installing Neovim";
                install_neovim
                ;;
            *)
                echo "Unknown option: ${target}"
        esac
    done
    echo "Finished!"
    echo "You may need to run: source ${HOME}/.bashrc"
    echo "To fully initialize everything"
}

install_starship () {
    echo
    echo "--- Installing [Starship] ---"
    curl -sS https://starship.rs/install.sh | sh
    
    echo "Updating bashrc"
    local modified_bashrc=$(grep -Ev "^#" ${BASHRC} | fgrep 'eval "$(starship init bash)"')
    if [[ -n "${modified_bashrc}" ]]; then
        echo "Starship already enabled!"
    else
        echo 'eval "$(starship init bash)"' >> ${BASHRC}
    fi

    echo "Adding Configuration"
    cp -v ${SCRIPT_DIR}/starship/starship.toml ${CFGDIR}/starship.toml
    echo "--- Starship Installed ---"
}

install_neovim () {
    echo
    #Compiling from source due to lazy.vim version requirements
    echo "--- Installing [Neovim] ---"
    sudo apt-get install ninja-build gettext cmake unzip curl -y
    git clone https://github.com/neovim/neovim
    cd neovim/
    git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    make install

    #Cleanup
    cd ..
    rm -rf neovim/

    #Vultr machines don't have /usr/local in path for some ungodly reason
    ln -s /usr/local/bin/nvim /usr/bin/nvim

    #Plugins and dependencies
    sudo apt install -y python3-venv \ #For python LSP
                         ripgrep #For Telescope

    echo "Configuring Neovim"
    cp -Rv ${SCRIPT_DIR}/nvim/ ${CFGDIR}
    local modified_bashrc=$(grep -Ev "^#" ${BASHRC} | fgrep 'alias vim="nvim"')
    if [[ -n "${modified_bashrc}" ]]; then
        echo "Neovim Already aliased"
    else
        echo 'alias vim="nvim"' >> ${BASHRC}
    fi
    echo "--- Neovim Installed ---"
}

run ${@}

#Cleanup
shopt -u nocasematch

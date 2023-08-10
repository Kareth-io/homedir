# Starship configuration and installation

## Installation
    #Pull down binary from the web
    curl -sS https://starship.rs/install.sh | sh
    
    #Append starship init to bashrc
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    
    #Create config dir and config file
    mkdir -p ~/.config && touch ~/.config/starship.toml


## Configuration
Premade config file present in this repo, simply replace `~/.config/starship.toml`

## Useful links
- [Color Reference](https://www.w3schools.com/colors/colors_hexadecimal.asp)
- [Official Documentation](https://starship.rs/config/#prompt)
- [Supported Fonts](https://www.nerdfonts.com/font-downloads)

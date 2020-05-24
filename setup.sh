#! /bin/bash

echo "Installing neovim"
sudo apt install neovim -y
python3 -m pip install pynvim

echo "Downloading vim-plug for neovim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Linking config files"
./link.sh

echo "Don't forget to run :PlugInstall in nvim"
#! /bin/bash

WORKDIR=$(pwd)

echo "Ensuring proper directory structure"
mkdir -p ~/.config/nvim

echo "Linking init.vim"
ln $(pwd)/init.vim ~/.config/nvim/init.vim
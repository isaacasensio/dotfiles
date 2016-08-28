#!/usr/bin/env bash

# Install Vundle, the plug-in manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# Create swap folder
mkdir -p ~/.vim/swaps

# Install all plugins from vimrc
vim +PluginInstall +qall

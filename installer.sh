#!/bin/bash

set -e
set -x

# Basic installations
sudo apt install -y \
    zsh tmux neovim cargo fzf curl fonts-powerline python3 python3-pip
cargo install lsd ripgrep

# Add cargo to the path
echo "\nPATH=\"\$PATH:/home/$USER/.cargo/bin\"" >> ~/.profile
. ~/.profile

# VIM
ln -s dots/vim/.vimrc ~/.vimrc
ln -s dots/vim/.vim ~/.vim
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

vim +PluginInstall +qa

# Git
ln -s dots/git/.gitconfig ~/.gitconfig
mkdir -p ~/.config/git
ln -s dots/git/.gitignore ~/.config/git/.gitignore

# ZSH
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm -f ~/.zshrc ~/.zshrc.pre-oh-my-zsh
mv ~/.oh-my-zsh dots/bash_zsh/oh-my-zsh
ln -s dots/bash_zsh/oh-my-zsh ~/.oh-my-zsh
ln -s dots/bash_zsh/.zshrc ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# git clone --depth=1 https://github.com/zsh-users/zsh-completions \
    # $HOME/.oh-my-zsh/custom/plugins/zsh-completions

# General
# ln -s dots/daemons ~/daemons

#!/bin/bash

set -e
set -x


APT_PACKAGES="zsh tmux neovim cargo fzf curl fonts-powerline python3 python3-pip"
CARGO_PACKAGES="lsd ripgrep fd-find exa bat"

ZSH_PLUGINS="zsh-syntax-highlighting zsh-autosuggestions zsh-completions"


save_backup () {
    local to_backup="$@"
    test -e "$to_backup" && mv "$to_backup"{,.BKP} || true
}


# Basic installations
install_packages () {
    # There are no quotes on the variable and it's intentional! we have to let apt and cargo treat these "as an array" of pacakges
    sudo apt install -y $APT_PACKAGES
    cargo install $CARGO_PACKAGES
}


configure_zsh () {
    save_backup ~/.oh-my-zsh
    # mv "$DOTS"/bash_zsh/oh-my-zsh ~/.oh-my-zsh 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    save_backup ~/.zshrc
    save_backup ~/.zshrc.pre-oh-my-zsh

    ln -s "$DOTS"/bash_zsh/oh-my-zsh ~/.oh-my-zsh
    ln -s "$DOTS"/bash_zsh/.zshrc ~/.zshrc

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        $HOME/.oh-my-zsh/custom/themes/powerlevel10k

    # There are no quotes on the variable and it's intentional! we have to let the for-loop treat this "as an array" of plugins
    for plugin in $ZSH_PLUGINS; do
        git clone --depth=1 https://github.com/zsh-users/"$plugin" "$HOME"/.oh-my-zsh/custom/plugins/"$plugin"
    done
}


configure_vim () {
    # VIM
    save_backup ~/.vimrc
    save_backup ~/.vim

    ln -s "$DOTS"/vim/.vimrc ~/.vimrc
    ln -s "$DOTS"/vim/.vim ~/.vim

    # NVIM
    mkdir -p ~/.config/nvim
    save_backup ~/.config/nvim/init.vim
    ln -s ~/.vimrc ~/.config/nvim/init.vim

    # Install plugins
    vim +PluginInstall +qa
}


get_submodules () {
    cd "$DOTS"
    git submodule update --init
    cd -
}


configure_git () {
    mkdir -p ~/.config/git

    save_backup ~/.gitconfig
    save_backup ~/.config/git/.gitignore

    ln -s "$DOTS"/git/.gitconfig ~/.gitconfig
    ln -s "$DOTS"/git/.gitignore ~/.config/git/.gitignore
}


add_cargo_to_path () {
    echo -e "\nPATH='\$PATH:/home/$USER/.cargo/bin'" >> ~/.profile
    . ~/.profile
}


test -z "$DOTS" && echo "Must specify the path to the 'dots' dir with the DOTS environment variable" && exit
DOTS=$(realpath "$DOTS")

install_packages
configure_zsh
configure_vim
get_submodules
configure_git
add_cargo_to_path

echo Finished installing and configuring the DOT files!

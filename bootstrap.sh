#!/usr/bin/env bash

# move old dotfiles to backup directory
mkdir -p ~/dotfiles_backup
files="bash_profile bashrc bash_aliases vimrc zshrc zsh_aliases gitconfig gitmessage"
for file in $files; do
    if [ -f ~/.$file ]; then
        mv ~/.$file ~/dotfiles_backup/
    fi
done
# copy new dotfiles to home directory
for file in $files; do
    if [ -f ~/dotfiles/$file ]; then
        cp ~/dotfiles/$file ~/.$file
        source ~/.$file
    fi
done

# install pip without root permission if pip is not installed
if ! [ -x "$(command -v pip)" ]; then
    echo "installing pip without root permission"
    # sh -c "$(curl -fsSL https://bootstrap.pypa.io/get-pip.py)"
    wget https://bootstrap.pypa.io/get-pip.py
    python get-pip.py --user
    rm get-pip.py
fi

# install pre-commit without root permission if pre-commit is not installed
if ! [ -x "$(command -v pre-commit)" ]; then
    echo "installing pre-commit without root permission"
    pip install pre-commit --user
fi

# install tldr without root permission if tldr is not installed
if ! [ -x "$(command -v tldr)" ]; then
    echo "installing tldr without root permission"
    pip install tldr --user
fi

# add zsh plugins if zsh is installed
if [ -x "$(command -v zsh)" ]; then
    echo "installing zsh plugins"
    plugins="zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search"
    for plugin in $plugins; do
        if [ ! -d "$ZSH_CUSTOM/custom/plugins/$plugin" ]; then
            git clone "git@github.com:zsh-users/$plugin.git" "$ZSH_CUSTOM/custom/plugins/$plugin"
        fi
    done
fi

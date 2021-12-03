#!/usr/bin/env bash

# move old dotfiles to backup directory
mkdir -p ~/dotfiles_backup
files=".bash_aliases .bash_profile .bashrc .gitconfig .gitmessage .vimrc .zsh_aliases .zshrc"
for file in $files; do
    if [ -f $HOME/$file ] && [ ! -f $HOME/dotfiles_backup/$file ]; then
        mv $HOME/$file $HOME/dotfiles_backup/
    fi
done

# copy new dotfiles to home directory
for file in $files; do
    if [ -f $HOME/dotfiles/$file ]; then
        cp $HOME/dotfiles/$file ~/$file
    fi
    echo "Copied $file"
done

# if running bash, source .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# if zsh is installed and running, source zshrc
if [ -x "$(command -v zsh)" ]; then
    if [ -f ~/.zshrc ]; then
        source ~/.zshrc
    fi
fi

# # check if current user is root
# super_user () {
#     if [ "$(id -u)" != "0" ]; then
#         true
#     else
#         false
#     fi
# }

# install pip if not installed
if ! [ -x "$(command -v pip)" ]; then
    echo "pip is not installed, installing pip"
    # if super_user; then
    #     sudo apt-get install python3-pip
    if [ -x "$(command -v wget)" ] || [ -x "$(command -v curl)" ] && [ -x "$(command -v python)" ]; then
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py || wget https://bootstrap.pypa.io/get-pip.py
        python get-pip.py
        rm get-pip.py
    else
        echo "cannot install pip, please install pip manually"
    fi
fi

# include .local/bin in PATH if not already there
if [ -d $HOME/.local/bin ]; then
    if ! echo $PATH | grep -q $HOME/.local/bin; then
        export PATH=$PATH:$HOME/.local/bin
    fi
fi

# install pre-commit if not installed
if ! [ -x "$(command -v pre-commit)" ]; then
    echo "pre-commit is not installed, installing pre-commit"
    # if super_user; then
    #     sudo pip install pre-commit
    if [ -x "$(command -v pip)" ]; then
        pip install pre-commit --user
    else
        echo "cannot install pre-commit, please install pre-commit manually"
    fi
fi

# automatically enabling pre-commit if pre-commit is installed
if [ -x "$(command -v pre-commit)" ]; then
    if [ -f $HOME/.git-template/hooks/pre-commit ]; then
        echo "pre-commit is already enabled"
    elif [ -x "$(command -v git)" ] && [ -x "$(command -v pre-commit)" ]; then
        git config --global init.templatedir ~/.git-template
        pre-commit init-templatedir ~/.git-template
        echo "pre-commit is now enabled by default"
    fi
fi

# install tldr without root permission if tldr is not installed
if ! [ -x "$(command -v tldr)" ]; then
    echo "installing tldr without root permission"
    pip install tldr --user || echo "cannot install tldr, please install tldr manually"
else
    echo "tldr is already installed"
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

#!/usr/bin/env bash
# may try chezmoi in the future
# several pre-req:
# pip curl wget
# update zsh version in gist script at line 37

# move old dotfiles to backup directory
mkdir -p ~/dotfiles_backup
files=".aliases .path .bash_profile .bashrc\
 .gitconfig .gitmessage .gitignore_global\
 .vimrc .zshrc\
 .tmux.conf .tmux.conf.local"
for file in $files; do
    if [ -f $HOME/$file ] && [ ! -f $HOME/dotfiles_backup/$file ]; then
        echo "Moving $file to ~/dotfiles_backup"
        mv $HOME/$file $HOME/dotfiles_backup/
    fi
done

# copy new dotfiles to home directory
for file in $files; do
    if [ -f $HOME/dotfiles/$file ]; then
        echo "Copying $file"
        cp $HOME/dotfiles/$file ~/$file
    fi
done

# source .bash_profile if it exists
if [ -f ~/.bash_profile ]; then
    echo "Sourcing .bash_profile"
    source ~/.bash_profile
fi

# install pip if not installed
if ! [ -x "$(command -v pip)" ]; then
    echo "pip is not installed, installing pip"
    if [ -x "$(command -v wget)" ] || [ -x "$(command -v curl)" ] && [ -x "$(command -v python)" ]; then
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py || wget https://bootstrap.pypa.io/get-pip.py
        python get-pip.py
        rm get-pip.py
    else
        echo "cannot install pip, please install pip manually"
    fi
fi

# include local/bin in PATH if not already there
if ! echo $PATH | grep -q $HOME/local/bin; then
    export PATH=$PATH:$HOME/local/bin
fi

# install pre-commit if not installed
if ! [ -x "$(command -v pre-commit)" ]; then
    echo "pre-commit is not installed, installing pre-commit"
    if [ -x "$(command -v pip)" ]; then
        pip install pre-commit --user --no-cache-dir || echo "pip install pre-commit failed"
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
    pip install tldr --user --no-cache-dir || echo "cannot install tldr, please install tldr manually"
else
    echo "tldr is already installed"
fi

# install tmux if not installed
# note that the script will also htop if it is not installed
if [ -x "$(command -v tmux)" ]; then
    echo "tmux is already installed"
else
    echo "installing tmux without root permission"
    # https://gist.github.com/ryin/3106801
    if [ -x "$(command -v curl)" ]; then
        sh -c "$(curl -fsSL https://gist.githubusercontent.com/luchaoqi/e34560109f1d04c3a69998f96606a40e/raw/tmux_local_install.sh)"
    else
        echo "cannot install tmux, please install tmux manually"
    fi
fi

# install zsh and oh-my-zsh if not installed
if [ -x "$(command -v zsh)" ]; then
    echo "zsh is already installed"
else
    echo "installing zsh without root permission"
    if [ -x "$(command -v curl)" ]; then
        sh -c "$(curl -fsSL https://gist.githubusercontent.com/luchaoqi/ed4a26dcd0dd61a169703496d310427c/raw/zsh_local_install.sh)"
    else
        echo "cannot install zsh, please install zsh manually"
    fi
fi

# add zsh plugins if zsh is installed
if [ -x "$(command -v zsh)" ]; then
    echo "installing zsh plugins"
    plugins=(zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)
    for plugin in $plugins; do
        if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
            git clone "https://github.com/zsh-users/$plugin" "$ZSH_CUSTOM/plugins/$plugin"
        fi
    done
fi

# uncomment to install poetry

# if [ -x "$(command -v poetry)" ]; then
#     echo "poetry is already installed"
# else
#     echo "installing poetry without root permission"
#     if [ -x "$(command -v curl)" ]; then
#         sh -c "$(curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -)"
#         # Oh-My-Zsh
#         mkdir $ZSH_CUSTOM/plugins/poetry
#         poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
#     else
#         echo "cannot install poetry, please install poetry manually"
#     fi
# fi

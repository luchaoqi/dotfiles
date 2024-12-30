#!/bin/bash
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# ---------------------------------------------------------------------------- #
#                                  custom part                                 #
# ---------------------------------------------------------------------------- #

# Alias definitions.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# if custom path file exists, add it to PATH
if [ -f "$HOME/.path" ] ; then
    . "$HOME/.path"
fi

# enable zsh if it is executable
if [ -x "$(command -v zsh)" ]; then
    if [ -f "$HOME/.zshrc" ]; then
        zsh -l
    fi
fi

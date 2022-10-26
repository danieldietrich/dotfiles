#!/bin/sh

if ! zsh_bin=$(which zsh); then
    exit $?
fi

chsh -s "$zsh_bin"

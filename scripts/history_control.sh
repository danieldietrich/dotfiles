#!/bin/bash

# Ignore duplicates and commands starting with a space
printf '\n\n%s\n' "HISTCONTROL=ignoreboth" >> "$HOME/.bashrc"
printf '\n\n%s\n' "setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE" >> "$HOME/.zshrc"

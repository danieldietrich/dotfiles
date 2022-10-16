#!/bin/bash

ALIASES="$(cat <<- CODE
# Git
alias branch="git branch -vv"
alias checkout="git checkout"
alias commit="git commit -m"
alias fetch="git fetch --all --prune"
alias pull="git pull --rebase"
alias push="git push"
alias rebase="git rebase -i"
alias status="git status -sb"
CODE
)"

for script in ".bashrc" ".zshrc"; do
    printf '\n\n%s\n' "$ALIASES" >> "$HOME/$script"
done

#!/bin/sh

__set() {
    git config --global "$1" "$2"
}
__set init.defaultBranch main
__set pull.rebase true
__set diff.colorMoved zebra

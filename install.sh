#!/bin/bash
# ------------------------------------------------------------------------------
# (C)opyright 2022 by Daniel Dietrich - MIT license
# ------------------------------------------------------------------------------

echo "Installing dotfiles..."

TMP_DIR=$(mktemp -d)
CURRENT_DIR=$PWD

cd "$TMP_DIR" || exit 1

for script in ~/.dotfiles/scripts/*; do
  bash "$script"
done

cd "$CURRENT_DIR" || exit 1
rm -rf "$TMPDIR"

echo "Done installing dotfiles."

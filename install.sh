#!/bin/bash
# ------------------------------------------------------------------------------
# (C)opyright 2022 by Daniel Dietrich - MIT license
# ------------------------------------------------------------------------------

echo "Installing dotfiles..."

TMP_DIR=$(mktemp -d)
CURRENT_DIR="$(cd -- "$(dirname "$0")" || exit 1 ; pwd -P)"

cd "$TMP_DIR" || exit 1

for script in "$CURRENT_DIR"/scripts/*; do
  bash "$script"
done

cd "$CURRENT_DIR" || exit 1
rm -rf "$TMPDIR"

echo "Done installing dotfiles."

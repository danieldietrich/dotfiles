#!/bin/bash
# ------------------------------------------------------------------------------
# (C)opyright 2022 by Daniel Dietrich - MIT license
# ------------------------------------------------------------------------------

__install_zsh_addon() {
  local addon="$1"
  local init_script="$2"
  echo "Installing $addon..." >&2
  git clone "https://github.com/zsh-users/$addon" "$HOME/.zsh/$addon"
  printf '\n\n%s\n' "$init_script" >> ~/.zshrc
}

printf '\n\n%s\n' "export ZSH_DISABLE_COMPFIX=\"true\"" >> ~/.profile

__install_zsh_addon zsh-autosuggestions "$(cat <<- CODE
if [ -f "\$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  . \$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh &>/dev/null
fi
CODE
)"

__install_zsh_addon zsh-history-substring-search "$(cat <<- CODE
if [ -f "\$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
  . \$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh &>/dev/null
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  setopt histignoredups
fi
CODE
)"

__install_zsh_addon zsh-completions "$(cat <<- CODE
if [ -d "\$HOME/.zsh/zsh-completions" ]; then
  FPATH="\$HOME/.zsh/zsh-completions":\$FPATH
  autoload -Uz compinit
  if [[ \$ZSH_DISABLE_COMPFIX == 'true' ]]; then
    compinit -u -C
  else
    compinit
  fi
  zstyle ':completion:*' menu select
fi
CODE
)"

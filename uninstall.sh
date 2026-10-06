#!/usr/bin/env bash
# Remove claude-account and its ~/.zshrc block. Stored tokens in
# ~/.config/claude-accounts are left alone; delete that folder yourself if wanted.
set -euo pipefail

zshrc="${ZDOTDIR:-$HOME}/.zshrc"
rm -f "$HOME/.local/bin/claude-account" && echo "removed ~/.local/bin/claude-account"
if [[ -f $zshrc ]] && grep -qF "# >>> claude-account >>>" "$zshrc"; then
  sed -i '' '/# >>> claude-account >>>/,/# <<< claude-account <<</d' "$zshrc"
  echo "removed claude-account block from $zshrc"
fi

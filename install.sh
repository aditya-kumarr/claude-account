#!/usr/bin/env bash
# Install claude-account on macOS + zsh: copies the script to ~/.local/bin and
# adds a PATH line and a `claude-accounts` alias to ~/.zshrc. Safe to re-run
# (re-running after `git pull` updates the installed copy).
set -euo pipefail

here=$(cd "$(dirname "$0")" && pwd)
bin_dir="$HOME/.local/bin"
zshrc="${ZDOTDIR:-$HOME}/.zshrc"
begin="# >>> claude-account >>>"
end="# <<< claude-account <<<"

[[ $(uname) == Darwin ]] || echo "warning: this installer targets macOS; continuing anyway" >&2

mkdir -p "$bin_dir"
cp "$here/bin/claude-account" "$bin_dir/claude-account"
chmod 755 "$bin_dir/claude-account"
echo "installed $bin_dir/claude-account"

touch "$zshrc"
if grep -qF "$begin" "$zshrc"; then
  echo "$zshrc already configured"
else
  cat >>"$zshrc" <<ZSH

$begin
export PATH="\$HOME/.local/bin:\$PATH"
alias claude-accounts='claude-account'
$end
ZSH
  echo "added PATH + alias to $zshrc"
fi

for dep in python3 claude; do
  command -v "$dep" >/dev/null || echo "note: '$dep' not found on PATH; claude-account needs it" >&2
done

echo
echo "done. open a new terminal (or: source $zshrc), then: claude-account list"

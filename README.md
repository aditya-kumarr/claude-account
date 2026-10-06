# claude-account

Keep several Claude Code logins on one machine and switch between them.
Tokens come from `claude setup-token` and are stored in `~/.config/claude-accounts/`
(folder 700, files 600). `default` is your normal login (`~/.claude/.credentials.json`).

## Install (macOS + zsh)

```sh
git clone https://github.com/aditya-kumarr/claude-account.git
cd claude-account
./install.sh
source ~/.zshrc
```

This copies `bin/claude-account` to `~/.local/bin` and adds a marked block to `~/.zshrc`
with the PATH entry and a `claude-accounts` alias. Re-run `./install.sh` after `git pull`
to update. `./uninstall.sh` removes both (stored tokens are kept).

Needs `bash`, `python3` and the `claude` CLI.

## Usage

```
claude-account list [--json]        accounts, the active one marked
claude-account current              print the active account name
claude-account add <name>           store a token from `claude setup-token`
claude-account use <name|default>   set the active account
claude-account rm <name>            delete a stored token
claude-account check [name]         test the account with one tiny Haiku request
claude-account run [name] -- cmd…   run one command as that account
```

Example: `claude-account run personal -- claude` starts Claude Code as `personal`.

Note: `use` only records the active name; nothing on a Mac reads it automatically
except `run`/`check` with no name. To use an account interactively, use `run`.

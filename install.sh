#!/usr/bin/env bash
# Link configs, install fonts and seed the Obsidian vault config on Ubuntu (native or WSL2).
# Software installation is in SETUP-UBUNTU.md; this script only places files.
# Idempotent: safe to re-run. Existing files are moved to ~/.dotfiles-backup/<timestamp>/.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

link() { # link <repo-path> <target>
  local src="$DOTFILES/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then return; fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP"; mv "$dst" "$BACKUP/"; log "backed up $dst"
  fi
  ln -s "$src" "$dst"; log "linked $dst"
}

do_link() {
  link home/.zshrc                     "$HOME/.zshrc"
  link home/.gitconfig                 "$HOME/.gitconfig"
  link home/.git-templates             "$HOME/.git-templates"
  link config/starship.toml            "$HOME/.config/starship.toml"
  link config/ghostty                  "$HOME/.config/ghostty"
  link config/git/ignore               "$HOME/.config/git/ignore"
  link config/gh/config.yml            "$HOME/.config/gh/config.yml"
  link claude/settings.json            "$HOME/.claude/settings.json"
  link claude/statusline-command.sh    "$HOME/.claude/statusline-command.sh"
  for s in "$DOTFILES"/claude/skills/*/; do
    link "claude/skills/$(basename "$s")" "$HOME/.claude/skills/$(basename "$s")"
  done
  for ed in Cursor Code; do
    link editors/cursor/settings.json    "$HOME/.config/$ed/User/settings.json"
    link editors/cursor/keybindings.json "$HOME/.config/$ed/User/keybindings.json"
  done

  log "installing fonts"
  mkdir -p "$HOME/.local/share/fonts/dotfiles"
  cp -f "$DOTFILES"/fonts/* "$HOME/.local/share/fonts/dotfiles/"
  have fc-cache && fc-cache -f >/dev/null

  # Obsidian rewrites its config files, so copy (not symlink) into the vault.
  local vault="$HOME/Workspace"
  if [ -d "$vault" ]; then
    mkdir -p "$vault/.obsidian"
    cp -rn "$DOTFILES"/obsidian/vault-config/. "$vault/.obsidian/"
    log "Obsidian config copied into $vault/.obsidian (existing files kept)"
  else
    log "skip Obsidian vault config: $vault not found (clone it, then re-run ./install.sh)"
  fi
}


do_link
log "done (backups, if any: $BACKUP)"

# Ubuntu setup runbook (for an AI agent)

This repo is a snapshot of Andi's Mac dev setup (taken 2026-10-23). Follow this file
top to bottom on an Ubuntu machine — native Ubuntu or Ubuntu on WSL2 — to end up with
the same shell, prompt, terminal, theme, fonts, editors and tools.

## Rules for the agent

- Run steps in order. After each step, run its **Verify** command; do not continue past a failure — fix it or stop and report.
- Every step is idempotent: if Verify already passes, skip the install part.
- Use `sudo` where shown. If a sudo password prompt blocks you, ask the user to run the command with `! <command>`.
- Steps marked **[user]** need a person (browser login, password, GUI). Ask the user to do them; don't fake them.
- Steps marked **[WSL]** apply only when `grep -qi microsoft /proc/version` succeeds; **[native]** only when it fails.
- On WSL you can drive Windows from bash: `powershell.exe`, `cmd.exe`, `winget.exe`, `wslpath -w <path>`.
- Never commit to this repo from the Ubuntu machine unless the user asks.
- When finished, print the checklist at the bottom with ✅/❌ per line.

## What's in the repo

| Path | Goes to | Notes |
|---|---|---|
| `home/.zshrc` | `~/.zshrc` | zsh + starship + git aliases + `z`. Cross-platform (macOS guards). |
| `home/.gitconfig`, `home/.git-templates/` | `~/` | identity, LFS, global hook templates |
| `config/starship.toml` | `~/.config/starship.toml` | prompt |
| `config/ghostty/config` (+ `config.linux`) | `~/.config/ghostty/` | Inconsolata 14, theme **Monokai Pro Light Sun**, keybinds; `config.linux` holds Linux-only overrides |
| `config/git/ignore`, `config/gh/config.yml` | `~/.config/…` | |
| `claude/settings.json`, `claude/statusline-command.sh`, `claude/skills/` | `~/.claude/` | Claude Code settings, status line, personal skills |
| `editors/cursor/` | Cursor / VS Code user dir | settings, keybindings, `extensions.txt` |
| `fonts/` | `~/.local/share/fonts/dotfiles/` (and Windows on WSL) | Inconsolata, Inconsolata Nerd Font, Inter |
| `obsidian/vault-config/` | `~/Workspace/.obsidian/` (copied, not linked) | theme **Maple** (base `moonstone`), CSS snippet |
| `windows/` | Windows host (WSL only) | font installer + Windows Terminal color scheme |
| `install.sh` | — | places all of the above (symlinks + font copy + Obsidian copy); installs no software |

## Step 0 — Detect environment

```bash
lsb_release -ds; uname -m
grep -qi microsoft /proc/version && echo WSL || echo NATIVE
echo "DISPLAY=$DISPLAY WAYLAND_DISPLAY=$WAYLAND_DISPLAY"
systemctl is-system-running 2>/dev/null || echo "no systemd"
```

Record: Ubuntu version (expect 22.04+; 24.04 preferred), arch (commands below assume `x86_64`; adjust download names for `aarch64`), WSL vs native, whether a display exists (GUI apps need one — WSLg provides it on Windows 11), whether systemd is running (snap needs it).

**[WSL] if systemd is not running:** append to `/etc/wsl.conf` and ask the user to run `wsl.exe --shutdown` from Windows, then reopen Ubuntu:
```bash
printf '[boot]\nsystemd=true\n' | sudo tee -a /etc/wsl.conf
```

## Step 1 — Base packages

```bash
sudo apt-get update -y
sudo apt-get install -y zsh git git-lfs curl wget unzip xz-utils build-essential \
  ca-certificates gnupg ripgrep jq p7zip-full fontconfig \
  python3 python3-pip python3-venv pipx git-filter-repo
git lfs install --skip-repo
pipx ensurepath
```
**Verify:** `zsh --version && git lfs version && rg --version && jq --version && 7z | head -2 && git filter-repo --version`

## Step 2 — Clone this repo

```bash
mkdir -p ~/Projects
[ -d ~/Projects/dotfiles ] || git clone https://github.com/AndiWang/dotfiles.git ~/Projects/dotfiles
```
(If the remote differs, ask the user.) **Verify:** `ls ~/Projects/dotfiles/install.sh`

## Step 3 — CLI tools (GitHub CLI, Starship, z)

**GitHub CLI**
```bash
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
sudo apt-get update -y && sudo apt-get install -y gh
```
**Starship** — `curl -fsSL https://starship.rs/install.sh | sh -s -- -y`

**z** (directory jumper; `.zshrc` sources it from here) — `git clone --depth 1 https://github.com/rupa/z ~/.local/share/z`

**Verify:** `gh --version && starship --version && test -f ~/.local/share/z/z.sh`

## Step 4 — Claude Code (and Codex CLI)

```bash
curl -fsSL https://claude.ai/install.sh | bash
# optional, needs Node/npm installed first: npm install -g @openai/codex
```
**Verify:** `~/.local/bin/claude --version`

## Step 5 — Place dotfiles, fonts, Obsidian config

```bash
~/Projects/dotfiles/install.sh
```
It symlinks every config in the table above (existing files are moved to `~/.dotfiles-backup/<timestamp>/`), copies `fonts/` into `~/.local/share/fonts/dotfiles` and runs `fc-cache`, and copies the Obsidian config into `~/Workspace/.obsidian` if `~/Workspace` exists.

The Obsidian vault is the repo `https://github.com/AndiWang/Workspace` (its `.obsidian/` is not tracked there, which is why this repo carries it). If `~/Workspace` is missing:
```bash
git clone https://github.com/AndiWang/Workspace.git ~/Workspace && ~/Projects/dotfiles/install.sh
```
**Verify:**
```bash
readlink ~/.zshrc ~/.config/ghostty ~/.config/starship.toml ~/.claude/settings.json
fc-list | grep -ci inconsolata   # > 0
fc-list | grep -ci 'Inter'       # > 0
ls ~/Workspace/.obsidian/themes/Maple
```

## Step 6 — Default shell → zsh

```bash
[ "$(basename "$SHELL")" = zsh ] || sudo chsh -s "$(command -v zsh)" "$USER"
```
**Verify:** `getent passwd "$USER" | cut -d: -f7` ends in `zsh`, and `zsh -ic 'type gs; type z; echo $STARSHIP_SHELL'` shows the alias, the `z` function and `zsh`.

## Step 7 — Ghostty (terminal)

Requires a display (native desktop, or WSLg on WSL).
```bash
sudo snap install ghostty --classic
```
If snap is unavailable, use the community .deb instead:
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"`

Config is already linked at `~/.config/ghostty/config`. The theme `Monokai Pro Light Sun` ships with Ghostty.

**Verify:** `ghostty +show-config | grep -E '^(theme|font-family|font-size) '` prints the theme, `Inconsolata`, `14`, and `ghostty +validate-config` prints no errors.

Notes:
- macOS `Cmd` keybinds become `Super`, which Windows and GNOME capture. `config.linux` adds `Ctrl+Alt+←/→` (line start/end), `Ctrl+Alt+↑/↓` (scroll top/bottom), `Ctrl+Alt+Backspace` (delete to line start), `Ctrl+Shift+K` (clear). Home/End also work.
- **[user]** Mac renders 14pt smaller than Linux does. If the text looks bigger than on the Mac, add `font-size = 11` to `config/ghostty/config.linux`.

## Step 8 — **[WSL]** Windows side: fonts + Windows Terminal

Even if Ghostty runs through WSLg, Windows Terminal is the default terminal for WSL, so make it match.

1. Install fonts for the Windows user (no admin):
   ```bash
   powershell.exe -ExecutionPolicy Bypass -File "$(wslpath -w ~/Projects/dotfiles/windows/install-fonts.ps1)"
   ```
2. Add the color scheme as a Windows Terminal fragment:
   ```bash
   LAD=$(wslpath "$(cmd.exe /c 'echo %LOCALAPPDATA%' 2>/dev/null | tr -d '\r')")
   mkdir -p "$LAD/Microsoft/Windows Terminal/Fragments/dotfiles"
   cp ~/Projects/dotfiles/windows/terminal-fragment.json "$LAD/Microsoft/Windows Terminal/Fragments/dotfiles/"
   ```
3. Edit Windows Terminal `settings.json` at `$LAD/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json` (back it up first; it may contain `//` comments, so edit carefully). For the Ubuntu profile under `profiles.list`, set:
   ```json
   "colorScheme": "Monokai Pro Light Sun",
   "font": { "face": "Inconsolata", "size": 11, "cellHeight": 1.2 },
   "cursorShape": "filledBox",
   "padding": "12, 10",
   "historySize": 10000,
   "commandline": "wsl.exe -d <distro> --cd ~"
   ```
   and add to `actions` (Shift+Enter for Claude Code, Ctrl+K clear):
   ```json
   { "command": { "action": "sendInput", "input": "\u001b\r" }, "keys": "shift+enter" },
   { "command": { "action": "sendInput", "input": "\u000c" }, "keys": "ctrl+shift+k" }
   ```
   Also set top-level `"copyOnSelect": true` and `"defaultProfile"` to the Ubuntu profile's guid.
4. **[user]** Reopen Windows Terminal and confirm the light Monokai background (`#F8EFE7`) and Inconsolata font.

## Step 9 — Obsidian

- Install: `sudo snap install obsidian --classic` (on WSL it runs through WSLg against the Linux vault).
- **[user]** Open Obsidian → "Open folder as vault" → `~/Workspace`. Theme Maple and the `snippet` CSS snippet should already be on (Settings → Appearance).
- The Mac interface font is "SF Pro Text", which is Apple-licensed and not in this repo; Obsidian falls back to the system font. For a close match, set Settings → Appearance → Interface font to `Inter` (included in `fonts/`).

**Verify:** `snap list obsidian` and `grep -q Maple ~/Workspace/.obsidian/appearance.json`

## Step 10 — Google Chrome

- **[native]**
  ```bash
  wget -qO /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt-get install -y /tmp/chrome.deb && rm /tmp/chrome.deb
  ```
  (adds Google's apt repo, so it auto-updates). Verify: `google-chrome --version`
- **[WSL]** Install on Windows: `winget.exe install -e --id Google.Chrome --accept-source-agreements --accept-package-agreements`. Verify: `winget.exe list --id Google.Chrome`
- **[user]** Sign in to Chrome to sync bookmarks and extensions, and install the "Claude in Chrome" extension from the Chrome Web Store.

## Step 11 — ZCode (Z.ai coding agent)

Mac runs ZCode 3.16.x. Download it only from the official site, https://zcode.z.ai. App data (`~/.zcode`) holds credentials and is **not** in this repo, so sign in again.

- **[WSL]** Use the Windows build: download the Windows x64 installer from https://zcode.z.ai into `$(wslpath "$(cmd.exe /c 'echo %USERPROFILE%' 2>/dev/null | tr -d '\r')")/Downloads` and run it with `cmd.exe /c start "" "<installer>.exe"`. **[user]** finish the setup wizard.
- **[native]** The Linux build is in beta. If https://zcode.z.ai offers a Linux x64 AppImage, install it:
  ```bash
  mkdir -p ~/Applications && mv ~/Downloads/ZCode*.AppImage ~/Applications/ZCode.AppImage
  chmod +x ~/Applications/ZCode.AppImage
  sudo apt-get install -y libfuse2t64 || sudo apt-get install -y libfuse2   # AppImage runtime
  mkdir -p ~/.local/share/applications && cat > ~/.local/share/applications/zcode.desktop <<EOF
  [Desktop Entry]
  Name=ZCode
  Exec=$HOME/Applications/ZCode.AppImage --no-sandbox %U
  Type=Application
  Categories=Development;
  EOF
  ```
  If the site has no Linux download, stop and tell the user (they may get it from Z.ai's beta group). Don't use unofficial repackages.
- **[user]** Launch ZCode and log in with the Z.ai account.

**Verify:** `test -x ~/Applications/ZCode.AppImage` (native) or ZCode appears in the Windows Start menu (WSL).

## Step 12 — Editors (Cursor, VS Code)

Mac uses Cursor (theme "Monokai Dimmed", Ruff for Python, Claude Code in the panel).

- **[native]**
  - Cursor: download the `.deb` from https://cursor.com/download and run `sudo apt-get install -y ./cursor_*.deb`.
  - VS Code (optional): `sudo snap install code --classic`.
  - Settings are already linked to `~/.config/Cursor/User/` and `~/.config/Code/User/`.
  - Extensions: `xargs -n1 cursor --install-extension < ~/Projects/dotfiles/editors/cursor/extensions.txt` (use `code` for VS Code; Cursor-only ones like `anysphere.cursorpyright` fail in VS Code, which is fine).
- **[WSL]** Install the editors on **Windows** and use their WSL remote:
  ```bash
  winget.exe install -e --id Anysphere.Cursor --accept-source-agreements --accept-package-agreements
  winget.exe install -e --id Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements   # optional
  APD=$(wslpath "$(cmd.exe /c 'echo %APPDATA%' 2>/dev/null | tr -d '\r')")
  for ed in Cursor Code; do mkdir -p "$APD/$ed/User" && cp ~/Projects/dotfiles/editors/cursor/{settings,keybindings}.json "$APD/$ed/User/"; done
  ```
  - Keybindings use `cmd+…`; on Windows change `cmd` to `ctrl` in the copied `keybindings.json`.
  - Install the extensions from Windows PowerShell: `Get-Content \\wsl$\<distro>\home\<user>\Projects\dotfiles\editors\cursor\extensions.txt | % { cursor --install-extension $_ }`. In a Remote-WSL window, also install Python, Ruff and Claude Code "in WSL".

**Verify:** `cursor --version` (native) or `winget.exe list --id Anysphere.Cursor` (WSL).

## Step 13 — **[user]** Logins

- `gh auth login` (HTTPS, browser). Verify: `gh auth status`.
- `claude` → log in. Then install the plugins enabled in `claude/settings.json`:
  ```bash
  claude plugin marketplace add ryanthedev/rtd-claude-inn
  claude plugin marketplace add pbakaus/impeccable
  for p in frontend-design superpowers code-simplifier feature-dev skill-creator ralph-loop; do claude plugin install "$p@claude-plugins-official"; done
  claude plugin install design-for-ai@rtd
  claude plugin install impeccable@impeccable
  ```
  Verify: `claude plugin list`, and the status line shows cwd · branch · model · ctx%.
- Git identity is already in `~/.gitconfig` (AndiWang / andrewswang89@gmail.com). SSH keys are not in this repo; GitHub uses HTTPS via `gh`.

## Final checklist (print this with ✅/❌)

- [ ] Ubuntu version / WSL-or-native recorded
- [ ] apt base packages, gh, starship, z
- [ ] Claude Code installed, logged in, plugins installed
- [ ] `install.sh` ran; configs are symlinks into `~/Projects/dotfiles`
- [ ] Fonts Inconsolata / Inconsolata Nerd Font / Inter in `fc-list` (and on Windows for WSL)
- [ ] Login shell is zsh with the starship prompt
- [ ] Ghostty installed, `+validate-config` clean, Monokai Pro Light Sun + Inconsolata
- [ ] [WSL] Windows Terminal uses Monokai Pro Light Sun + Inconsolata, Shift+Enter bound
- [ ] Obsidian installed, `~/Workspace` vault with Maple theme
- [ ] Google Chrome installed
- [ ] ZCode installed and logged in
- [ ] Cursor installed with settings + extensions
- [ ] `gh auth status` OK

## Keeping in sync

Configs are symlinks into this repo, so edits on Ubuntu show up in `git status` in `~/Projects/dotfiles`. To refresh from the Mac, re-copy the live files there (`~/.zshrc`, `~/.gitconfig`, `~/.config/{ghostty/config,starship.toml,git/ignore,gh/config.yml}`, `~/.claude/{settings.json,statusline-command.sh,skills}`, `~/Library/Application Support/Cursor/User/{settings,keybindings}.json`, `~/Workspace/.obsidian` minus `workspace.json`), commit and push, then `git pull` on Ubuntu.

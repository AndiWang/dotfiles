# Shared between macOS and Ubuntu (native or WSL2). Keep OS-specific bits guarded.

export CLICOLOR=1

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.local/bin:$BUN_INSTALL/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Linux: colored ls (macOS uses CLICOLOR above)
if [[ "$OSTYPE" == linux* ]]; then
  alias ls='ls --color=auto'
fi

# History (macOS zsh sets these via /etc/zshrc; Ubuntu does not)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Completion
autoload -Uz compinit && compinit -u

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Git aliases
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gb='git branch'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias glog='git log --oneline --graph --decorate -20'

# z (rupa/z): Homebrew on macOS, git clone on Linux
for _z in /opt/homebrew/etc/profile.d/z.sh "$HOME/.local/share/z/z.sh"; do
  [ -f "$_z" ] && . "$_z" && break
done
unset _z

# Interview prep app
alias iprep='echo "→ http://localhost:5173" && cd ~/Workspace/Career/interview-prep-sr && npm run dev'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

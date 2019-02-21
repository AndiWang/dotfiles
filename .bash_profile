export GIT_PROMPT_ONLY_IN_REPO=0
export GIT_PROMPT_THEME=Default
export M2_HOME=~/apache-maven-3.5.0
export PATH=$PATH:$M2_HOME/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/sbin

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias ll='ls -lh'

# List all files colorized in long format, including dot files
alias la="ls -lha"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Grep
export GREP_OPTTIONS='--color=always'
alias grep='grep --color'

# Shortcut to folders
alias m="cd ~/Projects/Mobike"
alias b="cd ~/Projects/BigONE"
alias o="cd ~/Projects/OYO"
alias ms="cd $GOPATH/src/peatio/messenger"
alias pa="cd $GOPATH/src/peatio/pxn-admin"
alias g="cd $GOPATH"
alias gup="git pull"
alias gp="git push"
# Python notebook
alias notebook="cd ~/Projects/Mobike/notebook; jupyter-notebook"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andiwang/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/andiwang/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andiwang/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/andiwang/Downloads/google-cloud-sdk/completion.bash.inc'; fi
##
# Your previous /Users/andiwang/.bash_profile file was backed up as /Users/andiwang/.bash_profile.macports-saved_2018-04-26_at_03:48:30
##

# MacPorts Installer addition on 2018-04-26_at_03:48:30: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

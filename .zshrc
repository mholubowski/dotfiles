DISABLE_AUTO_UPDATE="true"
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Use the zsh completion system
autoload -U compinit
compinit

# Set up history
#   - Don't share history between terminals
#   - Ignore duplicate lines
#   - Append to history, don't overwrite it
setopt no_share_history
unsetopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
HISTSIZE=1000
HISTFILESIZE=2000

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Ignore case and display colored output
export GREP_OPTIONS='-i --color=auto'

# STFU
setopt no_beep

# If numeric filesnames, sort numerically rather than lexicographically
setopt numericglobsort

# Don't exit on EOF, require exit or logout
setopt ignore_eof

# Prevent automatically overwriting an existing file
# Can force clobber with >!, e.g. `cat fileone >! filetwo`
setopt no_clobber

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/bin
export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH=$PATH:/usr/local/mysql/bin
# export PATH=$PATH:/usr/local/play-2.2.1
export PATH=$PATH:/usr/local/cassandra-2.0.4/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin/

# Preferred editor for local and remote sessions
export EDITOR='vim'


# Set the prompt with the following format:
#   ~/Documents $
#   ~/code/someproject (master) $
function parse_git_branch {
  git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

NORMAL=$'\033[0m'

# Green local prompt
function precmd() {
  # Non-bold git branch
  #export PROMPT="%{$FG[034]%}%~/%{$FG[207]%}$(parse_git_branch)%{$NORMAL%} $ "

  # Bold git branch (matches old)
  export PROMPT="%{$FG[034]%}%~/%{$FG[207]%}%B$(parse_git_branch)%b%{$NORMAL%} $ "
}

# Cyan remote prompt
# function precmd() {
#   export PROMPT="%{$FG[051]%}%n %~%{$FG[013]%}$(parse_git_branch)%{$NORMAL%} $ "
# }


# Enable rbenv shims and autocompletion
eval "$(rbenv init -)"

# Load up autojump
[[ -f ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# Load aliases
if [ -f ~/.sh_aliases ]; then
    source ~/.sh_aliases
fi

if [ -f ~/.git_aliases ]; then
    source ~/.git_aliases
fi

# Private aliases, can't touch this
if [ -f ~/.private_aliases ]; then
  source ~/.private_aliases
fi

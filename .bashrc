# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# Set default editor
export EDITOR=vim

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Ignore case and display colored output
export GREP_OPTIONS='-i --color=always'

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Load up bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Load up git completion
source ~/.git-completion.sh 2>/dev/null

# Set the prompt
function find_git_branch {
  local dir=. head
  until [ "$dir" -ef / ]; do
    if [ -f "$dir/.git/HEAD" ]; then
      head=$(< "$dir/.git/HEAD")
      if [[ $head == ref:\ refs/heads/* ]]; then
        git_branch=" (${head#*/*/})"
      elif [[ $head != '' ]]; then
        git_branch=' (detached)'
      else
        git_branch=' (unknown)'
      fi
      return
    fi
    dir="../$dir"
  done
  git_branch=''
}

cyan=$'\e[1;36m'
magenta=$'\e[1;35m'
green='\e[0;32m'
normal=$'\e[m'
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

# Green local prompt
PS1="$green\]\w/\[$magenta\]\$git_branch\]\[$normal\] $ "

# Cyan remote prompt
# PS1="$cyan\w/\[$magenta\]\$git_branch\[$normal\] $ "

# Enable rbenv shims and autocompletion
eval "$(rbenv init -)"

# Load up autojump
[[ -f ~/.autojump/etc/profile.d/autojump.bash ]] && source ~/.autojump/etc/profile.d/autojump.bash

# Load aliases
if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi

if [ -f ~/.git_aliases ]; then
    . ~/.git_aliases
fi

# Private aliases, can't touch this
if [ -f ~/.private_aliases ]; then
  . ~/.private_aliases
fi

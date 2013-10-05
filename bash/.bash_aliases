# Utility functions
# ---------------------
export GREP_OPTIONS='-i --color=always'

# 'Find file'. Shows matching files paths within the current directory
# Ex: ff shared.js
# => app/assets/javascripts/shared.js
# => public/javascripts/shared.js
# => etc...
function ff {
  find . | grep "$@"
}

# 'Find process'. Doesn't show grep itself.
# Ex: fps redis
function fps() {
  ps aux | grep -v grep | grep $1
}

# Print size of the given directory
# Ex: dirsize app/ => 25M
function dirsize {
  du -skh $1
}

# File count of the current directory
# Ex: filecount => 150
function filecount {
  ls -R | wc -l
}

# Linecount of files in the given directory (defaults to current directory)
# Ex: linecount app/ => 2000
# Ex: linecount
function linecount {
  if [[ -n "$1" ]]
  then
    dir="$1"
  else
    dir=`pwd`
  fi

  find $dir -type f | xargs cat | wc -l
}

# Restart pow
function pow_restart {
  echo "Restarting Pow..."
  touch ~/.pow/restart.txt
}

# Shortcut for opening a file with TextEdit
# Ex: te file.txt
function te {
  open -t $1
}

# Open Dropbox in a finder window
# Exit the terminal unless run with -k
function db {
  open ~/Dropbox
  if [[ "$1" != '-k' ]]
  then
    exit
  fi
}

# Open a directory in a finder window (defaults to current directory)
# Exit the terminal unless run with -k
# Ex: dir
# Ex: dir -k some/folder/
function dir {
  if [[ -n "$2" ]]
  then
    open "$2"
  else
    open .
  fi

  if [[ "$1" != '-k' ]]
  then
    exit
  fi
}

# Generate a .rvmrc file for a project
# Ex: rvmgen projectName
function rvmgen {
  echo "Creating .rvrc with gemset $1"
  echo "rvm use 1.9.3@$1 --create" > .rvmrc
}

# Force remove a file or directory, with confirmation
# Ex: rc file.txt junkDirectory/
# => Are you sure you want to remove file.txt?
# etc...
function rc {
  if [[ -n "$1" ]]
  then
    for var in "$@"
    do
      if [[ -d "$var" ]]
      then
        read -p "Remove directory $var and all of its contents? " -r
      elif [[ -f "$var" ]]
      then
        read -p "Remove file $var? " -r
      fi

      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        rm -rf $var
      else
        echo "Aborted."
      fi
    done
  else
    echo "Usage: rc [file | directory] ..."
  fi
}

# Open specified directory in Sublime for editing, or default to .
# Ex: e project/
# Ex: e
function e {
  if [[ -n "$1" ]]
  then
    subl -n "$1"
  else
    subl -n .
  fi
}

# Open a url in a web browser, because sometimes opening a browser is too much work
# Ex: web github.com/rails/rails
function web {
  if [[ -n "$1" ]]
  then
    open "http://www.$1"
  else
    open "http://www.google.com"
  fi
}

# Misc aliases
# ---------------------
alias c='clear'
alias ls='ls -F'
alias lsa='c; ls -lah'
alias ll='lsa'
alias cls='c; ls'
alias x='exit'
alias xx='exit'
alias ':x'='x'
alias cmake='c; make'
alias ccmake='c; make clean; make'

alias up='cd ../'
alias up.='up'
alias up..='cd ../../'
alias up...='cd ../../../'
alias up....='cd ../../../../'
alias up.....='cd ../../../../../'

# Rails-y shortcuts
# ---------------------
alias be='bundle exec'
alias rake='be rake'
alias cons='c;be rails console'
alias z='zeus'
alias zrake='zeus rake'
alias zc='zeus console'
alias zs='zeus server'


# Typo fixes. If I had a dollar...
# ---------------------
alias clera='clear'
alias qcs='cs'
alias xit='exit'

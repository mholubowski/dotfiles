files=(
  "dotfiles/.vimrc"
  "dotfiles/.vim"
  "dotfiles/.ackrc"
  "dotfiles/.bash_aliases"
  "dotfiles/.bash_profile"
  "dotfiles/.bashrc"
  "dotfiles/.git-completion.sh"
  "dotfiles/.git_aliases"
  "dotfiles/.inputrc"
  "dotfiles/.irbrc"
  "dotfiles/.profile"
)
dir=`pwd`

for file in "${files[@]}"
do
  name=`basename $file`

  if [[ -d "$HOME/$name" ]]; then
    read -p "Directory exists: $HOME/$name Remove? [y/n]: " -r
  elif [[ -f "$HOME/$name" ]]; then
    read -p "File exists: $HOME/$name Remove? [y/n]: " -r
  fi

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf "$name"
  else
    continue
  fi

  ln -s "$dir/$file" "$HOME/$name"
done

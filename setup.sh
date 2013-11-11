files=(
  "dotfiles/vim/.vimrc"
  "dotfiles/vim/.vim"
  "dotfiles/bash/.ackrc"
  "dotfiles/bash/.bash_aliases"
  "dotfiles/bash/.bash_profile"
  "dotfiles/bash/.bashrc"
  "dotfiles/bash/.git-completion.sh"
  "dotfiles/bash/.git_aliases"
  "dotfiles/bash/.inputrc"
  "dotfiles/bash/.irbrc"
  "dotfiles/bash/.profile"
)
dir=`pwd`

for file in "${files[@]}"
do
  name=`basename $file`
  ln -s "$dir/$file" "$HOME/$name"
done

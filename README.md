# Dotfiles
These are the dotfiles I use to configure my development environment. Included are bash aliases/functions, vim configuration + bundles, useful scripts, and more!

## Quick Start
A script is included to automatically symlink configuration files for vim and bash. From your home directory, run:

```
git clone https://github.com/andrewberls/dotfiles.git
cd dotfiles && bash setup.sh
```

You will need to reload your shell after running the script - you can either restart your session or run
`. ~/.bashrc`.

Note: the setup script creates symlinks into the dotfiles repo you cloned - don't delete it when you're done!


## Vim

![](https://dl.dropboxusercontent.com/u/7949088/dotfiles/vim.png)

### Plugins
Plugins are managed with [pathogen.vim](http://www.vim.org/scripts/script.php?script_id=2332).

* [ack.vim](https://github.com/mileszs/ack.vim) - code search (requires [Ack](http://beyondgrep.com/))
* [AutoClose.vim](http://www.vim.org/scripts/script.php?script_id=1849) - Auto-complete braces, parens, etc
* [BufOnly.vim](http://www.vim.org/scripts/script.php?script_id=1071) - Unload all buffers but current one
* [CtrlP](https://github.com/kien/ctrlp.vim) - Fuzzy file search
* [nerdcommenter](http://www.vim.org/scripts/script.php?script_id=1218) - commenting/uncommenting code blocks
* [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658) - File tree browser
* [ragtag](http://www.vim.org/scripts/script.php?script_id=1896) - Mappings for HTML/erb,etc (enhances surround.vim)
* [rainbow-parentheses](https://github.com/kien/rainbow_parentheses.vim) - Color matching parentheses
* [rust.vim](https://github.com/rust-lang/rust.vim) - Bindings for the Rust language
* [Tabular](https://github.com/godlygeek/tabular) - For aligning text
* [surround.vim](http://www.vim.org/scripts/script.php?script_id=1697) - Quoting/parenthesizing made simple
* [vim-coffeescript](https://github.com/kchmck/vim-coffee-script) - Highlighting for CoffeeScript
* [vim-endwise](https://github.com/tpope/vim-endwise) - add 'end' automatically for Ruby blocks
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git integration
* [vim-haml](https://github.com/tpope/vim-haml) - Highlighting for Haml
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) - Indent guides, useful for big chunks of HTML
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) - multiple cursors, a la Sublime Text
* [vim-rspec](https://github.com/thoughtbot/vim-rspec) - Run rspec specs from within Vim
* [vim-ruby](https://github.com/vim-ruby/vim-ruby) - Vim/Ruby configuration
* [vim-powerline](https://github.com/Lokaltog/vim-powerline) - Pretty status line
* [zencoding-vim](https://github.com/mattn/zencoding-vim) - HTML snippet expansion


### Executables

The [bin](http://github.com/andrewberls/dotfiles/tree/master/bin) directory contains a number
of useful executables.

#### ef - 'edit file'

Edits a file in vim from a list of modified files in git.

Consider the following output from `git status` (numbers added):

```
$ git status
Changes not staged for commit:

1) modified:   app/models/follow.rb
2) modified:   config/sunspot.yml
```

`ef 1` will open `app/models/follow.rb` in vim, and `ef 2` will open `config/sunspot.yml`.
If no number is given, the first file will be opened by default.

#### efack - 'edit file from ack'

Similar to `ef` - opens files in vim, except based on [ack](http://beyondgrep.com/) output instead of git.

Example ack session and usage:

```
$ ack TODO
app/assets/javascripts/fileone.js
10: TODO: fix this

app/assets/stylesheets/filetwo.css
22: TODO: this could be better
```

Running `efack 1` will open `app/assets/javascripts/fileone.js` in vim, while
`efack 2` will open `app/assets/stylesheets/filetwo.css`.
If a file number is not specified, the first result file will be edited by default.

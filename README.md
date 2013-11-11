## Dotfiles
These are the dotfiles I use to configure my development environment. Included are bash aliases/functions, vim bundles, script utilities, Sublime Text configuration, and more!

On my Mac, my Sublime configuration files go in `~/Library/Application Support/Sublime Text 2/Packages`

I host them here mostly to keep workstation transitions sane, although there are several aliases and utilities any developer may find useful.

### Quick Start
A script is included to automatically symlink configuration files for vim and bash. From your home directory, run:

```
git clone https://github.com/andrewberls/dotfiles.git
bash dotfiles/setup.sh
```

You will need to reload your shell after running the script - you can either restart your session or run
`. ~/.bashrc`

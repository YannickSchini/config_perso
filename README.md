# Customization

The objective for this repo is to store the different customizations that I appreciate having on my computer.
This allows me to get all I need to setup my stuff easily from any computer.

For convenience, I'll assume that this repo is cloned into `~/dotfiles/`

## Installation

Before installing the dotfiles themselves, please install all the dependencies first.

For ease of installation, I opted to go with [GNU Stow](https://www.gnu.org/software/stow/).
To install these dotfiles, simply run the following lines:

```bash
# Install GNU Stow
sudo apt-get install stow

# Install the dotfiles
cd ~
rm .bashrc .vimrc
cd ~/.dotfiles
stow bash
stow vim
```

# Dependencies

*  [GNU Stow](https://www.gnu.org/software/stow/)
*  [FZF](https://github.com/junegunn/fzf#using-linux-package-managers)
*  [Vim Plug](https://github.com/junegunn/vim-plug)
*  [Powerline fonts](https://github.com/powerline/fonts)
*  [Ripgrep](https://github.com/BurntSushi/ripgrep)
*  [Bat](https://github.com/sharkdp/bat)
*  [fd](https://github.com/sharkdp/fd)
*  [Z](https://github.com/rupa/z)
*  [CoC](https://github.com/neoclide/coc.nvim)'s own dependencies: node, [yarn](https://classic.yarnpkg.com/fr/docs/install/#debian-stable) (or [npm](https://www.npmjs.com/get-npm))
*  [Jedi Language Server](https://pypi.org/project/jedi/) as a Python Language Server

# TODO

*  Find a way to perform a commit-per-commit code review without leaving Vim
*  Automate the installation of all dependencies (git, fzf, fd, rg, etc)
*  Create aliases for Docker usage (image rm, container rm, etc)
*  ( Handle vaulted files properly (see diffs, handle conflicts, etc) )

# TO CHECK

-

# DONE

*  Add shortcuts for easy handling of git conflicts within Vim
*  Handle the sourcing of the dotfiles differently (for vim and bash) with symbolic linking to allow handling of the coc-config file (take a look at GNU Stow ?)
*  Test the use of the Jedi Language Server for Python instead of the Microsoft one
*  Check for "git gutter"-like features in CoC: maybe vim-signify plugin isn't required anymore ?
*  Finish the work around Python code: create latest keymaps for go to definition & other interesting features
*  Do so :Rg only looks through all the files' content and not their name
*  See how to bind the autocomplete on tab
*  Handle interruptions in the 'of' and 'ff' functions better
*  Improve vim buffer handling with new keymaps

Author: Yannick SCHINI

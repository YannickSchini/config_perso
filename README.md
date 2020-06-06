# Customization

The objective for this repo is to store the different customizations that I appreciate having on my computer.
This allows me to get all I need to setup my stuff easily from any computer.

For convenience, I'll assume that this repo is cloned into `~/.custom/`

## Bash aliases

The file `bash_aliases.sh` contains my bash aliases (as expected).
In order for them to be loaded properly, add the following snippet to `~/.bashrc`:

```bash
# Add bash aliases.
if [ -f ~/.custom/bash_aliases.sh ]; then
    source ~/.custom/bash_aliases.sh
fi
```
## Vim config

I'm trying to switch to vim as one of my core tools, so I'll also add my Vim config here as well.
In order for it to load properly, just add the following snippet to your `.vimrc` file.

```bash
try
  source ~/.custom/settings.vim
  source ~/.custom/plugins.vim
catch
endtry
```

# Dependencies

*  [FZF](https://github.com/junegunn/fzf#using-linux-package-managers)
*  [Vim Plug](https://github.com/junegunn/vim-plug)
*  [Powerline fonts](https://github.com/powerline/fonts)
*  [Ripgrep](https://github.com/BurntSushi/ripgrep)

# TODO

*  List all dependencies explicitely
*  Try out new fun looking tools (namely fzf, fd, rg, z and some Vim plugins like incsearch, fzf, vim fugitive, nerdtree, etc)
*  Automate the addition to the .bashrc file (with a Makefile ? A bash script ?)
*  Automate the installation of all dependencies (git, fzf, fd, rg, etc)

Author: Yannick SCHINI


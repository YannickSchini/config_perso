# Customization

The objective for this repo is to store the different customizations that I appreciate having on my computer.
This allows me to get all I need to setup my stuff easily from any computer.

For convenience, I'll assume that this repo is cloned into `~/.custom/`

## Aliases

The file `bash_aliases.sh` contains my bash aliases (as expected).
In order for them to be loaded properly, add the following snippet to `~/.bashrc`:

```bash
# Add bash aliases.
if [ -f ~/.custom/bash_aliases.sh ]; then
    source ~/.custom/bash_aliases.sh
fi
```

## TODO

*  Add .vimrc configuration
*  Try out new fun looking tools (namely fzf, fd, rg, z and some Vim plugins)
*  Automate the addition to the .bashrcfile (with a Makefile ? A bash script ?)
*  Automate the installation of all dependencies (git, fzf, fd, rg, etc)

Author: Yannick SCHINI


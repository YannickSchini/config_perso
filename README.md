# Customization

The objective for this repo is to store the different customizations that I appreciate having on my computer.
This allows me to get all I need to setup my stuff easily from any computer.

For convenience, I'll assume that this repo is cloned into `~/.custom/`

## Bash aliases

The file `bash_aliases.sh` contains my bash aliases (as expected).
In order for them to be loaded properly, add the following snippet to `~/.bashrc`:

```bash
# Add bash config.
if [ -d ~/dotfiles/ ]; then
    for f in $(fd . ~/dotfiles --max-depth 1 --extension sh); do source $f; done
fi
```
## Vim config

I'm trying to switch to vim as one of my core tools, so I'll also add my Vim config here as well.
In order for it to load properly, just add the following snippet to your `.vimrc` file.

```bash
for f in split(glob('~/dotfiles/*.vim'), '\n')
    exe 'source' f
endfor
```

# Dependencies

*  [FZF](https://github.com/junegunn/fzf#using-linux-package-managers)
*  [Vim Plug](https://github.com/junegunn/vim-plug)
*  [Powerline fonts](https://github.com/powerline/fonts)
*  [Ripgrep](https://github.com/BurntSushi/ripgrep)
*  [Bat](https://github.com/sharkdp/bat)
*  [fd](https://github.com/sharkdp/fd)
*  [Z](https://github.com/rupa/z)

# TODO

*  If the second member of a pair of symbols (brackets, parenthesis) is to the right of the opening one when the first one is deleted, delete the second automatically
*  Autocomplete, proper formatting & indentation for Python code
*  Find a way to perform a commit-per-commit code review without leaving Vim
*  Handle vaulted files properly (see diffs, handle conflicts, etc)
*  Automate the addition to the .bashrc file (with a Makefile ? A bash script ?)
*  Automate the installation of all dependencies (git, fzf, fd, rg, etc)

# TO CHECK

*  Check that :Rg only looks through all the files' content and not their name

# DONE

*  See how to bind the autocomplete on tab
*  Handle interruptions in the 'of' and 'ff' functions better
*  Improve vim buffer handling with new keymaps

Author: Yannick SCHINI

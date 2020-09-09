#!/bin/bash

# Open File
function of() {
    if [ -z "$1" ]
    then
        if [ -x "$(command -v bat)" ]; then
            FILES=$(fzf -m --reverse --preview "bat --style=numbers,changes --theme 'Monokai Extended' --color=always {}") && vim "$FILES"
        else
            FILES=$(fzf -m --reverse --preview "cat {}") && vim "$FILES"
        fi
    else
        vim $1
    fi
}

# Find file based on snippet
function ff() {
    # TODO: check that VIM is opened in the right directory (the root of the git folder when available, the directory of the file when not in a git repo)
    if [ -z "$1" ]
    then
        echo "Find File utility, usage: ff <string to be searched>"
    else
        if [ -x "$(command -v rg)" ] && [ -x "$(command -v bat)" ] && [ -x "$(command -v fzf)" ]; then
            FILES=$(rg $1 --files-with-matches . | fzf -m --reverse --preview "bat --style=numbers,changes --theme 'Monokai Extended' --color=always {}") && vim "$FILES"
        elif [ -x "$(command -v rg)" ] && [ ! -x "$(command -v bat)" ] && [ -x "$(command -v fzf)" ]; then
            FILES=$(rg $1 --files-with-matches . | fzf -m --reverse --preview "cat {}") && vim "$FILES"
        else
            echo "Please install the required libraries (ripgrep, fzf)"
        fi
    fi
}

# Easily startup python venv
alias venv='source venv/bin/activate'

# Misc
alias ll='ls -lah'

# FZF config to make it use ripgrep instead of find
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden -g "!{.git,venv}"'
export FZF_DEFAULT_OPTS='--bind shift-up:preview-up,shift-down:preview-down,page-up:preview-page-up,page-down:preview-page-down'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ -x "$(command -v bat)" ]; then
  alias cat='bat --style=numbers,changes --theme "Monokai Extended"'
fi

# For z-jump to work
. ~/z/z.sh

export EDITOR=vim

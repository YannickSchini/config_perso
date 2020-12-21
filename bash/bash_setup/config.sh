#!/bin/bash

# Open File
function of() {
    if [ -z "$1" ]
    then
        if [ -x "$(command -v bat)" ]; then
            FILES=$(fzf -m --reverse --preview "bat --style=numbers,changes --theme 'Monokai Extended' --color=always {}") && vim $FILES
        else
            FILES=$(fzf -m --reverse --preview "cat {}") && vim $FILES
        fi
    else
        vim $@
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
            FILES=$(rg $1 --files-with-matches . | fzf -m --reverse --preview "bat --style=numbers,changes --theme 'Monokai Extended' --color=always {}") && vim $FILES
        elif [ -x "$(command -v rg)" ] && [ ! -x "$(command -v bat)" ] && [ -x "$(command -v fzf)" ]; then
            FILES=$(rg $1 --files-with-matches . | fzf -m --reverse --preview "cat {}") && vim $FILES
        else
            echo "Please install the required libraries (ripgrep, fzf)"
        fi
    fi
}

# Start my development environment
function dev() {
    if [[ -d ./venv/ ]]
    then
        source ./venv/bin/activate
    fi
    tmux has-session -t dev
    if [ $? != 0 ]
    then
            tmux new-session -s dev -n vim -d
            tmux send-keys -t dev 'of' C-m
            tmux split-window -v -p 10 -t dev
            tmux new-window -n bash -t dev
            tmux select-window -t dev:1
            tmux select-pane -t dev:1.0
    fi
    tmux attach -t dev
}

# Easily startup python venv
alias venv='source venv/bin/activate'

# Misc
alias ll='ls -lah'
alias vimbegood='docker run -it --rm brandoncc/vim-be-good:latest'

# FZF config to make it use ripgrep instead of find
export FZF_DEFAULT_COMMAND='rg --files --hidden -g"!{.git}"'
export FZF_DEFAULT_OPTS='--bind shift-up:preview-up,shift-down:preview-down,page-up:preview-page-up,page-down:preview-page-down'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ -x "$(command -v bat)" ]; then
  alias cat='bat --style=numbers,changes --theme "Monokai Extended"'
  alias catcp='bat --style=grid --theme "Monokai Extended"'
fi

if [ -x "$(command -v fdfind)" ]; then
  alias fd='fdfind'
fi

# For z-jump to work
. ~/z/z.sh

export EDITOR=vim

# Powerline usage
if [ -f /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh ]; then
  source /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh 
fi

#!/bin/bash

# Open File
function of() {
    if [ -z "$1" ]
    then
        if [ -x "$(command -v bat)" ]; then
            vim $(fzf --reverse --preview "bat --style=numbers,changes --theme 'Monokai Extended' --color=always {}")
        else
            vim $(fzf --reverse --preview "cat {}")
        fi
    else
        vim $1
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

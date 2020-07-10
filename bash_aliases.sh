#!/bin/bash

# Git aliases
alias gst='git status'
alias gci='git commit -m'
alias glola='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'
alias gpull='git pull --prune --rebase'
alias grbi='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias ga='git add'
alias gbr='git branch'
alias gcob='git checkout -b'

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete gci _git_commit
  __git_complete glola _git_log
  __git_complete gpull _git_pull
  __git_complete grbi _git_rebase
  __git_complete grba _git_rebase
  __git_complete grbc _git_rebase
  __git_complete ga _git_add
  __git_complete gbr _git_branch
else
  echo "Error loading git completions"
fi

# Easily startup python venv
alias venv='source venv/bin/activate'

# Misc
alias ll='ls -lah'

# FZF config to make it use ripgrep instead of find
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden -g "!{.git,venv}"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ -x "$(command -v bat)" ]; then
  alias cat='bat --theme "Monokai Extended"'
fi

# Git CheckOut
#alias gco='git branch -a | fzf | cut -d / -f 3 | xargs git checkout'
function gco() {
    if [ -z "$1" ]
    then
        git branch -a | fzf -i --height 30% | cut -d / -f 3 | xargs git checkout
    else
        git checkout $1
    fi
}

# Open File
# alias of='vim $(rg --files --no-ignore-vcs --hidden -g "!{.git,venv}" . | fzf --reverse --preview "cat {}")'
function of() {
    if [ -z "$1" ]
    then
        vim $(fzf --reverse --preview "cat {}")
    else
        vim $1
    fi
}

# Remove branches
# alias gbrd='git branch | fzf -m | xargs git branch -D'
function gbrd() {
    if [ -z "$1" ]
    then
        git branch | fzf -m | xargs git branch -D
    elif [ "$1" = "merged" ]
    then
        git branch --merged | rg -v "(^\*|master)" | xargs git branch -D
    else
        git branch -D "$1"
    fi
}

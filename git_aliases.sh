#!/bin/bash

# ALIASES

# Misc
alias gst='git status'
alias gci='git commit'
alias grb='git rebase'
alias ga='git add'
alias gbr='git branch'
alias gcob='git checkout -b'

# Distant repo
alias gf='git fetch'
alias gpush='git push'
alias gpfwl='git push --force-with-lease'
alias gpull='git pull --prune --rebase'

# Git logging
alias gsl='git log --oneline --decorate -40'
alias gsla='git log --oneline --decorate --graph --all -25'
alias gslap='git log --oneline --decorate --graph --all --numstat'

# Git diff
alias gd='git diff'
alias gdm='git diff master'
alias gdc='git diff HEAD^'

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete gci _git_commit
  __git_complete grb _git_rebase
  __git_complete gbr _git_branch
  __git_complete ga _git_add
  __git_complete gf _git_fetch
  __git_complete gpush _git_push
  __git_complete gpfwl _git_push
  __git_complete gpull _git_pull
  __git_complete gsl _git_log
  __git_complete gsla _git_log
  __git_complete gslap _git_log
else
  echo "Error loading git completions"
fi

# FUNCTIONS

function gco() {
    if [ -z "$1" ]
    then
        git branch -a | fzf -i --height 30% | cut -d / -f 3- | xargs git checkout
    else
        git checkout $1
    fi
}

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

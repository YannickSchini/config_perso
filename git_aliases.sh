#!/bin/bash

# Aliases
alias gst='git status'
alias gci='git commit'
alias gf='git fetch'
alias gpull='git pull --prune --rebase'
alias grbi='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias ga='git add'
alias gbr='git branch'
alias gcob='git checkout -b'
alias gsl='git log --oneline --decorate -30'
alias gsla='git log --oneline --decorate --graph --all -30'
alias gslap='git log --oneline --decorate --graph --all --numstat'

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete gci _git_commit
  __git_complete glola _git_log
  __git_complete glog _git_log
  __git_complete gf _git_fetch
  __git_complete gpull _git_pull
  __git_complete grbi _git_rebase
  __git_complete grba _git_rebase
  __git_complete grbc _git_rebase
  __git_complete ga _git_add
  __git_complete gbr _git_branch
else
  echo "Error loading git completions"
fi

# Functions
function gco() {
    if [ -z "$1" ]
    then
        git branch -a | fzf -i --height 30% | cut -d / -f 3 | xargs git checkout
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

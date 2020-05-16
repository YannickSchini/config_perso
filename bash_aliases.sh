#!/bin/bash

# Git aliases
alias gco='git checkout'
alias gst='git status'
alias gci='git commit'
alias gbr='git branch'
alias glola='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'
alias gpull='git pull --prune --rebase'
alias grbi='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias ga='git add'

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete gco _git_checkout
  __git_complete gst _git_status
  __git_complete gci _git_commit
  __git_complete gbr _git_branch
  __git_complete glola _git_log
  __git_complete gpull _git_pull
  __git_complete grbi _git_rebase
  __git_complete grba _git_rebase
  __git_complete grbc _git_rebase
  __git_complete ga _git_add
else
  echo "Error loading git completions"
fi

alias gbr='git branch -a | fzf'
alias gco='git branch -a | fzf | xargs git checkout'

# Easily startup python venv
alias venv='source venv/bin/activate'


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

#alias gco='git branch -a | fzf | cut -d / -f 3 | xargs git checkout'
alias gbrd='git branch | fzf -m | xargs git branch -D'

# Easily startup python venv
alias venv='source venv/bin/activate'

# Misc
alias ll='ls -lah'

# FZF config to make it use ripgrep instead of find
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden -g "!{.git,venv}"'

# Open file in Vim with FZF
alias of='vim $(rg --files --no-ignore-vcs --hidden -g "!{.git,venv}" . | fzf --reverse --preview "cat {}")'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# alias cat='bat --theme "Monokai Extended"'
if [ -x "$(command -v bat)" ]; then
  alias cat='bat --theme "Monokai Extended"'
fi

function gco() {
    if [ -z "$1" ]
    then
        git branch | fzf -i --height 30% | xargs git checkout
    else
        git checkout $1
    fi
}

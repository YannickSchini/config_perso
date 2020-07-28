#!/bin/bash

function ggrep() {
    if [ -z "$1" ]
    then
        echo "Usage: ggrep <ARGUMENT>"
    else
        git grep --textconv $1 | fzf
    fi
}

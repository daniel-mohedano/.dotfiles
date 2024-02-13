#!/bin/sh

# Path update and defaults
PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts"
export PATH="$PATH:$HOME/julia-1.9.1/bin"
export EDITOR="nvim"
export BROWSER="firefox"

[ -f ~/.bashrc ] && source ~/.bashrc

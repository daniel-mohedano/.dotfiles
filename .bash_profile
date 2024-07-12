#!/bin/sh

# Path update and defaults
PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts"
export EDITOR="nvim"
export BROWSER="firefox"

[ -f ~/.bashrc ] && source ~/.bashrc

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/dan/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/dan/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

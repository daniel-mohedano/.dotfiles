#!/bin/sh

# Path update and defaults
PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"

[ -f ~/.bashrc ] && source ~/.bashrc
. "$HOME/.cargo/env"

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
*:/Users/daniel.mohedano/.juliaup/bin:*) ;;
*)
    export PATH=/Users/daniel.mohedano/.juliaup/bin${PATH:+:${PATH}}
    ;;
esac
# <<< juliaup initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

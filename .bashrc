# History control
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Settings
[[ $- == *i* ]] && stty -ixon # Disable ctrl-s and ctrl-q, but check for interactive shell first
shopt -s histappend           # Append history
shopt -s checkwinsize         # Resize window correctly after each command
shopt -s autocd               # Auto cd into directory just by typing the directory name

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# source aliases
[ -f ~/.aliases ] && source ~/.aliases

# custom configurations
[ -f ~/.config-tfm ] && source ~/.config-tfm
#[ -f ~/.config-work ] && source ~/.config-work

# Prompt configuration
PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'
PS1='\[\e[90m\][\u@\h\[\e[0m\] \[\e[92;1m\]\w\[\e[0;90m\]](\[\e[33;3m\]${PS1_CMD1}\[\e[0;90m\])\[\e[0m\]\$ '
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

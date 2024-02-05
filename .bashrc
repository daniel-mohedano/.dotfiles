# History control
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Settings
stty -ixon              # Disable ctrl-s and ctrl-q
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd         # Auto cd into directory just by typing the directory name

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Ubuntu specific
alias sa="sudo apt-get"

# Color related
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -alhN --color=auto --group-directories-first'

# Other aliases
alias mkd='mkdir -pv'
alias ..="cd .."
alias cl="clear"
alias si="source /opt/intel/oneapi/setvars.sh"

# Prompt configuration
PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\[\e[90m\][\u@\h\[\e[0m\] \[\e[92;1m\]\w\[\e[0;90m\]](\[\e[33;3m\]${PS1_CMD1}\[\e[0;90m\])\[\e[0m\]\$ '

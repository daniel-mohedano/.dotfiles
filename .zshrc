# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# custom configurations
#[ -f ~/.config-tfm ] && source ~/.config-tfm
[ -f $HOME/.config-work ] && source $HOME/.config-work

# starship
eval "$(starship init zsh --print-full-init)"

# exports
export EDITOR="nvim"

# path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# enable vim mode
bindkey -v

plugins=(
    colored-man-pages
    git
    jsontools
#		ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting
		zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
path=('/Users/daniel.mohedano/.juliaup/bin' $path)
export PATH
# <<< juliaup initialize <<<

# User configuration
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
. "$HOME/.cargo/env" 
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.theme ] && source ~/.theme

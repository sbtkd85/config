# Setup history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
setopt extended_history
setopt hist_reduce_blanks

# Other configs
unsetopt beep
setopt complete_aliases # Don't expand aliases before completion

# Vi mode
bindkey -v

# Home and End keys
bindkey "^[OF" end-of-line # End key
#bindkey "^[[8~" end-of-line # End key
bindkey "^[OH" beginning-of-line # Home key
#bindkey "^[[7~" beginning-of-line # Home key
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line

# Delete key
bindkey "[3~" delete-char

# Reverse-i-search of history
bindkey "^R" history-incremental-search-backward

# Backspace work properly
bindkey "^?" backward-delete-char

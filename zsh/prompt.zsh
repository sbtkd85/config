# This file sets a dynamic prompt based on both the current
# working directory and user

# Enable colors
autoload -U colors terminfo
colors

# Enable subsitution in prompt
setopt prompt_subst

set_prompt() {
  # Setup easy aliases for colors
  for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_BOLD_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
  done
  PR_NO_COLOR="%{$terminfo[sgr0]%}"

  # Setup colors based on user
  if [[ $UID -ge 1000 ]]; then # Normal users
    eval PR_OPEN='${PR_GREEN}[${PR_NO_COLOR}'
    eval PR_CLOSE='${PR_GREEN}]${PR_NO_COLOR}'
    eval PR_USER='${PR_GREEN}%{$%}${PR_NO_COLOR}'
  elif [[ $UID -eq 0 ]]; then # sudo or su
    eval PR_OPEN='${PR_RED}[${PR_NO_COLOR}'
    eval PR_CLOSE='${PR_RED}]${PR_NO_COLOR}'
    eval PR_USER='${PR_RED}%{$%}${PR_NO_COLOR}'
  fi

  # Set prompt to /first/three/dirs...last/three/dirs
  PROMPT="${PR_OPEN}%6(~:%-3~...:)%3~${PR_CLOSE} ${PR_USER} "
}
precmd(){
  title "zsh" "%n@%M" "%55<...<%~"
  set_prompt
}

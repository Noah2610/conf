export TERM="screen-256color"
export EDITOR="vim"
export VISUAL="$EDITOR"
export PS1="\[\033[32m\]\[\033[1m\]\u\[\033[0m\]\[\033[32m\]@\h\[\033[0m\]:\[\033[34m\]\w\[\033[0m\] \[\033[1m\]$\[\033[0m\] "
export PS2="  \[\033[34m\]\[\033[1m\]>\[\033[0m\] "
alias ls="ls --color=auto"
set -o vi
stty -ixon

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Set history file size.
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE
# Append to the history file, don't overwrite it.
shopt -s histappend
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alFX'
alias la='ls -AX'
alias l='ls -CF'

export PATH="$HOME/bin:$PATH"
export PS1="\[\033[32m\]\[\033[1m\]\u\[\033[0m\]\[\033[32m\]@\h\[\033[0m\]:\[\033[34m\]\w\[\033[0m\] \[\033[1m\]\\$\[\033[0m\] "
export PS2="  \[\033[34m\]\[\033[1m\]>\[\033[0m\] "
export TERM="screen-256color"
export EDITOR="vim"
export VISUAL="$EDITOR"
export LESS="-Ri"
alias ls="ls --color=auto"
set -o vi
stty -ixon

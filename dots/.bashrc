# Append to the history file, don't overwrite it.
shopt -s histappend
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
# Set history file size.
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
export HISTTIMEFORMAT='%Y-%m-%d %T '

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
export PS1="\[\033[32m\]\[\033[1m\]\u\[\033[0m\]\[\033[32m\]@\h\[\033[0m\]:\[\033[34m\]\w\[\033[0m\] \[\033[1m\]\\$\[\033[0m\] "
export PS2="  \[\033[34m\]\[\033[1m\]>\[\033[0m\] "
export TERM="screen-256color"
export EDITOR="vim"
export VISUAL="$EDITOR"
export LESS="-Ri"
set -o vi
stty -ixon

if command -v ranger &> /dev/null; then
    function ranger-cd {
        tempfile="$(mktemp -t tmp.XXXXXX)"
        /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
        test -f "$tempfile" &&
            [ "$(cat -- "$tempfile")" != "$(echo -n "$(pwd)")" ] &&
            cd -- "$(cat "$tempfile")"
            rm -f -- "$tempfile"
    }
    alias ranger="ranger-cd"
    alias ra="ranger"
fi

# Aliases
alias ls="ls --color=auto"
alias ll="ls -alFX"
alias la="ls -AX"
alias l="ls -CF"
alias sbash="source ~/.bashrc"
alias ebash="$EDITOR ~/.bashrc"
alias e${EDITOR}="$EDITOR ~/.${EDITOR}rc"
export CPPATH_FILE="$HOME/.cppath"
alias cppath='echo -n "$( pwd )" > $CPPATH_FILE'
alias cdpath='cd "$( cat $CPPATH_FILE )"'
! command -v mkdatedir &> /dev/null && \
    alias mkdatedir='mkdir $( date "+%Y-%m-%d" )'
    alias cddatedir='dirname="$( date "+%Y-%m-%d" )"; if [ -d "$dirname"  ]; then cd "$dirname"; unset dirname; else unset dirname; false; fi'

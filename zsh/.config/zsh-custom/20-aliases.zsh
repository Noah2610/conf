# vim -> nvim
command -v nvim &> /dev/null \
    && alias vim="nvim"
# vimw -> Vimwiki
command -v vim &> /dev/null \
    && [ -d "${HOME}/.vim/plugged/" ] \
    && alias vimw="vim '+VimwikiIndex'"

# Always use color with pacman and yay
alias pacman="pacman --color=always"
alias yay="yay --color=always"

# Configs
alias ezsh="$EDITOR $HOME/.zshrc"
alias evim="$EDITOR $HOME/.vimrc"
alias rzsh="ranger $HOME/.config/zsh-custom"
alias ri3="ranger $HOME/.config/i3"
alias szsh="source $HOME/.zshrc"

# ls
function _aliases_ls {
    # The first available app is used as the `ls` replacement.
    local ls_replacements=(
        "exa"
        "lsd"
    )
    local ls_alias=
    for ls_repl in "${ls_replacements[@]}"; do
        command -v "$ls_repl" &> /dev/null \
            && { ls_alias="$ls_repl"; break; }
    done
    [ -n "$ls_alias" ] && alias ls="$ls_alias"

    alias ll="ls -l"
    alias la="ls -la"

    # Append -h to vanilla ls
    [ -z "$ls_alias" ] && {
        alias ll="ls -lh"
        alias la="ls -lah"
    }
}; _aliases_ls; unfunction _aliases_ls

# git
alias gis="git status"
alias gid="git diff"
alias gids="git diff --staged"
alias gil="git log"
alias gi1="git log --oneline"
alias gia="git add"
alias gic="git commit -m"
alias gicm="git commit --amend"
alias gica="git add -A; git commit -m"
alias gicam="git add -A; git commit --amend"
alias gip="git push"
alias gipf="git push --force"
alias gipu="git pull"
alias gipuf="git pull --force"
alias gipup="git push -u"
alias gich="git checkout"
alias gib="git branch"
alias gitree="git log --oneline --decorate --graph --all"

# cd
alias cd="cd_then_source"

# ranger
alias ra="ranger"
alias rah="ranger $HOME"
alias rad="ranger $HOME/Downloads"
alias rap="ranger $HOME/Projects"
alias rag="ranger $HOME/Games"
alias rac="ranger $HOME/.config"
alias raC="ranger $HOME/conf"
alias raz="ranger $HOME/.config/zsh-custom"

# misc
alias psa="ps aux | grep -i"
alias cppa="cppath"
alias cdpa="cdpath"
alias vall="vimall"
# thunderbird date format
command -v "thunderbird" &> /dev/null \
    && alias thunderbird='LC_TIME="C" thunderbird'
# cat -> bat
command -v "bat" &> /dev/null \
    && alias cat="bat"
# waterfox -> waterfox-classic
command -v "waterfox-classic" &> /dev/null \
    && alias waterfox="waterfox-classic"
# _ -> nohist
alias _="nohist"

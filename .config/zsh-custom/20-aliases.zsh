# Configs
alias ezsh="$EDITOR $HOME/.zshrc"
alias evim="$EDITOR $HOME/.vimrc"
alias rzsh="ranger $HOME/.config/zsh-custom"
alias ri3="ranger $HOME/.config/i3"
alias szsh="source $HOME/.zshrc"

# Git
alias gis="git status"
alias gip="git push"
alias gipf="git push --force"
alias gipu="git pull"
alias gipuf="git pull --force"
alias gipup="git push -u"
alias gif="git fetch --all"
alias gica="git add -A; git commit -m"
alias gicam="git add -A; git commit --amend"
alias gil="git log"
alias gi1="git log --oneline"
alias gitree="git log --oneline --decorate --graph --all"
alias gich="git checkout"

# Ranger
alias ra="ranger"
alias rah="ranger $HOME"
alias rad="ranger $HOME/Downloads"
alias rac="ranger $HOME/.config"
alias raC="ranger $HOME/conf"
alias rai3="ranger $HOME/.config/i3"
alias ram="ranger $HOME/misc"

# misc
alias psa="ps aux | grep -i"
alias cdpath='cd "$( xclip -o -selection clipboard )"'
alias vall='if [ -f "bin/vimall" ]; then bin/vimall; elif [ -f "bin/vimall.sh" ]; then bin/vimall.sh; else false; fi'

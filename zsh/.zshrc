# ====================
# ENVIRONMENT VARIABLES
# PATH
export PATH="/usr/games:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="${HOME}/go/bin:${PATH}"
export PATH="${HOME}/.gem/ruby/2.7.0/bin:${PATH}"
export PATH="${HOME}/.yarn/bin:${PATH}"
export PATH="${HOME}/node_modules/.bin:${PATH}"
export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.garden/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
export PATH="node_modules/.bin:${PATH}"
export PATH="bin:${PATH}"

# ====================
# ZSH
function _init_oh_my_zsh {
    # Path to your oh-my-zsh installation.
    local ZSH="${HOME}/.oh-my-zsh"
    # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    local ZSH_THEME="robbyrussell"
    local UPDATE_ZSH_DAYS=7
    local DISABLE_AUTO_UPDATE="true"
    local ENABLE_CORRECTION="true"
    local COMPLETION_WAITING_DOTS="true"
    # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
    local HIST_STAMPS="yyyy-mm-dd"
    ## Add "/" on auto-complete to ".." and "."
    zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'
    # zsh plugins
    local plugins=(
        colored-man-pages
        docker
        docker-compose
        # gem
        git
        # rails
        # ruby
        rust
        z
        # fzf
    )
    # Path to custom zsh directory
    local ZSH_CUSTOM="$HOME/.config/zsh-custom"

    # Source oh-my-zsh
    [ -f "${ZSH}/oh-my-zsh.sh" ] && source "${ZSH}/oh-my-zsh.sh"

    # git prompt
    export ZSH_THEME_GIT_PROMPT_CLEAN=""
    export ZSH_THEME_GIT_PROMPT_DIRTY="%b%F{white}|%f%B%F{red}x%f"
    export ZSH_THEME_GIT_PROMPT_PREFIX="<%B%F{cyan}"
    export ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b>"
}; _init_oh_my_zsh; unfunction _init_oh_my_zsh

# source ~/.profile
[ -f "${HOME}/.profile" ] && source "${HOME}/.profile"

# ====================
# ENVIRONMENT VARIABLES (again)
# zsh history settings
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=50000
export HISTFILESIZE=900000
export SAVEHIST="$HISTFILESIZE"
# ranger
export RANGER_LOAD_DEFAULT_RC="true"  # Load default ranger config file (default = true)
# less
#   -R Make search case-insensitive
#   -i Process ANSI color sequences
#   -S Don't wrap lines
export LESS="-RiS"

# ====================
# MISC SETTINGS
# Disable <C-s> shell freeze
stty -ixon

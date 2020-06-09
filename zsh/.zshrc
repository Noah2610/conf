# ====================
# ENVIRONMENT VARIABLES
# PATH
export PATH="/usr/games:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="${HOME}/node_modules/.bin:${PATH}"
export PATH="${HOME}/.gem/ruby/2.6.0/bin:${PATH}"
export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.garden/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
export PATH="node_modules/.bin:${PATH}"
export PATH="bin:${PATH}"
# zsh history settings
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=100000
export SAVEHIST="$HISTSIZE"
# ranger
export RANGER_LOAD_DEFAULT_RC="true"  # Load default ranger config file (default = true)
# less
export LESS="-Ri"  # (-R) Make search case-insensitive; (-i) Process ANSI color sequences

# ====================
# ZSH
function _init_oh_my_zsh {
    # Path to your oh-my-zsh installation.
    local ZSH="${HOME}/.oh-my-zsh"
    # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    local ZSH_THEME="robbyrussell"
    local UPDATE_ZSH_DAYS=7
    local ENABLE_CORRECTION="true"
    local COMPLETION_WAITING_DOTS="true"
    # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
    local HIST_STAMPS="yyyy-mm-dd"
    ## Add "/" on auto-complete to ".." and "."
    zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'
    # zsh plugins
    local plugins=(
        cargo
        colored-man-pages
        docker
        docker-compose
        # gem
        git
        # rails
        # ruby
        rust
        # z
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
# MISC SETTINGS
# Disable <C-s> shell freeze
stty -ixon

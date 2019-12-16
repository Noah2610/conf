# Launch into new tmux session instead, which will in turn start zsh.
# This stops any further execution of this file.
# command -v "tmux" &> /dev/null && [ -z "$TMUX" ] && exec tmux new-session

# If you come from bash you might have to change your $PATH.
export PATH="bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.local/bin:/usr/local/bin:/usr/games:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it"ll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.config/zsh-custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  cargo
  colored-man-pages
  docker
  docker-compose
  gem
  git
  # rails
  ruby
  rust
)

[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh
[ -f "$HOME/.profile" ]    && source $HOME/.profile

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

## Disable <C-s> shell freeze
stty -ixon

### Environment variables
## zsh history settings
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST="$HISTSIZE"
## ranger
export RANGER_LOAD_DEFAULT_RC=true  # Load default ranger config file (default = true)
## git prompt
export ZSH_THEME_GIT_PROMPT_CLEAN=""
export ZSH_THEME_GIT_PROMPT_DIRTY="%b%F{white}|%f%B%F{red}x%f"
export ZSH_THEME_GIT_PROMPT_PREFIX="<%B%F{cyan}"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b>"
## Disable Athame
export ATHAME_ENABLED=0
## less settings
export LESS="-Ri"  # (-R) Make search case-insensitive; (-i) Process ANSI color sequences
## Thunderbird uses this locale
export LC_TIME="de_AT.utf8"

### Misc
## Prompt theme helper
#autoload -Uz promptinit
#promptinit

## Add "/" on auto-complete to ".." and "."
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

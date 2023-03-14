# Remap CapsLock to Escape for virtual consoles
[[ "$( tty )" =~ "tty" ]] \
    && echo "keycode 58 = Escape" | loadkeys -

# Set date-time language
export LC_TIME="C"

export XDG_CONFIG_HOME="${HOME}/.config"

# Cargo env
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Ruby / rvm env
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GEM_HOME="$HOME/.gem"

# NodeJS / nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

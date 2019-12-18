# Remap CapsLock to Escape for virtual consoles
echo "keycode 58 = Escape" | loadkeys -

# Cargo env
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Ruby / rvm env
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

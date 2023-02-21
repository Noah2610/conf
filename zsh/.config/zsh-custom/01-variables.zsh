export EDITOR="$( command -v nvim &> /dev/null && echo -n 'nvim' || echo -n 'vim' )"
export VISUAL="$EDITOR"
export BROWSER="firefox"
export PAGER="less"

# git pager
export GIT_PAGER="$PAGER"
command -v "delta" &> /dev/null \
    && export GIT_PAGER="delta"

# Calcurse calendar
#PROFILE = desktop-manjaro || h77m-arch || acer
export CALCURSE_CALENDAR='personal'
#PROFILE = aware-desktop
##export CALCURSE_CALENDAR='work'

# cdpath
export CDPATH_FILE="${HOME}/.cdpath"
export AUTO_CDPATH=1

# fzf default search command (ripgrep)
command -v "fd" &> /dev/null \
    && export FZF_DEFAULT_COMMAND="fd --type f"

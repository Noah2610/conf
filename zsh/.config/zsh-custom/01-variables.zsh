export EDITOR="$( command -v nvim &> /dev/null && echo -n 'nvim' || echo -n 'vim' )"
export VISUAL="$EDITOR"
export BROWSER="firefox"
export PAGER="less"

# git pager
export GIT_PAGER="$PAGER"
command -v "delta" &> /dev/null \
    && export GIT_PAGER="delta"

# cdpath
[ -z "$CDPATH_FILE" ] && export CDPATH_FILE="${HOME}/.cdpath"
[ -z "$AUTO_CDPATH" ] && export AUTO_CDPATH=1

# fzf default search command (ripgrep)
command -v "fd" &> /dev/null \
    && export FZF_DEFAULT_COMMAND="fd --type f"

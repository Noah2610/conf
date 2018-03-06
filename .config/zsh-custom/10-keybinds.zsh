## <S-tab> on auto-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

## Set vi mode
bindkey -v
## Set escape key timeout to 0.25 seconds
export KEYTIMEOUT=25

## Set <C-r> for backward search
bindkey '^R' history-incremental-search-backward
## Set <C-i> for forward search
bindkey '^S' history-incremental-search-forward

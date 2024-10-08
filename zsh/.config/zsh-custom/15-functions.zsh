# source a 'zshrc' file, if one is present in the current directory
function source_zshrc {
    [ -f "./zshrc" ] && source ./zshrc
}

# Try to source zshrc file if available
source_zshrc

# Change directory as usual with cd but execute function 'source_zshrc' afterwards
function cd_then_source {
    \cd $@
    exit_code=$?
    source_zshrc
    return $exit_code
}

# cd into directory with the current date
function cddatedir {
    local _parent="$1"
    [ -z "$_parent" ] && _parent="."
    local _dir="${_parent}/$( date "+%Y-%m-%d" )"
    [ -d "$_dir" ] && cd "$_dir"
}

# mkdatedir and cddatedir
function cdmkdatedir {
    local _dir="$( mkdatedir "$@" )" || return 1

    if ! [ -d "$_dir" ]; then
        echo "$_dir"
        return 1
    fi

    cd "$_dir"
}

# Save current directory to cdpath file.
# Use the `cdpath` function to then navigate into the stored cdpath.
function cppath {
    local cdpath_file="$CDPATH_FILE"
    [ -z "$cdpath_file" ] && cdpath_file="${HOME}/.cdpath"
    pwd > "$cdpath_file"
}

# Same as `cppath` but only auto-cd once for the next zsh session.
function cppath1 {
    local cdpath_file="$CDPATH1_FILE"
    [ -z "$cdpath_file" ] && cdpath_file="${HOME}/.cdpath1"
    pwd > "$cdpath_file"
}

# cd into directory path stored in the cdpath file.
function cdpath {
    local cdpath_file="$CDPATH_FILE"
    [ -z "$cdpath_file" ] && cdpath_file="${HOME}/.cdpath"
    local cdpath_path=
    if [ -f "$cdpath_file" ]; then
        read -r cdpath_path < "$cdpath_file"
        [ -d "$cdpath_path" ] && cd_then_source "$cdpath_path"
    fi
    return 0
}

# Same as `cdpath` but only auto-cd once, then remove the cdpath1 file.
function cdpath1 {
    local cdpath_file="$CDPATH1_FILE"
    [ -z "$cdpath_file" ] && cdpath_file="${HOME}/.cdpath1"
    local cdpath_path=
    if [ -f "$cdpath_file" ]; then
        read -r cdpath_path < "$cdpath_file"
        [ -d "$cdpath_path" ] && cd_then_source "$cdpath_path"
        rm "$cdpath_file"
        return 0
    fi
    return 1
}

# Automatically run cdpath on startup, unless `$AUTO_CDPATH` is unset or 0
[ -n "$AUTO_CDPATH" ] && [ "$AUTO_CDPATH" -ne 0 ] && {
    cdpath1 || cdpath
}

# cheat
function cheat {
    \curl "cheat.sh/$1"
}

# git clone
function giclone {
    local repo="$1"
    shift
    git clone "git@github.com:${repo}" "$@"
}

# cdp
function cdp {
    local cdp_path="$HOME/Projects/Bash/cdp"
    [ -d "$cdp_path" ] || return 1
    local p="$( ${cdp_path}/cdp.sh "$@" )" || return 1
    [ -d "$p" ] && cd "$p"
}

# Run a command without saving it to the command history.
function nohist {
    local histfile="$HISTFILE"
    unset HISTFILE

    $@

    [ -f "$histfile" ] && sed -i '$d' "$histfile"
    HISTFILE="$histfile"
}

# mkdir directory and cd into it
function cdmk {
    local dir="$1"
    [ -z "$dir" ] && { \
        echo -e "mkdir DIR and cd into it\n    $0 DIR [mkdir-args...]"
        return 0
    }
    shift
    [ -d "$dir" ] || mkdir -p "$dir" "$@"
    cd "$dir"
}

# neovim :Man
command -v "nvim" &> /dev/null && \
function vman {
    local manpage="$1"
    [ -z "$manpage" ] && { \man; return 1 }

    nvim +":Man $manpage | bd 1"
}

# vim quick :help
( command -v "vim" || command -v "nvim" ) &> /dev/null && \
function vimh {
    local _vim=
    command -v "nvim" &> /dev/null && _vim="nvim" || _vim="vim"

    local help="$1"
    [ -z "$help" ] && { echo "Expected argument"; return 1 }

    $_vim +":help $help | bd 1"
}

# source nvm
function nvm-init {
    local init_nvm_script="/usr/share/nvm/init-nvm.sh"
    [ -f "$init_nvm_script" ] || return 1
    source "$init_nvm_script"
}

# Update mirrorlist to specified branch (stable|testing|unstable)
function chmirrorbranch {
    case "$1" in
        current)
            pacman-mirrors --api --get-branch
            ;;
        stable|testing|unstable)
            echo "[$0] Switching to branch: $1"
            sudo pacman-mirrors --api --set-branch "$1" \
                && sudo pacman-mirrors --fasttrack 5 \
                && sudo pacman -Sy \
                && echo "[$0] Switched to branch: $1"
            ;;
        *)
            echo "Usage: $0 stable|testing|unstable"
            echo -n "Current branch: "
            pacman-mirrors --api --get-branch
            return 1
            ;;
    esac
}

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
  local _dir="$( date "+%Y-%m-%d" )"
  [ -d "$_dir" ] && cd "$_dir"
}

# cd into directory path in clipboard
function cdpath {
  local _path="$( xclip -o -selection clipboard )" &> /dev/null || return 0
  [ -d "$_path" ] && cd_then_source $_path
  return 0
}

# cheat
function cheat {
  \curl "cheat.sh/$1"
}

# git clone
function gic {
    local repo="$1"
    shift
    git clone "git@github.com:${repo}" "$@"
}

[ -n "$AUTO_CDPATH" ] && cdpath

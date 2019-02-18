# source a 'zshrc' file, if one is present in the current directory
function source_zshrc {
  [ -f "./zshrc" ] && source ./zshrc
}

# Change directory as usual with cd but execute function 'source_zshrc' afterwards
function cd_then_source {
  \cd $@
  exit_code=$?
  source_zshrc
  return $exit_code
}

# cd into directory with the current date
function cddatedir {
  dirname="$( date "+%Y-%m-%d" )"
  [ -d "$dirname" ] && cd "$dirname"
}

# Try to source zshrc file if available
source_zshrc

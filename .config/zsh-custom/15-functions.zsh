# source a 'zshrc' file, if one is present in the current directory
function source_zshrc {
  [ -f "./zshrc" ] && source ./zshrc
}

# Unalias cd to avoid recursively calling 'cd_then_source' when cd alias was set before defining the function.
alias cd && unalias cd

# Change directory as usual with cd but execute function 'source_zshrc' afterwards
function cd_then_source {
  cd $@
  exit_code=$?
  source_zshrc
  return $exit_code
}

# Try to source zshrc file if available
source_zshrc

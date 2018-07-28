export EDITOR='vim'
export VISUAL="$EDITOR"
export BROWSER='waterfox'
if ! which waterfox &> /dev/null; then
  export BROWSER='firefox'
fi

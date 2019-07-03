export EDITOR="$( command -v nvim &> /dev/null && echo -n 'nvim' || echo -n 'vim' )"
export VISUAL="$EDITOR"
export BROWSER='waterfox'
if ! which waterfox &> /dev/null; then
  export BROWSER='firefox'
fi

# Calcurse calendar
#PROFILE = desktop-manjaro || h77m-arch || acer
##export CALCURSE_CALENDAR='personal'
#PROFILE = aware-desktop
export CALCURSE_CALENDAR='work'

# cdpath on shell startup
export AUTO_CDPATH=1

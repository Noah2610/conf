# Custom prompt

precmd_prompt () {
    local PLEFT='%F{blue}%B%n%b@%m%f %F{green}%B%2~%b%f '
    local PRIGHT=' %F{yellow}%B%D{%H:%M:%S}%b%f'

    ## Pattern to remove all zsh escape sequences so we can count the shown characters
    local pattern='%([BUbfksu]|([FK]|){*})'

    ## Get length of prompts, by removing escape sequences with pattern
    local length_left=${#${(S%%)PLEFT//$~pattern/}}
    local length_right=${#${(S%%)PRIGHT//$~pattern/}}

    ## Get padding with lengths of prompts
    local padding_length=$(( COLUMNS - length_left - length_right - 1 ))
    local padding="$( printf "%${padding_length}s" )"

    ## Set the prompt
    PROMPT="${PLEFT}${padding}${PRIGHT}"
    PROMPT+=$'\n'
    PROMPT+='%F{%0(?.white.red)}%B%(!.#.$)%b%f '
    PROMPT2=' %F{green}%B>%b%f '
    RPROMPT='$(git_prompt_info)'
}

## Set custom terminal emulator window title bar
precmd_titlebar () {
    titlebar="$( pwd | sed "s,${HOME},~," )"
    print -Pn "\e]0;${titlebar}\a"
}

precmd_functions+=(precmd_prompt)
# precmd_functions+=(precmd_titlebar)

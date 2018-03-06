## Set custom prompt
precmd_prompt () {
	## My custom prompts for the first line, left and right
	# NOTE: Cannot use standout (%S) with current pattern below
	P1LEFT='%F{blue}%B%n%b@%m%f %F{green}%B%8~%b%f '
	P1RIGHT=' [%F{yellow}%B%D{%H:%M:%S}%b%f]'
	#P2LEFT=''
	#P2RIGHT=''

	## Pattern to remove all zsh escape sequences so we can count the shown characters
	local pattern='%([BUbfksu]|([FK]|){*})'

	## Get length of prompts, by removing escape sequences with pattern
	p1left_length=${#${(S%%)P1LEFT//$~pattern/}}
	p1right_length=${#${(S%%)P1RIGHT//$~pattern/}}
	#p2left_length=${#${(S%%)P1LEFT//$~pattern/}}
	#p2right_length=${#${(S%%)P1RIGHT//$~pattern/}}

	## Get padding with lengths of prompts
	local p1padding=$'${(r:${COLUMNS} - ${p1left_length} - ${p1right_length}:::)}'
	#local p2padding=$'${(r:${COLUMNS} - ${p2left_length} - ${p2right_length}::-:)}'

	## Set the prompt
	PROMPT="${P1LEFT}${p1padding}${P1RIGHT}"
	#PROMPT+="${P2LEFT}${p2padding}${P2RIGHT}"

	PROMPT+=$'\n''%F{%0(?.white.red)}%B%(!.#.$)%b%f '
	PROMPT2=' %F{green}%B>%b%f '
	RPROMPT='$(git_prompt_info)'
}
precmd_functions+=(precmd_prompt)

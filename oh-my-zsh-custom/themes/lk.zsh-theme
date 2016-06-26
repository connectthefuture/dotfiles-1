hostcolor=$((16 + $(hostname | cksum | cut -c1-6) % 216))

PROMPT='%{$FG[${(l:3::0:)hostcolor}]%}%m%{$reset_color%}:%{$fg[blue]%}%c/%{$reset_color%} $(git_prompt_info)%(!.#.$) '
#RPROMPT='[%*]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg_no_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"

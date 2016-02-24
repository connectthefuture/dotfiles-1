export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

ZSH_THEME="lk"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

# Load exports
source ~/.exports

# Load aliases
source ~/.aliases

# Load OS-specific config, if exists
os=${$(echo `uname`):l}
if [ -f ~/.zshrc_$os ]; then
    source ~/.zshrc_$os
fi

# Load user config, if exists
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# Perl config
# (from http://stackoverflow.com/questions/2980297/how-can-i-use-cpan-as-a-non-root-user)
eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`

# SSH tab completion needs a little help
h=()
if [[ -r ~/.ssh/config ]]; then
    h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi

if [[ -r ~/.ssh/known_hosts ]]; then
    h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi

if [[ $#h -gt 0 ]]; then
    zstyle ':completion:*:ssh:*' hosts $h
    zstyle ':completion:*:slogin:*' hosts $h
fi

zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

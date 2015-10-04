export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

ZSH_THEME="lk"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-flow colorize compleat git-flow)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin"
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR='vim'
export TERM=xterm-256color

# Aliases
alias zshreload="source ~/.zshrc"

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

# Perl config (from http://stackoverflow.com/questions/2980297/how-can-i-use-cpan-as-a-non-root-user)

eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
export MANPATH=$HOME/perl5/man:$MANPATH

# Local config
# System-specific
os=${$(echo `uname`):l}
if [ -f ~/.zshrc_$os ]; then
    source ~/.zshrc_$os
fi

# User-defined
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

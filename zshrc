export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
ZSH_THEME="lk"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git tmux tmuxinator ubuntu)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin"
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export TERM=xterm-256color
eval "$(rbenv init -)"

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

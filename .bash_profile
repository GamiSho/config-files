export PS1='\[\e[0;32m\]\w $(__git_ps1 " (%s)") \n\[\e[0m\] $ '
export PATH="$HOME/.cargo/bin:$HOME/.rbenv/bin:$HOME/.local/bin:$PATH"
eval "$(rbenv init -)"
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
source ~/.bashrc

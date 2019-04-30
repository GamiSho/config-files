export PS1='\[\e[0;32m\]\w $(__git_ps1 " (%s)") \n\[\e[0m\] $ '
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

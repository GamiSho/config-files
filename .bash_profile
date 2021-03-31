export PS1='\n\[\e[0;32m\]\w $(__git_ps1 " (%s)") \n\[\e[0m\] $ '
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.rbenv/bin:$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export PATH="$PATH:/path/to/elixir/bin"

eval "$(rbenv init -)"

source $HOME/.bashrc

typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /opt/local/bin
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
  /Users/genronnewimac/.cargo/bin
  /Applications/MAMP/bin/php/php5.6.40/bin
)
# echo 'export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"' >> ~/.zshrc
# echo 'export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"' >> ~/.zshrc
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    autoload -Uz compinit
    compinit
fi

alias vim=nvim
alias vi=nvim
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias sqlite=/opt/homebrew/Cellar/sqlite/3.40.1/bin/sqlite3


# exa
if [[ $(command -v exa) ]]; then
  alias e='exa --icons'
  alias l=e
  alias ea='exa -a --icons'
  alias la=ea
  alias ee='exa -aal --icons'
  alias ll=ee
  alias ls='exa --icons --git'
  alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='exa -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'
fi

function fsh() {
  local host=$(grep -E "^Host " ~/.ssh/config | sed -e 's/Host[ ]*//g' | fzf)
  if [ -n "$host" ]; then
    ssh $host
  fi
}
# fch - checkout git branch
fch() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git switch $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
# fcd - cd to selected directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
fvi() {
  nvim $(fzf)
}
fdb() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +m) &&
    git branch -D $(echo "$branch" | sed "s/.* //")
}
function fhis() {
  BUFFER=$(history -n -r 1 | fzf -e --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fhis
bindkey '^r' fhis

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(anyenv init -)"
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/genronnewimac/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

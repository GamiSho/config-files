alias vi='nvim'
alias vim='nvim'
alias fvim='nvim $(fzf --exact)'
alias sed='gsed'
if [[ $(command -v exa) ]]; then
  alias e='exa --icons'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons'
  alias la=ea
  alias ee='exa -aal --icons'
  alias ll=ee
  alias lta=eta
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fcheckout - checkout git branch
fch() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "${branches}" | fzf +m) &&
  git checkout $(echo "${branch}" | awk '{print $1}' | sed "s/.* //")
}

# fhis - repeat history
fhis() {
  echo "$(history | fzf | sed -re 's/^\s*[0-9]+\s*//')"
}

# fssh - select ssh host
fssh() {
  local sshLoginHost
  sshLoginHost=`cat ~/.ssh/config | grep -i ^host | awk '{print $2}' | fzf`

  if [ "$sshLoginHost" = "" ]; then
      return 1
  fi

  ssh ${sshLoginHost}
}

source $HOME/.git-prompt.sh
source $HOME/alacritty/extra/completions/alacritty.bash

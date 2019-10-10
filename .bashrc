alias vi='nvim'
alias vim='nvim'
alias fvim='nvim $(fzf --exact)'
alias ll='ls -l'
alias sed='gsed'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

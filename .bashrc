alias vi='nvim'
alias vim='nvim'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source $HOME/.git-prompt.sh

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "${branches}" | fzf +m) &&
  git checkout $(echo "${branch}" | awk '{print $1}' | sed "s/.* //")
}

source /Users/sho/alacritty/extra/completions/alacritty.bash

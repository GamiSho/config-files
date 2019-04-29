 #!/bin/sh

 set -e
 set -u

 setup() {
     dotfiles=$HOME/dotfiles

     has() {
         type "$1" > /dev/null 2>&1
     }

     symlink() {
         [ -e "$2" ] || ln -s "$1" "$2"
     }

     if [ -d "$dotfiles" ]; then
         (cd "$dotfiles" && git pull --rebase)
     else
         git clone https://github.com/GamiSho/init.vim "$dotfiles"
     fi

     has git && symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
     has vim && symlink "$dotfiles/init.vim" "$XDG_CONFIG_HOME/init.vim"
 }

 setup

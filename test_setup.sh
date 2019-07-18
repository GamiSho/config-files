#!/bin/sh

set -e

DOT_DIR="${HOME}/dotfiles"
REPO_URL="https://github.com/GamiSho/init.vim"
NVIM_DIR="${XDG_CONFIG_HOME}/nvim"
NVIM_CONFIG="init.vim"

has() {
  type "$1" > /dev/null 2>&1
}

link_dot_files() {
  for f in .??*
  do
    if [ ! -e ${HOME}/${f} ]; then
      [[ ${f} = ".git" ]] && continue
      [[ ${f} = ".gitignore" ]] && continue
      #ln -snfv ${DOT_DIR}/${f} ${HOME}/${f}
      echo $(tput setaf)${f} $(tput sgr0)
    fi
  done

  echo $(tput setaf 2)Deploy dotfiles complete!. $(tput sgr0)
}

link_nvim() {
  #ln -snfv ${DOT_DIR}/${NVIM_CONFIG} ${NVIM_DIR}/${NVIM_CONFIG}
  echo "${DOT_DIR}/${NVIM_CONFIG} ${NVIM_DIR}/${NVIM_CONFIG}"
}

setup() {
  if [ ! -d ${DOT_DIR} ]; then
    mkdir ${DOT_FILES}
    #git clone "${REPO_URL}" "${DOT_DIR}"

    echo $(tput setaf 2)Download dotfiles complete!. $(tput sgr0)
  fi

  link_dot_files
  link_nvim
}

setup

exit 0

#!/bin/sh
set -e

mkdir -p "${HOME}/.zsh"
[ ! -d "${HOME}/.zsh/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.zsh/zsh-autosuggestions"
[ ! -d "${HOME}/.zsh/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/.zsh/zsh-syntax-highlighting"

ln -fs "${PWD}/.zshrc" "${HOME}/.zshrc"
ln -fs "${PWD}/.zshenv" "${HOME}/.zshenv"
ln -fs "${PWD}/.vimrc" "${HOME}/.vimrc"
ln -fs "${PWD}/.gitignore" "${HOME}/.gitignore"
ln -fs "${PWD}/.gitconfig" "${HOME}/.gitconfig"
ln -fs "${PWD}/.gitattributes" "${HOME}/.gitattributes"

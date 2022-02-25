ln -fs "${PWD}/.zshrc" "${HOME}/.zshrc"
ln -fs "${PWD}/.zshenv" "${HOME}/.zshenv"
ln -fs "${PWD}/.vimrc" "${HOME}/.vimrc"
ln -fs "${PWD}/.gitignore" "${HOME}/.gitignore"
ln -fs "${PWD}/.gitconfig" "${HOME}/.gitconfig"
ln -fs "${PWD}/.gitattributes" "${HOME}/.gitattributes"

mkdir -p .zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

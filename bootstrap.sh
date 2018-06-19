#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	if ! git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	then
		git -C ~/.vim/bundle/Vundle.vim
	fi

	vim +PluginInstall +qall

	if ! git clone https://github.com/thenikso/github-plus-theme.git ~/.vscode/extensions/github-plus-theme
	then
		git -C ~/.vscode/extensions/github-plus-theme pull
	fi

	if ! git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	then
		git -C ~/.oh-my-zsh pull
	fi
	
	chsh -s /bin/zsh

	if ! git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/themes/spaceship-prompt
	then
		git -C ~/.oh-my-zsh/themes/spaceship-prompt
	fi

	ln -s ~/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "brew.sh" \
		-avh --no-perms . ~;
	# source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;


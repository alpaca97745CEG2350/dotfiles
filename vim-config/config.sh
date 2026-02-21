#!/bin/bash
#
# define paths
DOTFILEREPO="$HOME/github/dotfiles/vim-config/.vimrc"
USERDIR="$HOME/.vimrc"
VUNDLEDIR="$HOME/.vim/bundle/Vundle.vim"

echo "Starting script..."

# Copy .vimrc file from repo to users home directory. Checks if .vimrc exists in repo, if it exists, copies it from the the repo folder to the users home directory.
if [ -f "$DOTFILEREPO" ]; then
	cp "$DOTFILEREPO" "$USERDIR"
	echo "Copied .vimrc to $HOME"
else
	echo "Error $DOTFILEREPO not found!"
	exit 1
fi

#INSTALL VUNDLE if ~/.vim/bundle/Vundle.vim does not exist, then echo, clone from vundle.vim repository to ~/home/gmaltby/.vim/bundle/Vundle.vim".
if [ ! -d "$VUNDLEDIR" ]; then
	echo "Vundle.vim not found. Installing Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLEDIR"
else
	echo "Vundle already exists"
fi
# Checks for .vimrc. then echos, launches vim and immediatley runs :PlugInstall, vim closes, returns to terminal.
if [ -f ~/.vimrc ]; then
	echo "Installing vim plugins"
    	vim +PluginInstall +qall
fi

echo "COMPLETED"

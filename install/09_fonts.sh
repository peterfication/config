#!/bin/bash

if ls $HOME/Library/Fonts | grep -q Powerline
then
  echo
  echo "Powerline fonts are already installed. Skipping."
else
  echo "Installing Powerline fonts ..."

  # Clone
  git clone https://github.com/powerline/fonts.git --depth=1

  # Install
  cd fonts
  ./install.sh

  # Clean-up a bit
  cd ..
  rm -rf fonts
fi

# TODO https://www.nerdfonts.com/font-downloads => FiraMono Nerd Font

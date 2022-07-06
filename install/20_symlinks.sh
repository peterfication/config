#!/bin/zsh

ln -s ~/config/zshrc ~/.zshrc
ln -s ~/config/init.vim ~/.config/init.vim
ln -s ~/config/tmux.conf ~/.tmux.conf

ln -s ~/config/ssh/config ~/.ssh/config &

ln -s ~/config/gitconfig ~/.gitconfig

ln -s ~/config/gpg.conf ~/.gnupg/gpg.conf &
ln -s ~/config/gpg-agent.conf ~/.gnupg/gpg-agent.conf &

gln -sT ~/config/hammerspoon ~/.hammerspoon

# k9s
# vim coc settings

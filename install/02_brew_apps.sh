#!/bin/bash

brew_apps=(
  firefox
  # TODO
  alfred
  cyberduck
  eqmac
  flux
  flycut
  chromium
  chrome
  eqmac
  iterm2
  keepingyouawake
  tableplus
  obsidian # and https://syncthing.net/
  postman
  spotify
  # https://github.com/exelban/stats
  stats
  veracrypt
  visual-studio-code
  vlc
  xbar
  zoom
  betterdisplay
  # Eject menu bar https://github.com/kainjow/Semulov
  semulov
  alacritty

  # ObjectiveSee
  lulu
  knockknock
  netiquette
  oversight

  oracle-jdk

  # Design tools
  # sketch
  # affinity-designer-beta

  # Other
  # docker
  # postgres
)

brew_apps_string=$(printf " %s" "${brew_apps[@]}")
brew_apps_string=${brew_apps_string:1}

echo "brew install --cask $brew_apps_string"
brew install $brew_apps_string

brew tap buo/cask-upgrade

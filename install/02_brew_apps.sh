#!/bin/bash

brew_apps=(
  firefox
  # TODO
  alfred
  cyberduck
  flux
  flycut
  chromium
  chrome
  iterm2
  keepingyouawake
  tableplus
  postman
  spotify
  # https://github.com/exelban/stats
  stats
  veracrypt
  visual-studio-code
  vlc
  zoom

  # Design tools
  # sketch
  # affinity-designer-beta

  # Backup
  # docker
  # postgres
)

brew_apps_string=$(printf " %s" "${brew_apps[@]}")
brew_apps_string=${brew_apps_string:1}

echo "brew install --cask $brew_apps_string"
brew install $brew_apps_string

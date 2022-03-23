#!/bin/bash

if command -v brew &> /dev/null
then
  echo
  echo "brew is already installed."
else
  echo "Installing brew ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew_tools=(
  # Update standard CLI tools
  bash
  git
  curl
  grep
  rclone
  less
  tree
  htop

  # GPG
  gpg
  pinentry-mac

  # PDFs
  pandoc

  # Rust things
  bat # cat/less replacement written in Rust
  broot
  exa # ls replacement
  fd # find replacement
  git-delta # Git pager
  ripgrep # grep replacement, same as rga
  watchexec
  # loc # cloc replacement
  # hyperfine
  zoxide

  # Programming/infrastructure languages
  kubectl
  k9s
  derailed/popeye/popeye
  kubeseal
  terraform
  terraform-docs
  terraform-ls # Terraform language server
  fluxcd/tap/flux
  weaveworks/tap/eksctl
  aws-iam-authenticator
  python
  # https://github.com/wagoodman/dive
  dive

  # Other
  fzf
  gh
  git-crypt
  git-extras
  hammerspoon
  jesseduffield/lazygit/lazygit
  jesseduffield/lazydocker/lazydocker
  jq
  neovim
  tmux
  urlview # For tmux URLs selection
  youtube-dl
  yt-dlp
  watch
  zbar
  zsh

  # Backup
  # chunkwm
  # ctags
  # fff
  # gron # grep flattenend JSON
  # hexyl
  # qrencode
  # pandoc
  # poppler
  # pdftotext
  # tesseract
  # ffmpeg
  # readline
  # reattach-to-user-namespace # For tmux clipboard sharing
)

brew_tools_string=$(printf " %s" "${brew_tools[@]}")
brew_tools_string=${brew_tools_string:1}

echo "brew install $brew_tools_string"
brew install $brew_tools_string

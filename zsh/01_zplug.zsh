#!/bin/bash

[ ! -d "$HOME/.zplug" ] && git clone https://github.com/zplug/zplug.git ~/.zplug

source ~/.zplug/init.zsh

# READMEs available here:
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
#
# More plugins:
# https://github.com/unixorn/awesome-zsh-plugins#plugins

# zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug "tinted-theming/base16-shell"
zplug "tinted-theming/base16-fzf"

zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "plugins/copypath", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
# man-preview
# rmdsstore # Remove .DS_Store files recursively in a directory
# spotify
# showfiles
# quick-look
zplug "g-plane/icd"

zplug "plugins/fzf", from:oh-my-zsh
zplug "Aloxaf/fzf-tab"
zplug "u1and0/fzf-extras",\
    use:"fzf*",\
    defer:2,\
    hook-load:"""
        alias gz='fzf-gitlog-widget'
        alias gx='fzf-gitlog-multi-widget'
        alias zz='zd -z'
    """

zplug "plugins/direnv", from:oh-my-zsh
zplug "plugins/zoxide", from:oh-my-zsh
# zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/dotenv", from:oh-my-zsh
# Might be interesting: https://github.com/Tarrasch/zsh-autoenv
zplug "plugins/git", from:oh-my-zsh
# Have a look at this: https://github.com/davidde/git
# Needs brew install git-extras
zplug "plugins/git-extras", from:oh-my-zsh
# zplug "bigH/git-fuzzy", as:command, use:"bin/git-fuzzy"
# zplug "wfxr/forgit"
zplug "plugins/rvm", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/gem", from:oh-my-zsh
zplug "plugins/rails", from:oh-my-zsh
zplug "plugins/rake-fast", from:oh-my-zsh
zplug "plugins/thor", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
# zplug "plugins/yarn", from:oh-my-zsh # only aliases
zplug "plugins/docker", from:oh-my-zsh
# zplug "plugins/rustup", from:oh-my-zsh
# zplug "plugins/rust", from:oh-my-zsh
# zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/uv", from:oh-my-zsh

zplug "plugins/terraform", from:oh-my-zsh
# zplug "plugins/helm", from:oh-my-zsh
# zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
# Have a look at the alias:
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl
# zplug "plugins/minikube", from:oh-my-zsh
# zplug "plugins/gcloud", from:oh-my-zsh

# zplug "amstrad/oh-my-matrix"

zplug load

# Don't use icd as default
unalias cd

# For debugging:
# zplug load --verbose

zplug install

# https://dystroy.org/broot/documentation/configuration/#verbs-shortcuts-and-keys
# ~/.config/broot/conf.hjson
if [ -L ~/.config/broot/launcher/bash/br ]; then
  source ~/.config/broot/launcher/bash/br
else
  echo "broot/br is not installed. Install it with:"
  echo ""
  echo "  brew install broot"
  echo ""
  echo "To fully install it, you need to run it:"
  echo ""
  echo "  br"
  echo ""
fi

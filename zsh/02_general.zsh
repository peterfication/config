# Enable Ctrl-f to edit command line
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '^f' edit-command-line

export VISUAL="nvim"
export EDITOR="nvim"
# alias nvim="~/.local/share/neovim/bin/nvim"
alias e=nvim
alias vim=nvim

# setopt shwordsplit
#
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
#   autoload -Uz compinit
#   compinit
#   autoload -U +X bashcompinit && bashcompinit
# fi


#  [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# See https://wilsonmar.github.io/maximum-limits/
# To me a problem occurred with Capybara and Webmock displaying the following message:
#   Failed to open TCP connection to 127.0.0.1:9515 (Too many open files - socket(2) for "127.0.0.1" port 9515
ulimit -n 8192

# Allow Ctrl-z to toggle between suspend and resume
function Resume {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

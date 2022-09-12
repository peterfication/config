# Enable Ctrl-f to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

export EDITOR='nvim'
export VISUAL='nvim'
alias e="nvim"
alias vim=nvim

setopt shwordsplit
#
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
#   autoload -Uz compinit
#   compinit
#   autoload -U +X bashcompinit && bashcompinit
# fi


#  [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

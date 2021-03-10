# Enable Ctrl-f to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

export EDITOR='vim'
export VISUAL='vim'
alias e="vim"
alias vim=nvim

setopt shwordsplit

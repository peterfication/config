# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Enable Ctrl-f to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.cargo/bin"
export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh
export FZF_DEFAULT_COMMAND="rg --files"
export PATH="$PATH:/Library/TeX/texbin"

export EDITOR='vim'
export VISUAL='vim'
alias e="vim"

alias g='git'
alias tm='tmux'
alias dcup='docker-compose up'
alias dcrw='docker-compose run web'
alias dcrspec='docker-compose run test bundle exec rspec'
alias dcrspec-web='docker-compose run web bundle exec rspec'
alias dcroutes='docker-compose run web bundle exec rake routes'
alias dcbundle='bundle && docker-compose run web bundle'
alias dcrm='docker-compose run web rm -Rf tmp/pids'
alias docker-machine-cleanup='docker volume rm $(docker volume ls -qf dangling=true); docker rmi $(docker images | grep "^<none>" | awk "{print $3}"); docker rm $(docker ps -qa --no-trunc --filter "status=exited")'

alias heroku-logs="heroku apps --all | grep '(' | sed 's/ .*$//' | fzf --header='Select the app you want to tail the logs' | xargs heroku logs -t -a"
alias heroku-bash="heroku apps --all | grep '(' | sed 's/ .*$//' | fzf --header='Select the app you want to bash into' | xargs heroku run bash -a"

alias cloc-ruby='cloc . --exclude-dir=tmp,log,spec,.idea,.ebextensions,.elasticbeanstalk,.git,vendor'

# Restart the camera on a Mac when it fails
alias restart-camera='sudo killall VDCAssistant && sudo killall AppleCameraAssistant'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# bindkey -v # Enable Vim mode => Press Esc to get into normal mode

[ -f ~/config/zsh/fzf.zsh ] && source ~/config/zsh/fzf.zsh
[ -f ~/config/submodules/fzf-extras/fzf-extras.sh ] && source ~/config/submodules/fzf-extras/fzf-extras.sh
[ -f ~/config/zsh/tmux.zsh ] && source ~/config/zsh/tmux.zsh
[ -f ~/config/zsh/local.zsh ] && source ~/config/zsh/local.zsh

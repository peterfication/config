# Interactive UNIX pipes
# https://github.com/akavel/up

# https://www.hammerspoon.org/
# OS X scripting

# The ZVM plugin will auto execute this zvm_after_init function.
# The addiotional sources are needed to restore behavior after ZVM overwrote it.
function zvm_after_init() {
  [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
  [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

  [ -f /usr/local/opt/fzf/shell/completion.zsh ] && source /usr/local/opt/fzf/shell/completion.zsh
  [ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh

  [ -f ~/.zplug/repos/Aloxaf/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.zplug/repos/Aloxaf/fzf-tab/fzf-tab.plugin.zsh
}

# Create dir and cd into it
function ccd { mkdir -p "$1" && cd "$1" }

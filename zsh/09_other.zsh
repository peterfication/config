# Interactive UNIX pipes
# https://github.com/akavel/up

# https://www.hammerspoon.org/
# OS X scripting

# The ZVM plugin will auto execute this zvm_after_init function.
# The addiotional sources are needed to restore behavior after ZVM overwrote it.
function zvm_after_init() {
  [ -f /usr/local/opt/fzf/shell/completion.zsh ] && source /usr/local/opt/fzf/shell/completion.zsh
  [ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh
  [ -f ~/.zplug/repos/Aloxaf/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.zplug/repos/Aloxaf/fzf-tab/fzf-tab.plugin.zsh
}

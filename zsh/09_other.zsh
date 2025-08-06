# Interactive UNIX pipes
# https://github.com/akavel/up

# https://www.hammerspoon.org/
# OS X scripting

# The ZVM plugin will auto execute this zvm_after_init function.
# The addiotional sources are needed to restore behavior after ZVM overwrote it.
function zvm_after_init() {
  [ -f $(brew --prefix)/opt/fzf/shell/completion.zsh ] && source $(brew --prefix)/opt/fzf/shell/completion.zsh
  [ -f $(brew --prefix)/opt/fzf/shell/key-bindings.zsh ] && source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh

  [ -f ~/.zplug/repos/Aloxaf/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.zplug/repos/Aloxaf/fzf-tab/fzf-tab.plugin.zsh
}

# Create dir and cd into it
function ccd { mkdir -p "$1" && cd "$1" }

# Load direnv if a shell is opened directly at a location where there is a .envrc file
if [[ -f .envrc ]] && command -v direnv >/dev/null 2>&1; then
  direnv reload
fi

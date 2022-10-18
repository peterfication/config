BASE16_SHELL_PATH="$ZPLUG_HOME/repos/tinted-theming/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"

[ -s "$ZPLUG_HOME/repos/tinted-theming/base16-fzf/bash/base16-solarized-dark.config" ] && source "$ZPLUG_HOME/repos/tinted-theming/base16-fzf/bash/base16-solarized-dark.config"

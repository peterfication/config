# Style

# True color support
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"

# Update Interval
set -g status-interval 1

# Status bar
set -g status-utf8 on
set -g status-bg default
set -g status-fg white

# Status bar - left side
set -g status-left 'a'

# Status bar - right side
set -g status-right-length 100
set -g status-right-fg black
set -g status-right-attr bold
set -g status-right ' #{?window_zoomed_flag,#[fg=colour178]ZOOMED #[fg=colour238]• ,}#[fg=colour178]#h #[fg=colour238]•#[fg=colour178] %a %b %d #[fg=colour178]%I:%M:%S '

# Window status - not the current window
set-window-option -g window-status-bg default
set-window-option -g window-status-fg white
set-window-option -g window-status-attr none
set-window-option -g window-status-format '#[fg=colour214,bg=colour235] #I #[fg=white,bg=colour236] #(pwd="#{pane_current_path}"; echo ${pwd####*/}) #W #[default]'

# Window status - current window
set-window-option -g window-status-current-attr none
set-window-option -g window-status-current-format '#[fg=black,bg=colour214] #I #[fg=brightwhite,bg=colour238] #(pwd="#{pane_current_path}"; echo ${pwd####*/}) #W #[default]'

# Pane borders
set -g pane-border-bg default
set -g pane-border-fg colour235

# Set inactive/active window pane styles
set -g window-style 'fg=colour247,bg=colour236'
set -g window-active-style 'fg=colour250,bg=black'

set -g pane-active-border-bg default
set -g pane-active-border-fg colour214

# Pane number display
set-option -g display-panes-active-colour colour214
set-option -g display-panes-colour colour240

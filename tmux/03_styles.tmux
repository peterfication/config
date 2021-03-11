# Style

# True color support
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"

# Update Interval
set -g status-interval 1

set -g window-style 'fg=colour242,bg=colour237'
set -g window-active-style 'bg=black,fg=colour247'

# This tmux statusbar config was created by tmuxline.vim
# on Mon, 08 Mar 2021
# https://github.com/edkolev/tmuxline.vim
set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#f8f8f0,bg=#232526"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#e6db74"
set -g status-style "none,bg=#465457"
set -g message-style "fg=#f8f8f0,bg=#232526"
set -g pane-border-style "fg=#232526"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#f8f8f0,bg=#465457"
set -g status-left "#[fg=#080808,bg=#e6db74] #S #[fg=#e6db74,bg=#465457,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#232526,bg=#465457,nobold,nounderscore,noitalics]#[fg=#f8f8f0,bg=#232526] %Y-%m-%d  %H:%M #[fg=#e6db74,bg=#232526,nobold,nounderscore,noitalics]#[fg=#080808,bg=#e6db74] #h "
setw -g window-status-format "#[fg=#f8f8f0,bg=#465457] #I #[fg=#f8f8f0,bg=#465457] #W "
setw -g window-status-current-format "#[fg=#465457,bg=#232526,nobold,nounderscore,noitalics]#[fg=#f8f8f0,bg=#232526] #I #[fg=#f8f8f0,bg=#232526] #W #[fg=#232526,bg=#465457,nobold,nounderscore,noitalics]"

# Base

set -g mode-keys vi # Enable vi-mode
# emacs key bindings in tmux command prompt (prefix + :) are better than
# vi keys, even for vim users
set -g status-keys emacs
set -g mouse on

set -g status-left-length 30
set -g base-index 1
set -sg escape-time 10 # Don't delay the ESC key too much
set-option -g history-limit 30000
# Show the status display longer
set-option -g display-time 4000

# Don't rename the window to the current command
set-option -g allow-rename off

# True color support
# set -g default-terminal "screen-256color"
# set-option -ga terminal-overrides ",xterm-256color:Tc"

set-option -g default-terminal "${TERM}"
set-option -sa terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set-option -sa terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

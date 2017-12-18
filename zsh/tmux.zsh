setopt shwordsplit

function tmux_new_with_name() {
  for TS_DIR in $1; do
    DIR_NAME=`echo $TS_DIR | grep -o [a-z0-9_-]*$`
    eval "tmux new-session -d -c ${TS_DIR} -s $DIR_NAME -n main"
  done
}

function ts() {
  tmux_new_with_name `pwd`
  DIR_NAME=`pwd | grep -o [a-z0-9_-]*$`
  tmux -2 a -t $DIR_NAME
}

function tss() {
  tmux split-pane -h gitsh
  tmux send-keys -t 1.0 vim Enter
  tmux split-pane -d -v
}

function tsd() {
  # Setup main window
  tmux split-pane -h gitsh
  tmux send-keys -t 1.0 vim Enter
  tmux split-pane -d -v
  tmux send-keys -t 1.2 "eval '$(docker-machine env store2be)'" Enter

  # Setup docker synching
  tmux new-window -n docker-osx-dev -d 'eval "$(docker-machine env store2be)" && docker-osx-dev'
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}


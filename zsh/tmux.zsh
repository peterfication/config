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
  tmux a -t $DIR_NAME
}

function tss() {
  tmux split-pane -h git sh
  tmux send-keys -t 1.0 vim Enter
  tmux split-pane -d -v
}

function tsd() {
  # Setup main window
  tmux split-pane -h git sh
  tmux send-keys -t 1.0 vim Enter
  tmux split-pane -d -v 'eval "$(docker-machine env store2be)"; zsh'

  # Setup docker synching
  tmux new-window -d 'eval "$(docker-machine env store2be)" && docker-osx-dev'
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

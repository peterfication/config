alias tm='tmux -2'

setopt shwordsplit

function tmux_new_with_name() {
  for TS_DIR in $1; do
    DIR_NAME=`echo $TS_DIR | grep -o "[a-zA-Z0-9_.-]*$" | sed -r 's/[.]+/-/g'`
    eval "tmux new-session -d -c ${TS_DIR} -s $DIR_NAME -n main"
  done
}

function ts() {
  tmux_new_with_name `pwd`
  DIR_NAME=`pwd | grep -o "[a-zA-Z0-9._-]*$" | sed -r 's/[.]+/-/g'`
  tmux -2 a -t $DIR_NAME
}

function tss() {
  tmux split-pane -h
  tmux send-keys -t 1.0 vim Enter
  tmux split-pane -d -v
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

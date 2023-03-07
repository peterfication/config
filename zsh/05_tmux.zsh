alias tm='env TERM=screen-256color tmux -2'

if ! [ -f ~/.tmux/plugins/tpm/tpm ]
then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo ""
  echo "tpm has been installed."
  echo ""
  echo "Install tmux plugins with 'prefix + I'"
  echo ""
fi

# Super Guide to the split-window tmux Subcommand (and Beyond)
# https://gist.github.com/sdondley/b01cc5bb1169c8c83401e438a652b84e

function tmux_new_with_name() {
  for TS_DIR in $1; do
    DIR_NAME=`echo $TS_DIR | grep -o "[a-zA-Z0-9_.-]*$" | sed -r 's/[.]+/-/g'`
    echo "Create session '${DIR_NAME}' with window 'vim' and folder '${TS_DIR}'"
    eval "tmux new-session -d -c ${TS_DIR} -s ${DIR_NAME} -n vim"
    eval "tmux send-keys -t 1.0 vim Enter"

    # echo "Split window 'console' in session '${DIR_NAME}'"
    # eval "tmux split-window -h -t ${DIR_NAME} -c ${TS_DIR}"

    # echo "Create window 'console' in session '${DIR_NAME}' with folder '${TS_DIR}'"
    # eval "tm new-window -t ${DIR_NAME}: -c ${TS_DIR} -n console"

    # Show vim window
    # eval "tm next-window"
  done
}

function ts() {
  tmux_new_with_name `pwd`
  DIR_NAME=`pwd | grep -o "[a-zA-Z0-9._-]*$" | sed -r 's/[.]+/-/g'`
  tm a -t $DIR_NAME
}

# This function is for tmux session creations. See tmux/04_mappings.tmux
function ts_from_arg() {
  tmux_new_with_name $1
  DIR_NAME=`$1 | grep -o "[a-zA-Z0-9._-]*$" | sed -r 's/[.]+/-/g'`
  # tmux -2 a -t $DIR_NAME
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

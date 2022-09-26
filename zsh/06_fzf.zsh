export FZF_DEFAULT_COMMAND="rg --files"

alias laf="la | fzf"

rga-fzf() {
  RG_PREFIX="rga --files-with-matches"
  local file
  file="$(
  FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
    fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
    --phony -q "$1" \
    --bind "change:reload:$RG_PREFIX {q}" \
    --preview-window="70%:wrap"
    )" &&
      echo "opening $file" &&
      xdg-open "$file"
}

# From https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
# mnemonic: [K]ill [P]rocess
kp() {
  local pid=$(ps -ef | sed 1d | eval "fzf  -m --header='[kill:process]'" | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs sudo kill -${1:-9}
    kp
  fi
}

find-command() {
  local command=$(compgen -c | eval "fzf ${FZF_DEFAULT_OPTS} --header='[find:command]'")
  LBUFFER="${command} "
}

alias fzrepl="~/config/zsh/fzf/fzrepl.sh"

# Preview files in current dir with FZF like in my Vim settings <leader>e
alias pf="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias preview-files=pf

# Use FZF to navigate with cd
function fcd() {
    local dir;

    while true; do
      # exit with ^D
      dir="$(ls -a1F | grep '[/@]$' | grep -v '^./$' | sed 's/@$//' | fzf --height 40% --reverse --no-multi --preview 'pwd' --preview-window=up,1,border-none --no-info)"
      if [[ -z "${dir}" ]]; then
        break
      elif [[ -d "${dir}" ]]; then
        cd "${dir}"
      fi
    done
  }

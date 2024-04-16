# Remove files a little bit more secure
alias shred="rm -rPv"

alias notes="cd ~/notes && vim"
snotes() {
  cd ~/notes
  git add .
  git stash
  git pull origin master
  git stash pop
  git add .
  git commit -m "Sync `date +"%Y-%m-%d %T"`"
  git push origin master
}

# Restart the camera on a Mac when it fails
alias restart-camera='sudo killall VDCAssistant && sudo killall AppleCameraAssistant'

# Clear the current shell, not only scroll down like clear does
alias clear-real="clear && printf '\e[3J'"

# Inspired by https://github.com/jlevy/the-art-of-command-line
alias explain="~/config/zsh/other/explain.sh"
cheat() {
  ~/config/zsh/other/cheat.sh $1
}
cheatl() {
  ~/config/zsh/other/cheat.sh $1 | less
}
compdef cheatl=cheat

# lazygit() {
#   config_file="$HOME/.config/lazygit/config.yml"

#   # If there is a .lazygit.yml file in the current Git repository root,
#   # use it as well.
#   gitroot=$(git rev-parse --show-toplevel)
#   if [ -f "$gitroot/.lazygit.yml" ]; then
#     config_file="$config_file,$gitroot/.lazygit.yml"
#   fi

#   command lazygit --use-config-file="$config_file"
# }

alias sqlite='sqlite3'
sqlite-csv-viewer() {
  sqlite3 -column :memory: ".import --csv $1 tmp" 'select * from tmp;' | bat
}
# curl https://clickhouse.com/ | sh
# See https://clickhouse.com/docs/en/operations/utilities/clickhouse-local
alias clickhouse=~/clickhouse
clickhouse-csv-viewer() {
  clickhouse local --query="SELECT * FROM '$1'"
}

# If there is a fork processes problem:
alias processes_count="ps -e | awk '{print $4" "$5" "$6}' | sort | uniq -c | sort -n"
# => Check for zombie/defunct processes to find the root cause.
# Make sure macOS is in server mode:
# sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"
# Increase max processes:
# sudo sysctl kern.tty.ptmx_max=999

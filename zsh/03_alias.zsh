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

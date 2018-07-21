# Install Little Snitch v3
cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask
git fetch --unshallow
git checkout -b little-snitch-3 b0a9f99632
# Change download URL of little snitch to
# 67c2c7d9a11cf4a427b5c1ac87db3be53cb92da9e39583dd6e63e5354cc30b22
# https://www.obdev.at/downloads/littlesnitch/legacy/LittleSnitch-3.8.2.dmg
vim Casks/little-snitch.rb
HOMEBREW_NO_AUTO_UPDATE=1 brew cask install little-snitch<Paste>
open /usr/local/Caskroom/little-snitch/3.8.2/Little Snitch Installer.app
git add .
git commit -m "Update Little Snitch 3 config"
git checkout master

if [ -e /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Nix is loaded via the files /etc/zprofile /etc/zshenv /etc/zshrc
# homebrew is loaded afterwards at the top of this file. This sets homebrew
# before nix in the PATH. Nix should be before homewbrew so I need to add it again.
#
# NOTE: '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' should not be sourced
# because I'm using nix-darwin. I can't source nix-darwin files again, because they are
# protected to be sourced only once. Hence, I need to manually set the PATH.
export PATH="$HOME/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$PATH"

# Use homebrew curl
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
# Use homebrew gnu grep
export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"

export PATH="$HOME/config/bin:$PATH"
export PATH=$HOME"/.local/share/neovim/bin:$PATH"

export PATH=$HOME"/.local/bin:$PATH"

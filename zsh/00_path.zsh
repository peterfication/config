if [ -e /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export PATH="$(brew --prefix)/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Use homebrew curl
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
# Use homebrew gnu grep
export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"

export PATH="$HOME/config/bin:$PATH"
fpath=(~/config/zsh/.d/ $fpath)
export PATH=$HOME"/.local/share/neovim/bin:$PATH"

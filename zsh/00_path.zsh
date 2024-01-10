export PATH="/opt/homebrew/bin:/opt/homebrew/opt/grep/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
eval "$(/opt/homebrew/bin/brew shellenv)"
# Use homebrew curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="$HOME/config/bin:$PATH"
fpath=(~/config/zsh/.d/ $fpath)
export PATH=$HOME"/.local/share/neovim/bin:$PATH"

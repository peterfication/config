export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if command -v conda &> /dev/null; then
  eval "$(conda "shell.$(basename "${SHELL}")" hook)"
fi

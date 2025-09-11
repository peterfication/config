export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if command -v conda &> /dev/null; then
  eval "$(conda "shell.$(basename "${SHELL}")" hook)"
fi

if command -v uv &> /dev/null; then
  # Make `uv` work with autocomplete just like `python` - see https://github.com/astral-sh/uv/issues/8432
  eval "$(uv generate-shell-completion zsh)"

  _uv_run_mod() {
      if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
          local venv_binaries
          if [[ -d .venv/bin ]]; then
              venv_binaries=( ${(@f)"$(_call_program files ls -1 .venv/bin 2>/dev/null)"} )
          fi

          _alternative \
              'files:filename:_files' \
              "binaries:venv binary:(($venv_binaries))"
      else
          _uv "$@"
      fi
  }
  compdef _uv_run_mod uv
fi

alias npy_show="uv run ~/.config/scripts/npy_show.py"

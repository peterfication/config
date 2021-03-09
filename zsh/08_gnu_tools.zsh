export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

if which sed | grep -q '/usr/bin/sed'; then
  echo "sed is still the old version from Mac OS X"
  echo "Install a recent one with:"
  echo "  "
  echo "  brew install gnu-sed"
  echo "  sudo ln -s /usr/local/bin/gsed /usr/local/bin/sed"
  echo "  "
fi

if bash -c "export PATH=\"/usr/local/opt/grep/libexec/gnubin:$PATH\" && which grep" | grep -q '/usr/bin/grep'; then
  echo "grep is still the old version from Mac OS X"
  echo "Install a recent one with:"
  echo "  "
  echo "  brew install grep"
  echo "  "
fi

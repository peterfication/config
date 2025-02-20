#!/bin/bash

if command -v rvm &> /dev/null
then
  echo
  echo "rvm is already installed. Updating."
  rvm get stable
else
  echo "Installing rvm ..."
  if command -v gpg2 &> /dev/null
  then
    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  else
    gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  fi
  \curl -sSL https://get.rvm.io | bash -s stable
fi

if rvm list | grep -q ruby-3.0.0
then
  echo
  echo "Ruby 3.0.0 is already installed. Skipping."
else
  echo "Installing Ruby 3.0.0 ..."
  rvm install ruby-3.1.4 --with-openssl-dir=$(brew --prefix)/opt/openssl@3
  rvm install ruby-3.2.2 --with-openssl-dir=$(brew --prefix)/opt/openssl@3
  rvm install ruby-3.3.0 --with-openssl-dir=$(brew --prefix)/opt/openssl@3
fi

if rvm list | grep -q ruby-2.7.2
then
  echo
  echo "Ruby 2.7.2 is already installed. Skipping."
else
  echo "Installing Ruby 2.7.2 ..."
  # From https://nickymarino.com/2021/12/17/install-ruby-273-on-m1/
  brew install openssl@1.1

  export PATH="$(brew --prefix)/opt/openssl@1.1/bin:$PATH"
  export LDFLAGS="-L$(brew --prefix)/opt/openssl@1.1/lib"
  export CPPFLAGS="-I$(brew --prefix)/opt/openssl@1.1/include"
  export PKG_CONFIG_PATH="$(brew --prefix)/opt/openssl@1.1/lib/pkgconfig"

  rvm autolibs disable
  rvm pkg install readline

  export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
  export optflags="-Wno-error=implicit-function-declaration"

  rvm install 2.5.3 --with-openssl-dir=$(brew --prefix)/opt/openssl@1.1 --with-readline-dir=$(brew --prefix)/opt/readline
  rvm install 2.7.5 --with-openssl-dir=$(brew --prefix)/opt/openssl@1.1 --with-readline-dir=$(brew --prefix)/opt/readline
  rvm install 2.7.3 --with-openssl-dir=$(brew --prefix)/opt/openssl@1.1 --with-readline-dir=$(brew --prefix)/opt/readline
  rvm install 2.5.8 --with-openssl-dir=$(brew --prefix)/opt/openssl@1.1 --with-readline-dir=$(brew --prefix)/opt/readline
  rvm install ruby-3.4.1 --reconfigure --enable-yjit --with-openssl-dir=$(brew --prefix openssl@3.0) --with-readline-dir=$(brew --prefix readline)
  rvm install ruby-3.4.1 --with-openssl-dir=$(brew --prefix)/opt/openssl@3.0
fi

echo
echo "Installing gems ..."
gem install bundler
gem install rubocop
gem install solargraph
gem install neovim

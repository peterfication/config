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
  rvm install ruby-3.0.0
fi

if rvm list | grep -q ruby-2.7.2
then
  echo
  echo "Ruby 2.7.2 is already installed. Skipping."
else
  echo "Installing Ruby 2.7.2 ..."
  rvm install ruby-2.7.2
fi

rvm alias create default 2.7.2

echo
echo "Installing gems ..."
gem install bundler
gem install rubocop
gem install solargraph
gem install neovim

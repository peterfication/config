# My local config files for Mac OS X

This is just a repository for my local config files.

## Install

### Install software

Install the software I might need now and then

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

$ brew install neovim/neovim/neovim
$ ln -s /usr/local/bin/nvim /usr/local/bin/vim

$ brew install zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

$ brew install git # Install an up to date Git version
$ brew install git-sh
$ brew install hub
$ brew install heroku
$ brew install less # Update less so it can handle emojis
$ brew install fzf && /usr/local/opt/fzf/install
$ brew install ripgrep
$ brew install docker
$ brew install docker-compose
$ brew install docker-machine
$ brew install kops
$ brew install kubernetes-cli
$ brew install openssl # Install an up to date version of OpenSSL
$ brew install cloc
$ brew install tree

$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
$ brew install nvm
$ curl -sf -L https://static.rust-lang.org/rustup.sh | sh
$ brew install go
$ brew install python
$ brew install redis
$ brew install postgresql

$ brew install wine
$ brew install winetricks
```


### Install the config files of this repository

```bash
$ cd
$ git clone --recursive git@github.com:cynektix/config.git
$ mkdir -p ~/.config/nvim && ln -s ~/config/init.vim ~/.config/nvim/init.vim
$ ln -s ~/config/zshrc ~/.zshrc
$ ln -s ~/config/gitconfig ~/.gitconfig
$ ln -s ~/config/gitignore_global ~/.gitignore_global
$ ln -s ~/config/ctags ~/.ctags
$ ln -s ~/config/tmux.conf ~/.tmux.conf
$ mkdir -p ~/.gnupg
$ ln -s ~/config/gpg.conf ~/.gnupg/gpg.conf
$ ln -s ~/config/gpg-agent.conf ~/.gnupg/gpg-agent.conf
```

### Install vim plugins

Open vim, ignore the errors and run `:PlugInstall`.

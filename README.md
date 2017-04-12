# My local config files for Mac OS X

This is just a repository for my local config files.

## Install

### Install software

Work in progress ...

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install neovim/neovim/neovim
$ ln -s /usr/local/bin/nvim /usr/local/bin/vim

$ curl -sf -L https://static.rust-lang.org/rustup.sh | sh
```


### Install config files

```bash
$ cd
$ git clone git@github.com:cynektix/config.git
$ mkdir -p ~/.config/nvim && ln -s ~/config/init.vim ~/.config/nvim/init.vim
```

### Install vim plugins

Open vim, ignore the errors and run `:PlugInstall`.

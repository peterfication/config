# My local config files for Mac OS X

This is just a repository for my local config files.

## Install everything with Ansible

*Before: Add SSH and GPG keys*
- https://makandracards.com/makandra/37763-gpg-extract-private-key-and-import-on-different-machine

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# We need an updated Python 2 because of a bug so we can't use the OS X one
brew install python@2
brew install ansible
git clone git@github.com:peterfication/config.git
cd config
ansible-playbook -K ansible/playbook.yml -i ansible/hosts -vv
./mac_os_defaults.sh
```

### Manual steps

- Change caps lock in `System Preferences > Keyboard > Modifier Keys` to escape
- Create local.zsh from example
- [Install BetterTouchTool](https://bettertouchtool.net/releases/btt2.340.zip) with its license and import the presets and setup `Windows Moving & Resizing` settings
- Remove/add some keyboard shortcuts (F11, F12, CMD+^)
- Install [Postgres.app](https://postgresapp.com/)
- Setup mail

### TODO

- iTerm config

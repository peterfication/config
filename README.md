# My local config files for Mac OS X

This is just a repository for my local config files.

## Install everything with Ansible

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# We need an updated Python 2 because of a bug so we can't use the OS X one
brew install python@2
brew install ansible
git clone https://github.com/peterfication/config.git
cd config
ansible-playbook -K ansible/playbook.yml -i ansible/hosts -vv
```

### Manual steps

- Change caps lock in `System Preferences > Keyboard > Modifier Keys` to escape
- Add SSH and GPG keys
- Create local.zsh
- Remove/add some keyboard shortcuts (F11, F12, CMD+^)
- Install [Postgres.app](https://postgresapp.com/)
- Setup mail
- [Install BetterTouchTool](https://bettertouchtool.net/releases/btt2.340.zip)

### TODO

- iTerm config

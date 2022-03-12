# My local config files for UNIX (mostly Mac OS (X))

This is just a repository for my local config files.

It is heavily focused around the usage of [fzf](https://github.com/junegunn/fzf):

- [fzf-tab](https://github.com/Aloxaf/fzf-tab)
- [fzf-vim](https://github.com/junegunn/fzf.vim)
- [coc-fzf](https://github.com/antoinemadec/coc-fzf)
- [git-fuzzy](https://github.com/bigH/git-fuzzy)
- [tmux session handling with fzf](tmux/04_mappings.tmux)

<img width="1792" alt="preview" src="https://user-images.githubusercontent.com/4454052/110747799-2594ee80-823f-11eb-9aef-8319e425202d.png">

## Steps

### Add SSH and GPG keys

https://makandracards.com/makandra/37763-gpg-extract-private-key-and-import-on-different-machine

```bash
touch gpg.key
vim gpg.key
# Fill private GPG key
gpg --import gpg.key
# Fully trust the key
gpg --edit-key 46FF813D9CC4452B
rm -P gpg.key
```

### Clone config and install

```bash
git clone git@github.com:peterfication/config.git
cd config
./mac_os_defaults.sh
./install.sh
```

### Manual steps

- Change caps lock in `System Preferences > Keyboard > Modifier Keys` to escape
- Change left alt key to `Esc+` in `iTerm2 settings > Profiles > Keys > Right option key`
- Clone base16 theme `git clone https://github.com/martinlindhe/base16-iterm2.git ~/.config/base16-shell`
- Set up iTerm2 with a base16 color scheme from https://github.com/martinlindhe/base16-iterm2
- Change font to NerdFont font "Fira Mono NerdFont" in iTerm2
- Remove/add some keyboard shortcuts (F11, F12, CMD+^)
- Install [Postgres.app](https://postgresapp.com/)
- Set up [Leo searches](alfred/leo-searches.md) in Alfred

### TODO

- iTerm config
- https://github.com/yutkat/dotfiles

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
- Clone base16 theme `git clone https://github.com/chriskempson/base16-shell ~/.config/base16-shell` (to be able to switch color schemes easily) with the `base_16...` commands
- Clone base16 iTerm theme `git clone https://github.com/martinlindhe/base16-iterm2.git ~/.config/base16-shell-iterm`
- Set up iTerm2 with a base16 color scheme from https://github.com/martinlindhe/base16-iterm2
- Change font to NerdFont font "Fira Mono NerdFont" in iTerm2
- Remove/add some keyboard shortcuts (F11, F12, CMD+^)
- Install [Postgres.app](https://postgresapp.com/)
- Set up [Leo searches](alfred/leo-searches.md) in Alfred
- Add Quartz filter in ColorSync Utility for reducing the file size with "Colour Image Sampling" (Quality high, constrain size to 128-1200)
- https://it.digitaino.com/use-touchid-to-authenticate-sudo-on-macos/

### TODO

- iTerm config
- https://github.com/yutkat/dotfiles
- https://dotfiles.github.io/
- https://ohmyposh.dev
- https://github.com/vendasta/setup-new-computer-script https://news.ycombinator.com/item?id=29535432

## Alfred workflows

- https://github.com/alanhg/alfred-workflows/tree/master/switch-audio
  Create own with https://github.com/deweller/switchaudio-osx
  https://github.com/beet/alfred_audio_switcher
- https://github.com/jsumners/alfred-emoji
- https://github.com/vitorgalvao/custom-alfred-iterm-scripts
- https://github.com/g1eny0ung/Alfred-Colors-workflow
- https://github.com/alexchantastic/alfred-ip-address-workflow
- https://github.com/LeEnno/alfred-terminalfinder
- https://gitlab.com/alexives/timer-alfred-workflow

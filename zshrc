# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LC_ALL=en_US.UTF-8

export DEFAULT_USER=petergundel

source ~/config/zsh/00_path.zsh
source ~/config/zsh/00_oh_my_zsh.zsh
source ~/config/zsh/01_zplug.zsh
source ~/config/zsh/02_general.zsh
source ~/config/zsh/03_alias.zsh
source ~/config/zsh/04_eza_ls.zsh
source ~/config/zsh/05_tmux.zsh
source ~/config/zsh/06_fzf.zsh
source ~/config/zsh/07_git.zsh
source ~/config/zsh/08_gnu_tools.zsh
source ~/config/zsh/09_other.zsh

source ~/config/zsh/10_gpg.zsh
source ~/config/zsh/11_asdf.zsh
source ~/config/zsh/12_neovim.zsh

source ~/config/zsh/20_bluetooth.zsh

# source ~/config/zsh/70_gcloud.zsh
source ~/config/zsh/71_aws.zsh
source ~/config/zsh/72_k8s.zsh
source ~/config/zsh/73_terraform.zsh
source ~/config/zsh/74_flux.zsh

source ~/config/zsh/81_ruby.zsh
source ~/config/zsh/82_rust.zsh
source ~/config/zsh/83_go.zsh
source ~/config/zsh/84_python.zsh
# Needs to be after python because of node from conda
source ~/config/zsh/80_node.zsh

source ~/config/zsh/98_base16_shell.zsh
# source ~/config/zsh/99_p10k.zsh
source ~/config/zsh/99_starship.zsh

[ -f ~/config/zsh/local.zsh ] && source ~/config/zsh/local.zsh

# From https://github.com/direnv/direnv/issues/68#issuecomment-114155484
if which direnv &> /dev/null; then
  eval "$(direnv hook zsh)"

  # _direnv_hook() {
  #   if [[ "$PWD" =~ "$HOME" ]]; then
  #     # Supress direnv output when in $HOME
  #     eval "$(direnv export zsh 2> >( egrep -v -e '^direnv: (loading|export|unloading)' ))"
  #   else
  #     eval "$(direnv export zsh)"
  #   fi
  # };
fi

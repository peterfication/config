export LC_ALL=en_US.UTF-8

export DEFAULT_USER=petergundel
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/grep/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/config/zsh/00_oh_my_zsh.zsh
source ~/config/zsh/01_zplug.zsh
source ~/config/zsh/02_general.zsh
source ~/config/zsh/03_alias.zsh
source ~/config/zsh/04_exa_ls.zsh
source ~/config/zsh/05_tmux.zsh
source ~/config/zsh/06_fzf.zsh
source ~/config/zsh/07_git.zsh
source ~/config/zsh/08_gnu_tools.zsh
source ~/config/zsh/09_other.zsh

source ~/config/zsh/10_gpg.zsh
source ~/config/zsh/11_asdf.zsh

# source ~/config/zsh/70_gcloud.zsh
source ~/config/zsh/71_aws.zsh
source ~/config/zsh/72_k8s.zsh
source ~/config/zsh/73_terraform.zsh
source ~/config/zsh/74_flux.zsh

source ~/config/zsh/80_node.zsh
source ~/config/zsh/81_ruby.zsh
source ~/config/zsh/82_rust.zsh
source ~/config/zsh/83_go.zsh
source ~/config/zsh/84_python.zsh

source ~/config/zsh/98_base16_shell.zsh
source ~/config/zsh/99_agnoster.zsh

[ -f ~/config/zsh/local.zsh ] && source ~/config/zsh/local.zsh

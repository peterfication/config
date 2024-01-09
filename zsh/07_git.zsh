# For lazygit
# See https://github.com/jesseduffield/lazygit/issues/1669#issuecomment-1120129863
export XDG_CONFIG_HOME="$HOME/.config"

alias lg=lazygit

# Change to a git repository's root directory from anywhere inside it
function cdb() {
  inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
  if [ $inside_git_repo ]; then
    cd `git rev-parse --show-toplevel`
  else
    echo "Not a git project"
  fi
}
alias cdr=cdb

function git_tmp_shallow() {
  for GIT_URL in $1; do
    REPO_NAME=`basename $GIT_URL`

    mkdir -p $HOME/tmp
    rm -rf "$HOME/tmp/${REPO_NAME}" > /dev/null

    echo ""
    echo "Cloning ${GIT_URL} into $HOME/tmp/${REPO_NAME}"
    echo ""
    echo "git clone -–depth 1 -- ${GIT_URL} $HOME/tmp/${REPO_NAME}"
    echo ""
    git clone --depth 1 -- ${GIT_URL} "$HOME/tmp/${REPO_NAME}"
    echo ""
    cd "$HOME/tmp/${REPO_NAME}"

    # This does not work somehow with the directory.
    # tmux_new_with_name "$HOME/tmp/${REPO_NAME}"
    # tm a -t ${REPO_NAME}
  done
}

alias g='git'
alias gs="git status"
alias gap="git add -p"
alias gall="git add ."
alias gci="git ci"
alias gcia="git cia"

unalias gp

alias gf="git fuzzy"
alias gfb="git fuzzy branch"
alias gfl="git fuzzy log"
alias gfs="git fuzzy status"

export GF_BASE_BRANCH=main
export GF_LOG_MENU_PARAMS='--pretty="%Cred%h%Creset %Cgreen[%ad]%Creset -%C(yellow bold)%d%Creset %s %C(blue)<%an>%Creset" --date=short --topo-order'

export GIT_FUZZY_BRANCH_CHECKOUT_KEY="enter"
export GIT_FUZZY_BRANCH_DELETE_BRANCH_KEY="Ctrl-D"
export GIT_FUZZY_STATUS_ADD_KEY="Ctrl-S"
export GIT_FUZZY_STATUS_EDIT_KEY="Ctrl-E"
export GIT_FUZZY_STATUS_COMMIT_KEY="Ctrl-C"
export GIT_FUZZY_STATUS_RESET_KEY="Ctrl-R"
export GIT_FUZZY_STATUS_DISCARD_KEY="Ctrl-U"

# # debugging information
# export GF_DEBUG_MODE="YES"
#
# # commands run by the program (those without headers)
# export GF_COMMAND_DEBUG_MODE="YES"
#
# # fzf commands run by the program
# export GF_COMMAND_FZF_DEBUG_MODE="YES"
#
# # log output of commands run by `git fuzzy`
# export GF_COMMAND_LOG_OUTPUT="YES"
#
# # log internal commands (pretty noisy)
# export GF_INTERNAL_COMMAND_DEBUG_MODE="YES"

##
# Use FZF to select and checkout a PR with the help
# of the Github CLI
#
# From https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
function pr-checkout() {
  local jq_template pr_number

  jq_template='"'\
'#\(.number) - \(.user.login) - \(.title)'\
'\t'\
'Author: \(.user.login)\n'\
'Created: \(.created_at)\n'\
'Updated: \(.updated_at)\n\n'\
'\(.body)'\
'"'

  pr_number=$(
    gh api 'repos/:owner/:repo/pulls' |
    jq ".[] | $jq_template" |
    sed -e 's/"\(.*\)"/\1/' -e 's/\\t/\t/' |
    fzf \
      --with-nth=1 \
      --delimiter='\t' \
      --preview='echo -e {2}' \
      --preview-window=top:wrap |
    sed 's/^#\([0-9]\+\).*/\1/'
  )

  if [ -n "$pr_number" ]; then
    gh pr checkout "$pr_number"
  fi
}

# Some nice aliases maybe: https://github.com/kbd/setup/blob/e23b3e8e2363284c3c766c0be2211f46c745354a/HOME/.config/git/config#L110
#

alias gitea="GIT_SSH_COMMAND='ssh -o IdentitiesOnly=yes -i ~/.ssh/id_gitea -F /dev/null' git"

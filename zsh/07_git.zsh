# Change to a git repository's root directory from anywhere inside it
function cdb() {
  inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
  if [ $inside_git_repo ]; then
    cd `git rev-parse --show-toplevel`
  else
    echo "Not a git project"
  fi
}

alias g='git'
alias gs="git status"
alias gap="git add -p"
alias gci="git ci"
alias gcia="git cia"

# export PATH="$(pwd)/tools/git-fuzzy/bin:$PATH"

alias gf="git fuzzy"
alias gfb="git fuzzy branch"
alias gfl="git fuzzy log"
alias gfs="git fuzzy status"

export GF_BASE_BRANCH=main
export GF_LOG_MENU_PARAMS='--pretty="%Cred%h%Creset %Cgreen[%ad]%Creset -%C(yellow bold)%d%Creset %s %C(blue)<%an>%Creset" --date=short --topo-order'

export GIT_FUZZY_BRANCH_CHECKOUT_KEY="Ctrl-B"
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

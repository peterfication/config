# Kubernetes
if command -v kubectl &> /dev/null
then
  source <(kubectl completion zsh)
  alias kwp="kubectl get pods --watch --all-namespaces -l"
fi

# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# From https://news.ycombinator.com/item?id=26636675
# Or use https://github.com/ahmetb/kubectx
# kube-context-switch () {
#     kubectl config get-contexts | tail -n +2 | fzf | cut -c 2- | awk ‘{print $1}’ | xargs kubectl config use-context
#  }

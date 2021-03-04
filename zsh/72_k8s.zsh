# Kubernetes
if command -v kubectl &> /dev/null
then
  source <(kubectl completion zsh)
  alias kwp="kubectl get pods --watch --all-namespaces -l"
fi

# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

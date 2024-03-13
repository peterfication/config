# Kubernetes
if command -v kubectl &> /dev/null
then
  alias kwp="kubectl get pods --watch --all-namespaces -l"
fi

# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# From https://news.ycombinator.com/item?id=26636675
# Or use https://github.com/ahmetb/kubectx
# kube-context-switch () {
#     kubectl config get-contexts | tail -n +2 | fzf | cut -c 2- | awk ‘{print $1}’ | xargs kubectl config use-context
#  }

k8s-proxy-eks-dashboard () {
  kubectl -n kube-system get secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}') -o json | jq -r '.data.token' | base64 -d | pbcopy
  echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#!/login"
  kubectl proxy
}

alias kns=k9s

alias ldd=lazydocker

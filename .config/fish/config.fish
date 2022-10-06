set -g fish_greeting ''

set EDITOR /usr/bin/vim
set -x GOPATH $HOME/go
set -x GOBINPATH $HOME/go/bin
#set -x K8S_USERNAME $USER
#set -x K8S_PASSWORD (security find-generic-password -a $USER -s openstack -w)
#set -x GITHUB_TOKEN (security find-generic-password -a $USER -s monsoonctl -w)
set -x NETBOX_TOKEN (security find-generic-password -a $USER -s netboxprod -w)
set -x SECRETS_REPO_PATH (security find-generic-password -a $USER -s cc-secrets -w)
set -x OS_USERNAME $USER
set -x OS_PASSWORD (security find-generic-password -a $USER -s openstack -w)
set -x HAMMER_REPO_PATH (security find-generic-password -a $USER -s cc-hammer -w)
set -x PYCCLOUD_SECRETS_REPO_PATH $GOPATH/src/$SECRETS_REPO_PATH
set -x PYCCLOUD_KUBERNETES_CONFIG ~/.kube/config
set -x PYCCLOUD_VAULT_TOKEN_FILE ~/.vault-token

set -x VAULT_ADDR https://vault.global.cloud.sap
set -x VAULT_KV_ENGINE secrets

set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$GOBINPATH/bin" $fish_user_paths
set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/go/libexec/bin" $fish_user_paths

alias c="code ."
alias goland="/usr/local/bin/goland"

alias python="python3"

alias o="openstack"
alias ozl="openstack zone list"
alias orl="openstack recordset list"

alias h="helm"

alias klocal="set -gx KUBECONFIG (pwd)/.kubeconfig"

alias k="kubectl"
alias kinfo="kubectl cluster-info"
alias kg="kubectl get"
alias ky="kubectl get -o yaml"
alias ksync="kubectl-sync --kubeconfig ~/.kube/config -v debug"
alias klogonall="kubectl-sync logon --all"
alias klogon="kubectl-logon"
alias kd="kubectl describe"
alias kgi="kubectl get ingress"
alias kdi="kubectl describe ingress"
alias kgs="kubectl get svc"
alias kds="kubectl describe svc"
alias kgds="kubectl get ds"
alias kdds="kubectl describe ds"
alias kgd="kubectl get deployment"
alias kdd="kubectl describe deployment"
alias kgrs="kubectl get rs"
alias kdrs="kubectl describe rs"
alias kga="kubectl get all"
alias kda="kubectl describe all"
alias kgns="kubectl get ns"
alias kdns="kubectl describe ns"
alias kgn="kubectl get node --label-columns failure-domain.beta.kubernetes.io/zone,kubernetes.cloud.sap/cp,kubernetes.cloud.sap/apod,kubernetes.cloud.sap/host,flatcar-linux-update.v1.flatcar-linux.net/version,cloud.sap/maintenance-state"
alias kdn="kubectl describe node"
alias kgp="kubectl get pod -o wide"
alias kdp="kubectl describe pod"
alias kgpnr="kubectl get pod -o wide | grep -v 'Running\|Completed'"
alias kgpanr="kubectl get pod -o wide --all-namespaces | grep -v 'Running\|Completed'"
alias kgpanrcount="kubectl get pod -o wide --all-namespaces | grep -v 'Running\|Completed' | grep -v 'Current context' | grep -v NAMESPACE | wc -l"
alias kgpa="kubectl get pod -o wide --all-namespaces"
alias kgpacount="kubectl get pod -o wide --all-namespaces | grep -v 'Current context' | grep -v NAMESPACE | wc -l"
alias kdelp="kubectl delete pod"
alias kdelpforce="kubectl delete pod --force --grace-period=0"
alias kpodcountnodes="kubectl describe node | grep 'Name:\|Non-terminated'"
alias knodesaz="kubectl describe node | grep 'Name:\|failure-domain'"
alias kpodcount="kubectl get pod -o wide --all-namespaces | grep -v 'Current context' | grep -v NAMESPACE | wc -l"
alias kpodcountnr="kubectl get pod -o wide --all-namespaces | grep -v 'Running\|Completed' | grep -v 'Current context' | grep -v NAMESPACE | wc -l"
alias kdrain="kubectl drain --ignore-daemonsets --delete-local-data --force"
alias kcidr="kubectl describe nodes | grep PodCIDR | awk '{print $2}' | sort"

alias kl="kubectl logs --timestamps"
alias wkgn="watch -n 1 kubectl get node --label-columns failure-domain.beta.kubernetes.io/zone,kubernetes.cloud.sap/cp,kubernetes.cloud.sap/apod,kubernetes.cloud.sap/host"
alias wkgp="watch -n 1 kubectl get pod -o wide"
alias wkgpnr="watch -n 1 'kubectl get pod -o wide | grep -v Running | grep -v Completed'"
alias wkgpanr="watch -n 1 'kubectl get pod -o wide --all-namespaces | grep -v Running| grep -v Completed'"

alias cont="kubectl --kubeconfig '/Users/$USER/OneDrive - SAP SE/Desktop/HOMESHARE/CCLOUD/gateway-api/contour-config.yml' --context contour"

alias g="git"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gpsh="git push"
alias gpl="git pull --rebase"
alias gitmaster="git checkout master"
alias gitmerge="git merge origin/master"
alias gitupdatefork="git checkout master && git fetch upstream && git rebase upstream/master && git push origin master"
alias gitlocal="git checkout -b local"
alias gitreset="git reset --hard"

alias ap="ansible-playbook"
alias apv="ansible-playbook --vault-password-file=.vault_password"
alias av="ansible-vault"

alias ll="ls -la"
alias ltime="ls -lart"
alias ls="command ls -FG"

alias wopen="open -n /Applications/Wireshark.app"

alias w="curl wttr.in/daugavpils"
alias wb="curl wttr.in/berlin"

alias dnskill="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias myip="curl api.ipify.org -w \n"
alias speed="speedtest-cli --simple"

alias oldssh="ssh -o KexAlgorithms=+diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1"
alias sshclean="ssh-keygen -R"
alias sshc="ssh-keygen -R"

alias drill="spore drill"

alias flyoldservices="fly5 login -c https://ci.eu-de-2.cloud.sap/ -t old-eu  --team-name services"
alias flyoldcontrolplane="fly5 login -c https://ci.eu-de-2.cloud.sap/ -t old-eu --team-name controlplane"
alias flyservices="fly7 login -c https://ci1.eu-de-2.cloud.sap/ -t ci1 --team-name services"
alias flycontrolplane="fly7 login -c https://ci1.eu-de-2.cloud.sap/ -t ci1 --team-name controlplane"
alias flycore="fly7 login -c https://ci1.eu-de-2.cloud.sap/ -t ci1 --team-name core"

alias vaultlogin="vault login --method oidc --no-print"
alias vaultreset="VAULT_ADDR=file:///dev/null vault-injector import-from ."

alias ksshall="kgn | awk '{print $1}' | grep -v "NAME" | tr '\n' ' ' | xargs csshX --login core"

alias dockerclean="docker system prune && docker rmi -f (docker images -aq)"

alias awslogin="aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/sapcc"

alias brewshow="echo '--Listing formulae:' && brew list -1 && echo '--Taps:' && brew tap && echo '--Casks:' && brew cask list"

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and . /opt/homebrew/share/autojump/autojump.fish
eval (direnv hook fish)

test -e {$HOME}/dotfiles/.iterm2_shell_integration.fish ; and source {$HOME}/dotfiles/.iterm2_shell_integration.fish

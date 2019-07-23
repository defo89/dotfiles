set -g fish_greeting ''

set EDITOR /usr/local/bin/mvim
set -x GOPATH $HOME/go
set -x GOBINPATH $HOME/goBin

set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$GOBINPATH/bin" $fish_user_paths
set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/go/libexec/bin" $fish_user_paths

alias c="code ."

alias o="openstack"
alias ozl="openstack zone list"
alias orl="openstack recordset list"

alias h="helm"

alias klocal="set -gx KUBECONFIG (pwd)/.kubeconfig"

alias k="kubectl"
alias kg="kubectl get"
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
alias kgn="kubectl get node"
alias kdn="kubectl describe node"
alias kgp="kubectl get pod -o wide"
alias kdp="kubectl describe pod"
alias kgpnr="kubectl get pod -o wide | grep -v Running"
alias kgpanr="kubectl get pod -o wide --all-namespaces | grep -v Running"
alias kgpa="kubectl get pod -o wide --all-namespaces"
alias kdelp="kubectl delete pod"
alias kdelpf="kubectl delete pod --force --grace-period=0"

alias kl="kubectl logs --tail=50"
alias wkgn="watch -n 1 kubectl get node"
alias wkgp="watch -n 1 kubectl get pod -o wide"
alias wkgpnr="watch -n 1 'kubectl get pod -o wide | grep -v Running'"
alias wkgpanr="watch -n 1 'kubectl get pod -o wide --all-namespaces | grep -v Running'"

alias g="git"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gpsh="git push"
alias gpl="git pull"
alias gitmaster="git checkout master"
alias gitmerge="git merge origin/master"
alias gitupdatefork="git checkout master && git fetch upstream && git rebase upstream/master && git push origin master"
alias gitlocal="git checkout -b local"
alias gitreset="git reset --hard"

alias ll="ls -la"
alias ltime="ls -lart"
alias ls="command ls -FG"

alias wopen="open -n /Applications/Wireshark.app"

alias w="curl wttr.in/daugavpils"
alias wb="curl wttr.in/berlin"

alias dnskill="sudo killall -HUP mDNSResponder;sudo dscacheutil -flushcache"
alias myip="curl api.ipify.org -w \n"
alias speed="speedtest-cli --simple"

alias oldssh="ssh -o KexAlgorithms=+diffie-hellman-group1-sha1"
alias sshclean="ssh-keygen -R"

alias dockerclean="docker system prune"

alias brewshow="echo '--Listing formulae:' && brew list -1 && echo '--Taps:' && brew tap && echo '--Casks:' && brew cask list"

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish
eval (direnv hook fish)

test -e {$HOME}/dotfiles/.iterm2_shell_integration.fish ; and source {$HOME}/dotfiles/.iterm2_shell_integration.fish

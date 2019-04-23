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

alias h="helm"

alias k="kubectl"

alias g="git"
alias gs="git status"
alias gitmaster 'git checkout master'
alias gitupdatefork 'git checkout master && git fetch upstream && git rebase upstream/master && git push origin master'
alias gitlocal 'git checkout -b local'
alias gitreset 'git reset --hard'

alias ll 'ls -la'
alias ltime 'ls -lart'
alias ls 'command ls -FG'

alias w 'curl wttr.in/daugavpils'
alias wb 'curl wttr.in/berlin'

alias dnskill 'sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

alias sshclean 'ssh-keygen -R'

function fish_user_key_bindings
  bind \e.       'history-token-search-backward'
  bind \e\[1\;9A 'history-token-search-backward'
  bind \e\[1\;9B 'history-token-search-forward'
  bind \e\[1\;9C 'forward-word'
  bind \e\[1\;9D 'backward-word'
end

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish
eval (direnv hook fish)

test -e {$HOME}/dotfiles/.iterm2_shell_integration.fish ; and source {$HOME}/dotfiles/.iterm2_shell_integration.fish

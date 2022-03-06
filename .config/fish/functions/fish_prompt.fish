function __KUBECONTEXT
  set -l context ""
  set -l namespace ""

  if test -n "$KUBECONTEXT"
    set context $KUBECONTEXT
  else
    set context (cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
  end

  if test -n "$KUBECTL_NAMESPACE"
    set namespace "/$KUBECTL_NAMESPACE"
  end

  echo " "(set_color -o blue)‹$context$namespace› 
end

function fish_prompt
  set -gx __fish_git_prompt_showdirtystate true
  set -gx __fish_git_prompt_showcolorhints true

  echo -n -s (set_color -o cyan)(basename (prompt_pwd)) (__fish_git_prompt) (__KUBECONTEXT) (set_color normal) " "
end
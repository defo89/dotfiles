function kc
  if test (count $argv) -gt 0
    set -gx KUBECONTEXT $argv[1]
  else
    set -u KUBECONTEXT
    echo "Context has been removed"
  end
end

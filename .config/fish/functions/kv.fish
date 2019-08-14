function kv
  if test (count $argv) -gt 0
    set -gx KUBECTL_VERSION $argv[1]
    echo "Kubectl version is now $argv[1]"
  else
    set -u KUBECTL_VERSION
    echo "Kubectl version has been removed"
  end
end

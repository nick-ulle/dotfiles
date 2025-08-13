function root
  set root (git rev-parse --show-toplevel)
  if test $status -eq 0
    cd $root
  end
end

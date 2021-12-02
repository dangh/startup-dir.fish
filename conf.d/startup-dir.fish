status is-interactive || exit

function set-startup-dir --argument-names dir
  test -n "$dir" || set --local dir "$PWD"
  test -d "$dir" && set --universal startup_dir (realpath $dir)
end

if test "$PWD" = "$HOME" -a -n "$startup_dir"
  while test ! -d "$startup_dir"
    set startup_dir (dirname $startup_dir)
  end
  cd $startup_dir
end

status is-interactive || exit

function set-startup-dir --argument-names dir
  test -n "$dir" || set --local dir "$PWD"
  test -d "$dir" && set --universal startup_dir (realpath $dir)
end

test "$PWD" = "$HOME" -a -n "$startup_dir" && cd "$startup_dir"

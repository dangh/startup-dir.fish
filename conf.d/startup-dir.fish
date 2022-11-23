status is-interactive || exit

function set-startup-dir -a dir
  test -n "$dir" || set -l dir "$PWD"
  test -d "$dir" && set -U startup_dir (realpath $dir)
end

if test "$PWD" = "$HOME" -a -n "$startup_dir"
  while test ! -d "$startup_dir"
    set startup_dir (dirname $startup_dir)
  end
  if test "$TERM_PROGRAM" = "iTerm.app"
    fish -c "builtin cd" >/dev/null 2>&1
  end
  builtin cd $startup_dir >/dev/null 2>&1
end

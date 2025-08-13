function open
  # Use this instead of fish's built-in open so that no output is printed.
  fork -- xdg-open $argv
end

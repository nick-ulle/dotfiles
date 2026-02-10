function is-pseudoterminal
  string match --quiet --invert '*tty*' (tty)
end

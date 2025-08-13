function ls --wraps eza
  eza --icons --group-directories-first --git --sort=extension --group $argv
end

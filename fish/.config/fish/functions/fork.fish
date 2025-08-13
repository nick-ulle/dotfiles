function fork
  if string length --quiet $argv
    setsid $argv &> /dev/null
  end
end

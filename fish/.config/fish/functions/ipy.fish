function ipy
  if set --query PIXI_ENVIRONMENT_NAME
    # Running in a Pixi environment.
    ipython $argv
  else
    echo Running in default Pixi environment.
    pixi run ipython $argv
  end
end

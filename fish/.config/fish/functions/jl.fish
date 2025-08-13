function jl
  if set --query PIXI_ENVIRONMENT_NAME
    # Running in a Pixi environment.
    jupyter lab --custom-css $argv
  else
    echo Running in default Pixi environment.
    pixi run jupyter lab --custom-css $argv
  end
end

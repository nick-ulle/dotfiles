function py --wraps python
  if set --query PIXI_ENVIRONMENT_NAME
    # Running in a Pixi environment.
    python $argv
  else
    echo Running in default Pixi environment.
    pixi run python $argv
  end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish --disable-up-arrow | source
    pixi completion --shell fish | source
    zoxide init fish | source
    starship init fish | source
    tinty init
end

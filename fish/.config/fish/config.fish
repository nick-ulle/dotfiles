if status is-interactive
    # Commands to run in interactive sessions can go here

    # Abbreviations.
    abbr -a df df --human-readable --exclude-type tmpfs
    abbr -a du du --human-readable --max-depth 1
    abbr -a fd fd --no-ignore
    abbr -a px pixi run
    abbr -a r R --quiet --no-save
    abbr -a trim "sd ' +\$' ''"

    abbr -a --position anywhere \
      -- --help '--help | bat --plain --language help'

    # Initializations.
    atuin init fish --disable-up-arrow | source
    pixi completion --shell fish | source
    zoxide init fish | source
    starship init fish | source
    batman --export-env | source
    tinty init
end

if status is-interactive
    # Commands to run in interactive sessions can go here


    # Abbreviations.
    abbr -a df df --human-readable --exclude-type tmpfs
    abbr -a du du --human-readable --max-depth 1
    abbr -a fd fd --no-ignore
    abbr -a o open
    abbr -a px pixi run
    abbr -a r R --quiet --no-save
    abbr -a trim "sd ' +\$' ''"
    abbr -a mount-ntfs \
      "sudo mount --options loop,uid=nick,gid=nick,fmask=0133,dmask=0022 --types ntfs3"

    abbr -a --position anywhere \
      -- --help '--help | bat --plain --language help'

    abbr -a sudo sudo-rs


    # Environment variables.
    set -gx EDITOR /usr/bin/nvim
    set -gx DIFFPROG /usr/bin/nvim -d
    set -gx PAGER /usr/bin/less

    # Prepend to PATH.
    set -gx -p PATH $HOME/orchard/bin

    # Together with the systemd user-level ssh-agent.service, this takes care
    # of running the SSH agent.
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

    # Explicitly set the XDG variables for use later.
    set -gx XDG_CONFIG_HOME $HOME/.config
    set -gx XDG_CACHE_HOME $HOME/.cache
    set -gx XDG_DATA_HOME $HOME/.local/share
    set -gx XDG_STATE_HOME $HOME/.local/state

    # Set up R user library (for development).
    set -gx R_LIBS_USER $XDG_CONFIG_HOME/R/library
    set -gx R_MAKEVARS_USER $XDG_CONFIG_HOME/R/makevars
    set -gx R_PROFILE_USER $XDG_CONFIG_HOME/R/rprofile


    # Initializations.
    atuin init fish --disable-up-arrow | source
    pixi completion --shell fish | source
    zoxide init fish | source

    if is-pseudoterminal
      starship init fish | source
      batman --export-env | source
      tinty init
    end
end

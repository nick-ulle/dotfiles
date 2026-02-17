#
# .profile
#
# This file is executed on TTY login to any shell.
#
# By default, bash skips this file if .bash_profile is found.


# Exit early if this script already ran.
if [ "$PROFILE_EXECUTED" = true ]; then
  # From <https://stackoverflow.com/a/52012684/1166039>:
  return 0 2>/dev/null || exit 0
fi
export PROFILE_EXECUTED="true"


# Path
# ====
# Make PATH an environment variable if it's not already.
export PATH

# Add local bin to the path.
PATH="${HOME}/.local/bin:${PATH}"

# Add the binaries directory to the path.
PATH="${HOME}/orchard/bin:${PATH}"

# Add Ruby Gems to the path.
# PATH="${XDG_CONFIG_HOME}/ruby/gems/bin:${PATH}"

# Add TeXLive to the path.
# PATH="/usr/local/texlive/2021/bin/x86_64-linux:${PATH}"
# export MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man:${MANPATH}"
# export INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info:${INFOPATH}"

# Add Cargo to the path.
PATH="${HOME}/.cargo/bin:${PATH}"



# XDG Basedir Support
# ===================
# From <https://specifications.freedesktop.org/basedir-spec/>:
#
# > $XDG_CONFIG_HOME defines the base directory relative to which user-specific
# > configuration files should be stored. If $XDG_CONFIG_HOME is either not set
# > or empty, a default equal to $HOME/.config should be used.
# >
# > $XDG_CACHE_HOME defines the base directory relative to which user-specific
# > non-essential data files should be stored. If $XDG_CACHE_HOME is either not
# > set or empty, a default equal to $HOME/.cache should be used.
# >
# > $XDG_DATA_HOME defines the base directory relative to which user-specific
# > data files should be stored. If $XDG_DATA_HOME is either not set or empty,
# > a default equal to $HOME/.local/share should be used.
# >
# > $XDG_STATE_HOME defines the base directory relative to which user-specific
# > state files should be stored. If $XDG_STATE_HOME is either not set or
# > empty, a default equal to $HOME/.local/state should be used.
#
# Explicitly set the XDG variables for use later.
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"


# Config Files
# ------------
# Set up R user library (for development).
export R_LIBS_USER=${XDG_CONFIG_HOME}/R/library
export R_MAKEVARS_USER=${XDG_CONFIG_HOME}/R/makevars
export R_PROFILE_USER=${XDG_CONFIG_HOME}/R/rprofile

# Set up Ruby Gems directory.
export GEM_HOME=${XDG_CONFIG_HOME}/ruby/gems

# Set up grip settings directory.
export GRIPHOME=${XDG_CONFIG_HOME}/grip

# Set up gnupg settings directory.
export GNUPGHOME=${XDG_CONFIG_HOME}/gnupg

export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"


# SSH Agent
# =========
# Together with the systemd user-level ssh-agent.service, this takes care of
# running the SSH agent.
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"


# Other Settings
# ==============
# Make Vim the default editor.
export EDITOR=nvim
export DIFFPROG="nvim -d"

# Set GTK3 and QT5 high DPI scaling.
# export GDK_SCALE=2
export GDK_DPI_SCALE=0.825
# export QT_DEVICE_PIXEL_RATIO=2

# Make Java AWT behave in bspwm.
# export _JAVA_AWT_WM_NONREPARENTING=1

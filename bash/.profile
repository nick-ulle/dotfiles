#
# .profile
#
# This file is executed on TTY login to any shell. By default, bash skips this
# file if .bash_profile is found.


# Environment Variables
# =====================
# Make Vim the default editor.
export EDITOR=nvim
export DIFFPROG="nvim -d"

# Set GTK3 and QT5 high DPI scaling.
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5
#export QT_DEVICE_PIXEL_RATIO=2

# Set up R user library (for development).
export R_LIBS_USER=${HOME}/.config/R/library
export R_MAKEVARS_USER=${HOME}/.config/R/makevars
export R_PROFILE_USER=${HOME}/.config/R/rprofile

# Set up Ruby Gems directory.
export GEM_HOME=${HOME}/.config/ruby/gems

# Make Java AWT behave in bspwm.
export _JAVA_AWT_WM_NONREPARENTING=1

# Set up grip settings directory.
export GRIPHOME=${HOME}/.config/grip


# Path
# ====
# Add the binaries directory to the path.
PATH="${HOME}/garden/bin:${PATH}"

# Add Ruby Gems to the path.
PATH="${HOME}/.config/ruby/gems/bin:${PATH}"

# Add TeXLive to the path.
PATH="/usr/local/texlive/2021/bin/x86_64-linux:${PATH}"
MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man:${MANPATH}"
INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info:${INFOPATH}"

# Add Cargo to the path.
PATH="${HOME}/.cargo/bin:${PATH}"

# Add local bin to the path.
PATH="${HOME}/.local/bin:${PATH}"

export PATH
export MANPATH
export INFOPATH


# XDG Basedir Support
# ===================
export GNUPGHOME=${XDG_CONFIG_HOME}/gnupg

export ICEAUTHORITY=${XDG_CACHE_HOME}/ICEauthority

export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"


# Gnome Keyring
# =============
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

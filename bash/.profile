#
# .profile
#
# This file is executed on TTY login to any shell. By default, bash skips this
# file if .bash_profile is found.


# Environment Variables
# =====================
# Make Vim the default editor.
export EDITOR=nvim

# Set GTK3 and QT5 high DPI scaling.
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5
#export QT_DEVICE_PIXEL_RATIO=2

# Make Wine emulate 32-bit Windows.
#export WINEARCH=win32

# Set up R user library (for development).
export R_USER=${HOME}/.config/R
export R_LIBS_USER=${HOME}/.config/R/library
export R_MAKEVARS_USER=${HOME}/.config/R/Makevars


# Path
# ====
# Add the binaries directory to the path.
PATH="${HOME}/garden/bin:${PATH}"

# Add Ruby Gems to the path.
PATH="${PATH}:$(ruby -rubygems -e "puts Gem.user_dir")/bin"

# Add TeXLive to the path.
PATH="${PATH}:/usr/local/texlive/2015/bin/x86_64-linux"

export PATH

export PATH="$HOME/.cargo/bin:$PATH"


# XDG Basedir Support
# ===================
export GNUPGHOME=${XDG_CONFIG_HOME}/gnupg

export ICEAUTHORITY=${XDG_CACHE_HOME}/ICEauthority

export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"


# TTY Colors
# ==========
if [ "$TERM" = "linux" ]; then
  # Atelier Forest
  color00="1b1918"
  color01="f22c40"
  color02="7b9726"
  color03="c38418"
  color04="407ee7"
  color05="6666ea"
  color06="3d97b8"
  color07="a8a19f"

  color08="766e6b"
  color09=$color01
  color0A=$color02
  color0B=$color03
  color0C=$color04
  color0D=$color05
  color0E=$color06
  color0F="f1efee"

  echo -en "\e]P0$color00" # Base 00 - Black
  echo -en "\e]P1$color01" # Base 08 - Red
  echo -en "\e]P2$color02" # Base 0B - Green
  echo -en "\e]P3$color03" # Base 0A - Yellow
  echo -en "\e]P4$color04" # Base 0D - Blue
  echo -en "\e]P5$color05" # Base 0E - Magenta
  echo -en "\e]P6$color06" # Base 0C - Cyan
  echo -en "\e]P7$color07" # Base 05 - White

  echo -en "\e]P8$color08" # Base 03 - Bright Black
  echo -en "\e]P9$color09" # Base 08 - Bright Red
  echo -en "\e]PA$color10" # Base 0B - Bright Green
  echo -en "\e]PB$color11" # Base 0A - Bright Yellow
  echo -en "\e]PC$color12" # Base 0D - Bright Blue
  echo -en "\e]PD$color13" # Base 0E - Bright Magenta
  echo -en "\e]PE$color14" # Base 0C - Bright Cyan
  echo -en "\e]PF$color15" # Base 07 - Bright White

  clear # Prevent artifacts.

  unset color00
  unset color01
  unset color02
  unset color03
  unset color04
  unset color05
  unset color06
  unset color07
  unset color08
  unset color09
  unset color10
  unset color11
  unset color12
  unset color13
  unset color14
  unset color15

  # Set sane dircolors.
  export TTY_DIRCOLORS=$HOME/.config/dircolors/ansi-universal
fi

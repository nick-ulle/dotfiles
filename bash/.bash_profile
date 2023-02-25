#
# .bash_profile
#
# This file is executed on TTY login to a bash shell.
#
# For some reason, this file is executed twice under SDDM and Cinnamon-bspwm.
# It seems to be because SDDM sources this file once and terminals opened with
# bspwm(?) are login shells so they source it again.

[[ -r ~/.profile ]] && source ~/.profile
[[ -r ~/.bashrc  ]] && source ~/.bashrc

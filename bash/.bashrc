#
# .bashrc
#
# This file is executed by every new interactive shell.

# Return if not running interactively.
[[ $- != *i* ]] && return

# Set up Rust sources for racer.
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Aesthetics
# ==========

# Set the shell prompt.
#PS1='[\u@\h \W]\$ '
PS1='\u \[\e[0;34m\]\W\[\e[m\] \$ '

# Set Base16 shell colors.
#BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-solarized-dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
BASE16_SHELL="$HOME/.config/base16-shell/"
if [ -s "$BASE16_SHELL/profile_helper.sh" ]; then
# #  # The script exists, so evaluate it.
  source "$BASE16_SHELL/profile_helper.sh"
fi

base16_catppuccin-frappe

# Enable filetype-specific colors for ls.
eval $(dircolors -b $TTY_DIRCOLORS)


# Aliases
# =======

alias ssh='TERM=xterm-256color ssh'
alias vpn='sudo openconnect --user=nulle --force-dpd=240'`
  `' --protocol=pulse staff.vpn.library.ucdavis.edu'
alias vpn-library='sudo openconnect --user=nulle --force-dpd=240'`
  `' --protocol=pulse vpn.library.ucdavis.edu'
alias vpn-ucdh='sudo openconnect --user=nulle'`
  `' --protocol=anyconnect connect.ucdmc.ucdavis.edu'

# This function creates an SSH tunnel (e.g., for JupyterLab).
function ssht {
  local remote="${1:-farm}"
  local host="${2:-gpu-4-56}"
  local socket="${3:-8888}"
  # local_socket:host:remote_socket
  ssh $remote -L "$socket:$host:$socket" -N
}

alias vi='nvim'
alias vim='nvim'

# This alias makes python use the IPython debugger.
alias pdb="PYTHONBREAKPOINT='IPython.core.debugger.set_trace' python"
alias jn='jupyter notebook'
alias jl='jupyter lab'

alias r='R --quiet --no-save'
alias rbuild='R CMD build'
alias rinstall='R CMD INSTALL'


# System Aliases
# ==============

alias du='du --human-readable --max-depth 1'
alias df='df --human-readable --exclude-type tmpfs'
alias free='free --human'

alias ls='eza --icons --group-directories-first --git --sort=extension --group'
alias ll='ls -l --classify'

alias fd='fd --no-ignore'

alias grep='grep -n --color=auto'

# This alias trims all end-of-line whitespace from a file.
alias trim='sd '\'' +$'\'' '\'\'

alias dl='trash-put'

alias .todo='nvim ~/TODO.md'

# This function forks a process.
function fork {
  if [ -n "$1" ]; then
    setsid "$@" &> /dev/null
  fi
}

alias open='fork xdg-open'
alias o='open'

alias up='cd ..'
alias back='cd ~-'

# This function provides a concise alternative to xrandr.
function xr {
  local output="${1:-hdmi}"
  local position="${2:-mirror}"
  local mode="${3:-1920x1080}"

  case $output in
    dp)
      output="DP-1";;
    hdmi)
      output="HDMI-2";;
    *)
      echo "Usage: xr [hdmi|dp] [left|right|above|below|mirror|off] [res]"
      return;;
  esac

  case $position in
    left | right)
      position="$position-of";;
    above | below)
      ;;
    mirror | same)
      position="same-as";;
    off)
      local cmd="xrandr --output $output --$position"
      echo $cmd
      eval $cmd
      return;;
    *)
      echo "Usage: xr [hdmi|dp] [left|right|above|below|mirror|off] [res]"
      return;;
  esac

  local cmd="xrandr --output $output --$position eDP-1 --mode $mode"
  echo $cmd
  eval $cmd
}

# zoxide init
eval "$(zoxide init bash)"

# starship init
eval "$(starship init bash)"
starship_precmd

# Pixi autocompletion
eval "$(pixi completion --shell bash)"

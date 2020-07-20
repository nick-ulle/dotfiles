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
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Enable filetype-specific colors for ls.
eval $(dircolors -b $TTY_DIRCOLORS)


# Aliases
# =======

alias ssh='TERM=xterm-256color ssh'

alias jn='jupyter notebook'
alias jl='jupyter lab'

alias r='R --quiet --no-save'
alias rbuild='R CMD build'
alias rinstall='R CMD INSTALL'

alias ls='ls -h --group-directories-first --color=auto'

alias grep='grep -n --color=auto'

alias dl='trash-put'

alias .library='cd ${HOME}/archive/library'
alias .market='cd ${HOME}/market'
alias .research='cd ${HOME}/workshop/research'
alias .teach='cd ${HOME}/university/teach'
alias .learn='cd ${HOME}/university/learn'
alias .work='cd ${HOME}/workshop'

alias .todo='nvim ~/TODO.md'

# Add fork command to fork a process.
fork () {
  if [ -n "$1" ]
  then
    setsid "$@" &> /dev/null
  fi
}

alias open='fork xdg-open'
alias o='open'

alias up='cd ..'
alias back='cd ~-'

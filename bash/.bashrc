#
# .bashrc
#
# This file is executed by every new interactive shell.

# Return if not running interactively.
[[ $- != *i* ]] && return


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

alias jn='jupyter notebook'

alias ls='ls -h --group-directories-first --color=auto'

alias grep='grep -n --color=auto'

alias dl='trash-put'

alias .library='cd ${HOME}/archive/library'
alias .market='cd ${HOME}/market'
alias .research='cd ${HOME}/workshop/research'
alias .teach='cd ${HOME}/university/teach'
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

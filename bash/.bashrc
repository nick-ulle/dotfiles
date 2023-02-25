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

alias du='du --human-readable --max-depth 1'
alias df='df --human-readable --exclude-type tmpfs'

alias ssh='TERM=xterm-256color ssh'
alias mm='micromamba'

function mma {
  local env="${1:-main}"
  micromamba activate $env
}

alias mmd='micromamba deactivate'

alias jn='jupyter notebook'
alias jl='jupyter lab'

alias r='R --quiet --no-save'
alias rbuild='R CMD build'
alias rinstall='R CMD INSTALL'

alias ls='exa --icons --group-directories-first --sort=extension'
alias ll='ls --long'

alias grep='grep -n --color=auto'

alias dl='trash-put'

alias .datalab='cd ${HOME}/workshop/datalab'
alias .library='cd ${HOME}/archive/library'
alias .market='cd ${HOME}/market'
alias .research='cd ${HOME}/workshop/research'
alias .teach='cd ${HOME}/university/teach'
alias .learn='cd ${HOME}/university/learn'
alias .work='cd ${HOME}/workshop'
alias .config='cd ${HOME}/.config'

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
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/nick/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/nick/garden/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/nick/garden/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/nick/garden/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/nick/garden/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

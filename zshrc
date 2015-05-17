#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# I need to first run dircolors -p > ~/.dircolors
# and then put TERM xterm-termite in the .dircolors file
#eval $(dircolors ~/.dircolors)

# Set environment variable for nvim to support true color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

#Aliases {{{
alias vi=nvim
#}}}

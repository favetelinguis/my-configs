set PATH /Users/henriklarsson/.cargo/bin $PATH
set PATH /Users/henriklarsson/.npm-global/bin $PATH
set PATH /Users/henriklarsson/.local/bin $PATH

# Used for haskell
bass source /Users/henriklarsson/.ghcup/env

# Used for vim fzf plugin
set -x FZF_DEFAULT_COMMAND 'rg --files'

# set aliases
alias vi nvim
alias gl "git log --graph --pretty=format:'%C(auto)%h -%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# removes the default fish greeting
set fish_greeting

# get autojump to work
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# If the file is avaliable load it
if test -e ~/.extraconf.fish
	source ~/.extraconf.fish
end

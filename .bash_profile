#My own directory i can put things in 
export PATH="~/bin:$PATH"
# added by Anaconda 1.9.1 installer
export PATH="//anaconda/bin:$PATH"

#Imported since cabal put its files here on mac 
export PATH="~/Library/Haskell/bin:$PATH"

#To get mactex to work
export PATH="/usr/texbin:$PATH"

#To get vim working with haskell
#export PATH="$HOME/.cabal/bin:$PATH"

#Setting prompt
export PS1="\w (\!): "

#set some aliases
alias ls="ls -F"

#make less clear the window befor showing each new page
export LESS='eMqc'

#makes all grep command show color matches for words
GREP_OPTIONS="--color=always";export GREP_OPTIONS

#makes is to that > kan not owerwrite existing files, obs affects only >
set noclobber

#fix colors in less so that git diff works
export LESS="-erX"

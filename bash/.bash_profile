#My own directory i can put things in 
export PATH="~/bin:$PATH"
# added by Anaconda 1.9.1 installer
export PATH="//anaconda/bin:$PATH"

#To get mactex to work
export PATH="/usr/texbin:$PATH"

#To get vim working with haskell
#export PATH="$HOME/.cabal/bin:$PATH"

#Imported since cabal put its files here on mac 
#Needs to go before Usr/bin
export PATH="~/Library/Haskell/bin:$PATH"
export PATH="/Users/henriklarsson/Library/Haskell/ghc-7.6.3/lib/alex-3.1.4/bin$PATH"

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

#puts the newest emacs on my path
alias emacs='/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw'
alias vim='/usr/local/Cellar/macvim/7.4-72/MacVim.app/Contents/MacOS/Vim'

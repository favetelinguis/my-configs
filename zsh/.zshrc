export PATH=$PATH:/opt/local/bin
# MACFILE="~/.zshrc"
# source $MACFILE
#Adjusts screen brightness to 50% of original value
# xbacklight -set 50

#set gamma values
# xgamma -rgamma 1 -ggamma 1 -bgamma 1

#An alias to connect to the networks defined in
#/etc/systemd/system
alias nw="systemctl start network-wireless@wlp3s0"
# alias blu="xbacklight -inc 10" #Increase backlight 10%
# alias bld="xbacklight -dec 10" #decrese backlight 10%

#Required to get colurs with ls in termite
eval $(dircolors ~/.dircolors)

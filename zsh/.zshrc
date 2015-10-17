export PATH=$PATH:/opt/local/bin

#An alias to connect to the networks defined in
#/etc/systemd/system
alias nw="systemctl start network-wireless@wlp3s0"

#Required to get colurs with ls in termite
eval $(dircolors ~/.dircolors)

#Inactivate C-s C-q for scrollmode
vim() STTY=-ixon command vim "$@"

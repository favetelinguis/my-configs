export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/home/henke/my-configs/scripts
export PATH=$PATH:/home/henke/anaconda/bin

# Used to support xmonad with java swing
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1

#An alias to connect to the networks defined in
#/etc/systemd/system
alias nwsetup="sudo vim /etc/wpa_supplicant/wpa_supplicant.conf"
alias nw="systemctl start network-wireless@wlp3s0"
alias python="~/anaconda/bin/python"
alias chrome="nohup chromium --force-device-scale-factor=1.8 &"
 # alias nw="systemctl start network-wireless@wlp0s20u2"

#Required to get colurs with ls in termite
eval $(dircolors ~/.dircolors)

#Inactivate C-s C-q for scrollmode
vim() STTY=-ixon command vim "$@"

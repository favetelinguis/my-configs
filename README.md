# My Devsetup
tmux
asdf
rg
ranger
fzf
guake
vscode
    - vim
WinTile gnome extension

### Details
fzf need the following set
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
export FZF_ALT_C_COMMAND="fdfind -t d . $HOME"
This need fd-find installed and ranger, not that DEFAULT_COMMAND has no affect in my setup, its the other two that has effect
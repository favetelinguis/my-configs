#!/usr/bin/env bash

#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# requirements fasd https://www.tecmint.com/fasd-quick-access-to-linux-files-and-directories/

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Removing ~/.spacemacs"
rm ~/.spacemacs
echo "Creating symlink for .spacemacs"
ln -s $DIR/.spacemacs $HOME/.spacemacs

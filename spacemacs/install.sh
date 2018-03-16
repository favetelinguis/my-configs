#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Removing ~/.spacemacs"
rm ~/.spacemacs
echo "Creating symlink for .spacemacs"
ln -s $DIR/.spacemacs $HOME/.spacemacs

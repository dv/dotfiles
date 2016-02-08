#!/bin/sh
# Setup a machine for Sublime Text 3
set -x

# Install `subl` command line tool
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Symlink settings
mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User.backup
ln -s $DOTFILES_ROOT/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

echo "  Linked Sublime settings. Make sure to have Package Control installed."

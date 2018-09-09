#!/bin/sh

rm -f ~/.config/karabiner
ln -s $DOTFILES_ROOT/karabiner-elements/config ~/.config/karabiner

if test ! $(which karabiner-elements)
then
  echo "  Installing karabiner-elements for you."
  brew cask install karabiner-elements > /tmp/karabiner-elements-install.log
fi

launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

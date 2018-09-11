#!/bin/sh

rm -f ~/.config/karabiner
ln -s $DOTFILES_ROOT/karabiner-elements/config ~/.config/karabiner

if ! brew cask ls --versions karabiner-elements 2>/dev/null >/dev/null
then
  echo "  Installing karabiner-elements for you."
  brew cask install karabiner-elements > /tmp/karabiner-elements-install.log
fi

launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

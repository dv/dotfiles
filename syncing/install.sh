#!/bin/sh

# Using https://github.com/markogresak/cloud-ignore-files

if ! brew ls --versions unison 2>/dev/null >/dev/null
then
  echo "  Installing unison for you."
  brew install unison > /tmp/unison-install.log
fi

cd $DOTFILES_ROOT/syncing/cloud-ignore-files
./install-cloud-ignore-files.sh

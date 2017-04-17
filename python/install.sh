#!/bin/sh

if test ! $(which pyenv)
then
  echo "  Installing pyenv for you."
  brew install pyenv > /tmp/pyenv-install.log
fi

brew install pyenv-virtualenv

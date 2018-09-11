#!/bin/sh

if test ! $(which postgres)
then
  echo "  Installing postgresql for you."
  brew install postgresql > /tmp/postgresql-install.log
fi

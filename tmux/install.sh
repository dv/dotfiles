#!/bin/sh

if test ! $(which tmux)
then
  echo "  Installing tmux for you."
  brew install tmux reattach-to-user-namespace > /tmp/tmux-install.log
fi

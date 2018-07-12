#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew install grc coreutils spark openssl

# Development utils
brew install pup httpie jq moreutils
brew install Caskroom/cask/licecap # GIF recorder
brew install graphicsmagick

# Install patched ansible
for filename in $(find -H "$DOTFILES_ROOT/homebrew/formulae" -name '*.rb' )
do
  brew install file://$filename
done

exit 0

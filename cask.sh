#!/usr/bin/env bash

# All these applications are independent, so if one
# fails to install, don't stop.
set +e

# Make sure we’re using the latest Homebrew.
brew update

brew tap caskroom/cask

# Upgrade any already-installed formulae.
brew upgrade --all

brew cask install --appdir="~/Applications" atom
brew cask install --appdir="~/Applications" virtualbox
brew cask install --appdir="~/Applications" vagrant
brew cask install --appdir="~/Applications" macdown
brew cask install --appdir="~/Applications" calibre
brew cask install --appdir="~/Applications" visual-studio-code
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" flycut
brew cask install --appdir="~/Applications" shiftit
brew cask install --appdir="~/Applications" flux

brew cask cleanup
brew cleanup

set -e

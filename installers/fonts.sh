#!/bin/sh

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# install fonts - like a boss!
brew tap caskroom/fonts
# fonts -- search for more with [$brew cask search /font-inconsola]
fonts=(
  font-inconsolata-for-powerline
  #font-m-plus
  font-clear-sans
  font-roboto
)

# install fonts
echo "installing fonts..."
#brew cask install ${fonts[@]}


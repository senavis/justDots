#!/bin/sh
brew update
brew upgrade

brew install ack
brew install tree
brew install wget
brew install openssl

# development server setup
#brew install nginx
#brew install dnsmasq

# development tools
brew install git
#brew install hub
brew install macvim --override-system-vim
brew install tmux
brew install zsh
#brew install highlight
brew install z
brew install markdown #optional

# more stuff
brew install mutt
brew install ctags
brew install htop-osx
brew install python
brew install grc
brew install coreutils
brew install findutils
brew install msmtp
brew install offline-imap
brew install fish
brew install fortune
brew install cowsay
brew install brew-cask
#brew install contacts #needs xcode dev tools #outdated
brew install https://raw.github.com/tgray/homebrew-tgbrew/master/contacts2.rb
brew install openssh
brew install sqlite
brew install figlet
brew install urlview
brew install w3m
brew install notmuch
brew install the_silver_searcher #kick ass search :P

# cask installs
brew cask install flux #must have
brew cask install caffeine
brew cask install google-chrome
brew cask install firefox
brew cask install vlc
brew cask install the-unarchiver
brew cask install iterm2 #top most
#brew cask install alfred 
brew cask install transmission
brew cask install skype
brew cask install sublime-text3
brew cask install dropbox
brew cask install xtrafinder
brew cask install spectacle
brew cask install sqlitebrowser
#brew cask install controlplane

# cleanup
brew cleanup

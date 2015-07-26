#!/bin/bash
#TODO backup existing dotfiles if any.

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source installers/linkit.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "Brewing all the things"
    source installers/brew.sh

    echo "Updating OSX settings"
    source scripts/osx.sh

    #echo "Installing node (from nvm)"
    #nvm install stable
    #nvm alias default stable

#    echo "Configuring nginx"
#    # create a backup of the original nginx.conf
#    mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.original
#    ln -s nginx/nginx.conf /usr/local/etc/nginx/nginx.conf
#    # symlink the code.dev from dotfiles
#    ln -s nginx/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
fi


echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Install Oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "Done."

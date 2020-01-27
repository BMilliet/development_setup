#!/usr/bin/env bash

# install brew

brew update
brew upgrade

brew install git
brew cask install iterm2
brew install zsh
brew cask install slack
brew cask install spotify
brew cask install visual-studio-code
brew cask install postman
brew cask install firefox
brew cask install brave-browser
brew install python3
brew install ruby

brew cleanup
brew list

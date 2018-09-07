#!/bin/sh

arch=$(uname)

if [[ "$arch" == "Linux" ]]; then
    sudo apt install golang-go -y
elif [[ "$arch" == "Darwin" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install go
fi

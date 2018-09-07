#!/bin/bash

arch=$(uname)

bash bootstrap_go.sh

# TODO: just download the appropriate pre-compiled binary of sysreqs
go install github.com/iepathos/reqs

reqs -u

# install pyenv
PYENV_HOME=~/.pyenv
if [[ ! -d $PYENV_HOME ]]; then
    git clone https://github.com/pyenv/pyenv.git $PYENV_HOME
fi
PYENV_VIRTUALENV_HOME=$PYENV_HOME/plugins/pyenv-virtualenv
if [[ ! -d $PYENV_VIRTUALENV_HOME ]]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_VIRTUALENV_HOME
fi

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# set shell to zsh
chsh -s `which zsh`

# copy over shellenv exports to ~/.zshrc
cat shellenv/goexports.sh >> ~/.zshrc
cat shellenv/pyexports.sh >> ~/.zshrc
cat shellenv/sublexports.sh >> ~/.zshrc

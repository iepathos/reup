#!/bin/sh

arch=$(uname)

sh bootstrap_go.sh

# TODO: just download the appropriate pre-compiled binary of sysreqs
go install -u github.com/iepathos/sysreqs

if [[ "$arch" == "Linux" ]]; then
    cat common-requirements.txt apt-requirements.txt | sysreqs
elif [[ "$arch" == "Darwin" ]]; then
    cat common-requirements.txt brew-requirements.txt | sysreqs
fi

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
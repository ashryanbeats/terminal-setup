#!/bin/zsh
############################
# .make.sh
# This script checks if node/npm is installed and installs it if not yet installed
############################

install_node () {
    if [ ! -f /bin/zsh -o -f /usr/bin/zsh ]; then
        echo "Run installzsh.sh to install zsh first, then run this script."
        exit 1
    fi

    if [ ! -d ~/n ]; then
      echo "Installing n..."
      cd ~
      git clone https://github.com/tj/n.git
      cd n
      sudo make install
      wait
    fi

    n lts &
    wait
}

install_node

#!/bin/bash

printf "\n"
source ~/dotfiles/scripts/installzsh.sh

printf "\n"
zsh ~/dotfiles/scripts/createdotfiles.sh

printf "\n"
zsh ~/dotfiles/scripts/installnode.sh

printf "\n"
zsh ~/dotfiles/scripts/installnodemodules.sh

printf "\n"
node ~/dotfiles/scripts/clonescripts.js

printf "\n"
zsh ~/dotfiles/scripts/finalize.sh

#!/bin/bash

printf "\n"
source ~/terminal-setup/scripts/installzsh.sh

printf "\n"
zsh ~/terminal-setup/scripts/createdotfiles.sh

printf "\n"
zsh ~/terminal-setup/scripts/installterminalfonts.sh

printf "\n"
zsh ~/terminal-setup/scripts/installterminaltheme.sh

printf "\n"
zsh ~/terminal-setup/scripts/installnode.sh

printf "\n"
zsh ~/terminal-setup/scripts/installnodemodules.sh

printf "\n"
node ~/terminal-setup/scripts/clonescripts.js

printf "\n"
zsh ~/terminal-setup/scripts/finalize.sh

#!/bin/zsh

########## Variables
nodemodules=("http-server" "jshint" "trash-cli")
##########

echo "Installing global node modules..."
npm i -g $nodemodules

echo "Installing terminal setup node modules..."
cd ~/terminal-setup
npm i
#!/bin/zsh

########## Variables
nodemodules=("http-server" "jshint" "trash-cli")
##########

echo "Installing global node modules..."
npm i -g $nodemodules
#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy .gitconfig to home
cp $dir/.gitconfig ~/.gitconfig
echo "Copied .gitconfig to ~/.gitconfig"

# Copy .gitignore_global to home
cp $dir/.gitignore_global ${HOME}/.gitignore_global
echo "Copied .gitignore_global to ${HOME}/.gitignore_global"

# Set up credentials
sh $dir/set_credentials.sh
echo "Set up credentials"

# Set up global gitignore
git config --global core.excludesfile ${HOME}/.gitignore_global
echo "Set up global gitignore file"

#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy .gitconfig to home
cp ${DIR}/.gitconfig ~/.gitconfig
echo "Copied .gitconfig to ~/.gitconfig"

# Set up credentials
sh ${DIR}/set_credentials.sh
echo "Set up credentials"


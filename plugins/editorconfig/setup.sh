#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy .gitconfig to home
cp $dir/.editorconfig ~/.editorconfig
echo "Copied .editorconfig to ~/.editorconfig"

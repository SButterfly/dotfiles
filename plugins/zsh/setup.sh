#!/bin/bash

install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Install Oh My Zsh if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      chsh -s $(which zsh)
    fi
  else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
      if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
        install_zsh
      fi
      if [[ -f /etc/debian_version ]]; then
        sudo apt-get install zsh
        install_zsh
      fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      echo "We'll install zsh, then re-run this script!"
      brew install zsh
      exit
    fi
  fi
}

install_zsh

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy my theme to home
cp ${dir}/sbutterfly.zsh-theme ~/.oh-my-zsh/themes
echo "Copied theme file to ~/.oh-my-zsh/themes/sbutterfly.zsh-theme"

# Append to .zchrc line to run our script
INIT_FILE="${HOME}/.myrc"
ZCH_FILE="${HOME}/.zshrc"
line="export $INIT_FILE"
grep -q -F "$line" $ZCH_FILE || echo "$line" >> $ZCH_FILE
echo "Appended '$line' to '$ZCH_FILE'"

cat zsh_init >> $INIT_FILE 
echo "Appended 'zsh_init' to '$INIT_FILE'"

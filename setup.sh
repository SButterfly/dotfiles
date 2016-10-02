#!/bin/bash
# Start script of machine initilization
# It's safe to run it multilple times

INIT_FILE="${HOME}/.myrc"

# Prepare to run plugin scripts
# Clear ~/myrc script
rm -f $INIT_FILE
echo "#!/bin/bash" > $INIT_FILE
echo "Cleared $INIT_FILE"

# Plugins to run
declare -a PLUGINS=(
	'zsh'
	'git'
)

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for i in ${PLUGINS[@]}; do
	path="$dir/plugins/$i"
	echo "Running '$i' plugin"
	sh $path/setup.sh	
	echo
done

echo "Finished initialization"

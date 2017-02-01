#!/bin/bash
# Start script of machine initilization
# It's safe to run it multilple times

export INIT_FILE="${HOME}/.myrc"

# Prepare to run plugin scripts
# Clear ~/myrc script
rm -f $INIT_FILE
echo "#!/bin/bash" > $INIT_FILE
echo "Cleared $INIT_FILE"

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Running shell initiliazation"
sh $dir/shell/setup.sh
echo

# Plugins to run
declare -a PLUGINS=(
	'git'
	'ant'
	'java'
	'javascript'
	'sublime'
	'gradle'
)
for i in ${PLUGINS[@]}; do
	path="$dir/plugins/$i"
	setup_file="$path/setup.sh"
	rc_file="$path/.rc"

	[ -f $setup_file ] && echo "Running '$i' plugin" \
		&& sh $setup_file

	[ -f $rc_file ] && echo "Attaching '$i/.rc' to $INIT_FILE" \
		&& cat $rc_file >> $INIT_FILE
	echo
done

echo $INIT_FILE

echo "Finished initialization"

function read_value {
	read -e -p "$1 " -i "$2" REPLY
	echo $REPLY
}

function read_boolean_value {
	DEFAULT=`[ "$2" ] && echo "yes" || echo "no"`
	REPLY=`read -e -p "$1 " -i "$DEFAULT" REPLY`
	[ "$REPLY" == "yes"  ] && echo 1 || echo 0
}

PS3="Select number (default is 1): "

function select_value {
	echo "$1" >&2
	read -ra DEFAULT <<< "$2"
	select REPLY in `echo $2`
	do
		echo ${REPLY:-$DEFAULT}
		break
	done
}

function echo_progress {
    printf "\e[1;36m---> \e[1;32m$1\e[0m\n"
}
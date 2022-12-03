#! /bin/bash

cd $(dirname "$(realpath "$0")") || exit 1

if [ ! "$1" ]; then
	echo "please give 01, 02... etc."
	exit 2
fi

cd "$1" || exit 1;

source "./run.sh"
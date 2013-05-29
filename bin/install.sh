#!/usr/bin/env bash

printf "installing default templates to '~/.fsplates'\n"

DIR=$(dirname $(cd $(dirname ${BASH_SOURCE[0]}) && pwd))

if [[ -d $HOME"/.fsplates" ]]; then
	printf "'~/.fsplates' already exists so no files written to it\n"
	printf "if you want to update your templates you should do it manually\n"
else
	if [[ -d $DIR"/templates" ]]; then
		cp -r $DIR"/templates" $HOME"/.fsplates"
		printf "done!\n"
	else
		printf "unable to find default templates. Try installing straight from github\n"
	fi
fi

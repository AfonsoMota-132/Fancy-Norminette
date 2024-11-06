#!/bin/bash

RC_FILE="$HOME/.zshrc"

if ! grep "fancynorm=" "$RC_FILE"; then
	printf "\nalias fancynorm='~/scripts_shell/fancy_norm/run.sh | grep %c %c' \n" '"' '"' >> "$RC_FILE"
fi

if ! grep "fnorm=" "$RC_FILE"; then
	printf "\nalias fnorm='~/scripts_shell/fancy_norm/run.sh | grep %c %c'\n" '"' '"' >> "$RC_FILE"
fi


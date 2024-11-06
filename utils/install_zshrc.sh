RC_FILE="$HOME/.zshrc"

if ! grep "fancynorm=" "$RC_FILE" &> /dev/null; then
	printf "\nalias fancynorm=$HOME/scripts_shell/fancy_norm/run.sh\n" >> "$RC_FILE"
fi

if ! grep "fnorm=" "$RC_FILE" &> /dev/null; then
	printf "\nalias fnorm=$HOME/scripts_shell/fancy_norm/run.sh\n" >> "$RC_FILE"
fi


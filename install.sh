TE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'
if ls -l $HOME | grep "scripts_shell"; then
	if ls -l $HOME/scripts_shell | grep "fancy_norm"; then
		echo -e "${RED} There's already a fancy norminette directory inside scripts_shell!}"
	else
		git clone git@github.com:AfonsoMota-132/Fancy-Norminette.git $HOME/scripts_shell/fancy_norm
		
	fi
else
	mkdir $HOME/scripts_shell/
	git clone git@github.com:AfonsoMota-132/Fancy-Norminette.git $HOME/scripts_shell/fancy_norm
fi

	

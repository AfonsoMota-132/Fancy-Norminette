TE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'

CHECK=1



# while [ $CHECK -eq 1 ]; do
# 		echo "${BLUE}What's your source's directory name?"
# 		
# 		read SRC
# 		while true; do	
# 			read -p "Is $SRC the name you always use for the Source's directory?" yn
#     		case $yn in
#     	        [Yy]* ) CHECK=0; break;;
#     	        [Nn]* ) exit;;
#     	        * ) echo "Please answer yes or no.";;	
# 			esac
# 		done
# done
# 
# while [ $CHECK -eq 1 ]; do
# 		echo "${BLUE}What's your source's directory name?"
# 		
# 		read SRC
# 		while true; do	
# 			read -p "Is $SRC the name you always use for the Source's directory?" yn
#     		case $yn in
#     	        [Yy]* ) CHECK=0; break;;
#     	        [Nn]* ) exit;;
#     	        * ) echo "Please answer yes or no.";;	
# 			esac
# 		done
# done
if ls -l $HOME | grep "scripts_shell"; then
	clear
	if ls -l $HOME/scripts_shell | grep "fancy_norm"; then
		clear
		echo "${RED}There's already a fancy norminette directory inside scripts_shell!"
	fi
fi
if ls -l $HOME | grep "scripts_shell"; then
	while [ $CHECK -eq 1 ]; do
 		echo "${BLUE}What's your source's directory name?"
			
			read SRC
			while true; do	
				read -p "Is $SRC the name you always use for the Source's directory?" yn
	    		case $yn in
	    	        [Yy]* ) CHECK=0; break;;
	    	        [Nn]* ) exit;;
	    	        * ) echo "Please answer yes or no.";;	
				esac
			done
	done
	CHECK=1
	while [ $CHECK -eq 1 ]; do
			echo "${BLUE}What's your Include's directory name?"
			
			read INC
			while true; do	
				read -p "Is $INC the name you always use for the Include's directory?" yn
	    		case $yn in
	    	        [Yy]* ) CHECK=0; break;;
	    	        [Nn]* ) exit;;
	    	        * ) echo "Please answer yes or no.";;	
				esac
			done
	done
	mkdir $HOME/scripts_shell/
	git clone git@github.com:AfonsoMota-132/Fancy-Norminette.git $HOME/scripts_shell/fancy_norm
	chmod +x $HOME/scripts_shell/fancy_norm/utils/install_zshrc.sh
	source $HOME/scripts_shell/fancy_norm/utils/install_zshrc.sh $SRC $INC
	chmod +x $HOME/scripts_shell/fancy_norm/run.sh	
	source ~/.zshrc
	clear
	echo -e "${GREEN} Fancynette was installed successfully!"
fi	

#!/bin/bash
TE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BWhite='\033[1;37m' 
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

echo -e "${BLUE}Progress : [${GREEN}${_fill// /#}${RED}${_empty// /-}${BLUE}] ${_progress}%"

}
if (norminette ${1} ${2} | grep -c ":") > 0; then
	while true; do
		clear
		OK_NBR=$(norminette ${1} ${2} | grep -c "OK")
		KO_NBR=$(norminette ${1} ${2} | grep -c "Error!")
		STR=$(norminette ${1} ${2} | grep "Error")
		let "TOTAL=$OK_NBR+$KO_NBR"
		if [ $KO_NBR -eq 0 ]; then
			clear
			echo -e "${BLUE}╔══════════════════════════════════════════╗ "
			echo -e "${BLUE}║                                          ║ "
			echo -e "${BLUE}║   ${GREEN}🎉 Everything's according to norm 🎉 ${BLUE}  ║ "
			echo -e "${BLUE}║                                          ║ "
			echo -e "${BLUE}╚══════════════════════════════════════════╝ "
			break
		fi
		let "PERCENTAGE=$OK_NBR*100/$TOTAL"
		echo -e "${BLUE}╔══════════════════════════════════════════╗ "
		echo -e "${BLUE}║                                          ║ "
		echo -e "${BLUE}║    Welcome to ✨ ${YELLOW}Improved ✨ ${BLUE}Norminette  ║ "
		echo -e "${BLUE}║                                          ║ "
		echo -e "${BLUE}╚══════════════════════════════════════════╝ "
		ProgressBar ${OK_NBR} ${TOTAL}	
		echo -e "${BLUE}Ok		:${GREEN}" $OK_NBR "/" $TOTAL " "
		echo -e "${BLUE}Error		:${RED}" $KO_NBR "/" $TOTAL " "
		echo -e "${BLUE}Percentage	:" $PERCENTAGE "% "
		echo "$STR"
		sleep 0.5
		clear
	done
else
	clear
	printf "$RED╔═════════════════════════════════════╗ \n"
	printf "$RED║                                     ║\n"
	printf "$RED║    No files found for Norminette    ║\n"
	printf "$RED║                                     ║\n"
	printf "$RED╚═════════════════════════════════════╝ "
fi

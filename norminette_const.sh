#!/bin/bash
TE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
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
if (norminette | grep -c ":") > 0; then
	while true; do
		clear
		OK_NBR=$(norminette | grep -c "OK")
		KO_NBR=$(norminette | grep -c "Error!")
		STR=$(norminette | grep "Error")
		let "TOTAL=$OK_NBR+$KO_NBR"
		if [ $KO_NBR -eq 0 ]; then
			echo -e "${GREEN}Everything's according to norm!"
			break
		fi
		let "PERCENTAGE=$OK_NBR*100/$TOTAL"
		ProgressBar ${OK_NBR} ${TOTAL}	
		echo -e "${BLUE}Ok		:${GREEN}" $OK_NBR "/" $TOTAL " "
		echo -e "${BLUE}Error		:${RED}" $KO_NBR "/" $TOTAL " "
		echo -e "${BLUE}Percentage	:" $PERCENTAGE "% "
		echo "$STR"
		sleep 1
		clear
	done
else
	echo -e "${RED}No files found for Norminette"
fi

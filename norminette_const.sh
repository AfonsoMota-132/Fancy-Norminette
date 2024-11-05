#!/bin/bash
TE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
while true; do
	clear
	OK_NBR=$(norminette | grep -c "OK")
	KO_NBR=$(norminette | grep -c "Error!")
	let "TOTAL=$OK_NBR+$KO_NBR"
	let "PERCENTAGE=$OK_NBR*100/$TOTAL"
	echo "Ok		:" $OK_NBR "/" $TOTAL " "
	echo "Error		:" $KO_NBR "/" $TOTAL " "
#	echo "Total		:" $TOTAL " "
	echo "Percentage	:" $PERCENTAGE "% "
	sleep 0.5
done

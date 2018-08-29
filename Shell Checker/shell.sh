#!/bin/bash

waktu=$(date '+%Y-%m-%d %H:%M:%S')
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'
header(){
printf "${HIJAU}
         ####################################
         ####################################
         #######                      #######
         #######                      #######${BIRU}
         ####### www.tatsumi-crew.net #######
         ###############      ###############
         ###############      ###############
         ###############      ###############
         ###############      ###############${MERAH}
         #######    ####      ####    #######
         #######    ####      ####    #######
         #######    ##############    #######
         #######    ##############    #######
         #######                      #######
         ####################################
         ####################################${PUTIH}
         ------------------------------------
              	  Shell Checker CLI
                Code By : NakoDers ID
         ------------------------------------
"
}
tatsumi(){
		site="${1}"
		ext=".php|.phtml|.php3|.phpgif|.php.jpg|.php.pjpg|.php.jpg|.pht"
		CekFile=$(echo $site)
		if [[ ! $CekFile =~ ($ext) ]]; then
			printf "${MERAH}Skip, Not Found => $site\n"
		else
			ngecurl=$(curl -s -I "$site")
			if [[ ! $ngecurl =~ "200 OK" ]]; then
				printf "${MERAH}NOT FOUND => $site\n"
			else
				ngecek=$(curl -s "$site" -L)
				title="wso|HAWKZONE|lite|shell|Linux|backdoor|Tatsumi|shells|cyber|team|hacker"
				ngeganti=$(echo $ngecek | tr [:upper:] [:lower:])
				if [[ $ngeganti =~ ($title) ]]; then
					times=$(date +%d-%m-%y)
					printf "${HIJAU}FOUND => $site \n"
					echo "$site" >> shell1.txt
				else
					printf "${MERAH}NOT FOUND => $site\n"
				fi
			fi
		fi
	}	
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> url"
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
persend=1
setleep=3

itung=1

    x=$(gawk '{ print $1 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'url=($x)'
for (( i = 0; i < "${#url[@]}"; i++ )); do
	set_kirik=$(expr $itung % $persend)
    if [[ $set_kirik == 0 && $itung > 0 ]]; then
        sleep $setleep
    fi
    urnna="${url[$i]}"
    tatsumi $urnna &
    itung=$[$itung+1]
done

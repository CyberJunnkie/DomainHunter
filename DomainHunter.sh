#!/bin/bash

url=$1      # Storing first argument in url var

printf "
_________        ___.                     ____.             __   .__        
\_   ___ \___.__.\_ |__   ___________    |    |__ __  ____ |  | _|__| ____  
/    \  \<   |  | | __ \_/ __ \_  __ \   |    |  |  \/    \|  |/ /  |/ __ \ 
\     \___\___  | | \_\ \  ___/|  | \/\__|    |  |  /   |  \    <|  \  ___/ 
 \______  / ____| |___  /\___  >__|  \________|____/|___|  /__|_ \__|\___  >
        \/\/          \/     \/                          \/     \/       \/ 

\n\n
"


if [ ! -d '$url' ];then            # making a new directory with target name
        mkdir $url
fi
    

echo "[+++++ Hunting SubDomains and assets+++++]"

assetfinder $url > $url/domains.txt                   #  using assetfinder to hunt domains



 amass enum -d $url >> $url/domains.txt               # using amass to find more domains

sort -u $url/domains.txt > $url/filtered.txt            # sorting domains and removing duplicates

rm $url/domains.txt


echo "[+++++ Hunting SubDomains and assets+++++]"

sleep 3

cat $url/filtered.txt | httprobe | sed 's/https\?:\/\///' | sort -u > $url/HuntedDomains.txt          # Checking which domains are alive and returning a response and crafting our final list


echo "[+++++]Hunted domains[+++++]"

echo "----------------------"
echo "  "
cat $url/HuntedDomains.txt
echo ""
echo "---------------------"






gowitness -F file -f $url/HuntedDomains.txt  -P $url/domains_screenshots   2>/dev/null           # screenshoting every alive domain for recon purposes


echo "Screenshots taken for Hunted Domains"



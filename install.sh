#!/bin/bash


wget https://github.com/sensepost/gowitness/releases/download/2.3.6/gowitness-2.3.6-linux-amd64
mv gowitness-2.3.6-linux-amd64 gowitness
mv gowitness /usr/bin



wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz
tar xvfz assetfinder-linux-amd64-0.1.1.tgz
mv assetfinder /usr/bin


wget https://github.com/OWASP/Amass/releases/download/v3.13.4/amass_linux_amd64.zip
unzip amass_linux_amd64.zip
cd amass_linux_amd64
mv amass /usr/bin


wget https://github.com/tomnomnom/httprobe/releases/download/v0.1.2/httprobe-linux-amd64-0.1.2.tgz
tar xvfz httprobe-linux-amd64-0.1.2.tgz
mv httprobe /usr/bin


chmod +x DomainHunter.sh

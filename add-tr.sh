#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
uuid=$(cat /etc/trojan/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "Expired (days): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan
trojanlink="trojan://${user}@${domain}:${tr}?security=tls&headerType=none&type=tcp&sni=bug.com#${user}"
clear
echo -e ""
echo -e "=============-Trojan-============"
echo -e "Remarks        : ${user}"
echo -e "Expired On     : $exp"
echo -e "Host/IP        : ${domain}"
echo -e "port           : ${tr}"
echo -e "Key            : ${user}"
echo -e "link           : ${trojanlink}"
echo -e "===================="
echo -e "🔰Pantang Larang PREMIUM VPN !!"
echo -e "Aktiviti Berikut Adalah Dilarang"
echo -e "(ID akan di ban tanpa notis & tiada refund)"
echo -e "❌ Torrent (p2p, streaming p2p)"
echo -e "❌ PS4"
echo -e "❌ Porn"
echo -e "❌ Ddos Server"
echo -e "❌ Mining Bitcoins"
echo -e "❌ Abuse Usage (1TB/DAY)"
echo -e "❌ Multi-Login ID (1 ID 1DEVICE SAHAJA)"
echo -e "❌ Sharing Premium Config"
echo -e "================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu

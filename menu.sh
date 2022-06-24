#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
blue='\e[0;34m'
blue_b='\e[0;94m'
yellow='\e[1;33m'
sea='\e[1;34m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com)
IZIN=$(curl https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $MYIP | awk '{print $4}')
if [ $MYIP = $IZIN ]; then
  echo -e ""
  clear
else
  echo -e ""
  echo -e "${green}ACCESS DENIED...PM TELEGRAM OWNER${NC}"
  exit 1
fi
echo -e " "
IPVPS=$(curl -s icanhazip.com)
DOMAIN=$(cat /etc/v2ray/domain)
city=$(curl -s https://ipinfo.io/json | grep -o 'city": "[^"]*' | grep -o '[^"]*$')
cekxray="$(openssl x509 -dates -noout </etc/v2ray/v2ray.crt)"
expxray=$(echo "${cekxray}" | grep 'notAfter=' | cut -f2 -d=)
name=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $IPVPS | awk '{print $3}')
c_xtls=$(grep -oc '### [^ ]*' /etc/xray/vless-direct.json | cut -d' ' -f2)
c_xvmess=$(grep -oc '### [^ ]*' /etc/xray/v2ray-tls.json | cut -d' ' -f2)
c_xvless=$(grep -oc '### [^ ]*' /etc/xray/vless-tls.json | cut -d' ' -f2)
c_grpc=$(grep -oc '### [^ ]*' /etc/xray/vless-grpc.json | cut -d' ' -f2)
c_vmess=$(grep -oc '### [^ ]*' /etc/v2ray/config.json | cut -d' ' -f2)
c_vless=$(grep -oc '### [^ ]*' /etc/v2ray/vless.json | cut -d' ' -f2)
total_xray=$(($c_xtls + $c_xvmess + $c_xvless + $c_grpc))
total_v2ray=$(($c_vmess + $c_vless))
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
vnstat -i eth0 >/root/t1
bulan=$(date +%b)
today=$(vnstat -i eth0 | grep today | awk '{print $8}')
today_v=$(vnstat -i eth0 | grep today | awk '{print $9}')
today_rx=$(vnstat -i eth0 | grep today | awk '{print $2}')
today_rxv=$(vnstat -i eth0 | grep today | awk '{print $3}')
today_tx=$(vnstat -i eth0 | grep today | awk '{print $5}')
today_txv=$(vnstat -i eth0 | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /root/t1)" != '0' ]; then
  bulan=$(date +%b)
  month=$(vnstat -i eth0 | grep "$bulan " | awk '{print $9}')
  month_v=$(vnstat -i eth0 | grep "$bulan " | awk '{print $10}')
  month_rx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $3}')
  month_rxv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $4}')
  month_tx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $6}')
  month_txv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $7}')
else
  bulan=$(date +%Y-%m)
  month=$(vnstat -i eth0 | grep "$bulan " | awk '{print $8}')
  month_v=$(vnstat -i eth0 | grep "$bulan " | awk '{print $9}')
  month_rx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $2}')
  month_rxv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $3}')
  month_tx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $5}')
  month_txv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /root/t1)" != '0' ]; then
  yesterday=$(vnstat -i eth0 | grep yesterday | awk '{print $8}')
  yesterday_v=$(vnstat -i eth0 | grep yesterday | awk '{print $9}')
  yesterday_rx=$(vnstat -i eth0 | grep yesterday | awk '{print $2}')
  yesterday_rxv=$(vnstat -i eth0 | grep yesterday | awk '{print $3}')
  yesterday_tx=$(vnstat -i eth0 | grep yesterday | awk '{print $5}')
  yesterday_txv=$(vnstat -i eth0 | grep yesterday | awk '{print $6}')
else
  yesterday=NULL
  yesterday_v=NULL
  yesterday_rx=NULL
  yesterday_rxv=NULL
  yesterday_tx=NULL
  yesterday_txv=NULL
fi
rm -f /root/t1
bash /root/.fontsam/banner
echo -e " "
echo -e "  Premium Script"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e "                       • SERVER INFORMATION • " | lolcat
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${red}VPS TYPE                    : PREMIUM"
echo -e " ${red}IP VPS NUMBER               : $IPVPS${NC}"
echo -e " ${red}DOMAIN                      : $DOMAIN${NC}"
echo -e " ${red}CITY                        : $city${NC}"
echo -e " ${red}SCRIPT VERSION              : REYZ-V4 (V1)"
echo -e " ${red}OS VERSION                  : $(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)"${NC}
echo -e " ${red}KERNEL VERSION              : $(uname -r)${NC}"
echo -e " ${red}EXP DATE CERT V2RAY/XRAY    : $expxray${NC}"
echo -e " ${red}CLIENT NAME                 : $name${NC}"
echo -e " ${red}EXP SCRIPT ACCSESS          : $exp${NC}"
echo -e " ${red}CONTACT TELEGRAM            : @GHReyz"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════" 
echo -e " ${green}TRAFFIC           TODAY          YESTERDAY          MONTH"  
echo -e " UPLOAD            $today_tx $today_txv      $yesterday_tx $yesterday_txv         $month_tx $month_txv" 
echo -e " DOWNLOAD          $today_rx $today_rxv      $yesterday_rx $yesterday_rxv         $month_rx $month_rxv" 
echo -e " TOTAL             $today $today_v      $yesterday $yesterday_v         $month $month_v" 
echo -e " ${yellow}═════════════════════════════════════════════════════════════════" 
echo -e " ${green}TOTAL USER        SSH/OVPN          XRAY            V2RAY" 
echo -e "                      $total_ssh               $total_xray                $total_v2ray" 
echo -e " ${yellow}═════════════════════════════════════════════════════════════════" 
echo -e "                          • MAIN MENU • " | lolcat
echo -e " ${yellow}═════════════════════════════════════════════════════════════════" 
echo -e " ${red}[  1 ] SSH & OPENVPN                  [  2 ] WIREGUARD"
echo -e " ${red}[  3 ] SHADOWSOCKS R                  [  4 ] SHADOWSOCKS OBFS"
echo -e " ${red}[  5 ] V2RAY CORE                     [  6 ] XRAY CORE"
echo -e " ${red}[  7 ] TROJAN GFW"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e "                         • SYSTEM MENU • " | lolcat
echo -e " ${yellow}═════════════════════════════════════════════════════════════════" 
echo -e " ${red}[  8 ] ADD/CHANGE DOMAIN VPS          [  9 ] CHANGE PORT SERVICE"
echo -e " [ 10 ] CHANGE DNS SERVER              [ 11 ] RENEW CERTIFICATION"
echo -e " [ 12 ] WEBMIN MENU                    [ 13 ] CHECK RAM USAGE"
echo -e " [ 14 ] REBOOT VPS                     [ 15 ] SPEEDTEST VPS"
echo -e " [ 16 ] DISPLAY SYSTEM INFORMATION     [ 17 ] CHECK STREAM GEO"
echo -e " [ 18 ] CHANGE SCRIPT BANNER           [ 19 ] CHECK SERVICE ERROR"
echo -e " [ 20 ] UPDATE SCRIPT                  [  0 ] EXIT MENU${NC}"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════" 
echo -e " ${green}🔰 Premium Script By Reyz-V4 🔰" 
echo -e " 🔰 Thank You For Using Script By Reyz-V4 🔰" 
echo -e " ${yellow}═════════════════════════════════════════════════════════════════" 
echo -e " 
echo -e "\e[1;31m"
read -p "     Please select an option :  " menu "
echo -e "\e[0m"
case $menu in
1)
  mssh
  ;;
2)
  mwg
  ;;
3)
  mssr
  ;;
4)
  mss
  ;;
5)
  mv2raycore
  ;;
6)
  mxraycore
  ;;
7)
  mtrojan
  ;;
8)
  add-host
  ;;
9)
  change
  ;;
10)
  mdns
  ;;
11)
  recert-xrayv2ray
  ;;
12)
  wbmn
  ;;
13)
  ram
  ;;
14)
  reboot
  ;;
15)
  speedtest
  ;;
16)
  info
  ;;
17)
  nf
  ;;
18)
  banner_changer
  ;;
19)
  checksystem
  ;;
20)
  update
  ;;
0)
  sleep 0.5
  clear
  jinggo
  ;;
*)
  echo -e "ERROR!! Please Enter an Correct Number"
  sleep 1
  clear
  menu
  ;;
esac

#!/bin/bash
clear
red='\e[1;35m'
bred1='\e[47m'
bred='\e[47m'
blue='\e[1;34m'
blue_b='\e[1;94m'
yellow='\e[1;31m'
purple='\e[1;33m'
white='\e[1;37m'
try='\e[0;103m'
cyan='\e[1;36m'
green='\e[1;35m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com)
IZIN=$(curl https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $MYIP | awk '{print $4}')
if [ $MYIP = $IZIN ]; then
  echo -e ""
  clear
else
  echo -e ""
  echo -e "${green}ACCESS DENIED...PM TELEGRAM OWNER @GHReyz${NC}"
  exit 1
fi
echo -e " "
# SYSTEM INFO
IPVPS=$(curl -s icanhazip.com)
DOMAIN=$(cat /etc/v2ray/domain)
city=$(curl -s https://ipinfo.io/json | grep -o 'city": "[^"]*' | grep -o '[^"]*$')
TIME=$(curl -sS ip-api.com | grep -w "timezone" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf)
ISP=$(curl -sS ip-api.com | grep -w "isp" | awk '{print $3,$4,$5,$6,$7,$8,$9}' | cut -d'"' -f2 | cut -d',' -f1 | tee -a /etc/afak.conf)
up=$(uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
cpu_usage+=" %"
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')

# CERT V2RAY/XRAY
cekxray="$(openssl x509 -dates -noout </etc/v2ray/v2ray.crt)"
expxray=$(echo "${cekxray}" | grep 'notAfter=' | cut -f2 -d=)

# CLIENT INFOMATION
name=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $IPVPS | awk '{print $3}')

# USER TOTAL
c_xtls=$(grep -oc '### [^ ]*' /etc/xray/vless-direct.json | cut -d' ' -f2)
c_xvmess=$(grep -oc '### [^ ]*' /etc/xray/v2ray-tls.json | cut -d' ' -f2)
c_xvless=$(grep -oc '### [^ ]*' /etc/xray/vless-tls.json | cut -d' ' -f2)
c_grpc=$(grep -oc '### [^ ]*' /etc/xray/vless-grpc.json | cut -d' ' -f2)
c_vmess=$(grep -oc '### [^ ]*' /etc/v2ray/config.json | cut -d' ' -f2)
c_vless=$(grep -oc '### [^ ]*' /etc/v2ray/vless.json | cut -d' ' -f2)
total_xray=$(($c_xtls + $c_xvmess + $c_xvless + $c_grpc))
total_v2ray=$(($c_vmess + $c_vless))
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

# VNSTAT
bulan=$(date +%b)
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /root/t1)" != '0' ]; then
  bulan=$(date +%b)
  month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
  month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $10}')
  month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
  month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $4}')
  month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
  month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $7}')
else
  bulan=$(date +%Y-%m)
  month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $8}')
  month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
  month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $2}')
  month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
  month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $5}')
  month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /root/t1)" != '0' ]; then
  yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
  yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
  yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
  yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
  yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
  yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
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
echo -e "  Premium Script" | lolcat
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${bred1}                      • SERVER INFORMATION •                     "${NC}
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${red}CPU MODEL                   :$cname"
echo -e " ${red}NUMBER OF CORES             : $cores"
echo -e " ${red}CPU USAGE                   : $cpu_usage1 %"
echo -e " ${red}CPU FREQUENCY               :$freq MHz"
echo -e " ${red}TOTAL AMOUNT OF RAM         : $tram MB"
echo -e " ${red}FREE RAM                    : $fram MB"
echo -e " ${red}SYSTEM UPTIME               : $up"
echo -e " ${red}ISP/PROVIDER NAME           : $ISP"
echo -e " ${red}CITY LOCATION               : $city${NC}"
echo -e " ${red}TIME LOCATION               : $TIME"
echo -e " ${red}IP VPS NUMBER               : $IPVPS"
echo -e " ${red}DOMAIN NAME                 : $DOMAIN${NC}"
echo -e " ${red}TELEGRAM                    : @GHReyz"
echo -e " ${red}SCRIPT VERSION              : REYZ-V4 (V1)"
echo -e " ${red}OS VERSION                  : $(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)"${NC}
echo -e " ${red}KERNEL VERSION              : $(uname -r)${NC}"
echo -e " ${red}CERT V2RAY/XRAY            : $expxray${NC}"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " TRAFFIC           TODAY          YESTERDAY          MONTH" | lolcat
echo -e " ${white}UPLOAD            $today_tx $today_txv      $yesterday_tx $yesterday_txv         $month_tx $month_txv"
echo -e " DOWNLOAD          $today_rx $today_rxv      $yesterday_rx $yesterday_rxv         $month_rx $month_rxv"
echo -e " TOTAL             $today $today_v      $yesterday $yesterday_v         $month $month_v"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${cyan}TOTAL USER        SSH/OVPN          XRAY            V2RAY" | lolcat
echo -e " ${white}                     $total_ssh               $total_xray                $total_v2ray"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${bred1}                         • MAIN MENU •                           "${NC}
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${green}[  1 ]\e[m \e[$purple SSH & OPENVPN\e[m                  \e[$green[  2 ]\e[m \e[$purple WIREGUARD"
echo -e " ${green}[  3 ]\e[m \e[$purple SHADOWSOCKS R\e[m                  \e[$green[  4 ]\e[m \e[$purple SHADOWSOCKS OBFS"
echo -e " ${green}[  5 ]\e[m \e[$purple V2RAY CORE\e[m                     \e[$green[  6 ]\e[m \e[$purple XRAY CORE"
echo -e " ${green}[  7 ]\e[m \e[$purple TROJAN GFW\e[m                     \e[$green[ 99 ]\e[m \e[$purple BANDWIDTH SERVER"
echo -e " ${yellow}════════════════════════════════════════════════════════════════="
echo -e " ${bred1}                        • SYSTEM MENU •                          "${NC}
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${green}[  8 ]\e[m \e[$purple ADD/CHANGE DOMAIN VPS\e[m          \e[$green[  9 ]\e[m \e[$purple CHANGE PORT SERVICE"
echo -e " ${green}[ 10 ]\e[m \e[$purple CHANGE DNS SERVER\e[m              \e[$green[ 11 ]\e[m \e[$purple RENEW CERTIFICATION"
echo -e " ${green}[ 12 ]\e[m \e[$purple WEBMIN MENU\e[m                    \e[$green[ 13 ]\e[m \e[$purple CHECK RAM USAGE"
echo -e " ${green}[ 14 ]\e[m \e[$purple REBOOT VPS\e[m                     \e[$green[ 15 ]\e[m \e[$purple SPEEDTEST VPS"
echo -e " ${green}[ 16 ]\e[m \e[$purple DISPLAY SYSTEM INFORMATION\e[m     \e[$green[ 17 ]\e[m \e[$purple CHECK STREAM GEO"
echo -e " ${green}[ 18 ]\e[m \e[$purple CHANGE SCRIPT BANNER\e[m           \e[$green[ 19 ]\e[m \e[$purple CHECK SERVICE ERROR"
echo -e " ${green}[ 20 ]\e[m \e[$purple UPDATE SCRIPT\e[m                  \e[$green[  0 ]\e[m \e[$purple EXIT MENU${NC}"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${green}CLIENT NAME   :\e[m \e[$purple $name${NC}"
echo -e " ${green}SCRIPT STATUS :\e[m \e[$purple $exp${NC}"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " "
echo -e "\e[1;37m"
read -p "     Please select an option :  " menu
echo -e " "
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
99)
  vnstat
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

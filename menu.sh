#!/bin/bash
clear
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
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)

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

#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
fi

rm -f /root/t1
bash /root/.fontsam/banner
echo -e "  Premium Script" | lolcat
echo -e   " \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                    \e[30m[\e[$box SERVER INFORMATION\e[30m ]\e[1m                       \e[m"
echo -e   " \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$text Cpu Model                  :$cname\e[m"
echo -e "  \e[$text Number Of Core             : $cores\e[m"
echo -e "  \e[$text Cpu Usage                  : $cpu_usage1 %\e[m"
echo -e "  \e[$text Cpu Frequency              :$freq MHz\e[m"
echo -e "  \e[$text Total Amount Of Ram        : $tram MB\e[m"
echo -e "  \e[$text Free Ram                   : $fram MB\e[m"
echo -e "  \e[$text System Uptime              :$up\e[m"
echo -e "  \e[$text Isp/Provider Name          : $ISP\e[m"
echo -e "  \e[$text City Location              : $city\e[m"
echo -e "  \e[$text Time Location              : $TIME\e[m"
echo -e "  \e[$text IpVps Number               : $IPVPS\e[m"
echo -e "  \e[$text Domain Name                : $DOMAIN\e[m"
echo -e "  \e[$text Telegram                   : @GHReyz\e[m"
echo -e "  \e[$text Script Version             : REYZ-V4 (V1)\e[m"
echo -e "  \e[$text Os Version                 : $(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)\e[m"
echo -e "  \e[$text Kernel Version             : $(uname -r)\e[m"
echo -e "  \e[$text Certificate License        :${red} $expxray\e[m"
echo -e "  \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e   "  \e[33m Traffic\e[0m       \e[33mToday     Yesterday     Month   "
echo -e   "  \e[33m Download\e[0m      $dtoday    $dyest       $dmon   \e[0m"
echo -e   "  \e[33m Upload\e[0m        $utoday    $uyest       $umon   \e[0m"
echo -e   "  \e[33m Total\e[0m       \033[0;36m  $ttoday    $tyest       $tmon  \e[0m "
echo -e   " \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$text Total User\e[m        \e[${text}Ssh/Ovpn          Xray            V2ray" 
echo -e   "   ${white}                     $total_ssh               $total_xray                $total_v2ray"
echo -e   " \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                        \e[30m[\e[$box MAIN MENU\e[30m ]\e[1m                            \e[m"
echo -e   " \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$number [  1 ]\e[m \e[$below Panel Ssh & OpenVpn\e[m           \e[$number[  6 ]\e[m \e[$below REBOOT"
echo -e " \e[$number [  2 ]\e[m \e[$below Panel V2ray Core\e[m              \e[$number[  7 ]\e[m \e[$below Check Service Error\e[m"     
echo -e " \e[$number [  3 ]\e[m \e[$below Panel Xray Core\e[m               \e[$number[  8 ]\e[m \e[$below System Information\e[m"
echo -e " \e[$number [  4 ]\e[m \e[$below Panel Trojan Gfw\e[m              \e[$number[  9 ]\e[m \e[$below Menu System Script\e[m"
echo -e " \e[$number [  5 ]\e[m \e[$below Change Banner Script\e[m          \e[$number[  0 ]\e[m \e[$below Exit Menu\e[m"
echo -e " \e[$number [ 10 ]\e[m \e[$below Menu Themes\e[m"
echo -e   " \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$below Client Name   :\e[m \e[$number $name\e[m"
echo -e " \e[$below Script Status :\e[m \e[$number $exp\e[m"
echo -e   " \e[$line═════════════════════════════════════════════════════════════════\e[m"
echo -e ""
echo -e "\e[$below "
read -p "     Please select an option :  " menu
echo -e " "
echo -e "\e[0m"
case $menu in
1)
  mssh
  ;;
2)
  mv2raycore
  ;;
3)
  mxraycore
  ;;
4)
  mtrojan
  ;;
5)
  banner_changer
  ;;
6)
  reboot
  ;;
7)
  checksystem
  ;;
8)
  info
  ;;
9)
  system
  ;;
10)
  themes
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

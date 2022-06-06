#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
blue='\e[0;34m'
blue_b='\e[0;94m'
purple='\e[1;35m'
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

bash /root/.fontsam/banner
echo -e " "
echo -e " ${red} Premium Script"
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e "                       • SERVER INFORMATION •" | lolcat
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e " ${red}VPS TYPE                    : PREMIUM"
echo -e " ${red}IP VPS NUMBER               : $IPVPS${NC}"
echo -e " ${red}DOMAIN                      : $DOMAIN${NC}"
echo -e " ${red}SCRIPT VERSION              : REYZ-V4 (V1)"
echo -e " ${red}OS VERSION                  : $(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)"${NC}
echo -e " ${red}KERNEL VERSION              : $(uname -r)${NC}"
echo -e " ${red}EXP DATE CERT V2RAY/XRAY    : $expxray${NC}"
echo -e " ${red}CLIENT NAME                 : $name${NC}"
echo -e " ${red}EXP SCRIPT ACCSESS          : $exp${NC}"
echo -e " ${red}CONTACT TELEGRAM            : @GHReyz"
echo -e " "
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e " TOTAL USER          SSH/OVPN          XRAY          V2RAY          " | lolcat
echo -e "                        $total_ssh               $total_xray              $total_v2ray             " | lolcat
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e "                          • MAIN MENU • " | lolcat
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e " ${red}[  1 ] SSH & OPENVPN"
echo -e " ${red}[  2 ] WIREGUARD"
echo -e " ${red}[  3 ] SHADOWSOCKS R"
echo -e " ${red}[  4 ] SHADOWSOCKS OBFS"
echo -e " ${red}[  5 ] V2RAY CORE"
echo -e " ${red}[  6 ] XRAY CORE"
echo -e " ${red}[  7 ] TROJAN GFW"
echo -e " "
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e "                         • SYSTEM MENU • " | lolcat
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e " ${red}[  8 ] ADD/CHANGE DOMAIN VPS"
echo -e " [  9 ] CHANGE PORT SERVICE"
echo -e " [ 10 ] CHANGE DNS SERVER"
echo -e " [ 11 ] RENEW V2RAY AND XRAY CERTIFICATION"
echo -e " [ 12 ] WEBMIN MENU"
echo -e " [ 13 ] CHECK RAM USAGE"
echo -e " [ 14 ] REBOOT VPS"
echo -e " [ 15 ] SPEEDTEST VPS"
echo -e " [ 16 ] DISPLAY SYSTEM INFORMATION"
echo -e " [ 17 ] CHECK STREAM GEO LOCATION"
echo -e " [ 18 ] CHANGE SCRIPT BANNER"
echo -e " [ 19 ] CHECK SERVICE ERROR"
echo -e " [ 20 ] UPDATE SCRIPT"
echo -e " [  0 ] EXIT MENU${NC} "
echo -e " "
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e "  Premium Script By Reyz-V4" | lolcat
echo -e "  Thank You For Using Script By Reyz-V4" | lolcat
echo -e " $═════════════════════════════════════════════════════════════════ " | lolcat
echo -e "  "
echo -e "\e[1;31m"
read -p "     Please select an option :  " menu
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
